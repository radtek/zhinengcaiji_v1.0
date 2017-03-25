package cn.uway.nbi.db.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.app.ExternalCmd;
import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBPoolMgrCdma;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.BsaDTO;
import cn.uway.nbi.util.BSAConfigProperties;
import cn.uway.nbi.util.DateTimeUtils;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.nbi.util.SysCfg;

public class BSADeduce {

	private static final Logger LOG = LoggerFactory.getLogger(BSADeduce.class);

	/** snapCell推导前生成csv文件路径 **/
	public String filePathBeforeDeduce = "a.csv";

	public static String dir = SysCfg.getInstance().getSnapCellDataDir();

	/** snapCell推导后文件路径 **/
	private static String filePathAfterDeduce = "bbb.csv";

	private static String b_file = SysCfg.getInstance().getTedb_global();

	/** snapCell.exe文件路径 **/
	private static String snapCell = SysCfg.getInstance().getBsasnapcell(); //

	/** 批量处理标志，为1或者true都会执行批量 **/
	private final String batchFlag = "1";

	/** 批量更新单词执行条数 默认500 **/
	private String batchExecuteNum;

	private final String sql = "select PILOT_SECTOR_NAME, SID, NID, EXTEND_BID, T_PN, ANTENNA_LATI, ANTENNA_LONGI, ANTENNA_ALTI, ANTENNA_LOC_ACCU, SECTOR_CENTER_LATI, SECTOR_CENTER_LONGI, SECTOR_CENTER_ALTI, ANTENNA_ORIENTATION, ANTENNA_OPENING, MAX_ANTENNA_RANGE, TERRAIN_AVERAGE_HEIGHT, TERRAIN_HEIGHT_STANDARD_DEVI, POTENTIAL_REPEATER, PN_INCREMENT, FWD_CALIB, FWD_CALIB_ACCU, RTD_CALIB, RTD_CALIB_ACCU, FORMAT_TYPE, SWITCH_NUM from (select PILOT_SECTOR_NAME, SID, NID, EXTEND_BID, T_PN, ANTENNA_LATI, ANTENNA_LONGI, ANTENNA_ALTI, ANTENNA_LOC_ACCU, SECTOR_CENTER_LATI, SECTOR_CENTER_LONGI, SECTOR_CENTER_ALTI, ANTENNA_ORIENTATION, ANTENNA_OPENING, MAX_ANTENNA_RANGE, TERRAIN_AVERAGE_HEIGHT, TERRAIN_HEIGHT_STANDARD_DEVI, POTENTIAL_REPEATER, PN_INCREMENT, FWD_CALIB, FWD_CALIB_ACCU, RTD_CALIB, RTD_CALIB_ACCU, FORMAT_TYPE, SWITCH_NUM from ne_bsa_carr union  select PILOT_SECTOR_NAME, SID, NID, EXTEND_BID, T_PN, ANTENNA_LATI, ANTENNA_LONGI, ANTENNA_ALTI, ANTENNA_LOC_ACCU, SECTOR_CENTER_LATI, SECTOR_CENTER_LONGI, SECTOR_CENTER_ALTI, ANTENNA_ORIENTATION, ANTENNA_OPENING, MAX_ANTENNA_RANGE, TERRAIN_AVERAGE_HEIGHT, TERRAIN_HEIGHT_STANDARD_DEVI, POTENTIAL_REPEATER, PN_INCREMENT, FWD_CALIB, FWD_CALIB_ACCU, RTD_CALIB, RTD_CALIB_ACCU, FORMAT_TYPE, SWITCH_NUM from ne_bsa_fake_carr) t  ";

	private final String countsql = " select  sum(cnum) from (select count(*)  cnum from ne_bsa_carr m union select count(*) cnum from ne_bsa_fake_carr n  ) t ";

	private final String sencondLine = "Pilot Sector Name,SID,NID,Extend BID,T-PN,Antenna Lati,Antenna Longi,Antenna Alti,Antenna Loc Accu,Sector Center Lati,Sector Center Longi,Sector Center Alti,Antenna Orientation,Antenna Opening,Max Antenna Range,Terrain Average Height,Terrain Height Standard Deviation,Potential Repeater,PN Increment,FWD Calib,FWD Calib Accu,RTD Calib,RTD Calib Accu,Format Type,Switch Num";

	private final String sqlFake = "select PILOT_SECTOR_NAME, SID, NID, EXTEND_BID, T_PN, ANTENNA_LATI, ANTENNA_LONGI, ANTENNA_ALTI, ANTENNA_LOC_ACCU, SECTOR_CENTER_LATI, SECTOR_CENTER_LONGI, SECTOR_CENTER_ALTI, ANTENNA_ORIENTATION, ANTENNA_OPENING, MAX_ANTENNA_RANGE, TERRAIN_AVERAGE_HEIGHT, TERRAIN_HEIGHT_STANDARD_DEVI, POTENTIAL_REPEATER, PN_INCREMENT, FWD_CALIB, FWD_CALIB_ACCU, RTD_CALIB, RTD_CALIB_ACCU, FORMAT_TYPE, SWITCH_NUM from ne_bsa_fake_carr ";

	protected static final int DEFAULT_BATCH_NUM = 2000;

	private String sid_nid_extid = "";

	private final String left = "(";

	private final String right = ")";

	private final String flag = ",";

	private static String updateSql = " update ne_bsa_carr t set t.sector_center_lati=?,t.sector_center_longi=?,t.sector_center_alti=?,t.terrain_average_height=?,t.terrain_height_standard_devi=?  where t.sid=? and t.nid =? and t.extend_bid =?  ";

	private static String updateSqlFake = " update ne_bsa_carr t set t.sector_center_lati=?,t.sector_center_longi=?,t.sector_center_alti=?,t.terrain_average_height=?,t.terrain_height_standard_devi=?  where t.sid=? and t.nid =? and t.extend_bid =?  ";

	private BSADataCheckUtil checkUtil = new BSADataCheckUtil();

	private Map<String, String[]> fakeMap = new HashMap<String, String[]>();

	public BSADeduce() {
		dir = SysCfg.getInstance().getSnapCellDataDir();
		b_file = SysCfg.getInstance().getTedb_global();

		String date = DateUtil.getDateString_yyyyMMddHHmmssSSS(new Date());
		String index = "_" + (int) (Math.random() * 1000);
		filePathBeforeDeduce = dir + "\\" + date + index + "_in.csv";
		filePathAfterDeduce = dir + "\\" + date + index + "_out.csv";

	}

	public String getSid_nid_extid() {
		return sid_nid_extid;
	}

	public void setSid_nid_extid(String sid_nid_extid) {
		this.sid_nid_extid = sid_nid_extid;
	}

	private boolean allowbatchExecute() {
		if (StringUtils.isBlank(batchFlag))
			return false;
		return batchFlag.equalsIgnoreCase("true") || batchFlag.equalsIgnoreCase("1");
	}

	private int getBatchExecuteNum() {
		if (StringUtils.isBlank(batchExecuteNum))
			return DEFAULT_BATCH_NUM;
		return Integer.valueOf(batchExecuteNum);
	}

	public Map<String, String[]> queryFakeData(String fakeSql) {

		Map<String, String[]> fakeMap = new HashMap<String, String[]>();

		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();

			ps = conn.createStatement();
			ResultSetHelper resultService = new ResultSetHelperService();
			rs = ps.executeQuery(fakeSql);

			while (rs.next()) {
				String[] values = resultService.getColumnValues(rs, false);

				if (values == null)
					continue;

				if (values.length > 3) {
					String key = values[1] + "_" + values[2] + "_" + values[3];
					fakeMap.put(key, values);
				}
			}

		} catch (Exception e) {
			LOG.error("数据库数据收集异常{}!", e);
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		return fakeMap;
	}

	public void executeDeduceSchedule() throws Exception {
		try {
			long begin = System.currentTimeMillis();
			String sql1 = null;
			String csql = null;

			// sql1 = new String(sqlSchedule + sqlScheduleWhere);
			// csql = new String(countsql + sqlScheduleWhere);

			sql1 = new String(sql);
			csql = new String(countsql);

			boolean b = loadMessageAndCreateFile(sql1, csql);
			if (b) {
				deduce();
				begin = System.currentTimeMillis();
				updateBaseData();
				long end = System.currentTimeMillis();
				LOG.debug("五项推导定时成功，共耗时: " + (end - begin) / 1000 + "秒.");

			}
		} finally {
			deleteTmpFile();
		}

	}

	/**
	 * 暴露给外部方法
	 * 
	 * @param parameters
	 *            作为外部扩展查询使用
	 */
	public void execute(Map<String, String> parameters) throws Exception {
		String ids[] = null;

		fakeMap = queryFakeData(sqlFake);

		long begin = System.currentTimeMillis();
		try {
			if (StringUtil.isNotNull(sid_nid_extid)) {
				ids = sid_nid_extid.split(",");

				StringBuilder whereCondition = new StringBuilder();
				for (int i = 0; i < ids.length; i++) {

					String key = ids[i];
					whereCondition.append(left);
					whereCondition.append(key.replace("_", ","));
					whereCondition.append(right);
					whereCondition.append(flag);
					if ((i + 1) % 500 == 0) {
						whereCondition.deleteCharAt(whereCondition.length() - 1);

						String sql1 = null;
						String csql = null;
						if (StringUtil.isNotNull(whereCondition.toString())) {
							String where = " where (sid ,nid,extend_bid )  in (" + whereCondition + " ) ";
							sql1 = sql + where;
							csql = countsql + where;
						} else {
							sql1 = new String(sql);
							csql = new String(countsql);
						}
						boolean b = loadMessageAndCreateFile(sql1, csql);
						if (b) {
							deduce();
							updateBaseData();
						}
						whereCondition.delete(0, whereCondition.length() - 1);
					}
				}

				if (whereCondition.length() > 0) {
					whereCondition.deleteCharAt(whereCondition.length() - 1);

					String sql1 = null;
					String csql = null;
					if (StringUtil.isNotNull(whereCondition.toString())) {
						String where = " where (sid ,nid,extend_bid )  in (" + whereCondition + " ) ";
						sql1 = sql + where;
						csql = countsql + where;
					} else {
						sql1 = new String(sql);
						csql = new String(countsql);

					}

					boolean b = loadMessageAndCreateFile(sql1, csql);
					if (b) {
						deduce();
						begin = System.currentTimeMillis();
						updateBaseData();
						long end = System.currentTimeMillis();
						LOG.debug("" + (end - begin) / 1000 + ":" + whereCondition.toString());
						if (whereCondition.length() > 0) {
							whereCondition.delete(0, whereCondition.length() - 1);
						}
					}
				}

			} else {

				String sql1 = null;
				String csql = null;
				sql1 = new String(sql);
				csql = new String(countsql);

				boolean b = loadMessageAndCreateFile(sql1, csql);
				if (b) {
					deduce();

				}
			}

		} finally {
			long end = System.currentTimeMillis();
			LOG.debug("一共消耗时间" + (end - begin) / 1000 + " 秒 ");
			// 删除临时文件
			deleteTmpFile();
		}
	}

	public void updateBaseData() throws Exception {
		updateBaseData(filePathAfterDeduce);
	}

	public int updateBaseData(String fileName) throws Exception {
		FileReader br = new FileReader(fileName);
		BufferedReader r = new BufferedReader(br);
		String line = null;
		r.readLine();
		r.readLine();
		int updateCount = 0;
		int count = 0;
		List<BsaDTO> batchSQL = new ArrayList<BsaDTO>(getBatchExecuteNum());

		List<BsaDTO> batchSQLFake = new ArrayList<BsaDTO>(getBatchExecuteNum());

		Connection con = DefaultDBPoolMgr.getConnection();

		PreparedStatement stm = con.prepareStatement(updateSql);

		PreparedStatement stmFake = con.prepareStatement(updateSqlFake);
		try {
			while ((line = r.readLine()) != null) {
				if (line.startsWith("BSTR"))
					continue;
				if (StringUtil.isNull(line))
					continue;
				String[] values = line.split(",");

				StringBuilder sbColumn = new StringBuilder();
				StringBuilder sbErrorType = new StringBuilder();

				boolean bFlag = checkUtil.bsaHandleAfter(values, sbColumn, sbErrorType, "5");

				if (!bFlag) {
					continue;
				}

				// 正常数据会大于等于25列
				if (values.length < 25)
					continue;

				if (values[3].contains("0x")) {
					values[3] = String.valueOf(Long.parseLong(values[3].substring(2, values[3].length()), 16));
				}

				BsaDTO bsaDTO = new BsaDTO();

				if (values[9] != null && Double.valueOf(values[9]) > 1000) {
					Log.warn(line);
					continue;
				}

				if (values[10] != null && Double.valueOf(values[10]) > 1000) {
					Log.warn(line);
					continue;
				}

				bsaDTO.setSectorCenterLati(Double.valueOf(values[9]));
				bsaDTO.setSectorCenterLongi(Double.valueOf(values[10]));
				bsaDTO.setSectorCenterAlti(Double.valueOf(values[11]));
				bsaDTO.setTerrainAverageHeight(Double.valueOf(values[15]));
				bsaDTO.setTerrainHeightStandardDevi(Double.valueOf(values[16]));

				bsaDTO.setSid(Long.valueOf(values[1]));
				bsaDTO.setNid(Long.valueOf(values[2]));

				bsaDTO.setExtendBid(Long.valueOf(values[3]));

				count++;
				batchSQL.add(bsaDTO);
				if (allowbatchExecute() && count == getBatchExecuteNum()) {
					executeBatch(batchSQL, con, stm);
					updateCount = updateCount + batchSQL.size();
					batchSQL.clear();
					count = 0;
				}

				// 如果伪基站表中包含， 则会跟新五个字段
				String key = values[1] + "_" + values[2] + "_" + values[3];
				if (fakeMap.containsKey(key)) {
					batchSQLFake.add(bsaDTO);

					if (allowbatchExecute() && count == getBatchExecuteNum()) {
						executeBatch(batchSQLFake, con, stmFake);
						batchSQLFake.clear();
					}
				}

			}
			// 执行ne_bsa_carr表的跟新
			executeBatch(batchSQL, con, stm);
			// 执行ne_bsa_fake_carr表的跟新
			executeBatch(batchSQLFake, con, stmFake);

			updateCount = updateCount + batchSQL.size();

			batchSQL.clear();
			return updateCount;
		} finally {
			LOG.debug(" 五项推导批量更新成功条数:  " + updateCount);

			if (stmFake != null) {
				stmFake.close();
			}
			if (stm != null)
				stm.close();
			if (con != null)
				con.close();
			if (br != null)
				br.close();
			if (r != null)
				r.close();
		}
	}

	/**
	 * 向数据库批量添加新数据
	 * 
	 * @param g_sql
	 * @return 返回批量提交受影响的行数
	 * @throws Exception
	 */
	public static int[] executeBatch(List<BsaDTO> sqlList, Connection con, PreparedStatement stm) throws Exception {
		int[] result = null;
		// PreparedStatement stm = null;
		try {
			int index = 1;
			if (null != con && sqlList != null && !sqlList.isEmpty()) {
				// stm = con.prepareStatement(updateSql);
				for (BsaDTO bsaDTO : sqlList) {
					stm.setDouble(index++, bsaDTO.getSectorCenterLati());
					stm.setDouble(index++, bsaDTO.getSectorCenterLongi());
					stm.setDouble(index++, bsaDTO.getSectorCenterAlti());
					stm.setDouble(index++, bsaDTO.getTerrainAverageHeight());
					stm.setDouble(index++, bsaDTO.getTerrainHeightStandardDevi());

					stm.setLong(index++, bsaDTO.getSid());
					stm.setLong(index++, bsaDTO.getNid());
					stm.setLong(index++, bsaDTO.getExtendBid());
					index = 1;
					stm.addBatch();
				}
				result = stm.executeBatch();
				if (con != null)
					con.commit();
			}
		} finally {
			DBUtil.close(null, null, null);
		}
		return result;
	}

	/**
	 * 调用snapCell.exe进行文件推导
	 */
	public void deduce() {
		String commandName = createCommand();
		deduce(commandName);
	}

	/**
	 * 调用snapCell.exe进行文件推导
	 */
	public synchronized void deduce(String commandName) {
		long begin = System.currentTimeMillis();
		LOG.debug(commandName);
		int ret = -1;
		try {
			ret = new ExternalCmd().execute(commandName);

		} catch (Exception e) {
			LOG.error(" 执行snapcell命令时发生异常 - " + commandName, e);
		}

		long end = System.currentTimeMillis();
		LOG.debug(" 推导消耗时间:  " + (end - begin) / 1000);
		if (ret == 0) {
			LOG.debug(" exitvalue =" + ret + " ,  执行snapcell命令成功 - " + commandName);
		} else {
			LOG.error(" exitvalue =" + ret + " , 执行snapcell命令时发生异常 - " + commandName);
		}
	}

	private String createCommand() {
		return "\"" + snapCell + "\"" + " /A=\"" + filePathBeforeDeduce + "\" /O=\"" + filePathAfterDeduce + "\" /B=\"" + b_file
				+ "\" /CP /CH /CR=30 /TH /TR=4 /TA=30";
	}

	/**
	 * 查询数据库并生成csv文件
	 * 
	 * @param parameters
	 */
	private boolean loadMessageAndCreateFile(String sql1, String csql) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBPoolMgrCdma.getConnection();
			st = conn.createStatement();
			LOG.debug("sql 为: " + csql);
			rs = st.executeQuery(csql);
			String count = null;
			while (rs.next())
				count = rs.getString(1);
			DBUtil.close(rs, st, null);
			st = conn.createStatement();
			LOG.debug("sql1 为: " + sql1);
			rs = st.executeQuery(sql1);

			return extrackAndCreateFile(rs, count);
		} catch (Exception e) {
			LOG.error("sql execute error! detail info is ", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return false;
	}

	private boolean extrackAndCreateFile(ResultSet rs, String count) throws Exception {

		int resultcount = 0;
		FileWriter fileWriter = new FileWriter(filePathBeforeDeduce);
		try {
			createFileHead(fileWriter, count);
			String[] values = null;
			ResultSetHelper resultService = new ResultSetHelperService();
			while (rs.next()) {
				int i = 1;

				values = resultService.getColumnValues(rs, false);

				StringBuilder sbColumn = new StringBuilder();
				StringBuilder sbErrorType = new StringBuilder();

				boolean bFlag = checkUtil.bsaHandleBefore(values, sbColumn, sbErrorType, "4");

				if (!bFlag) {
					continue;
				}

				BsaDTO bsaDTO = new BsaDTO();
				bsaDTO.setPilotSectorName(rs.getString(i++));
				bsaDTO.setSid(rs.getLong(i++));
				bsaDTO.setNid(rs.getLong(i++));
				bsaDTO.setExtendBid(rs.getLong(i++));
				bsaDTO.settPn(rs.getLong(i++));
				bsaDTO.setAntennaLati(rs.getDouble(i++));
				bsaDTO.setAntennaLongi(rs.getDouble(i++));

				Double dv = rs.getDouble(i++);
				if (dv != null) {
					bsaDTO.setAntennaAlti(dv);
				}

				bsaDTO.setAntennaLocAccu(rs.getDouble(i++));
				bsaDTO.setSectorCenterLati(rs.getDouble(i++));
				bsaDTO.setSectorCenterLongi(rs.getDouble(i++));
				bsaDTO.setSectorCenterAlti(rs.getDouble(i++));
				bsaDTO.setAntennaOrientation(rs.getDouble(i++));

				Double open = rs.getDouble(i++);
				if (open != null) {
					bsaDTO.setAntennaOpening(open);
				}

				bsaDTO.setMaxAntennaRange(rs.getDouble(i++));
				bsaDTO.setTerrainAverageHeight(rs.getDouble(i++));
				bsaDTO.setTerrainHeightStandardDevi(rs.getDouble(i++));
				bsaDTO.setPotentialRepeater(rs.getDouble(i++));
				bsaDTO.setPnIncrement(rs.getInt(i++));
				bsaDTO.setFwdCalib(rs.getDouble(i++));
				bsaDTO.setFwdCalibAccu(rs.getDouble(i++));
				bsaDTO.setRtdCalib(rs.getDouble(i++));
				bsaDTO.setRtdCalibAccu(rs.getDouble(i++));
				bsaDTO.setFormatType(rs.getLong(i++));
				// System.out.println(i);
				bsaDTO.setSwitchNum(rs.getLong(i));

				fileWriter.write(bsaDTO.toCommaSplitString() + "\n");
				resultcount++;
			}
			fileWriter.flush();
			createFileEnd(fileWriter);
			fileWriter.flush();
			fileWriter.close();

			return resultcount > 0;
		} catch (Exception e) {
			LOG.error("五项推导导出数据出现异常， 原因: ", e);
		} finally {
			fileWriter.close();
		}
		return false;
	}

	private void createFileHead(FileWriter fileWriter, String count) throws IOException {
		// 第三个参数开始含义不确定 116.0003
		fileWriter.write(BSAConfigProperties.getProps().get("bsa_header_one") + "," + DateTimeUtils.getCurrentDateTime() + ","
				+ BSAConfigProperties.getProps().get("bsa_header_three") + "," + BSAConfigProperties.getProps().get("bsa_header_four") + "," + count
				+ "\n");
		fileWriter.write(sencondLine + "\n");
		fileWriter.flush();
	}

	private void createFileEnd(FileWriter fileWriter) throws IOException {
		fileWriter.write("BSTR," + DateTimeUtils.getCurrentDateTime());
	}

	public void deleteTmpFile() {
		String projectPath = System.getProperty("user.dir");
		File f = new File(projectPath);
		File[] fs1 = f.listFiles(new DirFilter(".csv"));
		File[] fs2 = f.listFiles(new DirFilter(".bin"));
		try {
			if (fs1 != null) {
				for (File tmp : fs1)
					tmp.delete();
			}
			if (fs2 != null) {
				for (File tmp : fs2)
					tmp.delete();
			}
		} catch (Exception e) {
			LOG.error("删除文件失败,原因={}", e);
		}
	}

	class DirFilter implements FilenameFilter {

		private final String type;

		public DirFilter(String tp) {

			this.type = tp;
		}

		@Override
		public boolean accept(File fl, String path) {
			return path.endsWith(type);
		}

	}

	public static void main(String[] args) {
		System.out.println((int) (Math.random() * 1000));
		BSADeduce d = new BSADeduce();
		System.out.println(System.getProperty("user.dir"));
		d.deleteTmpFile();
	}

}
