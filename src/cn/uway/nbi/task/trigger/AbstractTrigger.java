package cn.uway.nbi.task.trigger;

import cn.uway.nbi.db.pojo.Task;

/**
 * 触发器抽象类
 * 
 * @author litp 2011-8-5
 */
public abstract class AbstractTrigger implements Trigger {

	// 触发实体类
	protected Class<?> clazz;

	// 触发实体参数
	protected Object param;

	protected Task task;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Object getParam() {
		return param;
	}

	public void setParam(Object param) {
		this.param = param;
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public void setClazz(Class<?> clazz) {
		this.clazz = clazz;
	}

}