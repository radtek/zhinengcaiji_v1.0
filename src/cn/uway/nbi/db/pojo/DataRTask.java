package cn.uway.nbi.db.pojo;

/**
 * 数据核查补报，重报任务
 * 
 * @author Admin
 * 
 */
public class DataRTask extends RTask {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 上报类型 1：补报， 2. 重报
	 */
	private int reportType;

	/**
	 * 集团规范上报名
	 */
	private String askReportFile;

	/**
	 * 实际上报的名称
	 */
	private String actureReportFile;

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getAskReportFile() {
		return askReportFile;
	}

	public void setAskReportFile(String askReportFile) {
		this.askReportFile = askReportFile;
	}

	public String getActureReportFile() {
		return actureReportFile;
	}

	public void setActureReportFile(String actureReportFile) {
		this.actureReportFile = actureReportFile;
	}

}
