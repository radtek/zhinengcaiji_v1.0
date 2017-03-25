package cn.uway.nbi.task.templet.ds;

/**
 * 数据库数据源模板
 * 
 * @author litp 2011-4-18
 */
public class DataBaseDSTag extends DSTag {

	private String driver;// 驱动程序

	private String url;// 连接地址

	private String username;// 用户名

	private String password;// 密码

	public DataBaseDSTag() {
		super();
	}

	public DataBaseDSTag(int id, int type) {
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
}
