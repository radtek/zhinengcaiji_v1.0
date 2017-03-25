package cn.uway.nbi.task.templet.ds;

/**
 * ftp数据源模板
 * 
 * @author litp 2011-4-18
 */
public class FTPFileDSTag extends DSTag {

	private String ip;// ftp服务器的ip地址

	private int port;// 端口号

	private String username;// 用户名

	private String password;// 密码

	private String path;// 采集路径

	public FTPFileDSTag() {
		super();
	}

	public FTPFileDSTag(int id, int type) {
		super(id, type);
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
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
