package cn.uway.nbi.db.pojo;

import java.util.Date;

public class CheckListLog {
	
	/** 日志记录标识 **/
	private long id; 
	
	/** 任务号,同igp_cfg_task/nbi_conf_task.task_id **/
	private long taskId;
	
	/** 任务执行时间 **/
	private Date dataTime;
	
	/** 专业 **/
	private String speciality;
	
	/** 文件名称(NBI打包文件名称，IGP采集文件名称) **/
	private String fileName;
	
	/** 文件大小(NBI打包文件大小) **/
	private long fileSize;
	
	/** 文件路径(NBI打包文件上传路径) **/
	private String filePath;
	
	/** 数据类型 **/
	private String dataType;	
	
	/** 文件来源方,被采集对象的系统名称（存放厂家编码） **/
	private String fileSource;
	
	/** 文件目标方（集团） **/
	private String fileTarget;
	
	/** 采集系统 **/
	private String systemName;
	
	/** 文件传输速率(所有文件大小之和/(文件传输结束时间-文件传输开始时间)) **/
	private double fileTransRate;
	
	/** 文件生成时间(NBI打包文件生成时间) **/
	private Date fileCreateTime;
	
	/** 文件接入开始时间 **/
	private Date accessStartTime;
	
	/** 文件接入结束时间 **/
	private Date accessEndTime;
	
	/** 文件解析开始时间(NBI处理数据时间) **/
	private Date parseStartTime;
	
	/** 文件解析结束时间(NBI处理数据时间) **/
	private Date parseEndTime;
	
	/** 文件传输开始时间 **/
	private Date transStartTime;
	
	/** 文件传输结束时间 **/
	private Date transEndTime;
	
	/** 采集成功失败状态: 1:成功 0：失败 **/
	private int status;
	
	/** 是否重传：1：重传 0：不重传 **/
	private int isReTrans;
	
	/** 接口连接状态: (发生错误时，记录错误的接口状态，正常则记录入库或上传的接口状态) 
	SOCKET: 100：正常 101：异常
	WEBSERVICE:200：正常 201：异常
	FTP:300：正常 301：异常
	DB:400：正常 401：异常 **/
	private int interConnStatus;
	
	/** 异常时间 **/
	private Date exceptionTime;
	
	/** 异常状态码（用于标识是否为同类型错误） **/
	private int errorCode;
	
	/** 异常原因 **/
	private String errorReason;
	
	/** 同类型错误是否已上报 1：已上报 0：未上报 **/
	private int isReport;	
	
	/** 是否重采 1：已重采 0：未重采 **/
	private int isRetryCollect;
	
	/** 是否处理 1：已处理 0：未处理 **/
	private int isProcessing;

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

	public Date getDataTime() {
		return dataTime;
	}

	public void setDataTime(Date dataTime) {
		this.dataTime = dataTime;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getFileSource() {
		return fileSource;
	}

	public void setFileSource(String fileSource) {
		this.fileSource = fileSource;
	}

	public String getFileTarget() {
		return fileTarget;
	}

	public void setFileTarget(String fileTarget) {
		this.fileTarget = fileTarget;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public double getFileTransRate() {
		return fileTransRate;
	}

	public void setFileTransRate(double fileTransRate) {
		this.fileTransRate = fileTransRate;
	}

	public Date getFileCreateTime() {
		return fileCreateTime;
	}

	public void setFileCreateTime(Date fileCreateTime) {
		this.fileCreateTime = fileCreateTime;
	}

	public Date getAccessStartTime() {
		return accessStartTime;
	}

	public void setAccessStartTime(Date accessStartTime) {
		this.accessStartTime = accessStartTime;
	}

	public Date getAccessEndTime() {
		return accessEndTime;
	}

	public void setAccessEndTime(Date accessEndTime) {
		this.accessEndTime = accessEndTime;
	}

	public Date getParseStartTime() {
		return parseStartTime;
	}

	public void setParseStartTime(Date parseStartTime) {
		this.parseStartTime = parseStartTime;
	}

	public Date getParseEndTime() {
		return parseEndTime;
	}

	public void setParseEndTime(Date parseEndTime) {
		this.parseEndTime = parseEndTime;
	}

	public Date getTransStartTime() {
		return transStartTime;
	}

	public void setTransStartTime(Date transStartTime) {
		this.transStartTime = transStartTime;
	}

	public Date getTransEndTime() {
		return transEndTime;
	}

	public void setTransEndTime(Date transEndTime) {
		this.transEndTime = transEndTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIsReTrans() {
		return isReTrans;
	}

	public void setIsReTrans(int isReTrans) {
		this.isReTrans = isReTrans;
	}

	public int getInterConnStatus() {
		return interConnStatus;
	}

	public void setInterConnStatus(int interConnStatus) {
		this.interConnStatus = interConnStatus;
	}

	public Date getExceptionTime() {
		return exceptionTime;
	}

	public void setExceptionTime(Date exceptionTime) {
		this.exceptionTime = exceptionTime;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorReason() {
		return errorReason;
	}

	public void setErrorReason(String errorReason) {
		this.errorReason = errorReason;
	}

	public int getIsReport() {
		return isReport;
	}

	public void setIsReport(int isReport) {
		this.isReport = isReport;
	}

	public int getIsRetryCollect() {
		return isRetryCollect;
	}

	public void setIsRetryCollect(int isRetryCollect) {
		this.isRetryCollect = isRetryCollect;
	}

	public int getIsProcessing() {
		return isProcessing;
	}

	public void setIsProcessing(int isProcessing) {
		this.isProcessing = isProcessing;
	}
	
}
