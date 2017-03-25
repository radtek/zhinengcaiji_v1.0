package cn.uway.webservice.managecontrol.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.webservice.managecontrol.impl.DBPoolMgrDcs;

/**
 * 深度覆盖的dao
 * 
 * @author yanb @ 2014年5月23日
 */
public class DcsDAOImpl implements DcsDAO {

	protected static final Logger LOG = LoggerFactory.getLogger(DcsDAOImpl.class);

	private static final String DDCSSCENE_SQL = "SELECT T.SCENE_ID as 区域编号,T.SCENE_NAME as 区域名称,T.CITY_ID as 地市编号,T.POLYGON_VERTEX_LNGLAT as 区域多边形经纬度集合 FROM CFG_SCENE T WHERE T.IS_SEND=1";

	private static final String DCSSCENECELL_SQL = "SELECT B.SCENE_ID as 区域编号,A.NE_CELL_ID as 网元编号,A.NE_TYPE as 网元类型,A.LAC,A.CI,A.CELL_NAME as 网元名称 FROM CFG_SCENE_CELL A, CFG_SCENE B WHERE A.SCENE_ID=B.SCENE_ID AND B.IS_SEND=1";

	private static final String DCSSCENEBUILDING_SQL = "SELECT T.BUILDING_ID as 楼宇编号,T.BUILDING_NAME as 楼宇名称,T.SCENE_ID as 区域编号,T.PROVINCE_ID as 楼宇所属省份,T.CITY_ID as 地市,T.AREA_ID as 区县,T.LONGITUDE 经度,T.LATITUDE as 维度 FROM CFG_BASEDATA_BUILDING T,CFG_SCENE B WHERE T.SCENE_ID=B.SCENE_ID AND B.IS_SEND=1";

	/**
	 * 获取到链接
	 * 
	 * @return Connection Connection
	 * @throws Exception
	 *             Exception
	 */
	protected Connection getConnection() throws Exception {
		return DBPoolMgrDcs.getConnection();
	}

	@Override
	public List<String[]> queryDcsScene() throws Exception {
		LOG.debug("开始查询区域信息数据");
		List<String[]> list = new ArrayList<String[]>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(DDCSSCENE_SQL);
			while (rs.next()) {
				String[] listLine = new String[4];
				listLine[0] = replaceSpecialChar(rs.getString("区域编号"));
				listLine[1] = replaceSpecialChar(rs.getString("区域名称"));
				listLine[2] = replaceSpecialChar(rs.getString("地市编号"));
				listLine[3] = replaceSpecialChar(rs.getString("区域多边形经纬度集合"));
				list.add(listLine);
			}
			return list;
		} finally {
			DBUtil.close(rs, st, conn);
		}
	}

	@Override
	public List<String[]> queryDcsSceneCell() throws Exception {
		LOG.debug("开始查询区域与小区关系数据");
		List<String[]> list = new ArrayList<String[]>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(DCSSCENECELL_SQL);
			while (rs.next()) {
				String[] listLine = new String[6];
				listLine[0] = replaceSpecialChar(rs.getString("区域编号"));
				listLine[1] = replaceSpecialChar(rs.getString("网元编号"));
				listLine[2] = replaceSpecialChar(rs.getString("网元类型"));
				listLine[3] = replaceSpecialChar(rs.getString("LAC"));
				listLine[4] = replaceSpecialChar(rs.getString("CI"));
				listLine[5] = replaceSpecialChar(rs.getString("网元名称"));
				list.add(listLine);
			}
			return list;
		} finally {
			DBUtil.close(rs, st, conn);
		}
	}

	@Override
	public List<String[]> queryDcsSceneBuilding() throws Exception {
		LOG.debug("开始查询区域与楼宇关系数据");
		List<String[]> list = new ArrayList<String[]>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(DCSSCENEBUILDING_SQL);
			while (rs.next()) {
				String[] listLine = new String[8];
				listLine[0] = replaceSpecialChar(rs.getString("楼宇编号"));
				listLine[1] = replaceSpecialChar(rs.getString("楼宇名称"));
				listLine[2] = replaceSpecialChar(rs.getString("区域编号"));
				listLine[3] = replaceSpecialChar(rs.getString("楼宇所属省份"));
				listLine[4] = replaceSpecialChar(rs.getString("地市"));
				listLine[5] = replaceSpecialChar(rs.getString("区县"));
				listLine[6] = replaceSpecialChar(rs.getString("经度"));
				listLine[7] = replaceSpecialChar(rs.getString("维度"));
				list.add(listLine);
			}
			return list;
		} finally {
			DBUtil.close(rs, st, conn);
		}
	}

	/**
	 * 进行值替换
	 * 
	 * @param value
	 *            value
	 * @return String String
	 */
	protected String replaceSpecialChar(String value) {
		if (null == value || "".equalsIgnoreCase(value.trim())) {
			return "";
		}
		return value;
	}
}
