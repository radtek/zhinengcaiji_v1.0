package cn.uway.nbi.task.t;

import java.util.List;

import cn.uway.nbi.task.triggerbean.TriggerBean;

/**
 * Strategy
 * 
 * @author liuwx 2012-9-7
 */
public class Strategy {

	private List<TriggerBean> triggerList;

	public Strategy() {
	}

	public List<TriggerBean> getTriggerList() {
		return triggerList;
	}

	public void setTriggerList(List<TriggerBean> triggerList) {
		this.triggerList = triggerList;
	}

}
