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
import java.util.Date;
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
import cn.uway.nbi.db.dao.BSADeduce;
import cn.uway.nbi.db.dao.BSARuleLogDao;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.BsaDTO;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.ds.DataBaseDS;
import cn.uway.nbi.util.BSAConfigProperties;
import cn.uway.nbi.util.BadWriter;
import cn.uway.nbi.util.BadWriterVendor;
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
@IDMember(id = 100)
public class DBResolver extends Resolver {

	protected List<MappingInfo> mappingInfos;

	protected ValidateFuction validateFuction = new ValidateFuction();

	protected CheckMappingMgr checkMgr = CheckMappingMgr.getInstance();

	private static final Logger LOG = LoggerFactory.getLogger(DBResolver.class);

	private static final Logger BADWRITER = BadWriter.getInstance()
			.getBadWriter();

	private static final Logger BADWRITER_VENDOR = BadWriterVendor
			.getInstance().getBadWriter();

	private BSARuleLogDao bsaLog = new BSARuleLogDao();

	public DBResolver() {
		mappingInfos = new ArrayList<MappingInfo>();
	}

	public DBResolver(Task task, int actionId) {
		this();
		this.task = task;
		mappingInfos = new ArrayList<MappingInfo>();
	}

	@Override
	@SuppressWarnings("unchecked")
	public void parseResolveNode() {
		controllog = element.attributeValue("controllog");
		if (controllog != null)
			controllog = ConstDef.ParseFilePath(controllog, new Timestamp(task
					.getCurrDataTime().getTime()));

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
				if (null != task.getNet_type()
						&& !"".equals(task.getNet_type())
						&& null != task.getVersion()
						&& !"".equals(task.getVersion())) {

					info.templetFileName = task.getNet_type() + File.separator
							+ task.getVersion() + File.separator + templet;

				}
				String isRelated = ee.attributeValue("isrelated");
				if (StringUtil.isNotNull(isRelated))
					info.isRelated = isRelated.equals("1");

				String isPrefixCondition = ee
						.attributeValue("is_prefix_condition");
				if (StringUtil.isNotNull(isPrefixCondition)) {

					if (isRelated.equals("1")
							|| isRelated.equalsIgnoreCase("true"))
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
						String isFieldMatch = heads
								.attributeValue("isfieldmatch");
						if (StringUtil.isNotNull(isFieldMatch)
								&& ("1".equalsIgnoreCase(isFieldMatch) || "true"
										.equalsIgnoreCase(isFieldMatch))) {
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
					String sql = sqlE.getText().trim();

					String prefix_condition = sqlE
							.attributeValue("is_prefix_condition");

					if (StringUtil.isNotNull(prefix_condition)) {
						if ("1".equalsIgnoreCase(prefix_condition)
								|| "true".equalsIgnoreCase(prefix_condition))
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

				
				Element webservice =  ee.element("webservice");
				String webUrl="";
				
				if(webservice!=null)
					webUrl =webservice.getTextTrim();
				info.wsURL=webUrl;
				
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
				info.replaceSymbolInfo.put(element.attributeValue("old"),
						element.attributeValue("new"));
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
		excelFile
				.setVersion(null == version ? 2003 : Integer.parseInt(version));
		excelFile.setSheetName(ee.attributeValue("sheet"));
		excelFile.setTableHeader(getTableHeader(ee.element("tableheader")));
		List<Element> excelStyle = ee.elements("formart");
		for (Element element : excelStyle) {
			ExcelFileStyle excelFileStyle = new ExcelFileStyle();
			excelFileStyle.setFiledName(element.attributeValue("filed"));
			excelFileStyle.setFiledType(element.attributeValue("type"));
			excelFileStyle.setIndex(Integer.parseInt(element
					.attributeValue("index")));
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
		LOG.info(getLogInfo()+" 开始进行数据库数据收集!");
		task.getLog().setInterConnStatus(400);
		long start = System.currentTimeMillis();
		ResolverResult result = new ResolverResult();
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();
		Map<String,String> localMap = new HashMap<String,String>();
		result.setLocalFileInfoMap(localMap);
		result.setUploadFileInfoMap(fileInfoMap);

		// 初始化数据验证功能模块
		if(SysCfg.getInstance().isEnableDataCheck())
		{
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
				Set<String> citySet = task.getTemplet().getInclude()
						.getCityMap().keySet();
				for (String cityId : citySet)
					this.resolveProcess(result, resultService, rs, ps, true,
							cityId);
			}
		} catch (Exception e) {
			if(StringUtil.isNull(task.getLog().getErrorReason()))
			{
				task.getLog().setInterConnStatus(401);
				task.getLog().setErrorReason("数据库数据收集异常!");
			}
			LOG.error(getLogInfo()+" 数据库数据收集异常{}!", e);
			throw e;
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		long end = System.currentTimeMillis();
		LOG.info(getLogInfo()+" 数据收集完毕, 耗时({})s", (end - start) / 1000);
		return result;
	}
	
	public void resolvePartionProcess(ResolverResult result,
			ResultSetHelper resultService, ResultSet rs, Statement ps,
			boolean isReplaceCitys, String cityId,MappingInfo info) throws Exception
	{
		try {
			Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
			Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
			String destFilePath = getDestFilePath(info.fileName, cityId);

			boolean bFlag = info.addHead;

			boolean b = task.getTemplet().includeValidate();

			processStrategy(info);

			String ext = Util.getPackageExt(info.fileName);
			boolean errFlag = false;

			int dataType = 0;

			// 文件名称
			Map<String,Integer> partionFilesMap = new HashMap<String,Integer>();
			for (int i = 0; i < info.sqls.size(); i++) {

				SqlEntry sqlEntry = info.sqls.get(i);
				String sql = sqlEntry.sql;

				if (StringUtil.isNull(sql))
					continue;
				if (isReplaceCitys)// 替换城市相关占位符
				{
					sql = ProvinceNameMgr.replaceAllName(sql, cityId, task
							.getTemplet().getInclude().getProviceMap(),
							task.getTemplet().getInclude().getCityMap());
				} else if (b)// 替换省相关占位符
				{
					sql = ProvinceNameMgr.replaceProvince(sql, task
							.getTemplet().getInclude().getProviceMap());
				}
				sql = processParaMap(sql, "${", "}", null);
				// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
				sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task
						.getCurrDataTime().getTime()));

				if (task instanceof BSATask) {
					if (sql.contains("${planno}")) {
						BSATask tasktmp = (BSATask) task;
						sql = sql.replace("${planno}", tasktmp.getPlanno());
					}
				}

				LOG.debug(getLogInfo()+" , sql=" + sql);
				try {

					rs = ps.executeQuery(sql);
				} catch (Exception e) {
					errFlag = true;
					LOG.error(getLogInfo()+" ," + info.fileName + " , templet: "
							+ info.templetFileName
							+ ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
					task.getLog().setInterConnStatus(400);
					task.getLog().setErrorReason("执行查询SQL失败，请检查SQL是否正确!");
					throw e;
					//break;
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

				int count = 0;
				
				// 文件序号
				int partion = 0;
				while (rs.next()) {
					String[] values = resultService.getCovertColumnValues(rs,
							bFlag,task.getTemplet().getInclude().getCityMap());
					if (values == null)
						continue;

					count++;
					data.add(values);
					if (info.batchNum >= 1 && data.size() >= info.batchNum) {
						datas.put("d" + sqlNum, data);
						this.process(datas, indexs,
										info.templetFileName, ConstDef.replacePartion(destFilePath, (++partion)+""),
										true, info);
						partionFilesMap.put(ConstDef.replacePartion(destFilePath, partion+""), count);
						count = 0;
						data.clear();
						if (info.batchNum <= 0 || info.addHead && sqlNum == 1)
							data.add(headLine);
					}
				}
				if(data.size() > 0)
				{
					datas.put("d" + sqlNum, data);
					this.process(datas, indexs,
									info.templetFileName, ConstDef.replacePartion(destFilePath, (++partion)+""),
									true, info);
					partionFilesMap.put(ConstDef.replacePartion(destFilePath, partion+""), count);
				}
			}
			if(partionFilesMap.size() == 0)
			{
				task.getLog().setInterConnStatus(400);
				task.getLog().setErrorReason("在数据库中没有查询到数据，请检查数据是否生成!");
				throw new Exception("在数据库中没有查询到数据，请检查数据是否生成!");
			}
			Iterator<String> it = partionFilesMap.keySet().iterator();
			while(it.hasNext())
			{
				String fileName = it.next();
				String fkey = fileName + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug(getLogInfo()+" file templet mapping :  file:" + fileName
						+ "   templet :" + info.templetFileName + " key :"
						+ fkey);

				File filetmp = new File(fileName);
				if (filetmp.exists() && filetmp.length() > 0) {
					
					// add on 20131203 , 如果是文件扩展名则打包
					String packageNameTmp = packageProcess(fileName, info,
							cityId, isReplaceCitys, b);
					
					// 当文件需要打包时，删除打包前生成的临时文件
					result.getLocalFileInfoMap().put(fileName, fileName);
					
					if("mapping".equalsIgnoreCase(task.getLastPack()))
					{
						CheckListLog log = new CheckListLog();
						log.setFileCreateTime(new Date());
						log.setFileName(new File(packageNameTmp).getName());
						task.getLogs().add(log);
					}

					// end add

					FileInfo fileInfo = new FileInfo();
					fileInfo.setFileName(packageNameTmp);

					fileInfo.setCount(partionFilesMap.get(fileName));

					fileInfo.setDataType(dataType);

					result.getUploadFileInfoMap().put(fkey, fileInfo);

				}
			}
		} catch (Exception e) {
			LOG.error(
					getLogInfo()+" 级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName,
					e);
			task.getLog().setInterConnStatus(401);
		    throw e;
		}	
	}

	/** 获取数据库连接 */
	public Connection getConnection(DataBaseDS ds) throws Exception {
		return DBUtil.getConnection(ds.getDriver(), ds.getUrl(),
				ds.getUsername(), ds.getPassword());
	}

	public String replaceProcess(String sFile, String cityId, boolean bProvice,
			boolean isReplaceCitys) {
		if (isReplaceCitys)// 替换城市相关占位符
		{
			sFile = ProvinceNameMgr.replaceAllName(sFile, cityId, task
					.getTemplet().getInclude().getProviceMap(), task
					.getTemplet().getInclude().getCityMap());
		} else if (bProvice)// 替换省相关占位符
		{
			sFile = ProvinceNameMgr.replaceProvince(sFile, task.getTemplet()
					.getInclude().getProviceMap());
		}
		sFile = processParaMap(sFile, "${", "}", null);
		return sFile;
	}

	/**
	 * 个性化协调单处理
	 * 
	 * @throws Exception
	 */
	public boolean orderProcess(MappingInfo info,
			Map<String, FileInfo> fileInfoMap, ResultSetHelper resultService,
			ResultSet rs, Statement ps, boolean isReplaceCitys, String cityId,
			Map<String, Map<String, Integer>> indexs,
			Map<String, List<String[]>> datas) throws Exception {

		String destFilePath = getDestFilePath(info.fileName, cityId);

		if (destFilePath.contains("${index}")) {
			destFilePath = destFilePath.replace("${index}", BSAIndexMgr
					.getInstance().getIndex());
		}

		boolean bFlag = info.fileName.toLowerCase().contains(".csv");

		boolean b = task.getTemplet().includeValidate();

		if (info.isRelated) {

			Map<String, FtpFileUnit> map = new HashMap<String, FtpFileUnit>();
			// List<String> ftpnameListResult =new ArrayList<String>();

			// Map<协调单号,文件名>
			Map<String, String> fname = new HashMap<String, String>();
			if (StringUtil.isNotNull(info.fileParaSql)) {
				info.fileParaSql = ConstDef.ParseFilePathForDB(
						info.fileParaSql, new Timestamp(task.getCurrDataTime()
								.getTime()));
				rs = ps.executeQuery(info.fileParaSql);

				String[] headLine = resultService.getColumnNames(rs);
				String[] values = null;
				while (rs.next()) {
					values = resultService.getColumnValues(rs, bFlag);
					if (values == null)
						continue;
					String key = values[0];

					int i = 0;
					List<String> ftpnameList = new ArrayList<String>(
							info.ftpnameList);
					String tmpfile = new String(destFilePath);

					String cfile = new String(info.compressFile);

					for (String fieldname : headLine) {
						tmpfile = tmpfile
								.replace("${" + fieldname.toLowerCase() + "}",
										values[i]);

						cfile = cfile.replace("${" + fieldname.toLowerCase()
								+ "}", values[i]);
						cfile = replaceProcess(cfile, cityId, b, isReplaceCitys);

						for (int ii = 0; ii < ftpnameList.size(); ii++) {
							String sFile = ftpnameList.get(ii);
							sFile = sFile.replace(
									"${" + fieldname.toLowerCase() + "}",
									values[i]);
							sFile = replaceProcess(sFile, cityId, b,
									isReplaceCitys);
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

			info.compressFile = ConstDef.ParseFilePathForDB(info.compressFile,
					new Timestamp(task.getCurrDataTime().getTime()));

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
				SqlEntry sqlEntry = info.sqls.get(i);
				;
				String sql = sqlEntry.sql;

				if (StringUtil.isNull(sql))
					continue;
				if (isReplaceCitys)// 替换城市相关占位符
				{
					sql = ProvinceNameMgr.replaceAllName(sql, cityId, task
							.getTemplet().getInclude().getProviceMap(), task
							.getTemplet().getInclude().getCityMap());
				} else if (b)// 替换省相关占位符
				{
					sql = ProvinceNameMgr.replaceProvince(sql, task
							.getTemplet().getInclude().getProviceMap());
				}
				sql = processParaMap(sql, "${", "}", null);

				// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
				sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task
						.getCurrDataTime().getTime()));

				LOG.debug(getLogInfo() + " , sql=" + sql);
				try {
					rs = ps.executeQuery(sql);

					String head[] = resultService.getColumnNames(rs);
					if (mainSqlFlag) {
						headLines = head;
					} else
						subheadLines = head;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs,
								bFlag);
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
					LOG.error(getLogInfo()  + "," + info.fileName + " , templet: "
							+ info.templetFileName
							+ ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
					break;
				}
			}
			Iterator<Entry<String, String[]>> mainSet = mainmap.entrySet()
					.iterator();
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
				long lineNum = this.process(datas, indexs,
						info.templetFileName, filename, false, info);
				datas.clear();
				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug(getLogInfo()+" file templet mapping :  file:" + destFilePath
						+ "   templet :" + info.templetFileName + " key :"
						+ fkey);

				// fNames.put(filename, filename);

				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileName(filename);
				fileInfo.setCount((int) (0 == lineNum ? mainList.size()
						+ subList.size() : lineNum));

				fileInfoMap.put(filename, fileInfo);
			}

			// 获取FTP上协调单数据文件，并添加到集合中

			if (mainmap.size() > 0) {
				Map<String, String> ftpFiles = this.ftpFileProcess(dstmp);
				// fNames.putAll(ftpFiles);

				if (ftpFiles != null) {
					Iterator<Entry<String, String>> it = ftpFiles.entrySet()
							.iterator();
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
	protected void resolveProcess(ResolverResult result,
			ResultSetHelper resultService, ResultSet rs, Statement ps,
			boolean isReplaceCitys, String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			// 生成多个文件
			if(info.fileName.contains("%%PARTION"))
			{
				resolvePartionProcess(result,resultService,rs,ps,isReplaceCitys, cityId,info);
				continue;
			}
			try {
				Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
				Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
				String destFilePath = getDestFilePath(info.fileName, cityId);
				if (destFilePath.contains("${index}")) {
					destFilePath = destFilePath.replace("${index}", BSAIndexMgr
							.getInstance().getIndex());
				}
				String oldFilePath = destFilePath;
				//
				destFilePath = getFileName(destFilePath);

				boolean bFlag = info.fileName.toLowerCase().contains(".csv");

				boolean b = task.getTemplet().includeValidate();

				// 是否是协调单，如果是协调单，则特殊处理。
				boolean isOrder = orderProcess(info, fileInfoMap,
						resultService, rs, ps, isReplaceCitys, cityId, indexs,
						datas);
				if (isOrder)
					continue;

				processStrategy(info);

				String ext = Util.getPackageExt(info.fileName);

				int recordCount = 0;
				boolean errFlag = false;

				int dataType = 0;

				long lineNum = 0;
				for (int i = 0; i < info.sqls.size(); i++) {

					SqlEntry sqlEntry = info.sqls.get(i);
					String sql = sqlEntry.sql;

					if (StringUtil.isNull(sql))
						continue;
					if (isReplaceCitys)// 替换城市相关占位符
					{
						sql = ProvinceNameMgr.replaceAllName(sql, cityId, task
								.getTemplet().getInclude().getProviceMap(),
								task.getTemplet().getInclude().getCityMap());
					} else if (b)// 替换省相关占位符
					{
						sql = ProvinceNameMgr.replaceProvince(sql, task
								.getTemplet().getInclude().getProviceMap());
					}
					sql = processParaMap(sql, "${", "}", null);
					// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
					sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task
							.getCurrDataTime().getTime()));

					if (task instanceof BSATask) {
						if (sql.contains("${planno}")) {
							BSATask tasktmp = (BSATask) task;
							sql = sql.replace("${planno}", tasktmp.getPlanno());
						}
					}

					LOG.debug(getLogInfo()+" , sql=" + sql);
					try {

						rs = ps.executeQuery(sql);
					} catch (Exception e) {
						errFlag = true;
						LOG.error(getLogInfo()+" ," + info.fileName + " , templet: "
								+ info.templetFileName
								+ ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
						task.getLog().setInterConnStatus(400);
						task.getLog().setErrorReason("执行查询SQL失败，请检查SQL是否正确!");
						throw e;
						//break;
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
					boolean ischeckGlobal = CheckMappingMgr.getInstance()
							.isCheck();
					if (ischeckGlobal) {
						CheckMapping checkMapping = checkMgr
								.findByFileName(fileName);

						// add by yanb 2013.8.21 修改核查checkMapping为空的校验
						if (null != checkMapping) {
							dataType = Integer.valueOf(checkMapping
									.getDataType());
							neLevel = checkMapping.getLevel();
							neSysIDTagName = checkMapping.getNe_sys_id();

							singleCheckFlag = checkMapping.isUsed();
						}
					}
					boolean ischeck = ischeckGlobal && singleCheckFlag;

					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						String bsaBaderHead = "导频扇区名,SID,NID,扩展基站ID,发射PN码,天线纬度,天线经度,天线高度,天线位置精度,扇区中心纬度,扇区中心经度,扇区中心高度,天线方向,天线张角,天线最大覆盖范围,地形平均高度,地形高度标准偏差,直放站信息,PN增量,FWD链路校准,FWD链路校准精度,RTD校准,RTD校准精度,格式类型,MSC SWITCH NUMBER";
						BADWRITER.warn("\t" + bsaBaderHead);
					}
					int count = 0;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs,
								bFlag);
						if (values == null)
							continue;
						// 调用数据验证接口,如果开启了模块校验功能。则开启
						if (ischeck)
							// bsa的时候 filename需要修改
							validateFuction.process(headLine, values,
									task.getCurrDataTime(), fileName, dataType,
									neLevel, neSysIDTagName);

						count++;
						// bsa 诺西扩展基站ID特殊处理
						if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {

							boolean resultFlag = bsaHandleBefore(values);
							if (!resultFlag) {
								LOG.debug(task
										+ "-------bsaHandleBefore---------------");

								count--;
								continue;
							}
						}
						data.add(values);
						if (info.batchNum >= 1 && data.size() >= info.batchNum) {
							lineNum = lineNum
									+ this.process(datas, indexs,
											info.templetFileName, destFilePath,
											true, info);
							data.clear();
						}
					}
					recordCount += count;
				}
				if (errFlag) {

					continue;
				}

				lineNum = lineNum
						+ this.process(datas, indexs, info.templetFileName,
								destFilePath, info.batchNum >= 1, info);
				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug(getLogInfo()+" file templet mapping :  file:" + destFilePath
						+ "   templet :" + info.templetFileName + " key :"
						+ fkey);

				File filetmp = new File(destFilePath);
				if (filetmp.exists() && filetmp.length() > 0) {
					// fNames.put(fkey, destFilePath);
					// 进行五项推导
					int bsaNum = 0;
					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						try {
							bsaNum = executeBsaSnapcell(destFilePath,
									oldFilePath);
						} catch (Exception e) {
							LOG.error(getLogInfo()+" ,ne_bsa_carr更新失败,原因： ", e);

						}
					}
					destFilePath = oldFilePath;
					
					// add on 20131203 , 如果是文件扩展名则打包
					String packageNameTmp = packageProcess(destFilePath, info,
							cityId, isReplaceCitys, b);
					
					// 当文件需要打包时，删除打包前生成的临时文件
					result.getLocalFileInfoMap().put(destFilePath, destFilePath);

					// end add
					
					if("mapping".equalsIgnoreCase(task.getLastPack()))
					{
						CheckListLog log = new CheckListLog();
						log.setFileCreateTime(new Date());
						log.setFileName(packageNameTmp);
						task.getLogs().add(log);
					}

					FileInfo fileInfo = new FileInfo();
					// fileInfo.setFileName(destFilePath);
					fileInfo.setFileName(packageNameTmp);

					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						fkey = packageNameTmp;
						fileInfo.setCount(bsaNum);
					} else {
						fileInfo.setCount((int) (lineNum == 0 ? recordCount
								: lineNum));
					}

					fileInfo.setDataType(dataType);

					result.getUploadFileInfoMap().put(fkey, fileInfo);

				}
			} catch (Exception e) {
				LOG.error(
						getLogInfo()+" 级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName,
						e);
				task.getLog().setInterConnStatus(401);
				task.getLog().setErrorReason("生成数据文件失败，请根据日志检查具体原因!");
			    throw e;
			}
		}

		result.getUploadFileInfoMap().putAll(fileInfoMap);
	}

	private boolean bsaHandleBefore(String[] values) {
		if (values.length < 25) {
			values = null;
			return false;
		}

		values[23] = "1";
		values[24] = "-1";

		StringBuilder sbColumn = new StringBuilder();
		StringBuilder sbErrorType = new StringBuilder();
		String split = ",";

		boolean tuidaoFlag1 = false;
		boolean tuidaoFlag2 = false;
		boolean tuidaoFlag3 = false;

		boolean islogOutFlag1 = false;
		boolean islogOutFlag2 = false;
		boolean islogOutFlag3 = false;
		boolean islogOutFlag4 = false;

		for (int i = 0; i < values.length; i++) {
			String tmp = values[i];
			if (i == 0) {
				if (StringUtil.isNull(tmp.trim()) || "".equalsIgnoreCase(tmp)
						|| tmp.length() > 50) {
					sbColumn.append("A").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 1) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Integer.valueOf(tmp) >= 0 && Integer.valueOf(tmp) <= 32767)) {
					sbColumn.append("B").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 2) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Integer.valueOf(tmp) >= 0 && Integer.valueOf(tmp) <= 65535)) {
					sbColumn.append("C").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 3) {
				if (StringUtil.isNotNull(tmp.trim())
						&& Integer.valueOf(tmp) < 0) {
					sbColumn.append("D").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 4) {
				// 对值的范围进行检验
				if (StringUtil.isNull(values[4])
						|| (StringUtil.isNotNull(values[4]) && !(Integer
								.valueOf(values[4]) >= 0 && Integer
								.valueOf(values[4]) <= 511))) {
					sbColumn.append("E").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 5) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) <= 90)) {
					sbColumn.append("F").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 6) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) <= 180)) {
					sbColumn.append("G").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 7) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("H").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 8) {
				if (StringUtil.isNull(tmp)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("9").append(split);
					tuidaoFlag1 = true;
				} else if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) == 300
								|| Double.valueOf(tmp) == 600 || Double
								.valueOf(tmp) == 1500)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("4").append(split);
				}
			}
			if (i == 9) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -90 && Double.valueOf(tmp) <= 90)) {
					sbColumn.append("J").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 10) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -180 && Double.valueOf(tmp) <= 180)) {
					sbColumn.append("K").append(split);
					sbErrorType.append("5").append(split);
				}
			}
			// if (i == 11) {
			// if (null == tmp || "".equals(tmp.trim()) || !(Double.valueOf(tmp)
			// >= -160 && Double.valueOf(tmp) <= 9000)) {
			// sbColumn.append("L").append(split);
			// sbErrorType.append("1").append(split);
			// }
			// }

			if (i == 12) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) < 360)) {
					sbColumn.append("M").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 13) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 360)) {
					sbColumn.append("N").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 14) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 100000)) {
					sbColumn.append("O").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 15) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("P").append(split);
					sbErrorType.append("6").append(split);
				}
			}

			if (i == 16) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("Q").append(split);
					sbErrorType.append("6").append(split);
				}
			}

			if (i == 17) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) == 0 || Double.valueOf(tmp) == 1)) {
					sbColumn.append("R").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 18) {
				if (StringUtil.isNull(tmp.trim())) {
					if (!(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 8)) {
						sbColumn.append("S").append(split);
						sbErrorType.append("1").append(split);
					} else if (StringUtil.isNotNull(values[4])
							&& StringUtil.isNotNull(values[18])
							&& Float.valueOf(values[4])
									% Float.valueOf(values[18]) != 0) {
						sbColumn.append("S").append(split);
						sbErrorType.append("11").append(split);
					}
				}
			}
			if (i == 19) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -10000 && Double
								.valueOf(tmp) <= 10000)) {
					sbColumn.append("T").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			if (i == 20) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 65535)) {
					sbColumn.append("U").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			if (i == 21) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -10000 && Double
								.valueOf(tmp) <= 10000)) {
					sbColumn.append("V").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag2 = true;
				}
			}
			if (i == 22) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 65535)) {
					sbColumn.append("W").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag3 = true;

				}
			}
			if (i == 23) {
				if (StringUtil.isNull(tmp.trim())
						|| (StringUtil.isNotNull(tmp.trim()) && Double
								.valueOf(tmp) > 1)) {
					sbColumn.append("X").append(split);
					sbErrorType.append("15").append(split);
				}
			}
			if (i == 24) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -1 && Double.valueOf(tmp) <= 255)) {
					sbColumn.append("Y");
					sbErrorType.append("1");
				}
			}
		}
		if (sbErrorType.length() > 0) {
			BsaDTO dto = bsaLog.conver(values, sbColumn.toString(),
					sbErrorType.toString(), "4");
			bsaLog.insertNBILog(dto);
			if (tuidaoFlag1 || tuidaoFlag2 || tuidaoFlag3) {
				return true;
			} else {
				return false;
			}
		}
		return true;
	}

	private boolean bsaHandleAfter(String[] values, StringBuilder sbColumn,
			StringBuilder sbErrorType) {
		if (values.length < 25) {
			values = null;
			return false;
		}

		values[23] = "1";
		values[24] = "-1";
		String split = ",";

		boolean tuidaoFlag1 = false;
		boolean tuidaoFlag2 = false;
		boolean tuidaoFlag3 = false;

		boolean islogOutFlag1 = false;
		boolean islogOutFlag2 = false;
		boolean islogOutFlag3 = false;
		boolean islogOutFlag4 = false;

		for (int i = 0; i < values.length; i++) {
			String tmp = values[i];
			if (i == 0) {
				if (StringUtil.isNull(tmp.trim()) || "".equalsIgnoreCase(tmp)
						|| tmp.length() > 50) {
					sbColumn.append("A").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 1) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Integer.valueOf(tmp) >= 0 && Integer.valueOf(tmp) <= 32767)) {
					sbColumn.append("B").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 2) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Integer.valueOf(tmp) >= 0 && Integer.valueOf(tmp) <= 65535)) {
					sbColumn.append("C").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 3) {
				if (StringUtil.isNotNull(tmp.trim())
						&& Integer.valueOf(tmp) < 0) {
					sbColumn.append("D").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 4) {
				// 对值的范围进行检验
				if (StringUtil.isNull(values[4])
						|| (StringUtil.isNotNull(values[4]) && !(Integer
								.valueOf(values[4]) >= 0 && Integer
								.valueOf(values[4]) <= 511))) {
					sbColumn.append("E").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 5) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) <= 90)) {
					sbColumn.append("F").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 6) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) <= 180)) {
					sbColumn.append("G").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 7) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("H").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 8) {
				if (StringUtil.isNull(tmp)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("9").append(split);
					tuidaoFlag1 = true;
				} else if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) == 300
								|| Double.valueOf(tmp) == 600 || Double
								.valueOf(tmp) == 1500)) {
					sbColumn.append("I").append(split);
					sbErrorType.append("4").append(split);
				}
			}
			if (i == 9) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -90 && Double.valueOf(tmp) <= 90)) {
					sbColumn.append("J").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 10) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -180 && Double.valueOf(tmp) <= 180)) {
					sbColumn.append("K").append(split);
					sbErrorType.append("5").append(split);
				}
			}
			// if (i == 11) {
			// if (null == tmp || "".equals(tmp.trim()) || !(Double.valueOf(tmp)
			// >= -160 && Double.valueOf(tmp) <= 9000)) {
			// sbColumn.append("L").append(split);
			// sbErrorType.append("1").append(split);
			// }
			// }

			if (i == 12) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 0 && Double.valueOf(tmp) < 360)) {
					sbColumn.append("M").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 13) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 360)) {
					sbColumn.append("N").append(split);
					sbErrorType.append("1").append(split);
				}
			}
			if (i == 14) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 100000)) {
					sbColumn.append("O").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 15) {
				if (StringUtil.isNotNull(tmp)
						&& !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("P").append(split);
					sbErrorType.append("6").append(split);
				}
			}

			if (i == 16) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) >= -160 && Double.valueOf(tmp) <= 9000)) {
					sbColumn.append("Q").append(split);
					sbErrorType.append("6").append(split);
				}
			}

			if (i == 17) {
				if (StringUtil.isNull(tmp.trim())
						|| !(Double.valueOf(tmp) == 0 || Double.valueOf(tmp) == 1)) {
					sbColumn.append("R").append(split);
					sbErrorType.append("1").append(split);
				}
			}

			if (i == 18) {
				if (StringUtil.isNull(tmp.trim())) {
					if (!(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 8)) {
						sbColumn.append("S").append(split);
						sbErrorType.append("1").append(split);
					} else if (StringUtil.isNotNull(values[4])
							&& StringUtil.isNotNull(values[18])
							&& Float.valueOf(values[4])
									% Float.valueOf(values[18]) != 0) {
						sbColumn.append("S").append(split);
						sbErrorType.append("11").append(split);
					}
				}
			}
			if (i == 19) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -10000 && Double
								.valueOf(tmp) <= 10000)) {
					sbColumn.append("T").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			if (i == 20) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 65535)) {
					sbColumn.append("U").append(split);
					sbErrorType.append("13").append(split);
				}
			}
			if (i == 21) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -10000 && Double
								.valueOf(tmp) <= 10000)) {
					sbColumn.append("V").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag2 = true;
				}
			}
			if (i == 22) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= 1 && Double.valueOf(tmp) <= 65535)) {
					sbColumn.append("W").append(split);
					sbErrorType.append("15").append(split);
					tuidaoFlag3 = true;

				}
			}
			if (i == 23) {
				if (StringUtil.isNull(tmp.trim())
						|| (StringUtil.isNotNull(tmp.trim()) && Double
								.valueOf(tmp) > 1)) {
					sbColumn.append("X").append(split);
					sbErrorType.append("15").append(split);
				}
			}
			if (i == 24) {
				if (StringUtil.isNotNull(tmp.trim())
						&& !(Double.valueOf(tmp) >= -1 && Double.valueOf(tmp) <= 255)) {
					sbColumn.append("Y");
					sbErrorType.append("1");
				}
			}
		}
		if (sbErrorType.length() > 0) {
			sbColumn.deleteCharAt(sbColumn.length() - 1);
			sbErrorType.deleteCharAt(sbErrorType.length() - 1);

			BsaDTO dto = bsaLog.conver(values, sbColumn.toString(),
					sbErrorType.toString(), "4");
			bsaLog.insertNBILog(dto);
			return false;
		}

		return true;
	}

	/**
	 * 临时文件名，用于五项推到输出的文件名
	 * 
	 * @param fileName
	 * @return
	 */
	protected String getFileName(String fileName) {
		if (fileName.endsWith(".csv")
				&& SysCfg.getInstance().getModelId() == ConstDef.BSA) {
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
	private int executeBsaSnapcell(String destFilePath, String oldFilePath)
			throws Exception {
		BufferedReader br_src = null;
		BufferedReader br = null;
		BufferedWriter bw = null;
		String outFile = null;

		if (destFilePath.contains("_bsa.csv")) {
			BSADeduce bsaDeduce = new BSADeduce();
			try {
				outFile = new String(oldFilePath + "_out.csv");
				// 进行五项推导
				String command = "\"" + SysCfg.getInstance().getBsasnapcell()
						+ "\"" + " /A=\"" + destFilePath + "\" /O=\"" + outFile
						+ "\" /B=\"" + SysCfg.getInstance().getTedb_global()
						+ "\" /CP /CH /CR=30 /TH /TR=4 /TA=30";
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

				int dataCount = 0;
				if (values != null && values.length > 3)
					dataCount = Integer.valueOf(values[3]);
				// 文件数据记录行数,五项推导输入文件，记录个数n . m<=n
				// int dataCount = Integer.valueOf(values[len - 1]);
				//
				// LOG.debug("五项推导输入文件数据记录条数:" + dataCount + " , 输出条数:" +
				// rowCount);

				String tmpline = "";

				int badCount = 0;

				// 应该上报的行数
				int tmpcount = 0;
				while ((tmpline = br.readLine()) != null) {
					if ("".equals(tmpline.trim()))
						continue;

					if (tmpline.startsWith("BSTR"))
						break;
					String[] tmpFieldValues = tmpline.split(",");
					if (tmpFieldValues.length > 9) {
						double scl = Double.valueOf(tmpFieldValues[9]);
						if (scl > 1000)
							badCount++;
					}

					tmpcount++;

				}
				br.close();

				br = new BufferedReader(new FileReader(outFile));
				// 忽略两行，开头两行为五项推到产生的2行数据。 结尾一行也要忽略，用模板ftl中的第一行，第二行，结尾一行。
				br.readLine();
				br.readLine();

				int rowCount = tmpcount;
				// 第二行
				String line_second = br_src.readLine();

				if (null == line_second) {
					return 0;
				}

				String lineTmp = null;
				String lastLineData = null;
				int rowCountTmp = 0;

				while ((lineTmp = br_src.readLine()) != null) {
					rowCountTmp++;
					// 最后一行记录
					if (rowCountTmp > dataCount) {
						lastLineData = lineTmp;
						break;
					}
				}

				if (values.length > 3)
					values[3] = "" + (rowCount - badCount);
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

				int count = 0;

				if (rowCount > 0) {
					while ((line = br.readLine()) != null) {
						if ("".equals(line.trim()))
							continue;
						count++;

						// 最后一行记录,则跳出，
						if (count > rowCount) {
							break;
						}
						if (line.startsWith("BSTR"))
							continue;

						String[] tmpFieldValues = line.split(",");

						StringBuilder sbColumn = new StringBuilder();
						StringBuilder sbErrorType = new StringBuilder();
						if (tmpFieldValues.length < 25) {

							boolean bFlag = bsaHandleAfter(tmpFieldValues,
									sbColumn, sbErrorType);
							if (!bFlag) {
								BsaDTO dto = bsaLog.conver(values,
										sbColumn.toString(),
										sbErrorType.toString(), "5");
								bsaLog.insertNBILog(dto);
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
				case 0:
					return "0x00000000";
				case 1:
					return "0x0000000" + temp;
				case 2:
					return "0x000000" + temp;
				case 3:
					return "0x00000" + temp;
				case 4:
					return "0x0000" + temp;
				case 5:
					return "0x000" + temp;
				case 6:
					return "0x00" + temp;
				case 7:
					return "0x0" + temp;
				case 8:
					return "0x" + temp;
				default:
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

	/**
	 * MappingInfo
	 * 
	 * @author litp 2011-9-29
	 */
	class MappingInfo {

		public String fileName; // 文件名

		public String templetFileName; // 模板文件名

		public List<SqlEntry> sqls; // sql语句集

		public String wsURL; // webservice 地址

		public String wsParam; // webservice 方法所需参数 NBI_PERF_MSC_1X,
								// NBI_PERF_MSC_DO, NBI_PERF_CITY_1X,
								// NBI_PERF_CITY_DO, NBI_PERF_SCENE_1X,
								// NBI_PERF_SCENE_DO

		public String[] table_keys;

		public int batchNum;// 批量写入时数据的数量

		// 添加表头的情况：1：不分批写入数据的时候,每个sql对应的数据都会添加;2：分批写入数据并且addHead为true只会添加第一条sql,否则都不添加
		public boolean addHead;// 批量写入时是否需要添加表头

		// add 2012-10-20
		public String fileParaSql;// 文件参数，用于文件中的参数替换

		public boolean isRelated = false;

		// add on 2013-12-02
		public String packageName;

		// add ftp info

		public int ftpdsid;

		public String compressFile;

		public List<String> ftpnameList;

		public String[] singleTableHeader;

		public ExcelFile excelFile;

		public Map<String, String> replaceSymbolInfo = new HashMap<String, String>();

		/**
		 * 是否开启前置条件检验，用于数据核查
		 */
		public boolean isPrefixCondition = false;

		public String strategyId;

		// add on 2014-05-28

		public Header header;
	}

	class SqlEntry {

		public String sql;

		public boolean isPrefixCondition = false;

	}

	// add on 2014-05-28
	class Header {

		public String[] headList;

		public boolean isFieldMatch = false;

		public String split = ",";

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