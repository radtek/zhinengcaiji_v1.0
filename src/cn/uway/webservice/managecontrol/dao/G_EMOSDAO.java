package cn.uway.webservice.managecontrol.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.uway.nbi.db.dbpool.DBPoolMgrGsm;

/**
 * 广东联通网络公司全流程管控系统接口
 * 
 * @author liuwx
 */
public class G_EMOSDAO extends EMOSDAO {

	/**
	 * 获取到链接
	 * 
	 * @return Connection Connection
	 * @throws Exception
	 *             Exception
	 */
	@Override
	protected Connection getConnection() throws Exception {
		return DBPoolMgrGsm.getConnection();
	}

	/**
	 * 获取执行的sql
	 * 
	 * @param btsName
	 *            btsName
	 * @param sqlType
	 *            sqlType
	 * @return String sql语句
	 */
	@Override
	public String getExecuteSql(String btsName, SqlType sqlType) {
		if (sqlType == SqlType.QUERY_BTSNAME) {
			String sql = G_SQL + "'" + btsName + "'";
			LOG.debug("G网查询sql是：" + sql);
			return sql;
		} else {
			String sql = "select t1.CHINA_NAME from NE_BTS_G t1 where t1.CHINA_NAME='"
					+ btsName + "'";
			LOG.debug("G网查询sql是：" + sql);
			return sql;
		}
	}

	/**
	 * 获取bts的数据
	 * 
	 * @param rs
	 *            rs
	 * @return List<Map<String, String>> List<Map<String, String>>
	 * @throws Exception
	 *             Exception
	 */
	@Override
	public List<Map<String, String>> getBtsData(ResultSet rs) throws Exception {
		LOG.debug("从G网库里面获取bts数据");
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		while (rs.next()) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("基站名称", replaceSpecialChar(rs.getString("基站名称")));
			map.put("小区名称", replaceSpecialChar(rs.getString("小区名称")));
			map.put("CGI", replaceSpecialChar(rs.getString("CGI")));
			map.put("话务量", replaceSpecialChar(rs.getString("话务量(Erl)")));
			map.put("GPRS流量", replaceSpecialChar(rs.getString("GPRS流量(MB)")));
			map.put("寻呼成功率", replaceSpecialChar(rs.getString("寻呼成功率(%)")));

			map.put("TCH分配成功率", replaceSpecialChar(rs.getString("TCH分配成功率(%)")));
			map.put("SDCCH拥塞率", replaceSpecialChar(rs.getString("SDCCH拥塞率(%)")));
			map.put("TCH拥塞率", replaceSpecialChar(rs.getString("TCH拥塞率(%)")));
			map.put("业务信道掉话率", replaceSpecialChar(rs.getString("业务信道掉话率(%)")));
			map.put("切换成功率", replaceSpecialChar(rs.getString("切换成功率(%)")));
			list.add(map);
		}
		LOG.debug("从G网库里面获取bts数据结束，获取数据行数为：" + list.size());
		return list;
	}

	/**
	 * 获取到表名
	 * 
	 * @return String String
	 * @throws Exception
	 *             Exception
	 */
	@Override
	protected String getTableName() throws Exception {
		return "UwayGsmMqi";
	}
}
