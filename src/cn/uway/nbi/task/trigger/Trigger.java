package cn.uway.nbi.task.trigger;

/**
 * 触发器接口(用于触发事件)
 * 
 * @author litp 2011-8-5
 */
public interface Trigger {

	public void onTrigger() throws Exception;
}