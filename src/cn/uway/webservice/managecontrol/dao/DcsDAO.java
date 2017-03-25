package cn.uway.webservice.managecontrol.dao;

import java.util.List;

/**
 * 深度覆盖接口
 * 
 * @author yanb @ 2014年5月23日
 */
public interface DcsDAO {

	/**
	 * 区域信息同步查询服务
	 * 
	 * @return List<String[]> 数据
	 */
	List<String[]> queryDcsScene() throws Exception;

	/**
	 * 区域与小区关系同步查询服务
	 * 
	 * @return List<String[]> 数据
	 */
	List<String[]> queryDcsSceneCell() throws Exception;

	/**
	 * 区域与楼宇关系同步查询服务
	 * 
	 * @return List<String[]> List<String[]>
	 */
	List<String[]> queryDcsSceneBuilding() throws Exception;
}
