package cn.uway.nbi.task;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.task.t.TAction;
import cn.uway.nbi.task.templet.Templet;
import cn.uway.nbi.task.templet.TempletParser;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * 数据源触发器(根据任务中数据源的不同，启动不同的数执行)
 * 
 * @author litp 2011-4-20
 */
public class TaskTrigger implements Runnable {

	private Task task;

	private TaskMgr taskMgr;

	private ExecutorService dsExecutor; // 任务线程池

	private static final Logger LOG = LoggerFactory.getLogger(TaskTrigger.class);

	public TaskTrigger(Task task, TaskMgr taskMgr) {
		this.task = task;
		this.taskMgr = taskMgr;
	}

	/**
	 * 初始化方法
	 * 
	 * @throws Exception
	 */
	private void init() throws Exception {
		Templet templet = createTemplet(task);
		task.setTemplet(templet);
	}

	@Override
	public void run() {
		boolean eFlag = false;// 是否发生异常
		String cause = null;// 发生异常的原因
		try {
			LOG.info("任务开始执行.");
			init();//
			execute();
		} catch (Exception e) {
			// 目前只是一个处理策略
			// 此处只是一个处理策略
			if (e instanceof Exception) {
				eFlag = true;
				cause = e.getMessage();
			}
			LOG.error("执行任务时发生错误.", e);
		} finally {
			if (eFlag)
				TaskMgr.getInstance().newReportTask(task, -1, cause);
			try {
				taskMgr.processAfterReport(task);// 上报完的处理
			} catch (Exception e) {
				LOG.error("上报完后的处理发生错误.", e);
			}
		}
	}

	/** 执行模板中所有的数据源的操作 */
	private void execute() {
		Map<Integer, TAction> actions = task.getTemplet().getActions();
		int size = actions.size();
		dsExecutor = Executors.newFixedThreadPool(size);
		CountDownLatch latch = new CountDownLatch(size);
		Collection<TAction> allAction = actions.values();
		try {
			// bsa 这里改为串行执行
			if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
				for (TAction a : allAction) {
					a.init(task, latch);
					a.run();
				}
			} else {
				for (TAction a : allAction) {
					a.init(task, latch);
					// 开始执行任务操作
					dsExecutor.execute(new Thread(a, "TAction-" + a.getId()));
				}
				dsExecutor.shutdown();
				int reportTime = SysCfg.getInstance().getMaxReportTime();
				if (reportTime <= 0)
					latch.await();
				else
					latch.await(reportTime, TimeUnit.MINUTES);
			}
		} catch (InterruptedException e) {
			LOG.warn("上报意外结束,原因:线程被外部意外中断!({})", e);
		} catch (Exception e) {
			LOG.error("上报时发生错误!({})", e);
		} finally {
			if (!dsExecutor.isShutdown())
				dsExecutor.shutdown();
		}
	}

	/** 根据任务信息获取模板 */
	private Templet createTemplet(Task task) throws Exception {
		TempletParser parser = new TempletParser(task);
		parser.parse();
		Templet templet = parser.getTemplet();
		if (!task.isTask()) {
			RTask r = (RTask) task;
			List<String> actionList = r.getActionList();
			// 如果为空，那么将上报模板中所有的action指定的数据
			if (actionList != null) {
				Map<Integer, TAction> actions = new HashMap<Integer, TAction>();
				for (String aId : actionList) {
					int id = Integer.parseInt(aId);
					actions.put(id, templet.getActions().get(id));
				}
				templet.setActions(actions);
			}
		}
		return templet;
	}
}