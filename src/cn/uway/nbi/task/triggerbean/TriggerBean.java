package cn.uway.nbi.task.triggerbean;

import java.util.List;

import cn.uway.nbi.db.pojo.NBILog;
import cn.uway.nbi.db.pojo.Task;

/**
 * 事件触发实体 * @author liuwx
 */
public abstract class TriggerBean {

	//代码模板数据
	protected Object param;

	protected List<String> fileNames;

	//文件上传之后的日志文件
	protected List<NBILog> nbiLogList;
	
	public List<String> getFileNames() {
		return fileNames;
	}

	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}

	public Object getParam() {
		return param;
	}

	public void setParam(Object param) throws Exception {
		this.param = param;
	}
	
	public void setNbiLogList(List<NBILog> nbiLogList) {
		this.nbiLogList = nbiLogList;
	}

	/**
	 * 执行操作
	 * 
	 * @throws Exception
	 */
	public abstract void trigger(Task task) throws Exception;

}