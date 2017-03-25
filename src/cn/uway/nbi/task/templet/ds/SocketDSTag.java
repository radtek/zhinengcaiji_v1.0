package cn.uway.nbi.task.templet.ds;

/**
 * socket数据源模板
 * 
 * @author litp 2011-4-18
 */
public class SocketDSTag extends DSTag {

	private String ip;// 连接ip地址

	private int port;// 连接端口

	public SocketDSTag() {
		super();
	}

	public SocketDSTag(int id, int type) {
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

}
