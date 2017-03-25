package cn.uway.webservice.managecontrol;

/**
 * EMOS服务接口
 */
public interface EMOSWebService {

	/**
	 * 同步接口
	 * 
	 * @param BTSName
	 *            基站名
	 * @param NETWORK_TYPE
	 *            网络类型
	 * @return 上报的文件名
	 */
	public String EMOSQuery(String BTSName, int type);

	/**
	 * 异步接口
	 * 
	 * @param BTSName
	 *            基站名
	 * @param NETWORK_TYPE
	 *            网络类型
	 * @return 上报的文件名
	 */
	public int EMOSAsyncQuery(String BTSName, int type);
}
