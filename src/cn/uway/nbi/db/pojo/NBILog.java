package cn.uway.nbi.db.pojo;

public class NBILog {

	private int dataType;

	private String netType;

	private String netGran;

	private int timeGran;

	private String dataTime;

	private String fileName;

	private String fileFtpDir;

	private long fileSizeBytes;

	private long recordCount;

	private String ftpIp;

	private int ftpPort;

	private String ftpUser;

	private int uploadResult;

	private String failReason;

	private String insertTime;

	private long taskId;

	private long actionId;

	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	public String getNetType() {
		return netType;
	}

	public void setNetType(String netType) {
		this.netType = netType;
	}

	public String getNetGran() {
		return netGran;
	}

	public void setNetGran(String netGran) {
		this.netGran = netGran;
	}

	public int getTimeGran() {
		return timeGran;
	}

	public void setTimeGran(int timeGran) {
		this.timeGran = timeGran;
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileFtpDir() {
		return fileFtpDir;
	}

	public void setFileFtpDir(String fileFtpDir) {
		this.fileFtpDir = fileFtpDir;
	}

	public long getFileSizeBytes() {
		return fileSizeBytes;
	}

	public void setFileSizeBytes(long fileSizeBytes) {
		this.fileSizeBytes = fileSizeBytes;
	}

	public long getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}

	public String getFtpIp() {
		return ftpIp;
	}

	public void setFtpIp(String ftpIp) {
		this.ftpIp = ftpIp;
	}

	public int getFtpPort() {
		return ftpPort;
	}

	public void setFtpPort(int ftpPort) {
		this.ftpPort = ftpPort;
	}

	public String getFtpUser() {
		return ftpUser;
	}

	public void setFtpUser(String ftpUser) {
		this.ftpUser = ftpUser;
	}

	public int getUploadResult() {
		return uploadResult;
	}

	public void setUploadResult(int uploadResult) {
		this.uploadResult = uploadResult;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}

	public String getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public long getActionId() {
		return actionId;
	}

	public void setActionId(long actionId) {
		this.actionId = actionId;
	}

}
