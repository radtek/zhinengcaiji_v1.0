package cn.uway.webservice.managecontrol;

/**
 * 深度覆盖接口
 * 
 * @author yanb @ 2014年5月23日
 */
public interface DcsWebService {

	/**
	 * 区域信息同步查询
	 * 
	 * @return String ftp路径
	 */
	String dcsSceneSyncQuery();

	/**
	 * 区域与小区关系同步查询服务
	 * 
	 * @return String ftp路径
	 */
	String dcsSceneCellSyncQuery();

	/**
	 * 区域与楼宇关系同步查询服务
	 * 
	 * @return String ftp路径
	 */
	String dcsSceneBuildingSyncQuery();

}
