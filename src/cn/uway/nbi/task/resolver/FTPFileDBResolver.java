package cn.uway.nbi.task.resolver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.DataBaseDS;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * FTP型数据源解释器，从FTP下载文件后，解析后入库。 主要是为了 与 泰和佳通 之间 开通 室分入网（也叫台账接口）
 * 
 * 
 */
@IDMember(id = 202)
public class FTPFileDBResolver extends LocalFileResolver {

	private static final Logger LOG = LoggerFactory.getLogger(FTPFileDBResolver.class);

	public DateFormat sdf;

	public Connection conn = null;

	public ResultSet rs = null;

	public BufferedReader reader = null;

	/**
	 * 解析resolve节点,因resolve节点下的内容结构不定，所以开放给子类
	 */
	@SuppressWarnings({"unused", "unchecked"})
	public void parseResolveNode() {

		List<Element> list = element.elements();

		int id = 0;
		for (Element ee : list) {
			String tagName = ee.getName();

			String db_dsid = ee.attributeValue("db_dsid");

			List<String> fnameList = new ArrayList<String>();
			FtpFileUnit ftpFileUnitTmp = new FtpFileUnit();// raw FTP

			ftpFileUnitTmp.setKey(db_dsid);

			if ("files".equals(tagName)) {

				List<Element> filesElement = ee.elements();
				for (Element ele : filesElement) {
					String pname = ele.attributeValue("name");
					String file = ele.getText();
					if (StringUtil.isNotNull(file))
						fnameList.add(file);
				}
				ftpFileUnitTmp.setFilenameList(fnameList);

				ftpRawUnitMap.put(db_dsid, ftpFileUnitTmp);
			}

		}
	}

	@Override
	public ResolverResult resolve() throws Exception {

		Map<String, String> pathMapResult = new HashMap<String, String>();
		ResolverResult resolverResult = new ResolverResult();
		Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
		resolverResult.setUploadFileInfoMap(recordCountMap);

		LOG.info("开始进行FTP数据收集!");
		FTPFileDS ds = (FTPFileDS) getDs();

		ftpUnitMap = ds.getFtpFileUnitMap();

		String localdir = ds.getLocalDownPath();

		String curDir = null;
		DownStructer fileDownList = null;

		if (StringUtil.isNotNull(localdir)) {
			localdir = localdir.replace("\\", "/");
			if (localdir.lastIndexOf("/") != localdir.length() - 1)
				localdir = localdir + "/";
			File f = new File(localdir);
			if (!f.exists())
				f.mkdirs();
			curDir = localdir;

		} else {
			curDir = SysCfg.getInstance().getCurrentpath().replace("\\", "/");
		}

		if (ftpUnitMap == null) {
			ftpUnitMap = new HashMap<String, FtpFileUnit>();
			ftpUnitMap.putAll(ftpRawUnitMap);
		}

		// 为 校验是否为 数据是否为 日期型 作准备， 写在这里，是因为在使用的时候，就不需要每一次都去New 了。
		sdf = new SimpleDateFormat("yyyy/mm/dd");

		for (Entry<String, FtpFileUnit> entity : ftpRawUnitMap.entrySet()) {

			Map<String, String> pathMap = new HashMap<String, String>();

			FtpFileUnit ftpFileUnit = entity.getValue();

			FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());

			try {

				// 通过通配符下载数据文件
				for (String fName : ftpFileUnit.getFilenameList()) {

					fName = ProvinceNameMgr.replaceProvince(fName, task.getTemplet().getInclude().getProviceMap());
					fName = processParaMap(fName, "${", "}", null);

					String tmpFile = ConstDef.ParseFilePath(fName, new Timestamp(task.getCurrDataTime().getTime()));
					String ftpFname = tmpFile;

					String localPath = curDir + File.separator + task.getId() + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					String dir = localPath.substring(0, localPath.length() - ftpFname.length());
					File f = new File(dir);
					if (!f.exists())
						f.mkdir();

					// 下载文件
					fileDownList = ftp.downFile(ftpFname, dir);

					if (fileDownList != null) {
						DataBaseDS db = (DataBaseDS) dsMap.get(Integer.parseInt(ftpFileUnit.getKey()));
						// 解析 下载后的文件。 并导入数据库。
						for (String tmp : fileDownList.getSuc()) {
							// 如果是ZIP的文件，需解压
							if (tmp.endsWith(".zip")) {
								tmp = ZIP_Extrac(tmp);
							}

							if (tmp != null && !"".equals(tmp)) {
								// 解析 下载后的文件。 并导入数据库。
								data_handle(db, tmp);
							}
						}
					}
				}

			} catch (Exception e) {
				LOG.error("FTP 方式 下载数据文件()失败. ", ftpFileUnit.getFilenameList(), e);
			} finally {
				if (ftp != null)
					ftp.closeConnect();
			}
		}

		return resolverResult;
	}

	public void data_handle(DataBaseDS db, String fileName) {
		CallableStatement proc = null;
		// 当前正在处理的字符串， 用于当出现异常时， 可以明确知道是哪一行 。
		String readStringNow = "";
		// 校验信息
		String checkString = "";
		Date sysData = new Date();
		long begin = new Date().getTime();
		try {
			// 数据库连接信息
			conn = getConnection(db);
			LOG.info("文件导入开始：" + fileName);
			// 读取文件
			// fileName="e:\\a.csv";
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "utf-16"));
			String tempString = null;

			// 数据从第2行开始读取， 第一行为表头
			reader.readLine();
			int line = 2;
			// 一次读入一行，直到读入null为文件结束

			while ((tempString = reader.readLine()) != null) {
				checkString = "";
				readStringNow = "正在处理第" + line + "行，数据为:" + tempString;

				// 显示行号
				// LOG.debug("---------------------------------------------------- " );
				// LOG.debug("正在处理 line " + line + ": " + tempString);

				String[] dataList = tempString.split(",", -1);

				TH th = new TH();
				// 校验数据
				checkData(dataList, th, sdf, sysData);
				// 插入数据
				insertData(conn, th);
				th = null;
				// 显示行号
				if (line % 100 == 0) {
					LOG.debug("正在处理 line " + line + ": " + tempString);
				}

				line++;
			}
			reader.close();
			long fileEnd = new Date().getTime();
			LOG.debug("文件导入完成：" + fileName + "，共耗时" + (fileEnd - begin) / 1000 + " 秒");

			// 文件内容导入完后， 调用 相关的存储过程。
			proc = conn.prepareCall("{ call  SP_IMP_ROOMSITE_W() }"); // 设置存储过程
			proc.execute();// 执行

			long procEnd = new Date().getTime();
			LOG.debug("存储过程 SP_IMP_ROOMSITE_W() 完成，共耗时" + (procEnd - fileEnd) / 1000 + " 秒");
			DBUtil.close(rs, proc, null);

		} catch (IOException e) {
			LOG.error("文件处理异常{}!" + readStringNow, e);
		} catch (Exception e) {
			LOG.error("数据库数据收集异常{}!" + readStringNow, e);
		} finally {
			DBUtil.close(rs, proc, conn);
			// java.util.
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 插入数据到数据库中。
	 * 
	 * @throws Exception
	 */
	public void insertData(Connection conn, TH th) throws Exception {

		int selectcount = 0;
		String sql = "";
		PreparedStatement stm = null;
		ResultSet rs = null;
		int i = 1;
		try {
			// LOG.debug("th.getRes_state() : " + th.getRes_state() );
			// Res_state() 的值为1 ， 代表 校验成功， 可以入库
			if ("1".equals(th.getRes_state() + "")) {

				/*
				 * 2014-12-4 广东现场 曾文亮 提出 根据局方要求,联通二期 室分系统有个基础数据模块跟泰和佳通对接 对入网需要修改一下逻辑. 具体修改内容如下: ne_cell_w 表中： sourcecellid对应ne_cell_w的ci字段
				 * impcity字段对应ne_cell_w的city_id字段
				 * 
				 * 对泰和佳通推送过来的小区数据 根据LAC+CI+CITY_ID 在ne_cell_w进行判断是否存在且是现网运行状态的小区(cell_state=1)? 1. 符合 再根据LAC+CI+CITY_ID在cfg_basedata_roomw 判断是否存在
				 * 不存在则插入,存在则不插入cfg_basedata_roomw. 2. 不符合 则不插入到cfg_basedata_roomw
				 * 
				 * 判读逻辑: If((Select count(1) from ne_cell_w where cell_state=1 and lac=泰和推送过来的LAC and Ci=泰和推送过来的[路由区域编码] and city_id=泰和推送过来的地市)>=1 &&
				 * Select coun(1) from cfg_basedata_roomw where cell_state=1 and lac=泰和推送过来的LAC and Ci=泰和推送过来的[路由区域编码] and city_id=泰和推送过来的地市)==0){
				 * 插入数据库 }
				 */
				sql = "select count(*) nu  from ne_cell_w where cell_state=1 and lac= " + th.getLac() + " and ci=" + th.getSourcecellid()
						+ " and city_id=" + th.getCity_id();

				// LOG.debug("sql 1 : " + sql );
				stm = conn.prepareStatement(sql);
				rs = stm.executeQuery();
				while (rs.next()) {
					selectcount = rs.getInt(1);
				}

				// LOG.debug("sql 1  selectcount: " + selectcount );
				// 如果 不存在记录，就直接返回
				if (selectcount < 1) {

					DBUtil.close(rs, stm, null);
					selectcount = 0;
					// 根据lac+ci+city_id为主键对数据表cfg_basedata_roomw进行判断是否已经存在,不存在则插入
					sql = "select count(*) from cfg_basedata_roomw where lac= " + th.getLac() + " and SOURCECELLID=" + th.getSourcecellid()
							+ " and IMPCITY=" + th.getCity_id();
					// LOG.debug("sql 2 : " + sql );
					stm = conn.prepareStatement(sql);
					rs = stm.executeQuery();
					while (rs.next()) {
						selectcount = rs.getInt(1);
					}

					// LOG.debug("sql 2  selectcount: " + selectcount );

					DBUtil.close(rs, stm, null);

					if (selectcount < 1) {

						i = 1;
						sql = "insert into cfg_basedata_roomw(ROWGUIDID,IMPID,IMPCITY,IMPTIME,"
								+ "ROOMSITENAME,VESTEDINCOMPANY,SOURCECELLNAME,VESTINGRNCNAME," + "LONGITUDE,LATITUDE,NETWORKTIME,VESTINGDURATION,"
								+ "ROOMSITESTATUS,UPLINKFREQUENCY,DOWNLINKFREQUENCY,SOURCECELLPSC," + "LAC,SOURCECELLID,impflag) values "
								+ "(?,'7',?,sysdate," + "?,?,?,?," + "?,?,?,?," + "?,?,?,?," + "?,?,2 " + ")";

						conn.setAutoCommit(false);
						stm = conn.prepareStatement(sql);

						stm.setString(i++, java.util.UUID.randomUUID().toString());
						stm.setInt(i++, th.getCity_id());

						stm.setString(i++, th.getRoomsitename());
						stm.setString(i++, th.getVestedincompany());
						stm.setString(i++, th.getSourcecellname());
						stm.setString(i++, th.getVestingrncname());

						if (th.getLongitude() == null) {
							stm.setNull(i++, Types.DOUBLE);
						} else {
							stm.setDouble(i++, th.getLongitude());
						}

						if (th.getLatitude() == null) {
							stm.setNull(i++, Types.DOUBLE);
						} else {
							stm.setDouble(i++, th.getLatitude());
						}

						stm.setDate(i++, th.getNetworktime() == null ? null : new java.sql.Date(th.getNetworktime().getTime()));

						stm.setString(i++, th.getVestingduration());

						stm.setString(i++, th.getRoomsitestatus());

						if (th.getUplinkfrequency() == null) {
							stm.setNull(i++, Types.INTEGER);
						} else {
							stm.setInt(i++, th.getUplinkfrequency());
						}

						if (th.getDownlinkfrequency() == null) {
							stm.setNull(i++, Types.INTEGER);
						} else {
							stm.setInt(i++, th.getDownlinkfrequency());
						}

						if (th.getSourcecellpsc() == null) {
							stm.setNull(i++, Types.INTEGER);
						} else {
							stm.setInt(i++, th.getSourcecellpsc());
						}

						if (th.getLac() == null) {
							stm.setNull(i++, Types.INTEGER);
						} else {
							stm.setInt(i++, th.getLac());
						}

						if (th.getSourcecellid() == null) {
							stm.setNull(i++, Types.INTEGER);
						} else {
							stm.setInt(i++, th.getSourcecellid());
						}

						stm.executeUpdate();
						conn.commit();
						DBUtil.close(rs, stm, null);
					} else {
						th.setRes("LAC ： " + th.getLac() + "，信源/施主基站小区CELL_ID:" + th.getSourcecellid() + "，地市：" + th.getVestedincompany() + "，  已导入过");
						th.setRes_state(2);
					}
				}
			}

			// 入历史表 setNetworktime
			i = 1;
			sql = "insert into mod_imp_basedata_roomw(city_id,IMPTIME," + "ROOMSITENAME,VESTEDINCOMPANY,SOURCECELLNAME,VESTINGRNCNAME,"
					+ "LONGITUDE,LATITUDE,NETWORKTIME,VESTINGDURATION," + "ROOMSITESTATUS,UPLINKFREQUENCY,DOWNLINKFREQUENCY,SOURCECELLPSC,"
					+ "LAC,SOURCECELLID,res,res_state) values " + "(?,sysdate," + "?,?,?,?," + "?,?,?,?," + "?,?,?,?," + "?,?,?,? " + ")";

			conn.setAutoCommit(false);
			stm = conn.prepareStatement(sql);

			if (th.getCity_id() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getCity_id());
			}

			stm.setString(i++, th.getRoomsitename());
			stm.setString(i++, th.getVestedincompany());
			stm.setString(i++, th.getSourcecellname());
			stm.setString(i++, th.getVestingrncname());

			if (th.getLongitude() == null) {
				stm.setNull(i++, Types.DOUBLE);
			} else {
				stm.setDouble(i++, th.getLongitude());
			}
			if (th.getLatitude() == null) {
				stm.setNull(i++, Types.DOUBLE);
			} else {
				stm.setDouble(i++, th.getLatitude());
			}

			stm.setDate(i++, th.getNetworktime() == null ? null : new java.sql.Date(th.getNetworktime().getTime()));
			stm.setString(i++, th.getVestingduration());

			stm.setString(i++, th.getRoomsitestatus());

			if (th.getUplinkfrequency() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getUplinkfrequency());
			}

			if (th.getDownlinkfrequency() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getDownlinkfrequency());
			}

			if (th.getSourcecellpsc() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getSourcecellpsc());
			}

			if (th.getLac() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getLac());
			}

			if (th.getSourcecellid() == null) {
				stm.setNull(i++, Types.INTEGER);
			} else {
				stm.setInt(i++, th.getSourcecellid());
			}

			stm.setString(i++, th.getRes());

			stm.setInt(i++, th.getRes_state());

			stm.executeUpdate();
			conn.commit();

			DBUtil.close(rs, stm, null);

		} catch (Exception e) {
			LOG.error("数据入库时出现异常" + e);

		} finally {
			DBUtil.close(rs, stm, null);
		}
	}

	/**
	 * 查询 city_id。
	 * 
	 * @throws SQLException
	 */
	public Integer getCity_id(String city_name) throws SQLException {

		ResultSet rs = null;
		Integer city_id = null;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement("select city_id from CFG_CITY where CITY_name='" + city_name + "'");
			rs = stm.executeQuery();
			while (rs.next()) {
				city_id = rs.getInt(1);
			}

		} catch (Exception e) {
			LOG.error("查询 city_id 出现异常" + e);
		} finally {
			DBUtil.close(rs, stm, null);
		}

		return city_id;
	}

	/**
	 * 对文件中的每一行数据进行校验
	 * 
	 * @param dataList
	 * @param th
	 * @throws ParseException
	 * @throws SQLException
	 */
	public void checkData(String[] dataList, TH th, DateFormat sdf, Date sysdate) throws ParseException, SQLException {

		String checkString = "";
		String isImport = "";
		String stringValue = "";
		int i = 0;

		// ROOMSITENAME 室分站点名称 对应泰和佳通的 [物理站点名称]
		stringValue = trimNull(dataList[i++]);
		if (stringValue.length() > 0) {
			th.setRoomsitename(stringValue);
		} else {
			//
			checkString = checkString + "室分站点名称为空;";
		}

		try {
			stringValue = trimNull(dataList[i++]);
			// 根据泰和佳通的[地市]列 插入city_id(可以从表cfg_city获取)
			if (stringValue.length() > 0) {
				th.setVestedincompany(stringValue);

				stringValue = getCity_id(stringValue) + "";
				if ("NULL".equals(stringValue) || "null".equals(stringValue)) {
					checkString = checkString + "地市 的值在表中未找到;";
					isImport = checkString;
				} else {
					th.setCity_id(Integer.parseInt(stringValue));
				}

			} else {
				//
				checkString = checkString + "地市 为空;";
				isImport = checkString;
			}

			// SOURCECELLNAME 信源/施主基站小区名称 对应泰和佳通的 [网元中文名称 ]
			stringValue = trimNull(dataList[i++]);
			if (stringValue.length() > 0) {
				th.setSourcecellname(stringValue);
			} else {
				//
				checkString = checkString + "信源/施主基站小区名称为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// VESTINGRNCNAME 归属RNC_NAME 对应泰和佳通的 [RNC名称 ]
			if (stringValue.length() > 0) {
				th.setVestingrncname(stringValue);
			} else {
				//
				checkString = checkString + "归属RNC_NAME 为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// LONGITUDE 经度 数字 对应泰和佳通的 [地理经度]

			if (stringValue.length() > 0) {
				if (isDouble(stringValue)) {
					th.setLongitude(Double.parseDouble(stringValue));
				} else {
					checkString = checkString + stringValue + "经度  数据的精度不够或不为数值型;";
				}

			} else {
				//
				checkString = checkString + "经度 为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// LATITUDE 纬度 数字 对应泰和佳通的 [地理纬度]

			if (stringValue.length() > 0) {
				if (isDouble(stringValue)) {
					th.setLatitude(Double.parseDouble(stringValue));
				} else {
					checkString = checkString + stringValue + "纬度  数据的精度不够或不为数值型;";
				}
			} else {
				checkString = checkString + "纬度  为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// NETWORKTIME 入网时间 时间 对应泰和佳通的 [入网时间]
			// 2015-1-4 修改 ， 曾文亮提出： 那个入网时间 只要在最近一个月的 才插入cfg_basedata_roomw
			if (stringValue.length() > 0) {
				if (isDate(stringValue)) {
					th.setNetworktime(sdf.parse(stringValue));

					if (daysBetween(sdf.parse(stringValue), sysdate) > 29) {
						checkString = checkString + "入网时间  不是最近一个月;";
						isImport = checkString;
					}
				} else {
					checkString = checkString + stringValue + "入网时间 不为日期型数据;";
				}
			} else {
				checkString = checkString + "入网时间   为空;";
				isImport = checkString;

			}

			stringValue = trimNull(dataList[i++]);
			// VESTINGDURATION 归属工期 字符串 对应泰和佳通的 [工程期别 ]

			if (stringValue.length() > 0) {
				th.setVestingduration(stringValue);
			} else {
				checkString = checkString + "归属工期	为空;";

			}

			stringValue = trimNull(dataList[i++]);
			// ROOMSITESTATUS 室分站点状态 字符串 对应泰和佳通的 [逻辑小区状态 ]
			// 逻辑小区状态 如果为 现网状态 ，则 改为 现网运行状态
			if (stringValue.length() > 0) {
				if ("现网状态".equals(stringValue.trim())) {
					th.setRoomsitestatus("现网运行状态");
				} else {
					th.setRoomsitestatus(stringValue);
				}

			} else {
				checkString = checkString + "室分站点状态	为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// UPLINKFREQUENCY 上行频点号 数字 对应泰和佳通的 [上行频点 ]
			if (stringValue.length() > 0) {
				if (isInteger(stringValue)) {
					th.setUplinkfrequency(Integer.parseInt(stringValue));
				} else {
					checkString = checkString + stringValue + "上行频点号 不为数字;";
				}
			} else {
				checkString = checkString + "上行频点号	为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// DOWNLINKFREQUENCY 下行频点号 数字 对应泰和佳通的 [下行频点 ]
			if (stringValue.length() > 0) {
				if (isInteger(stringValue)) {
					th.setDownlinkfrequency(Integer.parseInt(stringValue));
				} else {
					checkString = checkString + stringValue + "上行频点号 不为数字;";
				}
			} else {
				checkString = checkString + "上行频点号	为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// SOURCECELLPSC 信源/施主基站小区扰码(PSC) 数字 对应泰和佳通的 [主扰码号]
			if (stringValue.length() > 0) {
				if (isInteger(stringValue)) {
					th.setSourcecellpsc(Integer.parseInt(stringValue));
				} else {
					checkString = checkString + stringValue + "信源/施主基站小区扰码 不为数字;";
				}
			} else {
				checkString = checkString + "信源/施主基站小区扰码  为空;";
			}

			stringValue = trimNull(dataList[i++]);
			// LAC LAC 数字 对应泰和佳通的 [ 位置区域编码]
			if (stringValue.length() > 0) {
				if (isInteger(stringValue)) {
					th.setLac(Integer.parseInt(stringValue));
				} else {
					checkString = checkString + stringValue + "LAC 不为数字;";
					isImport = checkString;
				}
			} else {
				checkString = checkString + "LAC  为空;";
				isImport = checkString;
			}

			stringValue = trimNull(dataList[i++]);
			// SOURCECELLID 信源/施主基站小区CELL_ID 数字 对应泰和佳通的 [路由区域编码 ]
			if (stringValue.length() > 0) {
				if (isInteger(stringValue)) {
					th.setSourcecellid(Integer.parseInt(stringValue));
				} else {
					checkString = checkString + stringValue + "信源/施主基站小区CELL_ID	 不为数字;";
					isImport = checkString;
				}
			} else {
				checkString = checkString + stringValue + "信源/施主基站小区CELL_ID	  为空;";
				isImport = checkString;
			}

			// res 导入结果 状态
			if (isImport.length() > 0) {
				th.setRes_state(2);
			} else {
				th.setRes_state(1);
			}

			th.setRes(checkString);
		} catch (Exception e) {
			LOG.error("数据校验时出现异常" + e);
		}

	}

	/** 获取数据库连接 */
	public Connection getConnection(DataBaseDS ds) throws Exception {
		return DBUtil.getConnection(ds.getDriver(), ds.getUrl(), ds.getUsername(), ds.getPassword());
	}

	/**
	 * 删除空格
	 * 
	 * @param data
	 * @return
	 */
	public String trimNull(String data) {
		if (data == null) {
			data = "";
		}
		return data.trim();
	}

	/**
	 * 是否有6位小数，并且为Double
	 * 
	 * @param data
	 * @return
	 */
	public boolean isDouble(String data) {
		boolean returnvalues = false;
		try {
			Double.parseDouble(data);
			if (data.substring(data.lastIndexOf(".") + 1, data.length()).length() >= 6) {
				returnvalues = true;
			}

		} catch (Exception e) {
			returnvalues = false;
		}

		return returnvalues;
	}

	/**
	 * 是否 为 integer 型
	 * 
	 * @param data
	 * @return
	 */
	public boolean isInteger(String data) {
		boolean returnvalues = false;
		try {
			Integer.parseInt(data);
			returnvalues = true;

		} catch (Exception e) {
			returnvalues = false;
		}

		return returnvalues;
	}

	/**
	 * 是否 为 Date 型
	 * 
	 * @param data
	 * @return
	 */
	public boolean isDate(String data) {
		boolean returnvalues = false;

		try {
			sdf.parse(data);
			returnvalues = true;

		} catch (Exception e) {
			returnvalues = false;
		}

		return returnvalues;
	}

	/**
	 * 是否 不为 null 或 ""
	 * 
	 * @param data
	 * @return
	 */
	public boolean isNotNull(String data) {
		boolean returnvalues = false;

		try {
			if (data != null && data.trim().length() > 0 && !"null".equals(data.toLowerCase())) {
				returnvalues = true;
			}
		} catch (Exception e) {
			returnvalues = false;
		}

		return returnvalues;
	}

	public String ZIP_Extrac(String zipFileName) throws Exception {
		String destDir = zipFileName.substring(0, zipFileName.lastIndexOf(File.separator));
		String cvsName = "";
		OutputStream outputStream = null;
		InputStream inputStream = null;
		byte b[] = new byte[1024];
		int length;

		ZipFile zipFile;
		try {
			zipFile = new ZipFile(new File(zipFileName), "gbk");
			Enumeration enumeration = zipFile.getEntries();
			ZipEntry zipEntry = null;

			while (enumeration.hasMoreElements()) {
				zipEntry = (ZipEntry) enumeration.nextElement();
				File loadFile = new File(destDir + File.separator + zipEntry.getName());

				if (zipEntry.isDirectory()) {
					// 这段都可以不要，因为每次都貌似从最底层开始遍历的
					loadFile.mkdirs();
				} else {
					if (!loadFile.getParentFile().exists())
						loadFile.getParentFile().mkdirs();

					outputStream = new FileOutputStream(loadFile);
					inputStream = zipFile.getInputStream(zipEntry);

					while ((length = inputStream.read(b)) > 0)
						outputStream.write(b, 0, length);

					cvsName = loadFile.getAbsolutePath();

				}
				LOG.info(" 文件解压成功 " + loadFile.getAbsolutePath());
			}

		} catch (IOException e) {
			LOG.error(" 文件解压异常 " + e);
			throw e;
		} finally {
			if (outputStream != null) {
				outputStream.close();
			}

			if (inputStream != null) {
				inputStream.close();
			}

		}

		return cvsName;

	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public int daysBetween(Date smdate, Date bdate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		smdate = sdf.parse(sdf.format(smdate));
		bdate = sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

}

// cvs 文件解析后 对应的Bean
class TH {

	public Date imptime;

	public Integer city_id;

	public String roomsitename;

	public String vestedincompany;

	public String sourcecellname;

	public String vestingrncname;

	public Double longitude;

	public Double latitude;

	public Date networktime;

	public String vestingduration;

	public String roomsitestatus;

	public Integer uplinkfrequency;

	public Integer downlinkfrequency;

	public Integer sourcecellpsc;

	public Integer lac;

	public Integer sourcecellid;

	public String res;

	public int res_state;

	public Date getImptime() {
		return imptime;
	}

	public void setImptime(Date imptime) {
		this.imptime = imptime;
	}

	public Integer getCity_id() {
		return city_id;
	}

	public void setCity_id(Integer cityId) {
		city_id = cityId;
	}

	public String getRoomsitename() {
		return roomsitename;
	}

	public void setRoomsitename(String roomsitename) {
		this.roomsitename = roomsitename;
	}

	public String getVestedincompany() {
		return vestedincompany;
	}

	public void setVestedincompany(String vestedincompany) {
		this.vestedincompany = vestedincompany;
	}

	public String getSourcecellname() {
		return sourcecellname;
	}

	public void setSourcecellname(String sourcecellname) {
		this.sourcecellname = sourcecellname;
	}

	public String getVestingrncname() {
		return vestingrncname;
	}

	public void setVestingrncname(String vestingrncname) {
		this.vestingrncname = vestingrncname;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Date getNetworktime() {
		return networktime;
	}

	public void setNetworktime(Date networktime) {
		this.networktime = networktime;
	}

	public String getVestingduration() {
		return vestingduration;
	}

	public void setVestingduration(String vestingduration) {
		this.vestingduration = vestingduration;
	}

	public String getRoomsitestatus() {
		return roomsitestatus;
	}

	public void setRoomsitestatus(String roomsitestatus) {
		this.roomsitestatus = roomsitestatus;
	}

	public Integer getUplinkfrequency() {
		return uplinkfrequency;
	}

	public void setUplinkfrequency(Integer uplinkfrequency) {
		this.uplinkfrequency = uplinkfrequency;
	}

	public Integer getDownlinkfrequency() {
		return downlinkfrequency;
	}

	public void setDownlinkfrequency(Integer downlinkfrequency) {
		this.downlinkfrequency = downlinkfrequency;
	}

	public Integer getSourcecellpsc() {
		return sourcecellpsc;
	}

	public void setSourcecellpsc(Integer sourcecellpsc) {
		this.sourcecellpsc = sourcecellpsc;
	}

	public Integer getLac() {
		return lac;
	}

	public void setLac(Integer lac) {
		this.lac = lac;
	}

	public Integer getSourcecellid() {
		return sourcecellid;
	}

	public void setSourcecellid(Integer sourcecellid) {
		this.sourcecellid = sourcecellid;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public int getRes_state() {
		return res_state;
	}

	public void setRes_state(int resState) {
		res_state = resState;
	}

}
