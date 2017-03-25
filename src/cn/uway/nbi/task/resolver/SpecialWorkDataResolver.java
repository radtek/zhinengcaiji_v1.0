package cn.uway.nbi.task.resolver;

import static cn.uway.nbi.util.ConstDef.F_SEP;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.bsa.BSAIndexMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.ds.DataBaseDS;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.task.templet.file.FreeMarkerMgr;
import cn.uway.nbi.task.templet.file.Obj;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;

/**
 * DB型数据源解释器 --针对 5.3.8.3 结单工单
 * 
 * 
 */
@IDMember(id = 118)
public class SpecialWorkDataResolver extends DBResolver {

	private Map<String, String> csvFileMap;

	private static final Logger LOG = LoggerFactory
			.getLogger(SpecialWorkDataResolver.class);

	@Override
	public ResolverResult resolve() throws Exception {
		LOG.info("开始进行数据库数据收集!");
		long start = System.currentTimeMillis();
		ResolverResult result = new ResolverResult();
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		result.setUploadFileInfoMap(fileInfoMap);

		// 初始化数据验证功能模块
		validateFuction.init(getSysDB());

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
			LOG.error("数据库数据收集异常{}!", e);
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		long end = System.currentTimeMillis();
		LOG.info("数据收集完毕, 耗时({})s", (end - start) / 1000);
		return result;
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
	@Override
	protected void resolveProcess(ResolverResult result,
			ResultSetHelper resultService, ResultSet rs, Statement ps,
			boolean isReplaceCitys, String cityId) throws Exception {

		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("datacheck", "true");
		task.setParaMap(paraMap);

		// 遍历所有的mapping,每个mapping表示生成一个文件
		// for (MappingInfo info : mappingInfos) {
		MappingInfo[] sortMappingInfos = new MappingInfo[3];
		List<String> workOrderIDs = new ArrayList<String>();
		if (mappingInfos.size() == 3) {
			for (MappingInfo info : mappingInfos) {
				if (info.fileName.contains("WOINFO")
						&& !info.fileName.contains("gz")) {
					sortMappingInfos[0] = info;
				} else if (info.fileName.contains("WOFILE")) {
					sortMappingInfos[1] = info;
				} else {
					sortMappingInfos[2] = info;
				}
			}
		} else {
			sortMappingInfos = mappingInfos
					.toArray(new MappingInfo[mappingInfos.size()]);
		}
		for (MappingInfo info : sortMappingInfos) {
			if ((info.fileName.contains("WOINFO") && !info.fileName
					.contains("gz")) || info.fileName.contains("SOLUTIONPLAN")) {
				try {
					Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
					Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
					String destFilePath = getDestFilePath(info.fileName, cityId);
					if (destFilePath.contains("${index}")) {
						destFilePath = destFilePath.replace("${index}",
								BSAIndexMgr.getInstance().getIndex());
					}
					//
					destFilePath = getFileName(destFilePath);

					boolean bFlag = info.fileName.toLowerCase()
							.contains(".csv");

					boolean b = task.getTemplet().includeValidate();

					// 是否 需要特殊处理。
					boolean isOrder = orderProcess(info, fileInfoMap,
							resultService, rs, ps, isReplaceCitys, cityId,
							indexs, datas);

					processStrategy(info);

					if (isOrder)
						continue;

					String ext = Util.getPackageExt(info.fileName);

					int dataType = 0;

					long lineNum = 0;
					for (int i = 0; i < info.sqls.size(); i++) {

						SqlEntry sqlEntry = info.sqls.get(i);
						String sql = sqlEntry.sql;

						if (StringUtil.isNull(sql))
							continue;
						if (isReplaceCitys)// 替换城市相关占位符
						{
							sql = ProvinceNameMgr.replaceAllName(sql, cityId,
									task.getTemplet().getInclude()
											.getProviceMap(), task.getTemplet()
											.getInclude().getCityMap());
						} else if (b)// 替换省相关占位符
						{
							sql = ProvinceNameMgr.replaceProvince(sql, task
									.getTemplet().getInclude().getProviceMap());
						}
						sql = processParaMap(sql, "${", "}", null);
						// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
						if (info.fileName.contains("WOINFOMODIFY")
								|| info.fileName.contains("SOLUTIONPLAN")) {
							sql = ConstDef.ParseFilePathForDB2(sql,
									new Timestamp(task.getCurrDataTime()
											.getTime()));
						} else {
							sql = ConstDef.ParseFilePathForDB(sql,
									new Timestamp(task.getCurrDataTime()
											.getTime()));
						}

						if (task instanceof BSATask) {
							if (sql.contains("${planno}")) {
								BSATask tasktmp = (BSATask) task;
								sql = sql.replace("${planno}",
										tasktmp.getPlanno());
							}
						}

						LOG.debug(task + " , sql=" + sql);
						try {

							rs = ps.executeQuery(sql);
						} catch (Exception e) {
							LOG.error(task + "," + info.fileName
									+ " , templet: " + info.templetFileName
									+ ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
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

						while (rs.next()) {
							String[] values = resultService.getColumnValues(rs,
									bFlag);
							String fileName = "";
							if (values == null)
								continue;

							// 收集所有的工单编号
							if (values[3] != null
									|| !values[3].equalsIgnoreCase("")) {
								workOrderIDs.add(values[3]);
								if (destFilePath.contains("${workOrderID}")) {
									fileName = destFilePath;
									fileName = fileName.replace(
											"${workOrderID}", values[3]);
								}
							} else {
								continue;
							}

							// 在初次产生文件时候，如果这个文件存在，则删除
							File oldFile = new File(fileName);
							if (oldFile.exists())
								oldFile.delete();

							data.add(values);
							lineNum = lineNum
									+ this.process(datas, indexs,
											info.templetFileName, fileName,
											info.batchNum >= 1, info);
							data.remove(1);
							String fkey = fileName + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
							LOG.debug("file templet mapping :  file:"
									+ fileName + "   templet :"
									+ info.templetFileName + " key :" + fkey);

							File filetmp = new File(fileName);
							if (filetmp.exists() && filetmp.length() > 0) {
								// add on 20131203 , 如果是文件扩展名则打包
								String packageNameTmp = packageProcess(
										fileName, info, cityId, isReplaceCitys,
										b);

								// end add

								FileInfo fileInfo = new FileInfo();
								// fileInfo.setFileName(destFilePath);
								fileInfo.setFileName(packageNameTmp);
								fileInfo.setCount(1);
								fileInfo.setDataType(dataType);
								result.getUploadFileInfoMap().put(fkey,
										fileInfo);

							}
						}
					}
				} catch (Exception e) {
					LOG.error("级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName, e);
				}
			} else {
				for (String workOrderID : workOrderIDs) {
					try {
						Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
						Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
						String destFilePath = getDestFilePath(info.fileName,
								cityId);
						destFilePath = destFilePath.replace("${workOrderID}",
								workOrderID);
						if (destFilePath.contains("${index}")) {
							destFilePath = destFilePath.replace("${index}",
									BSAIndexMgr.getInstance().getIndex());
						}
						String oldFilePath = destFilePath;
						//
						destFilePath = getFileName(destFilePath);

						boolean bFlag = info.fileName.toLowerCase().contains(
								".csv");

						boolean b = task.getTemplet().includeValidate();

						// 是否 需要特殊处理。
						boolean isOrder = orderProcess(info, fileInfoMap,
								resultService, rs, ps, isReplaceCitys, cityId,
								indexs, datas, workOrderID);

						processStrategy(info);

						if (isOrder)
							continue;

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
							if (sql.contains("%%workOrderID")) {
								sql = sql.replace("%%workOrderID", workOrderID);
							}
							if (isReplaceCitys)// 替换城市相关占位符
							{
								sql = ProvinceNameMgr.replaceAllName(sql,
										cityId, task.getTemplet().getInclude()
												.getProviceMap(), task
												.getTemplet().getInclude()
												.getCityMap());
							} else if (b)// 替换省相关占位符
							{
								sql = ProvinceNameMgr.replaceProvince(sql, task
										.getTemplet().getInclude()
										.getProviceMap());
							}
							sql = processParaMap(sql, "${", "}", null);
							// 修改on 2012-10-12 ParseFilePath->
							// ParseFilePathForDB
							sql = ConstDef.ParseFilePathForDB(sql,
									new Timestamp(task.getCurrDataTime()
											.getTime()));

							if (task instanceof BSATask) {
								if (sql.contains("${planno}")) {
									BSATask tasktmp = (BSATask) task;
									sql = sql.replace("${planno}",
											tasktmp.getPlanno());
								}
							}

							LOG.debug(task + " , sql=" + sql);
							try {

								rs = ps.executeQuery(sql);
							} catch (Exception e) {
								errFlag = true;
								LOG.error(task + "," + info.fileName
										+ " , templet: " + info.templetFileName
										+ ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
								break;
							}
							String[] headLine = resultService
									.getColumnNames(rs);
							/* index */
							Map<String, Integer> index = new HashMap<String, Integer>();
							for (int j = 0; j < headLine.length; j++)
								index.put(headLine[j], j);
							int sqlNum = i + 1;
							indexs.put("d" + sqlNum, index);
							/* data */
							List<String[]> data = new ArrayList<String[]>();
							datas.put("d" + sqlNum, data);
							if (info.batchNum <= 0 || info.addHead
									&& sqlNum == 1)
								data.add(headLine);
							// 在初次产生文件时候，如果这个文件存在，则删除
							File oldFile = new File(destFilePath);
							if (oldFile.exists())
								oldFile.delete();

							int count = 0;
							while (rs.next()) {
								String[] values = resultService
										.getColumnValues(rs, bFlag);
								if (values == null)
									continue;

								// 如果是 isrelated=1 并且 file name 里含有 WOFILE 字符，
								// 则认为，
								// 这个 mapping 是取 附件列表信息,则需要对里面的 附件名称
								// 进行替换。一个附件一行记录
								if (csvFileMap != null && csvFileMap.size() > 0
										&& info.fileName.contains("WOFILE")) {
									// 这里的取 附件名称，直接是写死的。
									if (csvFileMap.containsKey(values[4])) {
										String[] csvFileName = csvFileMap.get(
												values[4]).split("&&");
										if (csvFileName.length > 1) {
											values[3] = ".csv";

											String[] valuesOne = values.clone();

											valuesOne[4] = csvFileName[0];
											data.add(valuesOne);

											values[4] = csvFileName[1];
										}

									}

								}

								count++;
								data.add(values);
								if (info.batchNum >= 1
										&& data.size() >= info.batchNum) {
									lineNum = lineNum
											+ this.process(datas, indexs,
													info.templetFileName,
													destFilePath, true, info);
									data.clear();
								}
							}

							recordCount += count;

						}
						if (errFlag) {

							continue;
						}

						lineNum = lineNum
								+ this.process(datas, indexs,
										info.templetFileName, destFilePath,
										info.batchNum >= 1, info);
						String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
						LOG.debug("file templet mapping :  file:"
								+ destFilePath + "   templet :"
								+ info.templetFileName + " key :" + fkey);

						File filetmp = new File(destFilePath);
						if (filetmp.exists() && filetmp.length() > 0) {
							// fNames.put(fkey, destFilePath);
							// 进行五项推导
							int bsaNum = 0;

							destFilePath = oldFilePath;

							// add on 20131203 , 如果是文件扩展名则打包
							String packageNameTmp = packageProcess(
									destFilePath, info, cityId, isReplaceCitys,
									b);

							// end add

							FileInfo fileInfo = new FileInfo();
							// fileInfo.setFileName(destFilePath);
							fileInfo.setFileName(packageNameTmp);

							if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
								fileInfo.setCount(bsaNum);
							} else {
								fileInfo.setCount((int) (lineNum == 0
										? recordCount
										: lineNum));
							}

							fileInfo.setDataType(dataType);

							result.getUploadFileInfoMap().put(fkey, fileInfo);

						}
					} catch (Exception e) {
						LOG.error("级别数据文件产生失败,模板{}，原因:{}"
								+ info.templetFileName, e);
					}
				}
			}
		}

		result.getUploadFileInfoMap().putAll(fileInfoMap);

	}

	/**
	 * 数据处理
	 * 
	 * @param datas
	 *            所有数据
	 * @param index
	 *            数据对应的索引
	 * @param templetFile
	 *            模板文件名
	 * @param destFilePath
	 *            目标文件路径
	 */
	protected long process(Map<String, List<String[]>> datas,
			Map<String, Map<String, Integer>> indexs, String templetFile,
			String destFilePath, boolean append, MappingInfo info)
			throws Exception {
		LOG.debug(destFilePath);
		/* out */
		File destFile = new File(destFilePath);
		if (!destFile.exists()) {
			boolean b = destFile.createNewFile();
			if (!b) {
				throw new Exception(destFilePath + "创建文件失败");
			}

			LOG.debug(destFilePath + "创建成功:" + b);
		} else {
			LOG.debug(destFilePath + "已经存在");
		}

		FileWriter out = new FileWriter(destFile, append);
		FreeMarkerWriter templetOut = new FreeMarkerWriter(out);
		LOG.debug(destFilePath + templetOut);
		/* o */
		Obj o = new Obj();
		o.setDatas(datas);
		o.setIndexs(indexs);
		/* root */
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("o", o);

		/* date time */
		Calendar c = Calendar.getInstance();
		c.setTime(task.getCurrDataTime());
		root.put("YEAR", String.valueOf(c.get(Calendar.YEAR)));
		root.put("MONTH", String.valueOf(c.get(Calendar.MONTH) + 1));
		root.put("DAY", String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
		root.put("HOUR", String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
		root.put("MINUTE", String.valueOf(c.get(Calendar.MINUTE)));
		root.put("SECOND", String.valueOf(c.get(Calendar.SECOND)));

		processParaMap(null, null, null, root);
		//
		FreeMarkerMgr.getInstance().process(root, templetFile, templetOut);
		return templetOut.getLineNum();
	}

	/**
	 * 附件上传处理
	 * 
	 * @throws Exception
	 */
	public boolean orderProcess(MappingInfo info,
			Map<String, FileInfo> fileInfoMap, ResultSetHelper resultService,
			ResultSet rs, Statement ps, boolean isReplaceCitys, String cityId,
			Map<String, Map<String, Integer>> indexs,
			Map<String, List<String[]>> datas, String workOrderID)
			throws Exception {

		String destFilePath = getDestFilePath(info.fileName, cityId).replace(
				"${workOrderID}", workOrderID);

		if (destFilePath.contains("${index}")) {
			destFilePath = destFilePath.replace("${index}", BSAIndexMgr
					.getInstance().getIndex());
		}

		boolean bFlag = info.fileName.toLowerCase().contains(".csv");

		boolean b = task.getTemplet().includeValidate();

		// 如果是 isrelated=1 并且 file name 里含有 a 字符， 则认为， 这个 mapping 是取 附件
		if (info.isRelated && info.fileName.contains("gz")) {

			Map<String, FtpFileUnit> map = new HashMap<String, FtpFileUnit>();

			// 对 fileParaSql 进行处理， 把需要上传的文件名取出。
			Map<String, String> fname = new HashMap<String, String>();
			if (StringUtil.isNotNull(info.fileParaSql)) {

				// sql 中的参数进行替换
				String sql = ConstDef.ParseFilePathForDB(info.fileParaSql,
						new Timestamp(task.getCurrDataTime().getTime()))
						.replace("%%workOrderID", workOrderID);

				LOG.debug("fileParaSql :" + sql);

				rs = ps.executeQuery(sql);

				String[] headLine = resultService.getColumnNames(rs);
				String[] values = null;

				while (rs.next()) {

					values = resultService.getColumnValues(rs, bFlag);

					if (values == null)
						continue;
					// 把查询出的第一个值， 作为key, 因为 第一个值可能出重复， 所以加年
					String key = values[0] + "hello"
							+ java.util.UUID.randomUUID().toString();

					int i = 0;

					// ftpsource 中的 列表
					List<String> ftpnameList = new ArrayList<String>(
							info.ftpnameList);

					String tmpfile = new String(destFilePath);

					// ftpsource 中的 name 属性
					String cfile = new String(info.compressFile);

					// 把ftp文件列表中的参数都替换
					for (String fieldname : headLine) {
						tmpfile = tmpfile
								.replace("${" + fieldname.toLowerCase() + "}",
										values[i]);

						// 对于 附件压缩名称， 进行替换。
						cfile = cfile.replace("${" + fieldname.toLowerCase()
								+ "}", values[i]);

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

					FtpFileUnit unit = new FtpFileUnit();
					unit.setKey(key);
					unit.setName(cfile);
					unit.setFilenameList(ftpnameList);
					map.put(key, unit);
					fname.put(key, tmpfile);

				}
			}

			// ftp ds
			LOG.debug("ftp ds" + info.ftpdsid);
			DS dstmp = dsMap.get(info.ftpdsid);

			dstmp.setFtpFileUnitMap(map);

			// FTP处理
			// 下载FTP上文件
			Map<String, String> ftpFiles = ftpFileProcess(dstmp, cityId,
					destFilePath);
			// 打包文件

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
			} else {
				LOG.debug("附件为空");
			}

		}
		return info.isRelated;
	}

	public Map<String, String> ftpFileProcess(DS dstemp, String cityId,
			String destFilePath) throws Exception {

		Map<String, String> pathMap1 = new HashMap<String, String>();//

		FTPFileDS ds = (FTPFileDS) dstemp;

		ftpUnitMap = ds.getFtpFileUnitMap();
		LOG.debug("file down ftp info:" + ds.getIp());

		FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(),
				ds.getPassword(), ds.getEncode(), ds.isbPasv());

		String curDir = SysCfg.getInstance().getCurrentpath()
				.replace("\\", "/");

		String dir = null;
		// 带有路径的 FTP文件名
		String ftpFname = null;
		// 不带路径的 FTP文件名
		String ftpFnam_nopath = null;
		// 不带路径的 FTP文件名
		Map<String, String> pathMap = new HashMap<String, String>();//
		for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {

			for (String fName : ftpFileUnit.getFilenameList()) {

				// 多个附件名， 是用 ｜ 分隔
				// 前台的附件上传到FTP上，　是放在　Bulletin　目录下，写死的。

				fName = fName.replace("\\", "/");
				fName = fName.replace("//", "/");
				ftpFname = fName;
				fName = fName.substring(fName.lastIndexOf("/") + 1,
						fName.length());
				String[] ftpFnameList = fName.split("\\|");
				for (int i = 0; i < ftpFnameList.length; i++) {
					ftpFnam_nopath = ftpFnameList[i];
					if (null == ftpFnam_nopath || "".equals(ftpFnam_nopath)) {
						continue;
					}

					String localPath = curDir + File.separator + task.getId()
							+ File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					// dir = localPath.substring(0, localPath.lastIndexOf("/"));
					// File f = new File(dir);
					// if (!f.exists())
					// f.mkdirs();
					dir = destFilePath.replace(".tar.gz", "").trim();
					File fdestFilePath = new File(dir);
					if (!fdestFilePath.exists()) {
						fdestFilePath.mkdir();
					}

					// String localFName = localPath + tmpFile;
					// 下载文件
					if (!ftpFname.startsWith("/")) {
						ftpFname = "/" + ftpFname;
					}
					DownStructer structer = ftp.downFile(ftpFname,
							fdestFilePath.getPath());

					for (String fname : structer.getSuc()) {
						// 把 EXCEL 文件 拆成 cvs 文件。
						pathMap.put(fname, fname);
					}

				}
				ftp.closeConnect();

				// 只循环一次就退出来。
				break;

			}

		}

		if (dir != null && pathMap.size() > 0) {
			Packer.pack(
					pathMap.values().toArray(
							new String[pathMap.values().size()]), destFilePath);
			pathMap.clear();
			pathMap1.put(destFilePath, destFilePath);
		}

		return pathMap1;
	}

	/**
	 * 获取本地文件名
	 * 
	 * @param fileName
	 * @param cityId
	 * @return
	 */
	protected String getDestFilePath(String fileName, String cityId) {
		boolean isInclude = task.getTemplet().includeValidate();
		if (isInclude)
			fileName = ProvinceNameMgr.replaceAllName(fileName, cityId, task
					.getTemplet().getInclude().getProviceMap(), task
					.getTemplet().getInclude().getCityMap());

		fileName = fileNameProcess(fileName);

		fileName = ConstDef.ParseFilePath(fileName, new Timestamp(task
				.getCurrDataTime().getTime()));

		// 如果是补报任务就需要对文件名进行操作
		if (!task.isTask()) {
			int index = fileName.lastIndexOf(".");
			if (index != -1)
				fileName = fileName.substring(0, index) + "_"
						+ (((RTask) task).getCounter() + 1)
						+ fileName.substring(index);
		}

		String dirFile = CURRPATH + F_SEP + task.getId() + F_SEP;
		File f = new File(dirFile);
		if (!f.exists())
			f.mkdirs();

		String resultFile = dirFile + fileName;

		return resultFile;
	}

}