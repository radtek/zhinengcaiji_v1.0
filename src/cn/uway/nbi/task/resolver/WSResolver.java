package cn.uway.nbi.task.resolver;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.task.ds.DataBaseDS;
import cn.uway.nbi.util.ClassUtil;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.webservice.perfservice.Parser;
import cn.uway.webservice.perfservice.TD;
import cn.uway.webservice.perfservice.Table;
import cn.uway.webservice.perfservice.TableMgr;
import cn.uway.webservice.perfservice.client.NorthGetNBISql;
import cn.uway.webservice.perfservice.store.FileCacheStore;
import cn.uway.webservice.perfservice.store.StoreParameter;

@IDMember(id = 500)
public class WSResolver extends DBResolver {

	private static final Logger LOG = LoggerFactory.getLogger(WSResolver.class);

	private List<String> tempFileList = new ArrayList<String>();

	/** 文件分隔符 */
	public static final String F_SEP = File.separator;

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
				String isRelated = ee.attributeValue("isrelated");
				if (StringUtil.isNotNull(isRelated))
					info.isRelated = isRelated.equals("1");
				// batchnum
				String bStr = ee.attributeValue("batchnum");
				if (bStr != null && !"".equals(bStr))
					info.batchNum = Integer.parseInt(bStr);
				// addhead
				String aStr = ee.attributeValue("addhead");
				if (aStr != null && !"".equals(aStr))
					info.addHead = Boolean.parseBoolean(aStr);

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

				// add on 20131202
				String package_name = ee.attributeValue("package_name");
				if (StringUtil.isNotNull(package_name))
					info.packageName = package_name.trim();

				// end add

				// webservice
				Element ws = ee.element("ws");
				List<Element> wsProperty = ws.elements("property");
				for (Element item : wsProperty) {
					String value = item.getText();
					if (StringUtil.isNull(value))
						value = "";
					else {
						value = value.trim();
					}
					String temp = item.attributeValue("name");
					if ("url".equalsIgnoreCase(temp)) {
						info.wsURL = value;
					} else if ("param_type".equalsIgnoreCase(temp)) {
						info.wsParam = value;
					} else if ("table_key".equalsIgnoreCase(temp)) {
						info.table_keys = list2StringArray(getKeyVaules(value));

					} else if ("conn_id".equalsIgnoreCase(temp)) {
						//如果有 conn_id 属性，说明， 把 WebService的信息已独立出来，放入到 connection-info.xml 文件中。
						// 因此需要 去   connection-info.xml 文件中 读取信息 来覆盖此处的信息。
						Map<String,String > connMap=null; 
						try {
							// 去 connection-info.xml文件中， 读取　对应的元素
							connMap=ClassUtil.getConnctioninfoFileProperties(value);
							if(connMap!=null){
								
								//如果有元素 ，则把它放入到 elementMap 对像中去，如 elementMap 存在这个对象，则进行替换，没有则放入。
								 Iterator i = connMap.entrySet().iterator();
								  while(i.hasNext()){
									  
									  java.util.Map.Entry entry = (java.util.Map.Entry)i.next();
									  //如果存在这个对象
									 
									   
										if ("url".equalsIgnoreCase(entry.getKey().toString())) {
											info.wsURL = entry.getValue().toString();
										} else if ("param_type".equalsIgnoreCase(entry.getKey().toString())) {
											info.wsParam = entry.getValue().toString();
										} else if ("table_key".equalsIgnoreCase(entry.getKey().toString())) {
											info.table_keys = list2StringArray(getKeyVaules(entry.getValue().toString()));
										}
								  
								  }
								  
								
							}else{
								LOG.error("connection-info.xml 文件 不存在id为({})的元素！",temp);
							}
						} catch (Exception e) {
							LOG.error("connection-info.xml 文件解析出现异常：({})！", e);
						}

					}
					// add by yanb 2013-8-21 个性化输出需求
					else if ("single_table_header".equalsIgnoreCase(temp)) {
						info.singleTableHeader = list2StringArray(getKeyVaules(value));
					}
				}
				mappingInfos.add(info);
			}
		}
	}

	// add by yanb 2013-8-21 提取公共方法
	private List<String> getKeyVaules(String value) {
		String vs[] = value.split(",");
		List<String> keyList = new ArrayList<String>();
		for (String s : vs) {
			if (StringUtil.isNull(s))
				continue;
			keyList.add(s);
		}
		return keyList;
	}

	/**
	 * 将list 转化为 String []
	 * 
	 * @param list
	 * @return
	 */
	public static String[] list2StringArray(List<String> list) {
		int size = list.size();
		return list.toArray(new String[size]);

	}

	@Override
	public ResolverResult resolve() throws Exception {
		LOG.info("开始进行数据库数据收集!");
		Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
		ResolverResult result = new ResolverResult();
		result.setUploadFileInfoMap(recordCountMap);

		// 初始化数据验证功能模块
		validateFuction.init(getSysDB());

		long start = System.currentTimeMillis();
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

		} catch (Exception e) {
			LOG.info("数据库数据收集异常{}!", e);
			throw e;
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		long end = System.currentTimeMillis();
		LOG.info("数据收集完毕, 耗时({})s", (end - start) / 1000);
		return result;
	}

	@Override
	protected void resolveProcess(ResolverResult resolverResult, ResultSetHelper resultService, ResultSet rs, Statement ps, boolean isReplaceCitys,
			String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		boolean b = task.getTemplet().includeValidate();

		int dataType = 0;
		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			TableMgr tableMgr = new TableMgr();
			try {
				String destFilePath = getDestFilePath(info.fileName, cityId);

				// 硬编码 3次重联
				NorthGetNBISql wsClient = new NorthGetNBISql(3);
				LOG.debug("请求webservice 获取sql， url=" + info.wsURL + ";type=" + info.wsParam);
				// webservice调用
				String xmlSQL = wsClient.getNBISql(info.wsURL, info.wsParam);
				if (StringUtil.isNull(xmlSQL))
					continue;

				String tmpFile = info.templetFileName;

				List<String> headList = readFileHead(ConstDef.TEMPLET_PATH_FOR_FILE + tmpFile, ",");

				List<String> headStrList = readFileHeadStrList(ConstDef.TEMPLET_PATH_FOR_FILE + tmpFile, ",");

				xmlSQL = ProvinceNameMgr.replaceProvince(xmlSQL, task.getTemplet().getInclude().getProviceMap());
				xmlSQL = processParaMap(xmlSQL, "${", "}", null);
				// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
				xmlSQL = replaceDateStr(xmlSQL);
				xmlSQL = ConstDef.ParseFilePathForDB(xmlSQL, new Timestamp(task.getCurrDataTime().getTime()));
				LOG.debug(task + " , sql=" + xmlSQL);
				/*
				 * 解析 xml数据
				 */
				Parser parser = new Parser();
				parser.setType(info.wsParam);
				parser.setXml(xmlSQL);
				try {
					parser.parser(); // 解析sql
				} catch (NullPointerException e) {
					LOG.debug(e.getLocalizedMessage());
					return ;
				}

				// 在初次产生文件时候，如果这个文件存在，则删除
				File oldFile = new File(destFilePath);
				if (oldFile.exists())
					oldFile.delete();

				Table table = parser.getTable();
				table.setHeadStrList(headStrList);

				table.setKeyFields(info.table_keys);

				List<String> outField = new ArrayList<String>();

				for (String k : info.table_keys) {
					outField.add(k);
				}
				if (null != info.singleTableHeader && info.singleTableHeader.length > 0) {
					for (String k : info.singleTableHeader) {
						outField.add(k);
					}
				} else {
					outField.addAll(headList);
				}
				table.setOutField(outField);
				table.setDataType(info.wsParam);

				tableMgr.setOutFile(destFilePath);
				tableMgr.setTask(task);
				tableMgr.setTable(table);
				table.getResultSet2(this);
				tableMgr.setResolver(this);
				int count = tableMgr.merger(table);

				for (String tmpfile : this.tempFileList) {
					File tFile = new File(tmpfile);
					if (tFile.exists())
						try {
							LOG.info("删除文件" + tFile.getName() + ",状态：" + tFile.delete());
						} catch (Exception e) {
						}
				}
				// add on 20131203 , 如果是文件扩展名则打包
				String packageNameTmp = packageProcess(destFilePath, info, cityId, isReplaceCitys, b);
				// end add

				FileInfo fileInfo = new FileInfo();
				// fileInfo.setFileName(destFilePath);
				fileInfo.setFileName(packageNameTmp);

				fileInfo.setCount((int) count);
				fileInfo.setDataType(dataType);
				fileInfoMap.put(packageNameTmp, fileInfo);
			} catch (Exception e) {
				LOG.error("级别数据文件产生失败,模板{}，原因:{}", e);
				throw e;
			} finally {
				Table table = tableMgr.getTable();
				table.getTrList();
			}
		}
		resolverResult.getUploadFileInfoMap().putAll(fileInfoMap);

	}

	/**
	 * @param dataType
	 *            数据类型
	 * @param trId
	 * @param td
	 * @return
	 */
	public StoreParameter getCacheFileName(String dataType, int trId, TD td) {
		String dataTime = DateUtil.getDateString_yyyyMMddHHmmss(this.task.getCurrDataTime());
		String tdStr = "";
		if (null != td) {
			tdStr = "_tdid_" + td.getId();
		}

		String dir = CURRPATH + File.separator + "tmp";
		File fileDir = new File(dir);
		if (!fileDir.exists())
			fileDir.mkdirs();

		String tdFileName = dir + File.separator + this.task.getId() + "_" + dataType + "_" + dataTime + "_trid_" + trId + tdStr;
		String indexFile = tdFileName + ".index";
		String dataFile = tdFileName + ".data";

		StoreParameter storePara = new StoreParameter();
		storePara.indexFile = indexFile;
		storePara.dataFile = dataFile;
		tempFileList.add(storePara.indexFile);
		tempFileList.add(storePara.dataFile);
		return storePara;

	}

	/**
	 * @param sql
	 * @param groupColumns
	 *            分组 关键字段
	 * @return
	 * @throws Exception
	 */
	public void processGetResult(String sql, TD td, List<String> groupKey, List<String> lineKeyList, int trId, String dataType)  throws Exception{
		LOG.info("数据库数据收集开始 !");
		long start = System.currentTimeMillis();
		Connection conn = null;
		Statement ps = null;
		java.sql.ResultSet rs = null;
		sql = replaceDateStr(sql);
		LOG.debug(task.getDescription() + " , trId=" + trId + " , tdId= " + td.getId() + "  ,sql = " + sql);
		long begin = System.currentTimeMillis();
		cn.uway.webservice.perfservice.ResultSet rsData = new cn.uway.webservice.perfservice.ResultSet();
		try {
			DataBaseDS ds = (DataBaseDS) this.getDs();
			conn = this.getConnection(ds);

			ps = conn.createStatement();
			rs = ps.executeQuery(sql);
			rs.setFetchSize(1000);
			rsData.setHeadLine(rs);

			long end = System.currentTimeMillis();

			LOG.debug(task.getId() + " , trId=" + trId + " , tdId= " + td.getId() + "  , 查询数据消耗时间{}秒", (end - begin) / 1000);

			begin = System.currentTimeMillis();

			StoreParameter storePara = getCacheFileName(dataType, trId, td);

			File indexFile = new File(storePara.indexFile);
			deleteFile(indexFile);
			File dataFile = new File(storePara.dataFile);
			deleteFile(dataFile);

			FileCacheStore store = new FileCacheStore(storePara);

			rsData.setResultData3(rs, groupKey, lineKeyList, store);

			store.storeIndexFile();

			rsData.setCacheStore(store);

			end = System.currentTimeMillis();

			LOG.debug(task.getId() + " , trId=" + trId + " , tdId= " + td.getId() + "  , 写文件消耗时间{}秒", (end - begin) / 1000);

		} catch (Exception e) {
			LOG.error("数据库数据收集 异常 { }!", e);
			throw e;
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		long end = System.currentTimeMillis();
		LOG.info("数据收集完毕,   耗时({})s", (end - start) / 1000);
		td.setResultSet(rsData);

	}

	public void deleteFile(File file) {
		if (file.exists())
			file.delete();
	}

	/**
	 * 替换时间标记
	 * 
	 * @param sql
	 * @return
	 */
	public String replaceDateStr(String sql) {
		// "@@Y-@@M-@@D @@H:@@m:@@S", "%%Y-%%M-%%D %%H:%%m:%%S"
		return sql.replaceAll("@@YY", "%%Y").replaceAll("@@MM", "%%M").replaceAll("@@DD", "%%D").replaceAll("@@HH", "%%H").replaceAll("@@MI", "%%m")
				.replaceAll("@@SS", "%%S");

	}

}
