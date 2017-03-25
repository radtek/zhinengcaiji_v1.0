package cn.uway.nbi.db.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 周期上报
 * 
 * @author ct
 * @version 1.0
 * @created 7-4-2015 11:11:12
 */
public class CycFileStatus implements Serializable {

	private static final long serialVersionUID = -5170619801723338324L;

	protected long taskId;//任务id

	protected Date dataTime;//当前要上报数据的时间
	
	protected Date insertTime;//入库时间
	
	protected String fileName;//文件名 （包含相对路径）
	
	protected int status;//上报状态 0 = 未上报成功，1=上报成功

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

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
}