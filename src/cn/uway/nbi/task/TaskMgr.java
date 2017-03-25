package cn.uway.nbi.task;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.DAO;
import cn.uway.nbi.db.dao.RTaskDAO;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.NossTask;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.ClassMgr;
import cn.uway.nbi.framework.Module;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * 任务管理类
 * 
 * @author liuwx
 */
public class TaskMgr implements Module {

	private Map<Long, Task> activeTasks;// 活动任务集合(用于存放当前程序正在处理的任务)

	private Map<Long, RTask> activeRTasks;// 活动任务集合(用于存放当前程序正在处理的任务)

	/** 数据格式：Map<报告表或者补报表id号，Map<任务时间,失败任务>> */
	private Map<Long, Map<Long, ReportStruct>> failedTaskMap;// 失败任务集合

	private ExecutorService taskExecutor; // 任务线程池

	private Timer timer;// 任务触发定时器

	private static final Logger LOG = LoggerFactory.getLogger(TaskMgr.class);

	private TaskMgr() {
		initialize();
	}

	public static TaskMgr getInstance() {
		return TaskMgrContainer.instance;
	}

	private static class TaskMgrContainer {

		private static TaskMgr instance = new TaskMgr();
	}

	@Override
	public String getName() {
		return "TaskMgr";
	}

	@Override
	public void initialize() {
		activeTasks = Collections.synchronizedMap(new HashMap<Long, Task>());
		activeRTasks = Collections.synchronizedMap(new HashMap<Long, RTask>());
		failedTaskMap = new HashMap<Long, Map<Long, ReportStruct>>();
		taskExecutor = Executors.newCachedThreadPool();
		timer = new Timer("任务触发定时器");
	}

	@Override
	public void dispose() {

	}

	@Override
	public void start() {
		LOG.info("开始扫描");
		// taskTimer
		ScheduleRunTask task = new ScheduleRunTask(true);
		long rPerroid = SysCfg.getInstance().getRTaskScanPeroid();
		Date now = new Date();
		timer.schedule(task, now, rPerroid);
		// rtaskTimer
		long tPerroid = SysCfg.getInstance().getTaskScanPeroid();

		task = new ScheduleRunTask(false); 
		timer.schedule(task, new Date(), tPerroid);

		// add by yanb 2014-6-24 去掉bsa的定时任务
		// if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
		// BsaDeduceScheduleMgr deduce = new BsaDeduceScheduleMgr();
		// deduce.start();
		// }
	}

	/**
	 * 添加执行此任务
	 * 
	 * @throws Exception
	 */
	public void addTask(List<? extends Task> taskList, Date scanDate) throws Exception {
		if (taskList == null || taskList.isEmpty())
			return;
		for (Task task : taskList)
			addTask(task, scanDate);
	}

	/**
	 * 添加执行此任务
	 * 
	 * @throws Exception
	 */
	public void addTask(Task task, Date scanDate) throws Exception {
		long id = task.getId();
		boolean isTask = task.isTask();
		if (isActive(id, isTask)) {
			LOG.info("当前任务ID={} isActive", id);
			return;
		}

		if (task.isReady(scanDate)) {

			if (SysCfg.getInstance().getModelId() == ConstDef.NOSS_REPORT) {
				ReportTaskTrigger trigger = new ReportTaskTrigger((NossTask) task, this);
				trigger.report();
			} else {
				if (isTask) {

					if (activeTasks.size() < SysCfg.getInstance().getTaskMaxAction()) {
						TaskTrigger taskTrigger = new TaskTrigger(task, this);

						activeTasks.put(id, task);
						taskExecutor.execute(new Thread(taskTrigger, "TaskTrigger-" + task.getId()));
					}
				} else {
					TaskTrigger taskTrigger = new TaskTrigger(task, this);

					/* 补报任务时候超过补报任务最大个数 */
					if (activeRTasks.size() < SysCfg.getInstance().getRTaskMaxAction())
						activeRTasks.put(id, (RTask) task);
					taskExecutor.execute(new Thread(taskTrigger, "TaskTrigger-" + task.getId()));
				}

			}
		}

	}

	/** 查看此任务是否为活动的(即此任务是否已经在执行) */
	private boolean isActive(long id, boolean isTask) {
		Map<Long, ? extends Task> map = isTask ? activeTasks : activeRTasks;
		return map.containsKey(id);
	}

	/**
	 * 文件上报后的处理
	 * 
	 * @param task
	 *            任务
	 * @throws Exception
	 */
	public void processAfterReport(Task task) throws Exception {
		try {
			updateTaskCurrDataTime(task);// 更新时间
			// to do 开启
			// to do 1 ：省接口上报支持补报， 2 ： bsa目前暂时不支持补报
			if (SysCfg.getInstance().getModelId() == 1) {
				commitReportStruct(task);// 提交补报任务
			}
		}catch(Exception e ){
			LOG.error("错误信息", e.toString());
		}
		finally {
			Thread.sleep(5000);// 为了不让扫描线程重复读取已经上报过的时间点的任务，这里将休眠一定时间，这个时间大概是启动扫描一次任务的时间(就是程序开始扫描数据库，到所有的任务检测完毕所花费的时间)
			removeTask(task);// 从活动任务集合表中删除任务
		}
	}

	/** 更新当前时间 */
	@SuppressWarnings("unchecked")
	private boolean updateTaskCurrDataTime(Task task) throws Exception {
		boolean flag = false;
		// String updateSql = null;
		// String tableName = null;
		if (!task.isTask()) {
			// 如果failedTaskMap含此任务的id号，那么就表示补报未成功，所以就不能更新表的状态，否则就需要更改
			if (failedTaskMap.containsKey(task.getId()))
				return flag;

			// to do 1 ：省接口上报支持补报， 2 ： bsa目前暂时不支持补报
			if (SysCfg.getInstance().getModelId() == 1) {
				RTaskDAO dao = new RTaskDAO();
				flag = dao.update((RTask) task);
			}
			// updateSql =
			// "update nbi_cfg_rtask r set r.state=1,r.counter=r.counter+1 where r.id="
			// + task.getId();
			// tableName = "NBI_CFG_RTASK";
		} else {
			DAO<Task> taskdao = ClassMgr.getInstance().getDAOById(SysCfg.getInstance().getModelId());
			flag = taskdao.update(task);
			// StringBuilder sb = new
			// StringBuilder("update nbi_cfg_task t set t.curr_data_time=to_date('");
			// sb.append(DateUtil.getDateString(task.getNextDataTime()));
			// sb.append("','YYYY-MM-DD HH24:MI:SS')");
			// if (task.getReportTime() != null)
			// {
			// sb.append(", t.reporttime=to_date('");
			// sb.append(DateUtil.getDateString(task.getNextReportTime()));
			// sb.append("','YYYY-MM-DD HH24:MI:SS')");
			// }
			// sb.append(" where t.id=");
			// sb.append(task.getId());
			// updateSql = sb.toString();
			// tableName = "NBI_CFG_TASK";
		}
		// flag = DBUtil.executeUpdate(updateSql) == 1 ? true : false;
		// long taskId = task.getId();
		// LOG.debug("taskId:" + taskId + "  成功更新" + tableName + "表");
		return flag;
	}

	/** 将本次处理失败的任务添加到nbi_cfg_rtask表中 */
	private void commitReportStruct(Task task) throws Exception {
		long id = task.getId();
		synchronized (failedTaskMap) {
			if (!failedTaskMap.containsKey(id))
				return;

			boolean flag = false;
			Map<Long, ReportStruct> map = failedTaskMap.get(id);
			long time = task.getCurrDataTime().getTime();
			if (map.containsKey(time))
				flag = commit(map.get(time));

			// 如果更新成功，那么就删除此时间点的补报结构
			if (flag) {
				map.remove(time);
				// 如果删除后，集合中没有此任务号的补报结构，那么就删除此任务号
				if (map.isEmpty())
					failedTaskMap.remove(id);
			}
		}
	}

	private boolean commit(ReportStruct struct) throws Exception {
		boolean flag = false;
		String cause = struct.getCause();
		String actionIds = getActionId(struct);
		if (struct.isrTaskFlag())
			flag = DBUtil.updateRTask(struct.getId(), actionIds, cause, struct.getCounter());
		else {
			String currDataTime = DateUtil.getDateString(struct.getCurrDataTime());
			flag = DBUtil.insertRTask(struct.getTaskId(), actionIds, cause, currDataTime);
		}
		return flag;
	}

	/** 获取所有需要补报的任务号 */
	private String getActionId(ReportStruct struct) {
		//int maxTime = 3; 
		if (struct.getCounter() >   SysCfg.getInstance().getRTaskMaxAction()) {
			LOG.info("任务号为({})的任务已经达到最大补报次数，放弃补报！", struct.getId());
			return "";
		}
		StringBuilder sb = new StringBuilder();
		List<String> actionList = struct.getActionList();
		int size = actionList.size() - 1;
		for (int i = 0; i < size; i++)
			sb.append(actionList.get(i)).append(",");
		sb.append(actionList.get(size));
		return sb.toString();
	}

	/** 删除指定id的任务 */
	private void removeTask(Task task) {
		long id = task.getId();
		boolean isTask = task.isTask();
		Map<Long, ? extends Task> map = isTask ? activeTasks : activeRTasks;
		if (map.containsKey(id))
			map.remove(id);
	}

	/** 将处理失败的任务添加到失败集合中，便于之后的集中处理 */
	public void newReportTask(Task task, int actionId, String cause) {
		String aId = null;
		if (actionId != -1)// 如果为-1，就表示全部都需要添加
			aId = String.valueOf(actionId);
		long id = task.getId();// 无论task是上报任务还是补报任务，taskId都只是表示id号
		long currDataTime = task.getCurrDataTime().getTime();
		synchronized (failedTaskMap) {
			if (failedTaskMap.containsKey(id)) {
				Map<Long, ReportStruct> map = failedTaskMap.get(id);
				if (map.containsKey(currDataTime)) {
					ReportStruct struct = map.get(currDataTime);
					if (!struct.getActionList().contains(aId))
						struct.getActionList().add(aId);
				} else {
					ReportStruct struct = buildReportStruct(task, aId, cause);
					map.put(currDataTime, struct);
				}
			} else {
				ReportStruct struct = buildReportStruct(task, aId, cause);
				Map<Long, ReportStruct> map = new HashMap<Long, ReportStruct>();
				map.put(currDataTime, struct);
				failedTaskMap.put(id, map);
			}
		}
	}

	/** 根据任务信息，重新组成一个补采结构 */
	private ReportStruct buildReportStruct(Task task, String actionId, String cause) {
		ReportStruct struct = new ReportStruct();
		if (task.isTask())
			struct.setTaskId(task.getId());
		else {
			RTask r = (RTask) task;
			struct.setrTaskFlag(true);
			struct.setId(r.getId());
			struct.setCounter(r.getCounter());
		}
		struct.setCurrDataTime(task.getCurrDataTime());
		struct.setCause(cause);
		List<String> actionList = new ArrayList<String>();
		if (actionId != null)
			actionList.add(actionId);
		struct.setActionList(actionList);

		return struct;
	}

	@Override
	public void stop() {
		timer.cancel();
	}

	private class ScheduleRunTask extends TimerTask {

		private boolean isRTask;

		public ScheduleRunTask(boolean isRTask) {
			this.isRTask = isRTask;
		}

		@Override
		public void run() {
			try {
				if (isRTask) {
					loadReTask();
				} else {
					Date now = new Date();
					loadScanTasks(now);
				}
			} catch (Exception e) {
				LOG.error("加载任务时异常.", e);
			}
		}
	}

	/** 加载任务表中的任务 */
	@SuppressWarnings("unchecked")
	private void loadScanTasks(Date scanDate) throws Exception {
		// DAO<Task> taskdao = new TaskDAO();
		DAO<Task> taskdao = ClassMgr.getInstance().getDAOById(SysCfg.getInstance().getModelId());
		List<Task> taskList = taskdao.loadTasks();
		addTask(taskList, scanDate);
	}

	/** 加载补报表中的任务 */
	private void loadReTask() throws Exception {
		RTaskDAO rTaskDAO = new RTaskDAO();
		// to do 1 ：省接口上报支持补报， 2 ： bsa目前暂时不支持补报
		if (SysCfg.getInstance().getModelId() == 1) {
			List<RTask> taskList = rTaskDAO.loadTasks();
			addTask(taskList, null);
		}
	}

	/** 补报结构 */
	private class ReportStruct {

		boolean rTaskFlag;// 生成此结构的任务是否为补报任务

		long id;// 补报任务的任务号，如果是正常任务需要补报，那么此值为0

		long taskId;// 正常任务的任务号

		int counter;// 计数器

		Date currDataTime;// 当前上报时间点

		List<String> actionList;// 需要补报的actionId集合

		String cause;// 新原因

		public boolean isrTaskFlag() {
			return rTaskFlag;
		}

		public void setrTaskFlag(boolean rTaskFlag) {
			this.rTaskFlag = rTaskFlag;
		}

		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public long getTaskId() {
			return taskId;
		}

		public void setTaskId(long taskId) {
			this.taskId = taskId;
		}

		public int getCounter() {
			return counter;
		}

		public void setCounter(int counter) {
			this.counter = counter + 1;
		}

		public Date getCurrDataTime() {
			return currDataTime;
		}

		public void setCurrDataTime(Date currDataTime) {
			this.currDataTime = currDataTime;
		}

		public List<String> getActionList() {
			return actionList;
		}

		public void setActionList(List<String> actionList) {
			this.actionList = actionList;
		}

		public String getCause() {
			return cause;
		}

		public void setCause(String cause) {
			if (StringUtil.isNull(cause))
				cause = "";
			cause = "[" + cause.trim() + "],";
			this.cause = cause;
		}
	}
}