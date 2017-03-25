package cn.uway.webservice.managecontrol.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dao.AbstractDAO;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.dt.BTSInfo;

/**
 * 广东联通网络公司全流程管控系统接口
 * 
 * @author yanb @ 2014年4月3日
 */
public abstract class EMOSDAO extends AbstractDAO<BTSInfo> {

	protected static final String W_SQL = "select t1.BTS_NAME as \"基站名称\",t1.CELL_NAME as \"小区名称\",t1.PRIMARYSCRAMBLINGCODE as \"扰码\",t2.CSERLTRAFFIC as \"CS域话务量(Erl)\",t2.RLCUPTRAFFIC as \"RLC上行流量（KB）\",t2.RLCDOWNTRAFFIC as \"RLC下行流量(KB)\",case         when (t2.NBRPAGINGSENDSUCC) >              (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL) then          100         else          ROUND(t2.NBRPAGINGSENDSUCC /                (t2.NBRPAGINGSENDSUCC + t2.NBRPAGINGSENDFAIL + 0.00000001) * 100,       3)       END as \"寻呼成功率(%)\",DECODE(t2.NBRCSRELERAB,     0,     0,     ROUND((t2.NBRCSUNNORMRELERAB / ((t2.NBRCSRELERAB))) * 100,3)) as \"网络掉话率(%)\",DECODE(t2.NBRRRCCONNREQ * t2.NBRRABASSIGNREQ,     0,     100,     ROUND((t2.NBRRRCCONNSUCC / ((t2.NBRRRCCONNREQ))) *                    (t2.NBRRABASSIGNSUCC / ((t2.NBRRABASSIGNREQ))) * 100,           3)) as \"无线系统接通率(%)\",DECODE((t2.nbrCs3gto2gHoOutReq),     0,     100,     ROUND((t2.nbrCs3gto2gHoOutSucc) / (t2.nbrCs3gto2gHoOutReq) * 100,           3)) as \"系统间CS域切出成功率(%)\",case         when (t2.NBRCS3GTO2GHOOUTSUCC) > (t2.NBRCSRABASSIGNSUCC) then          100         else          round(t2.NBRCS3GTO2GHOOUTSUCC / (t2.NBRCSRABASSIGNSUCC + 0.0000001) * 100,       3)       end as \"CS域切出比例(%)\" ";

	protected static final String G_SQL = "SELECT T3.CHINA_NAME AS \"基站名称\"," + " T1.CHINA_NAME AS \"小区名称\", " + "T1.GSM_CELL_ID AS \"CGI\", "
			+ "  T2.T_TRAFFIC AS \"话务量(ERL)\"," + "  T2.UL_GPRS_TRAFFIC + T2.DL_GPRS_TRAFFIC AS \"GPRS流量(MB)\"," + "  ' ' AS \"寻呼成功率(%)\","
			+ "  CASE" + "    WHEN NVL((T_CALL_ATT), 0) = 0 THEN" + "    100" + "   WHEN (TCH_ASSIGNSUCC) > (T_CALL_ATT) THEN" + "     100"
			+ "    ELSE" + "    ROUND((TCH_ASSIGNSUCC) / (T_CALL_ATT) * 100, 2)" + "  END AS \"TCH分配成功率(%)\"," + "  CASE"
			+ "    WHEN NVL((S_CALL_ATT), 0) = 0 THEN" + "    0" + "    WHEN (S_CALL_BLOCK) > (S_CALL_ATT) THEN" + "     100" + "   ELSE"
			+ "     ROUND((S_CALL_BLOCK) / (S_CALL_ATT) * 100, 4)" + "  END AS \"SDCCH拥塞率(%)\"," + "  CASE"
			+ "    WHEN NVL(T2.T_CALL_ATT, 0) = 0 THEN" + "    0" + "    ELSE" + "    ROUND(T2.T_CALL_BLOCK / T2.T_CALL_ATT * 100, 4)"
			+ "  END AS \"TCH拥塞率(%)\"," + "   CASE" + "     WHEN NVL((T_TCH_SEIZE), 0) = 0 THEN" + "     0"
			+ "    WHEN (T_CALL_DROP) > (T_TCH_SEIZE) THEN" + "     100" + "    ELSE" + "     ROUND((T_CALL_DROP) / (T_TCH_SEIZE) * 100, 4)"
			+ "   END AS \"业务信道掉话率(%)\"," + "   T2.HO_SUC_RATE AS \"切换成功率(%)\"" + " FROM NE_CELL_G T1, PERF_CELL_G_DAY T2, NE_BTS_G T3"
			+ " WHERE T1.NE_SYS_ID = T2.NE_SYS_ID" + "  AND T3.NE_SYS_ID = T1.RELATED_BTS" + "   AND T2.START_TIME >= TRUNC(SYSDATE) - 1"
			+ "   AND T2.START_TIME < TRUNC(SYSDATE)" + "   AND T3.CHINA_NAME = ";

	private static final String G_FLAG = "g";

	private static final String W_FLAG = "w";

	protected static final Logger LOG = LoggerFactory.getLogger(EMOSDAO.class);

	protected int fileLineCount = 0;

	/**
	 * 生产对象方法
	 * 
	 * @param type
	 *            网络类型
	 * @return
	 */
	public static EMOSDAO createDao(String type) throws Exception {
		if (G_FLAG.equalsIgnoreCase(type)) {
			return new G_EMOSDAO();

		} else if (W_FLAG.equalsIgnoreCase(type)) {
			return new W_EMOSDAO();
		} else {
			LOG.debug("type 网络类型为空，请检查参数. type: " + type);
			throw new Exception("传入的不是G,W网参数。");
		}
	}

	public int getFileLineCount() {
		return this.fileLineCount;
	}

	/**
	 * 更新操作
	 */
	@Override
	public boolean update(BTSInfo entity) throws Exception {
		return false;
	}

	/**
	 * 根据btsname查询bts名字
	 * 
	 * @param btsName
	 *            btsName
	 * @return Map<String, List<Map<String, String>>> Map<String, List<Map<String, String>>>
	 * @throws Exception
	 *             Exception
	 */
	public Map<String, List<Map<String, String>>> queryBTSName(String btsName) throws Exception {
		LOG.debug("开始从数据查询bts");
		Map<String, List<Map<String, String>>> map = new HashMap<String, List<Map<String, String>>>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(getExecuteSql(btsName, SqlType.QUERY_BTSNAME));
			List<Map<String, String>> list = getBtsData(rs);
			fileLineCount = list.size();
			map.put(getTableName(), list);
			return map;
		} finally {
			DBUtil.close(rs, st, conn);
		}
	}

	/**
	 * bts是否存在
	 * 
	 * @param btsName
	 *            btsName
	 * @return boolean 是
	 * @throws Exception
	 *             Exception
	 */
	public boolean isExistBTSName(String btsName) throws Exception {
		LOG.debug("从数据查询bts是否存在");
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(getExecuteSql(btsName, SqlType.BTS_IS_EXIST));
			return isExistBTSName(rs);
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

	/**
	 * 进行值替换
	 * 
	 * @param value
	 *            value
	 * @return String String
	 */
	protected Float stringToFloat(String value) {
		if (null == value || "".equalsIgnoreCase(value.trim())) {
			return 0F;
		}
		return Float.valueOf(value);
	}

	/**
	 * 名字是否存在
	 * 
	 * @param rs
	 *            rs
	 * @return boolean boolean
	 * @throws Exception
	 *             Exception
	 */
	protected boolean isExistBTSName(ResultSet rs) throws Exception {
		if (rs.next()) {
			return true;
		}
		return false;
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
	protected abstract String getExecuteSql(String btsName, SqlType sqlType);

	/**
	 * 获取bts的数据
	 * 
	 * @param rs
	 *            rs
	 * @return List<Map<String, String>> List<Map<String, String>>
	 * @throws Exception
	 *             Exception
	 */
	protected abstract List<Map<String, String>> getBtsData(ResultSet rs) throws Exception;

	/**
	 * 获取到链接
	 * 
	 * @return Connection Connection
	 * @throws Exception
	 *             Exception
	 */
	protected abstract Connection getConnection() throws Exception;

	/**
	 * 获取到表名
	 * 
	 * @return String String
	 * @throws Exception
	 *             Exception
	 */
	protected abstract String getTableName() throws Exception;

	/**
	 * sql类型
	 * 
	 * @author yanb @ 2013年9月27日
	 */
	enum SqlType {
		QUERY_BTSNAME(0), BTS_IS_EXIST(1);

		private final int value;

		private SqlType(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}
}
