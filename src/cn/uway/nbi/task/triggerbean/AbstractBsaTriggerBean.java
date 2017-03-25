package cn.uway.nbi.task.triggerbean;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import au.com.bytecode.opencsv.CSVReader;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.Task;

public abstract class AbstractBsaTriggerBean extends BatchUpdateBean {

	private static final Logger LOG = LoggerFactory.getLogger(AbstractBsaTriggerBean.class);

	private static final String CITY_SQL = "select   p.PROVINCE_NO,  p.PROVINCE_NAME,s.CITYID,s.CITYNAME ,a.sid,a.nid,a.extend_bid FROM NE_BSA_CARR a,cfg_city_sid s,cfg_province_city p where a.sid = s.sid  and s.cityname = p.city_name  and a.city_id =s.cityid   ";

	protected static Map<String, CityInfo> cityMap = null;

	protected void initCityMap() {
		try {
			if (null == cityMap) {
				cityMap = getCityMap();
			}
		} catch (Exception e) {
			LOG.error("bsa装载省份，城市信息失败：", e);
		}
	}

	protected void afterProcess(String fileName) throws Exception {
		// fileName =
		// "D:\\test\\6102\\REQ_ADD_201308170000_${province_code}0006.csv";
		CSVReader reader = new CSVReader(new FileReader(fileName));
		try {
			String[] nextLine;
			String[] title = null;
			int titleIndex = 0;
			int sqlNum = 0;
			List<String> sqls = new ArrayList<String>();
			while ((nextLine = reader.readNext()) != null) {
				// 和bsa上报文件相关，bsa上报文件前一行为不需要解析的数据
				if (titleIndex < 1) {
					titleIndex++;
					continue;
				}
				// 第二行为标题数据
				if (1 == titleIndex) {
					title = nextLine;
					titleIndex++;
					continue;
				}
				// 过滤那些非正规的数据
				if (nextLine.length < 5) {
					continue;
				}
				sqls.add(getSql(title, nextLine));
				titleIndex++;
				sqlNum++;
				// 批量插入和更新
				if (sqlNum == 1000) {
					insertDB(sqls);
					sqls.clear();
					sqlNum = 0;
				}
			}
			insertDB(sqls);
		} finally {
			if (null != reader) {
				reader.close();
			}
		}
	}

	protected Map<String, CityInfo> getCityMap() throws Exception {
		Connection con = null;
		Statement ps = null;
		ResultSet rs = null;
		Map<String, CityInfo> citryMap = new HashMap<String, CityInfo>();
		try {
			con = DBUtil.getConnection();
			ps = con.createStatement();
			rs = ps.executeQuery(CITY_SQL);
			while (rs.next()) {
				CityInfo cityInfo = new CityInfo();
				cityInfo.setCityId(rs.getInt("CITYID"));
				cityInfo.setCityName(rs.getString("CITYNAME"));
				cityInfo.setProvinceName(rs.getString("PROVINCE_NAME"));
				cityInfo.setProvinceNo(rs.getInt("PROVINCE_NO"));
				citryMap.put(getCityMapKey(rs.getString("sid"), rs.getString("nid"), rs.getString("extend_bid")), cityInfo);
			}

		} finally {
			DBUtil.close(rs, ps, con);
		}
		return citryMap;
	}

	protected String getCityMapKey(String sid, String nid, String extendBid) {
		return sid + ":" + nid + ":" + extendBid;
	}

	protected abstract String getSql(String[] title, String[] nextLine);

	protected void insertDB(List<String> sqls) throws Exception {
		executeBatch(sqls);
	}

	/**
	 * 
	 * @param sqls
	 * @param type
	 * @throws Exception
	 */
	protected void insertDB(String sqlTable, String sqlPara, boolean flag) throws Exception {
		executeBatch(sqlTable, sqlPara, flag);
	}

	@Override
	public void trigger(Task task) throws Exception {
		super.trigger(task);
		this.task = task;
		// executeSql();
		List<String> fileNams = getFileNames();
		for (String fileName : fileNams) {
			afterProcess(fileName.replace(".zip", ".csv"));
		}
	}

	// @SuppressWarnings("unchecked")
	// protected void executeSql() {
	// List<String> list = (List<String>) param;
	// if (list.size() > 0)
	// batchUpdate(list);
	// }

	protected class CityInfo {

		private int provinceNo;

		private String provinceName;

		private int cityId;

		private String cityName;

		public int getProvinceNo() {
			return provinceNo;
		}

		public void setProvinceNo(int provinceNo) {
			this.provinceNo = provinceNo;
		}

		public String getProvinceName() {
			return provinceName;
		}

		public void setProvinceName(String provinceName) {
			this.provinceName = provinceName;
		}

		public int getCityId() {
			return cityId;
		}

		public void setCityId(int cityId) {
			this.cityId = cityId;
		}

		public String getCityName() {
			return cityName;
		}

		public void setCityName(String cityName) {
			this.cityName = cityName;
		}

	}
}
