package cn.uway.nbi.task.templet;

import java.util.List;

import cn.uway.nbi.task.triggerbean.TriggerBean;

/**
 * 处理策略
 * 
 * @author litp 2011-4-18
 */
public class StrategyTag {

	private int maxTimes;// 上报失败的次数，如果达到次数还是失败，那么将放弃上报

	private List<String> failList;// 处理失败时的 策略

	private List<TriggerBean> triggerTagList;

	private String ids;

	public List<String> getFailList() {
		return failList;
	}

	public void setFailList(List<String> failList) {
		this.failList = failList;
	}

	public int getMaxTimes() {
		return maxTimes;
	}

	public void setMaxTimes(int maxTimes) {
		this.maxTimes = maxTimes;
	}

	public List<TriggerBean> getTriggerTagList() {
		return triggerTagList;
	}

	public void setTriggerTagList(List<TriggerBean> triggerTagList) {
		this.triggerTagList = triggerTagList;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
