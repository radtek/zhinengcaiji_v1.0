package cn.uway.webservice.managecontrol.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.uway.nbi.db.dbpool.DBPoolMgrWcdma;
import cn.uway.nbi.db.dbpool.DBUtil;

/**
 * 广东联通网络公司全流程管控系统接口
 * 
 * @author liuwx
 */
public class W_EMOSDAO extends EMOSDAO {

	/**
	 * 获取bts的数据 基站 名称 小区名称 扰码 CS域话务量(Erl) RLC上行流量（KB） RLC下行流量(KB) 寻呼成功率(%) 网络掉话率(%) 无线系统接通率(%) 系统间CS域切出成功率(%) CS域切出比例(%)
	 * 
	 * @param rs
	 *            rs
	 * @return List<Map<String, String>> List<Map<String, String>>
	 * @throws Exception
	 *             Exception
	 */
	@Override
	public List<Map<String, String>> getBtsData(ResultSet rs) throws Exception {
		LOG.debug("从W网库里面获取bts数据");
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		while (rs.next()) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("基站名称", replaceSpecialChar(rs.getString("基站名称")));
			map.put("扇区名称", replaceSpecialChar(rs.getString("小区名称")));
			map.put("扰码", replaceSpecialChar(rs.getString("扰码")));
			map.put("CS域话务量", replaceSpecialChar(rs.getString("CS域话务量(Erl)")));
			map.put("RLC流量", replaceSpecialChar(rs.getString("RLC上行流量（KB）")));
			map.put("RLC流量", replaceSpecialChar(rs.getString("RLC下行流量(KB)")));
			map.put("寻呼成功率", replaceSpecialChar(rs.getString("寻呼成功率(%)")));
			map.put("网络掉话率", replaceSpecialChar(rs.getString("网络掉话率(%)")));
			map.put("无线系统接通率", replaceSpecialChar(rs.getString("无线系统接通率(%)")));
			map.put("系统间CS域切出成功率", replaceSpecialChar(rs.getString("系统间CS域切出成功率(%)")));
			map.put("CS域切出比例", replaceSpecialChar(rs.getString("CS域切出比例(%)")));
			list.add(map);
		}
		LOG.debug("从W网库里面获取bts数据结束，获取数据行数为：" + list.size());
		return list;
	}

	/**
	 * 获取到链接
	 * 
	 * @return Connection Connection
	 * @throws Exception
	 *             Exception
	 */
	@Override
	protected Connection getConnection() throws Exception {
		return DBPoolMgrWcdma.getConnection();
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
			String sql = W_SQL
					+ "from (select * from PERF_CELL_W_D TT WHERE tT.start_time >= trunc(sysdate) - 1 and tT.start_time < trunc(sysdate)) t2,"
					+ "(SELECT * FROM NE_CELL_W MM WHERE MM.BTS_NAME ='" + btsName + "') t1 where t1.ne_cell_id = t2.ne_cell_id ";
			LOG.debug("W网查询sql是：" + sql);
			return sql;
		} else {
			String sql = "select t1.BTS_NAME from NE_CELL_W t1 where t1.BTS_NAME='" + btsName + "'";
			LOG.debug("W网查询sql是：" + sql);
			return sql;
		}
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
		return "UwayWcdmaMqi";
	}

	public List<Object> query3GParaKpi(String dateTime) throws Exception {
		String sql = "SELECT TO_CHAR(P.START_TIME, 'YYYY-MM-DD HH24:MI:SS') \"时间\",'全省' \"城市名称\","
				+ " ROUND((SUM(NVL(NBRCSUSER, 0)) * 50 * 3600 / 1024 +" + "       SUM(NVL(HSUPARLCUPTRAFFIC, 0)) * 1.2 * 8 / 1024 +"
				+ "     SUM(NVL(NBRRRCCONNSUCC, 0)) * 4 * 13.6 / 1024) /" + "      SUM(NBRREFTHROUGHPUT * 0.9) * 100," + "     3) \"无线资源利用率\","
				+ "  ROUND((SUM(NVL(NBRCSUSER, 0)) * 50 * 3600 / 1024) /" + "       SUM(NBRREFTHROUGHPUT * 0.9) * 100," + "      3) \"语音无线资源利用率\","
				+ " ROUND((SUM(NVL(HSUPARLCUPTRAFFIC, 0)) * 1.2 * 8 / 1024) /" + "       SUM(NBRREFTHROUGHPUT * 0.9) * 100,"
				+ "      3) \"数据无线资源利用率\" FROM PERF_BSC_W_H P WHERE START_TIME >=  TO_DATE('" + dateTime + "', 'YYYY-MM-DD') "
				+ " AND START_TIME <  TO_DATE('" + dateTime + "', 'YYYY-MM-DD')+1" + " GROUP BY TO_CHAR(P.START_TIME, 'YYYY-MM-DD HH24:MI:SS')"
				+ " ORDER BY TO_CHAR(P.START_TIME, 'YYYY-MM-DD HH24:MI:SS')";
		LOG.debug("开始从数据查询3G无线参数数据,时间为:" + dateTime.toString() + ",sql 为" + sql);
		List<Object> list = new ArrayList<Object>();
		list.add(addHeader());
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				List<Object> listValues = new ArrayList<Object>();
				listValues.add(replaceSpecialChar(rs.getString("时间")));
				listValues.add(replaceSpecialChar(rs.getString("城市名称")));
				listValues.add(stringToFloat(rs.getString("无线资源利用率")) / 100);
				listValues.add(stringToFloat(rs.getString("语音无线资源利用率")) / 100);
				listValues.add(stringToFloat(rs.getString("数据无线资源利用率")) / 100);
				list.add(listValues);
			}
			return list;
		} finally {
			DBUtil.close(rs, st, conn);
		}
	}

	private List<Object> addHeader() {
		List<Object> listValues = new ArrayList<Object>();
		listValues.add("时间");
		listValues.add("城市名称");
		listValues.add("无线资源利用率");
		listValues.add("语音无线资源利用率");
		listValues.add("数据无线资源利用率");
		return listValues;
	}
}
