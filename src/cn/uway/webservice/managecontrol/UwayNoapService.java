package cn.uway.webservice.managecontrol;

/**
 * EMOS服务接口
 * 
 */
public interface UwayNoapService {

	/**
	 * 异步接口
	 * 
	 * @param dataTime
	 *            时间
	 * @return 上报的文件名
	 */
	public int UwayKpiQueryAsync(String dataTime);
}
