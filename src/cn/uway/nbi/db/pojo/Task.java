package cn.uway.nbi.db.pojo;

import static cn.uway.nbi.util.ConstDef.F_SEP;
import static cn.uway.nbi.util.ConstDef.TEMPLET_PATH_FOR_TASK;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.uway.nbi.task.templet.Templet;

/**
 * 上报任务
 * 
 * @author liuwx
 * @version 1.0
 * @created 22-2-2011 16:11:12
 */
public class Task implements Serializable {

	private static final long serialVersionUID = 1L;

	protected long id;//

	protected Date currDataTime;// 任务采集时间点

	protected String pcName;// 机器名称

	protected String templetPath;// 模板绝对路径：如果数据库记录为空，那么就为(nbi_任务号.xml),如果仅为文件名那么就为(配置路径+文件名)，如果为绝对路径就不用改变

	protected String period;// 上报周期:m H D W M HY Y 默认为分钟(填写数字时) nc(no_cyc 非周期上报)

	protected boolean isUsed;// 数据库中任务是否可用

	protected Date endDataTime;// 本任务执行结束时间

	protected int reportOffset;// 上报时间偏移量，单位为分钟

	protected Date reportTime;// 上报时间

	protected String description;//

	//
	protected long periodTime;

	protected boolean isTask;// 如果为上报任务就为true,补报任务就为false

	//
	protected Templet templet;

	protected boolean usedFlag = false;// 判断是否正在被使用

	protected boolean isSms = false;

	protected Map<String, String> paraMap;

	protected String net_type;// 网络类型

	protected String version;// 版本号
	
	// 正常的日志对象列表
	protected List<CheckListLog> logs = new ArrayList<CheckListLog>(); 
	
	// 用于记录公共字段,出现错误时记录这个对象
	protected CheckListLog log = new CheckListLog();
	
	// 最后一层打包位置
	protected String lastPack;

	public String getNet_type() {
		return net_type;
	}

	public void setNet_type(String netType) {
		net_type = netType;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public boolean isUsed() {
		return isUsed;
	}

	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}

	public Date getEndDataTime() {
		return endDataTime;
	}

	public void setEndDataTime(Date endDataTime) {
		this.endDataTime = endDataTime;
	}

	public int getReportOffset() {
		return reportOffset;
	}

	/** 返回时间单位的毫秒数 */
	public int getReportOffsetMilliSeconds() {
		return reportOffset * 60 * 1000;
	}

	public void setReportOffset(int reportOffset) {
		this.reportOffset = reportOffset;
	}

	public Date getReportTime() {
		return reportTime;
	}

	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isSms() {
		return isSms;
	}

	public void setSms(boolean isSms) {
		this.isSms = isSms;
	}

	public Templet getTemplet() {
		return templet;
	}

	public void setTemplet(Templet templet) {
		this.templet = templet;
	}

	public boolean isUsedFlag() {
		return usedFlag;
	}

	public void setUsedFlag(boolean usedFlag) {
		this.usedFlag = usedFlag;
	}

	public boolean isTask() {
		return isTask;
	}

	public void setTask(boolean isTask) {
		this.isTask = isTask;
	}

	/**
	 * 获得一个周期的时间
	 * 
	 * @throws Exception
	 */
	public long getPeroidTime() throws Exception {
		if (periodTime != 0)
			return periodTime;

		long minute = 60 * 1000l;// 一分钟
		if (period == null || "".equals(period))
			throw new Exception("任务号为(" + id + ")的任务中周期为空!");

		if (period.matches("\\d+"))
			periodTime = Integer.parseInt(period) * minute;
		else {

			int periodunit = getPeriodUnit(period);
			Calendar c = Calendar.getInstance();
			if (period.endsWith("m")) {
				periodTime = minute;
			} else if (period.endsWith("H")) {
				periodTime = 60 * minute;
			} else if (period.endsWith("D")) {
				periodTime = 24 * 60 * minute;
			} else if (period.endsWith("W")) {
				periodTime = 7 * 24 * 60 * minute;
			} else if (period.endsWith("M")) {
				c.setTime(currDataTime);
				c.add(Calendar.MONTH,1);//日期加1个月
				periodTime =c.getTimeInMillis() - currDataTime.getTime();
			} else if (period.endsWith("HY")) {
				periodTime = getDays(c, 6) * 24 * 60 * minute;
			} else if (period.endsWith("Y")) {
				periodTime = c.getActualMaximum(Calendar.DAY_OF_YEAR) * 24 * 60 * minute;
			} else {
				throw new Exception("任务号为(" + id + ")的任务中上报周期配置错误!");
			}
			if (periodunit != 0)
				periodTime = periodunit * periodTime;
		}
		return periodTime;
	}

	/**
	 * 获取下一个当前时间 点的时间戳
	 * 
	 * @throws Exception
	 */
	public Date getNextDataTime() throws Exception {
		long nextTime = currDataTime.getTime() + getPeroidTime();
		return new Date(nextTime);
	}

	/**
	 * 获取下一个上报时间 点的时间戳
	 * 
	 * @throws Exception
	 */
	public Date getNextReportTime() throws Exception {
		if (reportTime == null)
			throw new Exception("上报时间为空！");

		long nextRTime = reportTime.getTime() + getPeroidTime();
		return new Date(nextRTime);
	}

	/** 获取当前时间接下来几个月的天数 */
	private int getDays(Calendar c, int months) {
		int month = c.get(Calendar.MONTH);
		int days = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int i = 1; i < months; i++) {
			c.set(Calendar.MONTH, month + i);
			days += c.getActualMaximum(Calendar.DAY_OF_MONTH);
		}
		return days;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCurrDataTime() {
		return currDataTime;
	}

	public void setCurrDataTime(Date currDataTime) {
		this.currDataTime = currDataTime;
	}

	public String getPcName() {
		return pcName;
	}

	public void setPcName(String pcName) {
		this.pcName = pcName;
	}

	/** 获取模板的绝对路径 */
	public String getTempletPath() {
		return templetPath;
	}

	public void setTempletPath(String templetName) {
		// 如果模板名为空，那么就为nbi_id.xml；如果只是文件名，那就表为模板路径加上文件名；否则就为绝对路径名
		if (templetName == null || "".equals(templetName))
			templetName = TEMPLET_PATH_FOR_TASK + "nbi_" + id + ".xml";
		else if (!templetName.contains(F_SEP))
			templetName = TEMPLET_PATH_FOR_TASK + templetName;
		this.templetPath = templetName;
	}

	@Override
	public String toString() {
		return "task-id:" + id;
	}

	/**
	 * 查看此任务是否已经准备就绪
	 * 
	 * @throws Exception
	 */
	public boolean isReady(Date scanDate) throws Exception {
		// 补报任务默认都已准备好
		if (!this.isTask())
			return true;
		boolean bReturn = false;
		long currTime = this.getCurrDataTime().getTime();
		Date endDataTime = this.getEndDataTime();
		// 如果结束时间不为空
		if (endDataTime != null) {
			long endTime = endDataTime.getTime();
			// 如果结束时间小于开始时间，那么此任务为无效
			if (endTime < currTime)
				return bReturn;
		}
		long scanTime = scanDate.getTime();
		Date reportTime = this.getReportTime();
		// 如果上报时间为空
		if (reportTime == null) {
			// 并且扫描时间大于当前时间
			if (scanTime >= currTime)
				bReturn = true;
		} else {
			long reportTimeL = reportTime.getTime();
			// 如果上报时间不大于当前时间，那就代表上报时间配置错误，那么就不对上报时间进行处理
			if (reportTimeL <= currTime) {
				if (scanTime >= currTime)
					bReturn = true;
			} else {
				long rOffset = this.getReportOffsetMilliSeconds();
				// 如果扫描时间大于等于上报时间 减去时间偏移量
				if (reportTimeL - scanTime <= rOffset)
					bReturn = true;
			}
		}
		return bReturn;
	}

	public Map<String, String> getParaMap() {
		return paraMap;
	}

	public void setParaMap(Map<String, String> paraMap) {
		this.paraMap = paraMap;
	}

	public int getPeriodUnit(String input) {
		int result = 0;
		Pattern p = Pattern.compile("(\\d+)");
		Matcher m = p.matcher(input);
		if (m.find()) {
			String s1 = m.group(1);
			result = Integer.valueOf(s1);
		}
		return result;
	}

	public List<CheckListLog> getLogs() {
		return logs;
	}

	public void setLogs(List<CheckListLog> logs) {
		this.logs = logs;
	}
	
	public CheckListLog getLog() {
		return log;
	}

	public void setLog(CheckListLog log) {
		this.log = log;
	}
	
	public String getLastPack() {
		return lastPack;
	}

	public void setLastPack(String lastPack) {
		this.lastPack = lastPack;
	}

	public static void main(String[] args) throws Exception {
		Pattern p = Pattern.compile("(\\d+)");
		Matcher m = p.matcher("34D");
		if (m.find()) {
			String s0 = m.group();
			String s1 = m.group(1);
			System.out.println(s0 + "||" + s1);
		}

		// Task t = new Task();
		// Date now = new Date();
		// System.out.println(DateUtil.getDateString(now));
		// t.setCurrDataTime(now);
		// t.setPeriod("M");
		// System.out.println(DateUtil.getDateString(t.getNextDataTime()));

	}
}