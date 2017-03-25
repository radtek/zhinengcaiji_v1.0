package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.framework.IDMember;

/**
 * FTP数据源
 * 
 * @author litp 2011-4-20
 */
@IDMember(id = 201)
public class FTPFileDS extends AbstractDS {

	private String ip;// ftp服务器的ip地址

	private int port;// 端口号

	private String username;// 用户名

	private String password;// 密码

	private String path;// 采集路径

	private String encode;// FTP字符集

	private boolean bPasv = true;// 主被动模式 , true : 被动模式 false : 主动模式

	private String localDownPath;

	public FTPFileDS() {
		super();
	}

	public FTPFileDS(int id, int type) {
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

	public boolean isbPasv() {
		return bPasv;
	}

	public void setbPasv(boolean bPasv) {
		this.bPasv = bPasv;
	}

	public String getLocalDownPath() {
		return localDownPath;
	}

	public void setLocalDownPath(String localDownPath) {
		this.localDownPath = localDownPath;
	}

	@Override
	public void setFileds(Map<String, String> elementMap) {
		setIp(elementMap.get("ftpip"));
		setPort(Integer.parseInt(elementMap.get("port")));
		setUsername(elementMap.get("username"));
		setPassword(elementMap.get("password"));
		setPath(elementMap.get("path"));
		String fpass = elementMap.get("conn_ftp_passive");
		setEncode(elementMap.get("encode"));
		boolean b = true;// 默认是被动模式
		if (StringUtil.isNotNull(fpass)) {
			b = (fpass.equals("1") ? true : false);
		}
		setbPasv(b);

		setLocalDownPath(elementMap.get("localdir"));
	}
}
