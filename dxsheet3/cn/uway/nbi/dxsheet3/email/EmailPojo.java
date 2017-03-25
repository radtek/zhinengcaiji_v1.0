package cn.uway.nbi.dxsheet3.email;

import java.io.Serializable;

public class EmailPojo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String smcTitle;

	private String tousers;

	private String content;

	private String username = System.getProperty("smc_username");

	private String password = System.getProperty("smc_password");

	private Integer srcId = Integer.valueOf(System.getProperty("smc_srcId"));

	private Integer level = Integer.valueOf(System.getProperty("smc_level"));

	private Integer sendWay;

	private String attachment;

	private byte[] attachmentfile;

	private String sendTime;

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public byte[] getAttachmentfile() {
		return attachmentfile;
	}

	public void setAttachmentfile(byte[] attachmentfile) {
		this.attachmentfile = attachmentfile;
	}

	public String getSmcTitle() {
		return smcTitle;
	}

	public void setSmcTitle(String smcTitle) {
		this.smcTitle = smcTitle;
	}

	public String getTousers() {
		return tousers;
	}

	public void setTousers(String tousers) {
		this.tousers = tousers;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSrcId() {
		return srcId;
	}

	public void setSrcId(Integer srcId) {
		this.srcId = srcId;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSendWay() {
		return sendWay;
	}

	public void setSendWay(Integer sendWay) {
		this.sendWay = sendWay;
	}
}
