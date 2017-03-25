package cn.uway.nbi.task.resolver;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import org.dom4j.Element;
import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.bsa.BSAIndexMgr;
import cn.uway.nbi.bsa.BsaUtil;
import cn.uway.nbi.db.dao.BSADataCheckUtil;
import cn.uway.nbi.db.dao.BSADeduce;
import cn.uway.nbi.db.dao.BSARuleLogDao;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.BsaDTO;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.ds.DataBaseDS;
import cn.uway.nbi.util.BSAConfigProperties;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;
import cn.uway.nbi.validate.CheckMapping;
import cn.uway.nbi.validate.CheckMappingMgr;
import cn.uway.nbi.validate.ValidateFuction;

/**
 * DB型数据源解释器
 * 
 * @author YangJian
 * @since 1.0
 */
@IDMember(id = 410)
public class BSADBResolver extends DBResolver {

	protected List<MappingInfo> mappingInfos;

	protected ValidateFuction validateFuction = new ValidateFuction();

	protected CheckMappingMgr checkMgr = CheckMappingMgr.getInstance();

	private static final Logger LOG = LoggerFactory.getLogger(DBResolver.class);

	private BSADataCheckUtil checkUtil = new BSADataCheckUtil();

	public BSADBResolver() {
		mappingInfos = new ArrayList<MappingInfo>();
	}

	public BSADBResolver(Task task, int actionId) {
		this();
		this.task = task;
		mappingInfos = new ArrayList<MappingInfo>();
	}

	@Override
	@SuppressWarnings("unchecked")
	public void parseResolveNode() {
		controllog = element.attributeValue("controllog");
		if (controllog != null)
			controllog = ConstDef.ParseFilePath(controllog, new Timestamp(task.getCurrDataTime().getTime()));

		List<Element> es = element.elements();
		for (Element ee : es) {
			String tagName = ee.getName();
			if ("mapping".equals(tagName)) {
				MappingInfo info = new MappingInfo();
				// name
				String name = ee.attributeValue("name");
				info.fileName = name;
				// templet
				String templet = ee.attributeValue("templet");
				info.templetFileName = templet;
				// add 2014-6-27 jinagl 模板的地址，要根据 网络类型与 版本号 来变化
				if (null != task.getNet_type() && !"".equals(task.getNet_type()) && null != task.getVersion() && !"".equals(task.getVersion())) {

					info.templetFileName = task.getNet_type() + File.separator + task.getVersion() + File.separator + templet;

				}
				String isRelated = ee.attributeValue("isrelated");
				if (StringUtil.isNotNull(isRelated))
					info.isRelated = isRelated.equals("1");

				String isPrefixCondition = ee.attributeValue("is_prefix_condition");
				if (StringUtil.isNotNull(isPrefixCondition)) {

					if (isRelated.equals("1") || isRelated.equalsIgnoreCase("true"))
						info.isPrefixCondition = true;
				}
				String strategy = ee.attributeValue("strategy");
				if (StringUtil.isNotNull(strategy)) {
					info.strategyId = strategy.trim();
				}

				// batchnum
				String bStr = ee.attributeValue("batchnum");
				if (bStr != null && !"".equals(bStr))
					info.batchNum = Integer.parseInt(bStr);
				// addhead
				String aStr = ee.attributeValue("addhead");
				if (aStr != null && !"".equals(aStr))
					info.addHead = Boolean.parseBoolean(aStr);

				// add on 20131202
				String package_name = ee.attributeValue("package_name");
				if (StringUtil.isNotNull(package_name))
					info.packageName = package_name.trim();

				// end add

				// filename 参数变量
				Element ftpsource = ee.element("ftpsource");

				if (ftpsource != null) {
					String ftp_dsid = ftpsource.attributeValue("ftp_dsid");
					String compressFile = ftpsource.attributeValue("name");

					List<String> ftpnameList = new ArrayList<String>();
					List<Element> fptfile = ftpsource.elements("property");
					for (Element sqlE : fptfile) {
						String sql = sqlE.getText();
						ftpnameList.add(sql);
					}

					info.ftpdsid = Integer.valueOf(ftp_dsid);
					info.compressFile = compressFile;
					info.ftpnameList = ftpnameList;
				}

				// filename 参数变量
				Element filepara = ee.element("filepara");

				if (filepara != null) {
					String fileParaSql = filepara.getText();
					info.fileParaSql = fileParaSql;
				}

				// add on 2014-05-28 添加字段是否匹配，以及字段自适应匹配输出, 主要针对大数据文件输出进行处理
				Element heads = ee.element("header");
				if (heads != null) {
					String headText = heads.getTextTrim();
					if (StringUtil.isNotNull(headText)) {
						Header header = new Header();
						String split = heads.attributeValue("split");
						if (StringUtil.isNotNull(split)) {
							header.split = split;
						}
						header.headList = headText.split(header.split);
						String isFieldMatch = heads.attributeValue("isfieldmatch");
						if (StringUtil.isNotNull(isFieldMatch) && ("1".equalsIgnoreCase(isFieldMatch) || "true".equalsIgnoreCase(isFieldMatch))) {
							header.isFieldMatch = true;
						}
						info.header = header;
					}
				}
				// end add

				// sqls
				List<SqlEntry> sqlEntryList = new ArrayList<SqlEntry>();
				List<Element> sqlEs = ee.elements("sql");
				for (Element sqlE : sqlEs) {
					boolean is_prefix_condition = false;
					String sql = sqlE.getText();

					String prefix_condition = sqlE.attributeValue("is_prefix_condition");

					if (StringUtil.isNotNull(prefix_condition)) {
						if ("1".equalsIgnoreCase(prefix_condition) || "true".equalsIgnoreCase(prefix_condition))
							is_prefix_condition = true;
					}

					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {

						List<String> sqlList = getBsaSql(sql);
						for (String sqlTmp : sqlList) {
							SqlEntry sqlEntry = new SqlEntry();
							sqlEntry.sql = sqlTmp;
							sqlEntry.isPrefixCondition = is_prefix_condition;

							sqlEntryList.add(sqlEntry);
						}
					} else {
						SqlEntry sqlEntry = new SqlEntry();
						sqlEntry.sql = sql;
						sqlEntry.isPrefixCondition = is_prefix_condition;

						sqlEntryList.add(sqlEntry);

					}
				}

				info.sqls = sqlEntryList;

				// add by yanb 2013.10.14 河北需求
				addExcelStyle(info, ee.element("excel"));

				// add by yanb 2013.10.16 山东工单特殊字符替换需求
				addReplaceSymbolInfo(info, ee.element("replacesymbol"));
				mappingInfos.add(info);

			} else if ("parameters".equals(tagName)) {
				List<Element> parameters = ee.elements("parameter");

				Map<String, ParaEntry> paraEntryMap = new HashMap<String, ParaEntry>();

				if (parameters != null && parameters.size() > 0) {
					for (Element para : parameters) {
						if (para != null) {

							ParaEntry pEntry = new ParaEntry();

							String key = para.attributeValue("name");
							String format = para.attributeValue("format");

							String textValue = para.getTextTrim();

							pEntry.setParaEn(key);
							pEntry.setFormat(format);
							pEntry.setRawValue(textValue);

							paraEntryMap.put(key, pEntry);

							this.setParaMap(paraEntryMap);

						}

					}
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	private void addReplaceSymbolInfo(MappingInfo info, Element ee) {
		if (null != ee) {
			List<Element> excelStyle = ee.elements("symbol");
			for (Element element : excelStyle) {
				info.replaceSymbolInfo.put(element.attributeValue("old"), element.attributeValue("new"));
			}
		}
	}

	@SuppressWarnings("unchecked")
	private void addExcelStyle(MappingInfo info, Element ee) {
		if (null == ee) {
			return;
		}
		ExcelFile excelFile = new ExcelFile();
		// <formart index="8" filed="基站上行CE资源利用率" type="float" style="0.00"/>
		String version = ee.attributeValue("version");
		excelFile.setVersion(null == version ? 2003 : Integer.parseInt(version));
		excelFile.setSheetName(ee.attributeValue("sheet"));
		excelFile.setTableHeader(getTableHeader(ee.element("tableheader")));
		List<Element> excelStyle = ee.elements("formart");
		for (Element element : excelStyle) {
			ExcelFileStyle excelFileStyle = new ExcelFileStyle();
			excelFileStyle.setFiledName(element.attributeValue("filed"));
			excelFileStyle.setFiledType(element.attributeValue("type"));
			excelFileStyle.setIndex(Integer.parseInt(element.attributeValue("index")));
			excelFileStyle.setStyle(element.attributeValue("style"));
			excelFile.setExcelFileStyles(excelFileStyle);
		}
		info.excelFile = excelFile;
	}

	private String[] getTableHeader(Element ee) {
		if (null == ee) {
			return null;
		}
		String tableHeader = ee.getText();
		if (null != tableHeader) {
			return tableHeader.split(",");
		}
		return null;
	}

	/**
	 * 如果是bsa，从数据库装载sql语句，这些先写这里面，以后重构
	 * 
	 * @param sql
	 *            sql
	 * @return List<String> sql语句
	 */
	private List<String> getBsaSql(String sql) {
		return BsaUtil.getBsaSql(sql, 1);
	}

	protected DataBaseDS getSysDB() {
		DataBaseDS sysDB = new DataBaseDS();
		sysDB.setDriver(SysCfg.getInstance().getDbDriver());
		sysDB.setUsername(SysCfg.getInstance().getDbUserName());
		sysDB.setPassword(SysCfg.getInstance().getDbPassword());
		sysDB.setUrl(SysCfg.getInstance().getDbUrl());
		return sysDB;
	}

	@Override
	public ResolverResult resolve() throws Exception {
		LOG.info("开始进行数据库数据收集!");
		long start = System.currentTimeMillis();
		ResolverResult result = new ResolverResult();
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		result.setUploadFileInfoMap(fileInfoMap);

		if (SysCfg.getInstance().getModelId() != ConstDef.BSA) {
			// 初始化数据验证功能模块
			validateFuction.init(getSysDB());
		}

		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
			DataBaseDS ds = (DataBaseDS) this.getDs();
			conn = getConnection(ds);
			ps = conn.createStatement();
			ResultSetHelper resultService = new ResultSetHelperService();

			boolean isValidate = task.getTemplet().includeValidate();
			boolean isLoop = task.getTemplet().getInclude().isLoop();
			if (!isValidate || !isLoop)
				this.resolveProcess(result, resultService, rs, ps, false, null);
			else {
				// 循环替换各个城市信息的相关占位符
				Set<String> citySet = task.getTemplet().getInclude().getCityMap().keySet();
				for (String cityId : citySet)
					this.resolveProcess(result, resultService, rs, ps, true, cityId);
			}
		} catch (Exception e) {
			LOG.error("数据库数据收集异常{}!", e);
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		long end = System.currentTimeMillis();
		LOG.info("数据收集完毕, 耗时({})s", (end - start) / 1000);
		return result;
	}

	/** 获取数据库连接 */
	public Connection getConnection(DataBaseDS ds) throws Exception {
		return DBUtil.getConnection(ds.getDriver(), ds.getUrl(), ds.getUsername(), ds.getPassword());
	}

	public String replaceProcess(String sFile, String cityId, boolean bProvice, boolean isReplaceCitys) {
		if (isReplaceCitys)// 替换城市相关占位符
		{
			sFile = ProvinceNameMgr.replaceAllName(sFile, cityId, task.getTemplet().getInclude().getProviceMap(), task.getTemplet().getInclude()
					.getCityMap());
		} else if (bProvice)// 替换省相关占位符
		{
			sFile = ProvinceNameMgr.replaceProvince(sFile, task.getTemplet().getInclude().getProviceMap());
		}
		sFile = processParaMap(sFile, "${", "}", null);
		return sFile;
	}

	/**
	 * 个性化协调单处理
	 * 
	 * @throws Exception
	 */
	public boolean orderProcess(MappingInfo info, Map<String, FileInfo> fileInfoMap, ResultSetHelper resultService, ResultSet rs, Statement ps,
			boolean isReplaceCitys, String cityId, Map<String, Map<String, Integer>> indexs, Map<String, List<String[]>> datas) throws Exception {

		String destFilePath = getDestFilePath(info.fileName, cityId);

		if (destFilePath.contains("${index}")) {
			destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
		}

		boolean bFlag = info.fileName.toLowerCase().contains(".csv");

		boolean b = task.getTemplet().includeValidate();

		if (info.isRelated) {

			Map<String, FtpFileUnit> map = new HashMap<String, FtpFileUnit>();
			// List<String> ftpnameListResult =new ArrayList<String>();

			// Map<协调单号,文件名>
			Map<String, String> fname = new HashMap<String, String>();
			if (StringUtil.isNotNull(info.fileParaSql)) {
				info.fileParaSql = ConstDef.ParseFilePathForDB(info.fileParaSql, new Timestamp(task.getCurrDataTime().getTime()));
				rs = ps.executeQuery(info.fileParaSql);

				String[] headLine = resultService.getColumnNames(rs);
				String[] values = null;
				while (rs.next()) {
					values = resultService.getColumnValues(rs, bFlag);
					if (values == null)
						continue;
					
					String key = values[0];

					int i = 0;
					List<String> ftpnameList = new ArrayList<String>(info.ftpnameList);
					String tmpfile = new String(destFilePath);

					String cfile = new String(info.compressFile);

					for (String fieldname : headLine) {
						tmpfile = tmpfile.replace("${" + fieldname.toLowerCase() + "}", values[i]);

						cfile = cfile.replace("${" + fieldname.toLowerCase() + "}", values[i]);
						cfile = replaceProcess(cfile, cityId, b, isReplaceCitys);

						for (int ii = 0; ii < ftpnameList.size(); ii++) {
							String sFile = ftpnameList.get(ii);
							sFile = sFile.replace("${" + fieldname.toLowerCase() + "}", values[i]);
							sFile = replaceProcess(sFile, cityId, b, isReplaceCitys);
							ftpnameList.set(ii, sFile);
						}

						i++;
					}
					// ftpnameListResult.addAll(ftpnameList);

					FtpFileUnit unit = new FtpFileUnit();
					unit.setKey(key);
					unit.setName(cfile);
					unit.setFilenameList(ftpnameList);
					map.put(key, unit);
					fname.put(key, tmpfile);

				}
			}
			// ftp ds
			DS dstmp = dsMap.get(info.ftpdsid);

			dstmp.setFtpFileUnitMap(map);

			info.compressFile = ConstDef.ParseFilePathForDB(info.compressFile, new Timestamp(task.getCurrDataTime().getTime()));

			info.ftpnameList.clear();

			// Map<协调单号,一行数据
			Map<String, String[]> mainmap = new HashMap<String, String[]>();
			// 协调单号,List<String[]>
			Map<String, List<String[]>> submap = new HashMap<String, List<String[]>>();

			String ext = Util.getPackageExt(info.fileName);

			// 主协调单表示
			boolean mainSqlFlag = false;
			// 头数据
			String headLines[] = null;
			// 子协调单数据
			String subheadLines[] = null;
			for (int i = 0; i < info.sqls.size(); i++) {
				if (i == 0)
					mainSqlFlag = true;
				else
					mainSqlFlag = false;
				SqlEntry sqlEntry = info.sqls.get(i);;
				String sql = sqlEntry.sql;

				if (StringUtil.isNull(sql))
					continue;
				if (isReplaceCitys)// 替换城市相关占位符
				{
					sql = ProvinceNameMgr.replaceAllName(sql, cityId, task.getTemplet().getInclude().getProviceMap(), task.getTemplet().getInclude()
							.getCityMap());
				} else if (b)// 替换省相关占位符
				{
					sql = ProvinceNameMgr.replaceProvince(sql, task.getTemplet().getInclude().getProviceMap());
				}
				sql = processParaMap(sql, "${", "}", null);

				// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
				sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));

				LOG.debug(task + " , sql=" + sql);
				try {
					rs = ps.executeQuery(sql);

					String head[] = resultService.getColumnNames(rs);
					if (mainSqlFlag) {
						headLines = head;
					} else
						subheadLines = head;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs, bFlag);
						if (values == null)
							continue;
						if (mainSqlFlag) {
							// 数据
							mainmap.put(values[1].trim(), values);
						} else {
							String k = values[0].trim().split("-")[0];
							if (fname.containsKey(k) && submap.containsKey(k)) {
								submap.get(k).add(values);
							} else {
								List<String[]> list = new ArrayList<String[]>();
								list.add(values);
								submap.put(k, list);
							}
						}
					}
				} catch (Exception e) {
					LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
					break;
				}
			}
			Iterator<Entry<String, String[]>> mainSet = mainmap.entrySet().iterator();
			while (mainSet.hasNext()) {
				Entry<String, String[]> entry = mainSet.next();
				String code = entry.getKey();
				String[] value = entry.getValue();
				List<String[]> subList = new ArrayList<String[]>();
				subList.add(subheadLines);

				// jiangl 2014-11-25 加入 submap.get(code)!=null 的条件判断 ,否则
				// subList.addAll( null) 会报错。
				if (submap.get(code) != null) {
					subList.addAll(submap.get(code));
				}

				String filename = fname.get(code);

				List<String[]> mainList = new ArrayList<String[]>();
				mainList.add(headLines);
				mainList.add(value);
				datas.put("d" + 1, mainList);
				datas.put("d" + 2, subList);
				long lineNum = this.process(datas, indexs, info.templetFileName, filename, false, info);
				datas.clear();
				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug("file templet mapping :  file:" + destFilePath + "   templet :" + info.templetFileName + " key :" + fkey);

				// fNames.put(filename, filename);

				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileName(filename);
				fileInfo.setCount((int) (0 == lineNum ? mainList.size() + subList.size() : lineNum));

				fileInfoMap.put(filename, fileInfo);
			}

			// 获取FTP上协调单数据文件，并添加到集合中

			if (mainmap.size() > 0) {
				Map<String, String> ftpFiles = this.ftpFileProcess(dstmp);
				// fNames.putAll(ftpFiles);

				if (ftpFiles != null) {
					Iterator<Entry<String, String>> it = ftpFiles.entrySet().iterator();
					while (it.hasNext()) {
						Entry<String, String> entity = it.next();
						String key = entity.getKey();
						FileInfo fileInfo = new FileInfo();
						fileInfo.setFileName(entity.getValue());
						fileInfo.setCount(999999);

						fileInfoMap.put(key, fileInfo);
					}
				}
			}
		}
		return info.isRelated;
	}

	public Map<String, String[]> queryFakeData(String fakeSql) {

		Map<String, String[]> fakeMap = new HashMap<String, String[]>();

		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
			DataBaseDS ds = (DataBaseDS) this.getDs();
			conn = getConnection(ds);
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

	/**
	 * 解析处理
	 * 
	 * @param result
	 * @param resultService
	 * @param rs
	 * @param ps
	 * @param isReplaceCitys
	 * @param cityId
	 * @throws Exception
	 */
	protected void resolveProcess(ResolverResult result, ResultSetHelper resultService, ResultSet rs, Statement ps, boolean isReplaceCitys,
			String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			try {
				Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
				Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
				String destFilePath = getDestFilePath(info.fileName, cityId);
				if (destFilePath.contains("${index}")) {
					destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
				}
				String oldFilePath = destFilePath;
				//
				destFilePath = getFileName(destFilePath);

				boolean bFlag = info.fileName.toLowerCase().contains(".csv");

				boolean b = task.getTemplet().includeValidate();

				// 是否是协调单，如果是协调单，则特殊处理。
				boolean isOrder = orderProcess(info, fileInfoMap, resultService, rs, ps, isReplaceCitys, cityId, indexs, datas);
				if (isOrder)
					continue;

				processStrategy(info);

				String ext = Util.getPackageExt(info.fileName);

				int recordCount = 0;
				boolean errFlag = false;

				Map<String, String[]> fakeMap = new HashMap<String, String[]>();

				int dataType = 0;

				long lineNum = 0;
				for (int i = 0; i < info.sqls.size(); i++) {

					SqlEntry sqlEntry = info.sqls.get(i);
					String sql = sqlEntry.sql;

					if (StringUtil.isNull(sql))
						continue;
					if (isReplaceCitys)// 替换城市相关占位符
					{
						sql = ProvinceNameMgr.replaceAllName(sql, cityId, task.getTemplet().getInclude().getProviceMap(), task.getTemplet()
								.getInclude().getCityMap());
					} else if (b)// 替换省相关占位符
					{
						sql = ProvinceNameMgr.replaceProvince(sql, task.getTemplet().getInclude().getProviceMap());
					}
					sql = processParaMap(sql, "${", "}", null);
					// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
					sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));

					if (task instanceof BSATask) {
						if (sql.contains("${planno}")) {
							BSATask tasktmp = (BSATask) task;
							sql = sql.replace("${planno}", tasktmp.getPlanno());
						}
					}

					LOG.debug(task + " , sql=" + sql);
					String sqlSelect = new String(sql);

//					List<String> fakeList = new ArrayList<String>();

					if (i == 1) {//i==1 代表 上报查询语句，  CFG_BSA_SYNC_UPLOAD_SQL表中sql_type=1的记录, 由于sync_sql可能有多个语句用";"分割， 代表基站数据和伪基站数据.
						String[] selectSql = sql.split(";");
						List<String> sqlList = new ArrayList<String>();
						for (String sSql : selectSql) {
							if (StringUtil.isNull(sSql))
								continue;
							sqlList.add(sSql);
						}
						sqlSelect = sqlList.get(0);
						if (sqlList.size() > 1) {
							// 伪基站数据查询
							fakeMap = queryFakeData(sqlList.get(1));
						}
					}

					try {

						rs = ps.executeQuery(sqlSelect);
					} catch (Exception e) {
						errFlag = true;
						LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
						break;
					}
					String[] headLine = resultService.getColumnNames(rs);
					/* index */
					Map<String, Integer> index = new HashMap<String, Integer>();
					for (int j = 0; j < headLine.length; j++)
						index.put(headLine[j], j);
					int sqlNum = i + 1;
					indexs.put("d" + sqlNum, index);
					/* data */
					List<String[]> data = new ArrayList<String[]>();
					datas.put("d" + sqlNum, data);
					if (info.batchNum <= 0 || info.addHead && sqlNum == 1)
						data.add(headLine);
					// 在初次产生文件时候，如果这个文件存在，则删除
					File oldFile = new File(destFilePath);
					if (oldFile.exists())
						oldFile.delete();
					//
					String fileName = new File(oldFilePath).getName();

					String neLevel = null;
					String neSysIDTagName = null;

					// 模板中的功能模块是否开启了核查功能
					boolean singleCheckFlag = false;
					// 判断是否开启了模块核查功能
					boolean ischeckGlobal = CheckMappingMgr.getInstance().isCheck();
					if (ischeckGlobal) {
						CheckMapping checkMapping = checkMgr.findByFileName(fileName);

						// add by yanb 2013.8.21 修改核查checkMapping为空的校验
						if (null != checkMapping) {
							dataType = Integer.valueOf(checkMapping.getDataType());
							neLevel = checkMapping.getLevel();
							neSysIDTagName = checkMapping.getNe_sys_id();

							singleCheckFlag = checkMapping.isUsed();
						}
					}
					boolean ischeck = ischeckGlobal && singleCheckFlag;

					
					 BSARuleLogDao bsaLog = new BSARuleLogDao();
					 
					int count = 0;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs, bFlag);
						if (values == null)
							continue;
						// 调用数据验证接口,如果开启了模块校验功能。则开启
						if (ischeck)
							// bsa的时候 filename需要修改
							validateFuction.process(headLine, values, task.getCurrDataTime(), fileName, dataType, neLevel, neSysIDTagName);

						count++;
						// bsa 诺西扩展基站ID特殊处理
						if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
							//查询上报语句
							if (i == 1  && values.length>=25) {
								String key = values[1] + "_" + values[2] + "_" + values[3];
								if (fakeMap.containsKey(key)) {
									// 重复数据校验， 如果伪基站中包含对应的基站数据，则以ne_bsa_carr表的数据为准， 同时记录重复数据到
									String[] fakeString = fakeMap.remove(key);

									BsaDTO dto = bsaLog.conver(fakeString, "18", "18", "4");
									bsaLog.insertNBILog(dto);
									

								}
							}

							StringBuilder sbColumn = new StringBuilder();
							StringBuilder sbErrorType = new StringBuilder();

							boolean resultFlag = checkUtil.bsaHandleBefore(values, sbColumn, sbErrorType, "4");
							if (!resultFlag && i == 1) {
								count--;
								continue;
							}

						}
						data.add(values);
						if (info.batchNum >= 1 && data.size() >= info.batchNum) {
							lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, true, info);
							data.clear();
						}
					}
					// 针对伪基站数据进行输出
					if (fakeMap.size() > 0) {
						Iterator<Entry<String, String[]>> it = fakeMap.entrySet().iterator();
						while (it.hasNext()) {
							Entry<String, String[]> entry = it.next();
							data.add(entry.getValue());
							if (info.batchNum >= 1 && data.size() >= info.batchNum) {
								lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, true, info);
								data.clear();
							}
						}

					}

					if (i == 1) {
						recordCount += count;
					}
				}
				if (errFlag) {

					continue;
				}

				lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, info.batchNum >= 1, info);
				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug(task + "file templet mapping :  file:" + destFilePath + "   templet :" + info.templetFileName + " key :" + fkey);

				File filetmp = new File(destFilePath);
				if (filetmp.exists() && filetmp.length() > 0) {
					// fNames.put(fkey, destFilePath);
					// 进行五项推导
					int bsaNum = 0;
					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						try {
							bsaNum = executeBsaSnapcell(destFilePath, oldFilePath);
						} catch (Exception e) {
							LOG.error(task + " ,ne_bsa_carr更新失败,原因： ", e);

						}
					}
					destFilePath = oldFilePath;

					// add on 20131203 , 如果是文件扩展名则打包
					String packageNameTmp = packageProcess(destFilePath, info, cityId, isReplaceCitys, b);

					// end add

					FileInfo fileInfo = new FileInfo();
					// fileInfo.setFileName(destFilePath);
					fileInfo.setFileName(packageNameTmp);

					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						fkey = packageNameTmp;
						fileInfo.setCount(bsaNum);
					} else {
						fileInfo.setCount((int) (lineNum == 0 ? recordCount : lineNum));
					}

					fileInfo.setDataType(dataType);

					result.getUploadFileInfoMap().put(fkey, fileInfo);

				}
			} catch (Exception e) {
				LOG.error(task + "级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName, e);
			}
		}

		result.getUploadFileInfoMap().putAll(fileInfoMap);
	}

	/**
	 * 临时文件名，用于五项推到输出的文件名
	 * 
	 * @param fileName
	 * @return
	 */
	protected String getFileName(String fileName) {
		if (fileName.endsWith(".csv") && SysCfg.getInstance().getModelId() == ConstDef.BSA) {
			return fileName.substring(0, fileName.length() - 4) + "_bsa.csv";
		}
		return fileName;
	}

	/**
	 * @param destFilePath
	 *            临时文件，用于五项推导的输入文件。
	 * @param oldFilePath
	 *            需要上报的数据文件
	 * @return 是否成功
	 * @throws Exception
	 */
	private int executeBsaSnapcell(String destFilePath, String oldFilePath) throws Exception {
		BufferedReader br_src = null;
		BufferedReader br = null;
		BufferedWriter bw = null;
		String outFile = null;

		if (destFilePath.contains("_bsa.csv")) {
			BSADeduce bsaDeduce = new BSADeduce();
			try {
				outFile = new String(oldFilePath + "_out.csv");
				// 进行五项推导
				String command = "\"" + SysCfg.getInstance().getBsasnapcell() + "\"" + " /A=\"" + destFilePath + "\" /O=\"" + outFile + "\" /B=\""
						+ SysCfg.getInstance().getTedb_global() + "\" /CP /CH /CR=30 /TH /TR=4 /TA=30";
				Log.debug(task + " , bsa上报，五项推导命令：" + command);

				bsaDeduce.deduce(command);

				br = new BufferedReader(new FileReader(outFile));
				// 忽略两行，开头两行为五项推到产生的2行数据。 结尾一行也要忽略，用模板ftl中的第一行，第二行，结尾一行。
				String firstLine = br.readLine();
				br.readLine();

				if (null == firstLine) {
					return 0;
				}

				// 此记录是推到之后的记录数m，和输入文件中的记录数可能不同n. m<=n
				// int rowCount = Integer.valueOf(fileds[tmpLen - 1].trim());

				// 需要按照规范格式进行输出。例如表头，结尾，必须按照集团数据文件规范。
				// 五项推到产生的数据文件，和集团规范存在差异，必须注意。
				// 写出输出文件。操作第1,2行，最后一行 与 新文件的数据部分(推导之后的数据)组成一个新的数据文件,
				// 此文件就是推导之后，需要上报的数据文件。
				br_src = new BufferedReader(new FileReader(destFilePath));
				String line_first = br_src.readLine();
				String[] values = line_first.split(",");

				int dataAfterCount = 0;

				br = new BufferedReader(new FileReader(outFile));
				// 忽略两行，开头两行为五项推到产生的2行数据。 结尾一行也要忽略，用模板ftl中的第一行，第二行，结尾一行。
				br.readLine();
				br.readLine();

				// 第二行
				String line_second = br_src.readLine();

				if (null == line_second) {
					return 0;
				}

				String lineTmp = null;
				String lastLineData = null;

				int reportLineCount = 0;

				while ((lineTmp = br_src.readLine()) != null) {
					if (lineTmp.contains("BSAEND,")) {
						lastLineData = lineTmp;
						break;
					}

				}

				// br 读2遍， 第一遍看符合上报要求的数据行数
				while ((lineTmp = br.readLine()) != null) {

					if (lineTmp.startsWith("BSTR"))
						continue;

					dataAfterCount++;

					String[] tmpFieldValues = lineTmp.split(",");

					if (tmpFieldValues.length < 25) {
						continue;
					}

					StringBuilder sbColumn = new StringBuilder();
					StringBuilder sbErrorType = new StringBuilder();

					if (checkUtil.bsaHandleAfterCheck(tmpFieldValues, sbColumn, sbErrorType)) {
						reportLineCount++;
					}

				}
				br.close();
				// end

				br = new BufferedReader(new FileReader(outFile));
				br.readLine();
				br.readLine();

				if (values.length > 3)
					values[3] = "" + reportLineCount;
				StringBuilder sb = new StringBuilder();
				for (String tmp : values) {
					if (tmp != null && !tmp.equalsIgnoreCase(""))
						sb.append(tmp).append(",");
				}
				if (sb.length() > 0)
					sb.deleteCharAt(sb.length() - 1);

				bw = new BufferedWriter(new FileWriter(oldFilePath));
				String line = null;
				bw.write(sb.toString());
				bw.newLine();

				bw.write(line_second);
				bw.newLine();

				if (dataAfterCount > 0) {
					while ((line = br.readLine()) != null) {
						if ("".equals(line.trim()))
							continue;

						if (line.startsWith("BSTR"))
							continue;

						String[] tmpFieldValues = line.split(",");

						StringBuilder sbColumn = new StringBuilder();
						StringBuilder sbErrorType = new StringBuilder();
						if (tmpFieldValues.length >= 25) {

							boolean bFlag = checkUtil.bsaHandleAfter(tmpFieldValues, sbColumn, sbErrorType, "5");
							if (!bFlag) {
								continue;
							}
						}

						if (tmpFieldValues.length > 9) {
							tmpFieldValues[3] = extendIDtoHex(tmpFieldValues[3]);
							double scl = Double.valueOf(tmpFieldValues[9]);
							if (scl > 1000)
								continue;
						}
						StringBuilder sb1 = new StringBuilder();
						int len = tmpFieldValues.length;
						for (int i = 0; i < len; i++) {
							if (i != len - 1) {
								sb1.append(tmpFieldValues[i]).append(",");
							} else {
								sb1.append(tmpFieldValues[i]);
							}
						}
						bw.write(sb1.toString());
						bw.newLine();
					}
				}
				// 最后一行数据
				if (null != lastLineData) {
					bw.write(lastLineData);
				}
				bw.flush();
				return bsaDeduce.updateBaseData(oldFilePath);
			} finally {
				IOUtils.closeQuietly(br_src);
				IOUtils.closeQuietly(br);
				IOUtils.closeQuietly(bw);

				if (outFile != null) {
					File file = new File(oldFilePath);
					if (file.exists() && file.length() > 0) {
						// delFile(outFile);
						// delFile(destFilePath);
					}
				}
				// 五项推导产生的临时文件，需要删除.
				bsaDeduce.deleteTmpFile();
			}

		}
		return 0;
	}

	private String extendIDtoHex(String values) {
		// bsa 诺西扩展基站ID特殊处理
		if (BSAConfigProperties.getInstance().isExtendBIDToHex()) {
			String exID = values;
			if (null != exID && !exID.equalsIgnoreCase("")) {
				String temp = Long.toHexString(Long.valueOf(exID));
				switch (temp.length()) {
					case 0 :
						return "0x00000000";
					case 1 :
						return "0x0000000" + temp;
					case 2 :
						return "0x000000" + temp;
					case 3 :
						return "0x00000" + temp;
					case 4 :
						return "0x0000" + temp;
					case 5 :
						return "0x000" + temp;
					case 6 :
						return "0x00" + temp;
					case 7 :
						return "0x0" + temp;
					case 8 :
						return "0x" + temp;
					default :
						return values;
				}
			}
		}
		return values;
	}

	public void delFile(String fileName) {
		File file = new File(fileName);
		if (file.exists())
			file.delete();
	}

	public static void main(String[] args) {
		String tmp = "4444.88";
		System.out.println(Float.parseFloat(tmp));
		System.out.println(Double.valueOf("4444.88"));
		List<String> ss = new ArrayList<String>();
		ss.add("yupo");

		for (int i = 0; i < ss.size(); i++) {
			String s = ss.get(i);
			s = "b";
			ss.set(i, s);
		}

		for (String s : ss) {
			System.out.println(s);
		}

		String ssss = "${index}";
		ssss = ssss.replace("${index}", "1");
		System.out.println(ssss);

		String tmp2 = "4444.00";

		Float ii = Float.parseFloat(tmp2);
		System.out.println(ii);
		System.out.println(ii == 4444);

	}
}