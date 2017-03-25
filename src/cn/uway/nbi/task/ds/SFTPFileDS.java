package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.framework.IDMember;

@IDMember(id = 203)
public class SFTPFileDS extends AbstractDS {

	private String ip;// ftp服务器的ip地址

	private int port;// 端口号

	private String username;// 用户名

	private String password;// 密码

	private String path;// 采集路径

	private String encode;// FTP字符集

	private String localDownPath;
	
	private int maxPoolSize;

	public SFTPFileDS() {
		super();
	}

	public SFTPFileDS(int id, int type) {
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

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
	}

	public String getLocalDownPath() {
		return localDownPath;
	}

	public void setLocalDownPath(String localDownPath) {
		this.localDownPath = localDownPath;
	}
	
	public int getMaxPoolSize() {
		return maxPoolSize;
	}

	public void setMaxPoolSize(int maxPoolSize) {
		this.maxPoolSize = maxPoolSize;
	}

	@Override
	public void setFileds(Map<String, String> elementMap) {
		setIp(elementMap.get("ftpip"));
		setPort(Integer.parseInt(elementMap.get("port")));
		setUsername(elementMap.get("username"));
		setPassword(elementMap.get("password"));
		setPath(elementMap.get("path"));
		setEncode(elementMap.get("encode"));
		
		setLocalDownPath(elementMap.get("localdir"));
		String maxPoolSize = elementMap.get("maxPoolSize");
		if(StringUtil.isNotNull(maxPoolSize))
		{
			setMaxPoolSize(Integer.parseInt(maxPoolSize));
		}
	}
}

