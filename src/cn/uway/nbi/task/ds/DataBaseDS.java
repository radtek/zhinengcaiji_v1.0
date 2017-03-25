package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.nbi.framework.IDMember;

/**
 * 数据库数据源
 * 
 * @author litp 2011-4-20
 */
@IDMember(id = 100)
public class DataBaseDS extends AbstractDS {

	private String driver;// 驱动程序

	private String url;// 连接地址

	private String username;// 用户名

	private String password;// 密码

	public DataBaseDS() {
		super();
	}

	public DataBaseDS(int id, int type) {
		super(id, type);
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	@Override
	public void setFileds(Map<String, String> elementMap) {
		setDriver(elementMap.get("driver"));
		setUrl(elementMap.get("url").trim());
		setUsername(elementMap.get("username"));
		setPassword(elementMap.get("password"));

	}
}
