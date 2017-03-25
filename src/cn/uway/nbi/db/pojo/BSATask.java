package cn.uway.nbi.db.pojo;

import java.util.Date;

public class BSATask extends Task {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int planid;

	private String planno;

	private Date plan_time;

	private int frequency;

	private String syncmode;

	private String synctype;

	private String synfile;

	private String syncer;

	private String creater;

	private Date createrDate;

	private long strategyId;

	private int iseffect;

	private SmsStrategy strategy;

	public int getPlanid() {
		return planid;
	}

	public void setPlanid(int planid) {
		this.planid = planid;
	}

	public String getPlanno() {
		return planno;
	}

	public void setPlanno(String planno) {
		this.planno = planno;
	}

	public Date getPlan_time() {
		return plan_time;
	}

	public void setPlan_time(Date plan_time) {
		this.plan_time = plan_time;
	}

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public String getSyncmode() {
		return syncmode;
	}

	public void setSyncmode(String syncmode) {
		this.syncmode = syncmode;
	}

	public String getSynctype() {
		return synctype;
	}

	public void setSynctype(String synctype) {
		this.synctype = synctype;
	}

	public String getSynfile() {
		return synfile;
	}

	public void setSynfile(String synfile) {
		this.synfile = synfile;
	}

	public String getSyncer() {
		return syncer;
	}

	public void setSyncer(String syncer) {
		this.syncer = syncer;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public Date getCreaterDate() {
		return createrDate;
	}

	public void setCreaterDate(Date createrDate) {
		this.createrDate = createrDate;
	}

	public long getStrategyId() {
		return strategyId;
	}

	public void setStrategyId(long strategyId) {
		this.strategyId = strategyId;
	}

	public SmsStrategy getStrategy() {
		return strategy;
	}

	public void setStrategy(SmsStrategy strategy) {
		this.strategy = strategy;
	}

	public int getIseffect() {
		return iseffect;
	}

	public void setIseffect(int iseffect) {
		this.iseffect = iseffect;
	}

}
