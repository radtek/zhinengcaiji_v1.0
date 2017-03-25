package cn.uway.webservice.dt;

/**
 * DTService
 * 
 * @author liuwx
 */
public interface DTService {

	public String getBtsJSON(String type, String userName, String password);

	public String getBtsInfoXml(String type, String btsid, String userName, String password);

	/**
	 * 获取室分基站名称、经纬度、扇区个数信息
	 * 
	 * @param userName
	 *            数据库用户名
	 * @param password
	 *            密码
	 * @param type
	 *            网络类型 (g/w)
	 * @return XML字符串
	 */
	public String getBtsCoordinateXML(String type, String userName, String password);

	/**
	 * 查询室分站详细信息
	 * 
	 * @param userName
	 *            数据库用户名
	 * @param password
	 *            密码
	 * @param type
	 *            网络类型 (g/w)
	 * @param id
	 * @return XML字符串
	 */
	public String getBtsDetailInfoXML(String type, String id, String userName, String password);

	// public LoginResponse login(String name, String password);
}
