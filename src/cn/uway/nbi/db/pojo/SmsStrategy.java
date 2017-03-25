package cn.uway.nbi.db.pojo;

import java.util.Date;

public class SmsStrategy {

	private long id;

	private int city_id;

	private int businessid;

	private int specificcode;

	private int dayofweek;

	private int isholiday;

	private int recipienttype;

	private int smsmergerecord;

	private String smscontent;

	private int sendtype;

	private Date nextrunningtime;

	private Date stamptime;

	private int noticeper;

	private int noticeouttime;

	private int presstimeset;

	private int outtime;

	private int alarmcount;

	private int nettype;

	private String emailsubject;

	private String emailcontent;

	private int coalitioncondition;

	private String coalitioncontent;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getCity_id() {
		return city_id;
	}

	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}

	public int getBusinessid() {
		return businessid;
	}

	public void setBusinessid(int businessid) {
		this.businessid = businessid;
	}

	public int getSpecificcode() {
		return specificcode;
	}

	public void setSpecificcode(int specificcode) {
		this.specificcode = specificcode;
	}

	public int getDayofweek() {
		return dayofweek;
	}

	public void setDayofweek(int dayofweek) {
		this.dayofweek = dayofweek;
	}

	public int getIsholiday() {
		return isholiday;
	}

	public void setIsholiday(int isholiday) {
		this.isholiday = isholiday;
	}

	public int getRecipienttype() {
		return recipienttype;
	}

	public void setRecipienttype(int recipienttype) {
		this.recipienttype = recipienttype;
	}

	public int getSmsmergerecord() {
		return smsmergerecord;
	}

	public void setSmsmergerecord(int smsmergerecord) {
		this.smsmergerecord = smsmergerecord;
	}

	public String getSmscontent() {
		return smscontent;
	}

	public void setSmscontent(String smscontent) {
		this.smscontent = smscontent;
	}

	public int getSendtype() {
		return sendtype;
	}

	public void setSendtype(int sendtype) {
		this.sendtype = sendtype;
	}

	public Date getNextrunningtime() {
		return nextrunningtime;
	}

	public void setNextrunningtime(Date nextrunningtime) {
		this.nextrunningtime = nextrunningtime;
	}

	public Date getStamptime() {
		return stamptime;
	}

	public void setStamptime(Date stamptime) {
		this.stamptime = stamptime;
	}

	public int getNoticeper() {
		return noticeper;
	}

	public void setNoticeper(int noticeper) {
		this.noticeper = noticeper;
	}

	public int getNoticeouttime() {
		return noticeouttime;
	}

	public void setNoticeouttime(int noticeouttime) {
		this.noticeouttime = noticeouttime;
	}

	public int getPresstimeset() {
		return presstimeset;
	}

	public void setPresstimeset(int presstimeset) {
		this.presstimeset = presstimeset;
	}

	public int getOuttime() {
		return outtime;
	}

	public void setOuttime(int outtime) {
		this.outtime = outtime;
	}

	public int getAlarmcount() {
		return alarmcount;
	}

	public void setAlarmcount(int alarmcount) {
		this.alarmcount = alarmcount;
	}

	public int getNettype() {
		return nettype;
	}

	public void setNettype(int nettype) {
		this.nettype = nettype;
	}

	public String getEmailsubject() {
		return emailsubject;
	}

	public void setEmailsubject(String emailsubject) {
		this.emailsubject = emailsubject;
	}

	public String getEmailcontent() {
		return emailcontent;
	}

	public void setEmailcontent(String emailcontent) {
		this.emailcontent = emailcontent;
	}

	public int getCoalitioncondition() {
		return coalitioncondition;
	}

	public void setCoalitioncondition(int coalitioncondition) {
		this.coalitioncondition = coalitioncondition;
	}

	public String getCoalitioncontent() {
		return coalitioncontent;
	}

	public void setCoalitioncontent(String coalitioncontent) {
		this.coalitioncontent = coalitioncontent;
	}

}
