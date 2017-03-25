package cn.uway.nbi.task.templet;

import cn.uway.nbi.task.triggerbean.TriggerBean;

/**
 * 传输接口(transfer interface)
 * 
 * @author litp 2011-4-18
 */
public class TITag {

	private int id;

	private TriggerBean triggerTag;

	private String ftpIp;// ftp服务器的ip地址

	private int port;// 端口号

	private String username;// 用户名

	private String password;// 密码

	private String path;// 采集路径

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TriggerBean getTriggerTag() {
		return triggerTag;
	}

	public void setTriggerTag(TriggerBean triggerTag) {
		this.triggerTag = triggerTag;
	}

	public String getFtpIp() {
		return ftpIp;
	}

	public void setFtpIp(String ftpIp) {
		this.ftpIp = ftpIp;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
