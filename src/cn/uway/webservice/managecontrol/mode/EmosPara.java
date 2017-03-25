package cn.uway.webservice.managecontrol.mode;

public class EmosPara {

	private String btsName;

	private int netType;

	public EmosPara(String btsName, int netType) {
		super();
		this.btsName = btsName;
		this.netType = netType;
	}

	public String getBtsName() {
		return btsName;
	}

	public void setBtsName(String btsName) {
		this.btsName = btsName;
	}

	public int getNetType() {
		return netType;
	}

	public void setNetType(int netType) {
		this.netType = netType;
	}

}
