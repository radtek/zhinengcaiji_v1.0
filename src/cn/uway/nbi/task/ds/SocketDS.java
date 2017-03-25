package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.nbi.framework.IDMember;

/**
 * socket数据源
 * 
 * @author litp 2011-4-20
 */
@IDMember(id = 300)
public class SocketDS extends AbstractDS {

	private String ip;// 连接ip地址

	private int port;// 连接端口

	public SocketDS() {
		super();
	}

	public SocketDS(int id, int type) {
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

	@Override
	public void setFileds(Map<String, String> elementMap) {
		setIp(elementMap.get("ip"));
		setPort(Integer.parseInt(elementMap.get("port")));
	}

}
