package cn.uway.nbi.task.trigger;

import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.task.triggerbean.TriggerBean;

/**
 * 目标方法发生异常时执行的方法
 * 
 * @author litp 2011-8-5
 */
@IDMember(id = 3)
public class TriggerException extends AbstractTrigger {

	@Override
	public void onTrigger() throws Exception {
		TriggerBean tb = (TriggerBean) clazz.newInstance();
		tb.setParam(param);
		tb.trigger(task);
	}
}