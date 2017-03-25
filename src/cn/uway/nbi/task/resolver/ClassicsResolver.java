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
 * 经典工单 上传
 * 
 * 
 */
@IDMember(id = 106)
public class ClassicsResolver extends DBResolver {
 
	private static final Logger LOG = LoggerFactory.getLogger(WorkDataMonthResolver.class);
	private static String   WordName = "";
	private static String   HtmlName = ""; 

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
			throw e;
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
		List<Map<String,String>> workorder_no_List= new ArrayList<Map<String,String>>();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("datacheck", "true");
		task.setParaMap(paraMap);
		
		 WordName = "";
		   HtmlName = ""; 
		// 取出  -经典案例经典案例工单编号-  的mppping
		//fileName的值为1 代表，  取出  -经典案例经典案例工单编号
		for (MappingInfo info : mappingInfos) {
			if ( "1".equals(info.fileName)){
			for (int i = 0; i < info.sqls.size(); i++) { 
				SqlEntry sqlEntry = info.sqls.get(i);
				String sql = sqlEntry.sql;
				sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));				LOG.debug(task + " , sql=" + sql);
				try {
					//用来标识是第几个 workorder_no_map，用于 从MAP中取出数据。
					int  workorder_no_map_int=0;
					rs = ps.executeQuery(sql);
					 while(rs.next()){
						 Map map=new HashMap<String,String>(); 
						 map.put("经典案例工单编号"+workorder_no_map_int, rs.getString("经典案例工单编号"));
						  map.put("Object_type"+workorder_no_map_int, rs.getString("Object_type"));
						  workorder_no_List.add(map);
						  workorder_no_map_int=workorder_no_map_int+1;
					 }
					 
				} catch (Exception e) {
					LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
				break;
					//	break;
				}
				break;
				
			}
			break;
			 
			 }
		}
		
		if(workorder_no_List==null || workorder_no_List.size()<1){
			 return ;
			
		}
		
           //  案例附件列表CSV  文件名 ，因为tar里需要把这个 csv 文件，打进去。
		String CVSFileName="";
		
		//用来标识是第几个 workorder_no_map，用于 从MAP中取出数据。
		int  workorder_no_map_int=0;
		
	for(Map  workorder_no_map :workorder_no_List)  {
		
		String  workorder_no =Util.objecTrimNull( workorder_no_map.get("经典案例工单编号"+workorder_no_map_int)); 
		String  workorder_Object_type =Util.objecTrimNull( workorder_no_map.get("Object_type"+workorder_no_map_int)); 
		workorder_no_map_int=workorder_no_map_int+1;
		
		CVSFileName="";
		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			try {
				if ( "1".equals(info.fileName)){
					continue;
				}
				
				Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
				Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
				
				String destFilePath = getDestFilePath(info.fileName, cityId);
				destFilePath=destFilePath.replace("${经典案例工单编号}", workorder_no); 
				destFilePath=destFilePath.replace("${Object_type}", workorder_Object_type);
				
				if (destFilePath.contains("${index}")) {
					destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
				}
				
				String oldFilePath = destFilePath;  

				boolean bFlag = info.fileName.toLowerCase().contains(".csv"); 
				boolean b = task.getTemplet().includeValidate(); 
				processStrategy(info);
				
			
				// 是否 需要特殊处理。
				boolean isOrder = orderProcess(info, fileInfoMap, resultService, rs, ps, isReplaceCitys, cityId, indexs, datas,workorder_no,CVSFileName);

			

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
					
					//替换  经典案例工单编号
					
					sql=sql.replace("${经典案例工单编号}", workorder_no);
					
					sql = processParaMap(sql, "${", "}", null);
					// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
					sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));

				 

					LOG.debug(task + " , sql=" + sql);
					try {

						rs = ps.executeQuery(sql);
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

					int count = 0;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs, bFlag);
						if (values == null)
							continue;

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
					CVSFileName=packageNameTmp;
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
	protected long process(Map<String, List<String[]>> datas, Map<String, Map<String, Integer>> indexs, String templetFile, String destFilePath,
			boolean append, MappingInfo info) throws Exception {
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
	public boolean orderProcess(MappingInfo info, Map<String, FileInfo> fileInfoMap, ResultSetHelper resultService, ResultSet rs, Statement ps,
			boolean isReplaceCitys, String cityId, Map<String, Map<String, Integer>> indexs, Map<String, List<String[]>> datas,String  workorder_no,String CVSFileName) throws Exception {
       String sql="";
		String destFilePath = getDestFilePath(info.fileName, cityId);

		if (destFilePath.contains("${index}")) {
			destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
		}

		boolean bFlag = info.fileName.toLowerCase().contains(".csv");

		boolean b = task.getTemplet().includeValidate();

		// 如果是 isrelated=1 ， 则认为， 这个 mapping 是取 附件
		if (info.isRelated) {

			Map<String, FtpFileUnit> map = new HashMap<String, FtpFileUnit>();

			// 对 fileParaSql 进行处理， 把需要上传的文件名取出。
			Map<String, String> fname = new HashMap<String, String>();
			if (StringUtil.isNotNull(info.fileParaSql)) {

				// sql 中的参数进行替换
				sql = ConstDef.ParseFilePathForDB(info.fileParaSql, new Timestamp(task.getCurrDataTime().getTime()));
				sql=sql.replace("${经典案例工单编号}", workorder_no); 
				
				LOG.debug("fileParaSql :" +sql);

				rs = ps.executeQuery(sql);

				String[] headLine = resultService.getColumnNames(rs);
				String[] values = null;

				while (rs.next()) {

					values = resultService.getColumnValues(rs, bFlag);

					if (values == null)
						continue;
					// 把查询出的第一个值， 作为key, 因为 第一个值可能出重复， 所以加上其它信息
					String key = values[0] + java.util.UUID.randomUUID().toString();

					int i = 0;

					// ftpsource 中的 列表
					List<String> ftpnameList = new ArrayList<String>(info.ftpnameList);

					String tmpfile = new String(destFilePath);

					// ftpsource 中的 name 属性
					String cfile = new String(info.compressFile);
					//cfile = getDestFilePath(cfile, cityId);
					// 把ftp文件列表中的参数都替换
					for (String fieldname : headLine) {
						tmpfile = tmpfile.replace("${" + fieldname.toLowerCase() + "}", values[i]);

						// 对于 附件压缩名称， 进行替换。
						cfile = cfile.toUpperCase().replace("${" + fieldname.toUpperCase() + "}", values[i]);
					
						
						for (int ii = 0; ii < ftpnameList.size(); ii++) {
							cfile=cfile.toUpperCase().replace("${" + fieldname.toUpperCase()  + "}", values[i]);
					     	String sFile = ftpnameList.get(ii); 
							sFile = sFile.toLowerCase().replace("${" + fieldname.toLowerCase() + "}", values[i]);
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
			Map<String, String> ftpFiles = ftpFileProcess(dstmp, cityId,info.fileName,CVSFileName);
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

	public Map<String, String> ftpFileProcess(DS dstemp, String cityId,String fileName,String CVSFileName) throws Exception {

		Map<String, String> pathMap1 = new HashMap<String, String>();//

		FTPFileDS ds = (FTPFileDS) dstemp;

		ftpUnitMap = ds.getFtpFileUnitMap();
		LOG.debug("file down ftp info:" + ds.getIp());

		FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());

		String curDir = SysCfg.getInstance().getCurrentpath().replace("\\", "/");

		String dir = null;
		// 带有路径的 FTP文件名
		String ftpFname = null;
		// 不带路径的 FTP文件名
		String ftpFnam_nopath = null;
		Map<String, String> pathMap = new HashMap<String, String>();//
		FtpFileUnit ftpFileUnit_zipName = null;
		for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
			// 取 压缩包的名字 ，
			ftpFileUnit_zipName = ftpFileUnit;
			// 取出 KEY的值， 这个值也就是 CVS文件将在 生成的格式。

			for (String fName : ftpFileUnit.getFilenameList()) {

				// 多个附件名， 是用 ｜ 分隔
				// 前台的附件上传到FTP上，　是放在　Bulletin　目录下，写死的。

				fName = fName.replace("\\", "/");
				fName = fName.replace("//", "/");
				ftpFname = fName;
				fName = fName.substring(fName.lastIndexOf("/") + 1, fName.length());
				String[] ftpFnameList = fName.split("\\|");

				for (int i = 0; i < ftpFnameList.length; i++) {
					ftpFnam_nopath = ftpFnameList[i];
					if (null == ftpFnam_nopath || "".equals(ftpFnam_nopath)) {
						continue;
					}

					String localPath = curDir + File.separator + task.getId() + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					dir = localPath.substring(0, localPath.lastIndexOf("/"));
					File f = new File(dir);
					if (!f.exists())
						f.mkdirs();

					// String localFName = localPath + tmpFile;
					// 下载文件
					if (!ftpFname.startsWith("/")) {
						ftpFname = "/" + ftpFname;
					}
					DownStructer structer = ftp.downFile(ftpFname, dir);

					for (String fname : structer.getSuc()) {
						pathMap.put(fname, fname);
					}

				}
				ftp.closeConnect();

				// 只循环一次就退出来。
				break;

			}

		}

		if (dir != null && pathMap.size() > 0) {
			// 压缩文件 的文件名
			String zipFile =ftpFileUnit_zipName.getName().replace("PROVINCE_EN", "province_en"); 
			zipFile= getDestFilePath(zipFile, cityId);
			
			if (zipFile.contains("${index}")) {
				zipFile = zipFile.replace("${index}", BSAIndexMgr.getInstance().getIndex());
			}
			
			   
			//如果文件名 等于2或为3 ， 说明是上报 案例信息WORD文件 或是  html文件， 
			//理论上说， 附件中的  案例信息WORD文件 它的文件名，应该是符合规范的。 这里为了 保险，还是进行一下处理
			// 即：如果 案例信息WORD文件 与 符合规范  不一致，就对文件进行重命名。
			if("2".equals(fileName) || "3".equals(fileName)){
				Util.renameFile("", pathMap.values().toArray(new String[pathMap.values().size()])[0], zipFile);
				pathMap1.put(zipFile, zipFile);
				if("2".equals(fileName)){
					   WordName = zipFile;
				    
				}else{
					  HtmlName = zipFile; 
				}
				
			}else{
			if (StringUtil.isNotNull(zipFile)) {
				pathMap.put("CVSFileName", CVSFileName);
				if(WordName!=null && WordName.length()>0 ){
					pathMap.put("WordFileName", WordName);
				}
				if(HtmlName!=null && HtmlName.length()>0 ){
					pathMap.put("HtmlFileName", HtmlName);
				}
				
				Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile); 
				pathMap.clear();
				pathMap1.put(zipFile, zipFile);
			}
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