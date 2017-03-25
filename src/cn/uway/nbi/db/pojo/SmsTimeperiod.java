package cn.uway.nbi.db.pojo;

public class SmsTimeperiod {

	private int id;

	private int seqno;

	private int starthour;

	private int startminute;

	private int endhour;

	private int endminute;

	private int nettype;

	private int typeid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	public int getStarthour() {
		return starthour;
	}

	public void setStarthour(int starthour) {
		this.starthour = starthour;
	}

	public int getStartminute() {
		return startminute;
	}

	public void setStartminute(int startminute) {
		this.startminute = startminute;
	}

	public int getEndhour() {
		return endhour;
	}

	public void setEndhour(int endhour) {
		this.endhour = endhour;
	}

	public int getEndminute() {
		return endminute;
	}

	public void setEndminute(int endminute) {
		this.endminute = endminute;
	}

	public int getNettype() {
		return nettype;
	}

	public void setNettype(int nettype) {
		this.nettype = nettype;
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

}
