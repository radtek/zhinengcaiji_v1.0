package cn.uway.nbi.task.resolver;

import static cn.uway.nbi.util.ConstDef.F_SEP;

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
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;
import cn.uway.nbi.validate.CheckMapping;
import cn.uway.nbi.validate.CheckMappingMgr;

/**
 * DB型数据源解释器 --针对 附件上传
 * 
 * 
 */
@IDMember(id = 102)
public class AttachmentDataResolver extends DBResolver {

	private static final Logger LOG = LoggerFactory.getLogger(AttachmentDataResolver.class);

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
	protected void resolveProcess(ResolverResult result, ResultSetHelper resultService, ResultSet rs, Statement ps, boolean isReplaceCitys,
			String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("datacheck", "true");
		task.setParaMap(paraMap);

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

				// 附件上传，则特殊处理。
				boolean isOrder = orderProcess(info, fileInfoMap, resultService, rs, ps, isReplaceCitys, cityId, indexs, datas);

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
					try {

						rs = ps.executeQuery(sql);
					} catch (Exception e) {
						errFlag = true;
						LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
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
						data.add(values);
						if (info.batchNum >= 1 && data.size() >= info.batchNum) {
							lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, true, info);
							data.clear();
						}
					}

					recordCount += count;
				}
				if (errFlag) {

					continue;
				}

				lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, info.batchNum >= 1, info);
				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug("file templet mapping :  file:" + destFilePath + "   templet :" + info.templetFileName + " key :" + fkey);

				File filetmp = new File(destFilePath);
				if (filetmp.exists() && filetmp.length() > 0) {
					// fNames.put(fkey, destFilePath);
					// 进行五项推导
					int bsaNum = 0;

					destFilePath = oldFilePath;

					// add on 20131203 , 如果是文件扩展名则打包
					String packageNameTmp = packageProcess(destFilePath, info, cityId, isReplaceCitys, b);

					// end add

					FileInfo fileInfo = new FileInfo();
					// fileInfo.setFileName(destFilePath);
					fileInfo.setFileName(packageNameTmp);

					if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
						fileInfo.setCount(bsaNum);
					} else {
						fileInfo.setCount((int) (lineNum == 0 ? recordCount : lineNum));
					}

					fileInfo.setDataType(dataType);

					result.getUploadFileInfoMap().put(fkey, fileInfo);

				}
			} catch (Exception e) {
				LOG.error("级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName, e);
			}
		}

		result.getUploadFileInfoMap().putAll(fileInfoMap);

	}

	/**
	 * 附件上传处理
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

			// 对 fileParaSql 进行处理， 把需要上传的文件名取出。
			Map<String, String> fname = new HashMap<String, String>();
			if (StringUtil.isNotNull(info.fileParaSql)) {

				// sql 中的参数进行替换
				info.fileParaSql = ConstDef.ParseFilePathForDB(info.fileParaSql, new Timestamp(task.getCurrDataTime().getTime()));

				LOG.debug("fileParaSql :" + info.fileParaSql);

				rs = ps.executeQuery(info.fileParaSql);

				String[] headLine = resultService.getColumnNames(rs);
				String[] values = null;
				while (rs.next()) {
					values = resultService.getColumnValues(rs, bFlag);

					if (values == null)
						continue;
					String key = values[0];

					int i = 0;

					// ftpsource 中的 列表
					List<String> ftpnameList = new ArrayList<String>(info.ftpnameList);

					String tmpfile = new String(destFilePath);

					// ftpsource 中的 name 属性
					String cfile = new String(info.compressFile);

					// 把ftp文件列表中的参数都替换
					for (String fieldname : headLine) {
						tmpfile = tmpfile.replace("${" + fieldname.toLowerCase() + "}", values[i]);
						for (int ii = 0; ii < ftpnameList.size(); ii++) {
							String sFile = ftpnameList.get(ii);
							sFile = sFile.replace("${" + fieldname.toLowerCase() + "}", values[i]);
							sFile = replaceProcess(sFile, cityId, b, isReplaceCitys);
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
			Map<String, String> ftpFiles = ftpFileProcess(dstmp, cityId);
			// 打包文件

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
			} else {
				LOG.debug("附件为空");
			}

		}
		return info.isRelated;
	}

	public Map<String, String> ftpFileProcess(DS dstemp, String cityId) throws Exception {

		Map<String, String> pathMap1 = new HashMap<String, String>();//

		FTPFileDS ds = (FTPFileDS) dstemp;

		ftpUnitMap = ds.getFtpFileUnitMap();
		LOG.debug("file down ftp info:" + ds.getIp());

		FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());

		String curDir = SysCfg.getInstance().getCurrentpath().replace("\\", "/");
		String dir = null;
		String ftpFname = null;
		Map<String, String> pathMap = new HashMap<String, String>();//
		FtpFileUnit ftpFileUnit_zipName = null;
		for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
			// 取 压缩包的名字 ，
			ftpFileUnit_zipName = ftpFileUnit;
			for (String fName : ftpFileUnit.getFilenameList()) {

				// 多个附件名， 是用 ｜ 分隔
				// 前台的附件上传到FTP上，　是放在　Bulletin　目录下，写死的。
				fName = fName.replace("/Bulletin/", "");
				String[] ftpFnameList = fName.split("\\|");
				for (int i = 0; i < ftpFnameList.length; i++) {
					ftpFname = ftpFnameList[i];
					if (null == ftpFname || "".equals(ftpFname)) {
						continue;
					}
					ftpFname = "/Bulletin/" + ftpFname;

					String localPath = curDir + File.separator + task.getId() + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					dir = localPath.substring(0, localPath.lastIndexOf("/"));
					File f = new File(dir);
					if (!f.exists())
						f.mkdirs();

					// String localFName = localPath + tmpFile;
					// 下载文件
					DownStructer structer = ftp.downFile(ftpFname, dir);
					for (String fname : structer.getSuc()) {
						pathMap.put(fname, fname);
					}
				}
				ftp.closeConnect();
			}

		}

		if (dir != null && pathMap.size() > 0) {
			// 压缩文件 的文件名
			String zipFile = getDestFilePath(ftpFileUnit_zipName.getName(), cityId);
			if (zipFile.contains("${index}")) {
				zipFile = zipFile.replace("${index}", BSAIndexMgr.getInstance().getIndex());
			}

			// 如果 反缀名为 gz ,则只能对单个文件进行打包，并且 对 Packer.pack(文件列表,压) 在

			if (StringUtil.isNotNull(zipFile)) {

				Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile);

				pathMap.clear();
				pathMap1.put(zipFile, zipFile);
			}
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
			fileName = ProvinceNameMgr.replaceAllName(fileName, cityId, task.getTemplet().getInclude().getProviceMap(), task.getTemplet()
					.getInclude().getCityMap());

		fileName = fileNameProcess(fileName);

		fileName = ConstDef.ParseFilePath(fileName, new Timestamp(task.getCurrDataTime().getTime()));

		// 如果是补报任务就需要对文件名进行操作
		if (!task.isTask()) {
			int index = fileName.lastIndexOf(".");
			if (index != -1)
				fileName = fileName.substring(0, index) + "_" + (((RTask) task).getCounter() + 1) + fileName.substring(index);
		}

		String dirFile = CURRPATH + F_SEP + task.getId() + F_SEP;
		File f = new File(dirFile);
		if (!f.exists())
			f.mkdirs();

		String resultFile = dirFile + fileName;

		return resultFile;
	}

}