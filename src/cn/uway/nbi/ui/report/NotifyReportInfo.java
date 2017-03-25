package cn.uway.nbi.ui.report;

/**
 * 上报信息数据类
 * 
 * @author lizt
 */
public class NotifyReportInfo {

	private String requestId;

	private String fileType;

	private String domainType;

	private String serCaller;

	private long task_id;

	private String fileAddr;

	public String getFileAddr() {
		return fileAddr;
	}

	public void setFileAddr(String fileAddr) {
		this.fileAddr = fileAddr;
	}

	public long getTask_id() {
		return task_id;
	}

	public void setTask_id(long task_id) {
		this.task_id = task_id;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getDomainType() {
		return domainType;
	}

	public void setDomainType(String domainType) {
		this.domainType = domainType;
	}

	public String getSerCaller() {
		return serCaller;
	}

	public void setSerCaller(String serCaller) {
		this.serCaller = serCaller;
	}
}
