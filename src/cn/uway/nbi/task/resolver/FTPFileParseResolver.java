package cn.uway.nbi.task.resolver;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.net.ftp.FTPFile;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.ucloud.util.MergeFile;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.task.ds.FTPFileParseDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FilePackageInfo;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;

/**
 * FTP型数据源解释器,读取小文件后合并成一个大文件
 * 
 * @author huzq 2016-11-29
 */
@IDMember(id = 208)
public class FTPFileParseResolver extends LocalFileResolver {

	private static final Logger LOG = LoggerFactory.getLogger(FTPFileParseResolver.class);
	
	private Map<String, String> pathMapResult = new HashMap<String, String>();
	private ResolverResult resolverResult = new ResolverResult();
	private Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
	private Map<String,String> localMap = new HashMap<String,String>();
	private boolean isCheckListLog = false;
	

	/**
	 * 解析resolve节点,因resolve节点下的内容结构不定，所以开放给子类
	 */
	@SuppressWarnings({"unused", "unchecked"})
	public void parseResolveNode() {

		List<Element> list = element.elements();

		int id = 0;
		for (Element ee : list) {
			String tagName = ee.getName();
			String rarname = ee.attributeValue("name");
			String filesId = ee.attributeValue("id");

			List<String> fnameList = new ArrayList<String>();
			FtpFileUnit ftpFileUnitTmp = new FtpFileUnit();// raw FTP

			ftpFileUnitTmp.setName(rarname);
			if ("files".equals(tagName)) {

				List<Element> filesElement = ee.elements();
				for (Element ele : filesElement) {
					String pname = ele.attributeValue("name");
					String file = ele.getText();
					if (StringUtil.isNotNull(file))
						fnameList.add(file);
				}
				ftpFileUnitTmp.setFilenameList(fnameList);

				// webservice
				Element ws = ee.element("ws");
				if (ws != null) {
					List<Element> wsProperty = ws.elements("property");
					WsInfo info = new WsInfo();
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
						} else if ("encode".equalsIgnoreCase(temp)) {
							if (StringUtil.isNull(value)) {
								value = "utf-8";
							}
							info.encode = value;
						}

					}
					ftpFileUnitTmp.setWsInfo(info);
				}
				ftpRawUnitMap.put(filesId, ftpFileUnitTmp);
			}

		}
	}

	@Override
	public ResolverResult resolve() throws Exception {
		task.getLog().setInterConnStatus(300);
		resolverResult.setUploadFileInfoMap(recordCountMap);
		resolverResult.setLocalFileInfoMap(localMap);

		LOG.info(this.getLogInfo()+" 开始进行FTP数据收集!");
		FTPFileParseDS ds = (FTPFileParseDS) getDs();

		ftpUnitMap = ds.getFtpFileUnitMap();

		String localdir = ds.getLocalDownPath();

		String curDir = null;

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
			// ftpUnitMap.put(ftpFileUnit.getKey(), ftpFileUnit);
			ftpUnitMap.putAll(ftpRawUnitMap);
		}
		
		int serviceSize = SysCfg.getInstance().getFtpThreads() < ftpRawUnitMap.size()?SysCfg.getInstance().getFtpThreads():ftpRawUnitMap.size();
		ExecutorService dsExecutor = Executors.newFixedThreadPool(serviceSize);
		CountDownLatch latch = new CountDownLatch(ftpRawUnitMap.size());
		// for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
		try
		{
			for (Entry<String, FtpFileUnit> entity : ftpRawUnitMap.entrySet()) {

				dsExecutor.submit(new FtpDownFile(ds,curDir,entity,latch));
			}
			dsExecutor.shutdown();
			latch.await();
		}
		catch(Exception e)
		{
			LOG.debug(this.getLogInfo()+" 下载文件失败");
		}
		finally
		{
			if(!dsExecutor.isShutdown())
				dsExecutor.shutdown();
		}
		
		if(isCheckListLog)
		{
			throw new Exception(this.getLogInfo()+" FTP下载文件失败");
		}
		Map<String, FileInfo> infoMap = new HashMap<String, FileInfo>();
		try{
			// 解析器节点中是否有打包属性(package_name)
			if (StringUtil.isNull(packageNameResolver)) {

				if (pathMapResult != null && !pathMapResult.isEmpty()) {
					Iterator<Entry<String, String>> it = pathMapResult.entrySet().iterator();
					while (it.hasNext()) {
						Entry<String, String> entity = it.next();
						FileInfo fileInfo = new FileInfo();
						fileInfo.setFileName(entity.getValue());
						fileInfo.setCount(999999);
						infoMap.put(entity.getKey(), fileInfo);
					}
				}
			} else {

				// 解析器中配置了打包属性，如果配置了打包属性，这将files中的所有节点打包为resolve 中的打包
				if (StringUtil.isNotNull(packageNameResolver)) {
					String destFilePath = new String(packageNameResolver);

					String packageNameTmp = new String(destFilePath);
					boolean isValidate = task.getTemplet().includeValidate();
					boolean isLoop = task.getTemplet().getInclude().isLoop();
					if (!isValidate || !isLoop) {

						// 目前只替换省份的展位符
						packageNameTmp = ProvinceNameMgr.replaceProvince(packageNameTmp, task.getTemplet().getInclude().getProviceMap());
						packageNameTmp = ConstDef.replaceRc(packageNameTmp, task);
						packageNameTmp = processParaMap(packageNameTmp, "${", "}", null);
						packageNameTmp = SysCfg.getInstance().getCurrentpath() + File.separator + packageNameTmp;
						String resolvePackageName = packageNameTmp;
						packageNameTmp = ConstDef.ParseFilePath(packageNameTmp, new Timestamp(task.getCurrDataTime().getTime()));
						FilePackageInfo tmpInfo = Packer.getFilePackExt(packageNameTmp);
						// 如果是文件扩展名，则打包
						if (tmpInfo.isFileExt()) {
							// 将files节点中的所有的文件都打包成
							List<String> fileList = new ArrayList<String>();
							fileList.addAll(pathMapResult.values());
							int maxFileSize = SysCfg.getInstance().getMaxFileSize();
							if(maxFileSize != 0)
							{
								int fileSize = 0;
								List<String> packageFileNames = new ArrayList<String>();
								int partion = 0;
								String pFile = packageNameTmp;
								for(int i=0;i<fileList.size();i++)
								{
									int singleFileSize = sumFileSize(packageFileNames,fileList.get(i));
									fileSize += singleFileSize;
									// 单个文件（打包列表中已经有文件）或总大小超过最大压缩大小时，回退这个文件，打包这个文件前的文件列表
									if((singleFileSize > maxFileSize&&packageFileNames.size()>1) 
											|| (fileSize > maxFileSize&&packageFileNames.size()!=1))
									{
										packageFileNames.remove(fileList.get(i));
										i--;
									}
									if(fileSize >= maxFileSize || i==fileList.size()-1)
									{
										packageNameTmp = ConstDef.replacePartion(packageNameTmp, partion+"");
										// 获取打包前唯一文件名称
										packageNameTmp = ConstDef.getUniqueFile(packageNameTmp);
										
										Packer.pack(packageFileNames, packageNameTmp);
										
										packageNameTmp = renameFile(packageNameTmp,resolvePackageName,partion+"");
										if("resolve".equalsIgnoreCase(task.getLastPack()))
										{
											CheckListLog log = new CheckListLog();
											log.setFileCreateTime(new Date());
											log.setFileName(new File(packageNameTmp).getName());
											task.getLogs().add(log);
										}
										
										FileInfo fileInfo = new FileInfo();
										fileInfo.setFileName(packageNameTmp);
										fileInfo.setCount(999999);
										infoMap.put(packageNameTmp, fileInfo);
										// 多重打包时，删除低层文件
										localMap.put(packageNameTmp,packageNameTmp);
										packageFileNames.clear();
										packageNameTmp = pFile;
										fileSize = 0;
										partion++;
									}
								}
							}
							else
							{
								packageNameTmp = ConstDef.replacePartion(packageNameTmp, "0");
								// 获取打包前唯一文件名称
								packageNameTmp = ConstDef.getUniqueFile(packageNameTmp);
								Packer.pack(fileList, packageNameTmp);
								packageNameTmp = renameFile(packageNameTmp,resolvePackageName,"0");
								if("resolve".equalsIgnoreCase(task.getLastPack()))
								{
									CheckListLog log = new CheckListLog();
									log.setFileCreateTime(new Date());
									log.setFileName(new File(packageNameTmp).getName());
									task.getLogs().add(log);
								}
								FileInfo fileInfo = new FileInfo();
								fileInfo.setFileName(packageNameTmp);
								fileInfo.setCount(999999);
								infoMap.put(packageNameTmp, fileInfo);
								// 多重打包时，删除低层文件
								localMap.put(packageNameTmp,packageNameTmp);
								
							}
							
						}
					}
				}
			}
		}
		catch(Exception e){
			task.getLog().setInterConnStatus(300);
			task.getLog().setErrorReason("打包文件失败，请根据日志检查具体原因!");
			throw e;
		}
		
		resolverResult.getUploadFileInfoMap().putAll(infoMap);
		return resolverResult;
	}
	
	private class FtpDownFile implements Runnable
	{
		private FTPFileParseDS ds;
		private String curDir;
		private Entry<String, FtpFileUnit> entity;
		private CountDownLatch latch;
		public FtpDownFile(FTPFileParseDS ds,String curDir,Entry<String, FtpFileUnit> entity,CountDownLatch latch)
		{
			this.ds = ds;
			this.curDir = curDir;
			this.entity = entity;
			this.latch = latch;
		}
		public void run(){
			List<String> pathList = new ArrayList<String>();
			Map<String, String> pathMap = new HashMap<String,String>();
			Map<String, String> tempLocalMap = new HashMap<String, String>();
			FtpFileUnit ftpFileUnit = entity.getValue();

			FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());
			
			ftp.login();
			
			String zipFile = ftpFileUnit.getName();
			String tempFileName = null;
			int maxFileSize = SysCfg.getInstance().getMaxFileSize();
			try {

				// 如果打包文件名不为空，则进行参数替换,例如省参数。
				if (zipFile != null && !"".equals(zipFile.trim())) {
					zipFile = ProvinceNameMgr.replaceProvince(zipFile, task.getTemplet().getInclude().getProviceMap());
					zipFile = processParaMap(zipFile, "${", "}", null);
					zipFile = ConstDef.replaceRc(zipFile, task);
					tempFileName = zipFile;
					zipFile = ConstDef.ParseFilePath(zipFile, new Timestamp(task.getCurrDataTime().getTime()));
					// 打包全路径名.
					zipFile = SysCfg.getInstance().getCurrentpath() + File.separator + zipFile;
					tempFileName = SysCfg.getInstance().getCurrentpath() + File.separator + tempFileName;
				}
				// 通过通配符下载数据文件
				for (String fName : ftpFileUnit.getFilenameList()) {

					fName=fName.trim();
					fName = ProvinceNameMgr.replaceProvince(fName, task.getTemplet().getInclude().getProviceMap());
					fName = processParaMap(fName, "${", "}", null);

					String tmpFile = ConstDef.ParseFilePath(fName, new Timestamp(task.getCurrDataTime().getTime()));
					String ftpFname = tmpFile;

					String localPath = curDir + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					String dir = localPath.substring(0, localPath.length() - ftpFname.length());
					File f = new File(dir);
					if (!f.exists())
						f.mkdir();

					// String localFName = localPath + tmpFile;
					// 下载文件
//					DownStructer result = ftp.downFile(ftpFname, dir);
					
					DownStructer result = null;

					List<FTPFile> fileList = null;
					
					try
					{
						String space = ftpFname.substring(ftpFname.indexOf("_")+1,ftpFname.indexOf("_")+2);
						List<String> fList =  preFiveMinute(ftpFname,Integer.valueOf(space));
						fileList = ftp.listFilesRecursive(ftpFname);
						//查找5或 15分钟内的所有文件
						for(String fl : fList){
							List<FTPFile> tempfileList = ftp.listFilesRecursive(fl);
							fileList.addAll(tempfileList);
						}
					}
					catch(Exception e)
					{
						task.getLog().setInterConnStatus(301);
						task.getLog().setErrorReason("请检查FTP连接是否正常或是否有权限LIST数据!");
						throw e;
					}
					LOG.debug("FTP list resource size +"+fileList.size());
					result =ftp.downLoadFile(fileList, curDir);
					
					
					// 周期性任务失败时，需要生成补采任务时，直接抛出异常
					if(null == result || result.getSuc().size()==0)
					{
						task.getLog().setInterConnStatus(300);
						task.getLog().setErrorReason("FTP下载文件失败或该目录下没有所需文件，文件目录："+ftpFname);
						throw new Exception(getLogInfo()+" FTP下载文件失败或该目录下没有所需文件，文件目录："+ftpFname);
					}

					for (String tmp : result.getSuc()) {
						pathMap.put(tmp, tmp);
						pathList.add(tmp);
					}
					
					//下载成功后，删附近ftp上的文件
					ftp.deleteDownloadedFile();
					//合并文件
					pathMap = MergeFile.getInstance().merge(pathList,zipFile);

					// 文件上传后删除FTP下载下来的文
					putLocalMap(pathMap);
				}
				
				try{
					/* add by tyler 2016-03-16如果zipFile不为空，那么就返回打包的名称，否则返回下载的原始文件名 */
					if (StringUtil.isNotNull(zipFile)) {
						if(maxFileSize != 0)
						{
							String[] fileNames = pathMap.values().toArray(new String[pathMap.values().size()]);
							pathMap.clear();
							for(int i=0;i<fileNames.length;i++)
							{
								String fname = fileNames[i];
								String pressName = fname.substring(0,fname.lastIndexOf("."))+
										zipFile.substring(zipFile.lastIndexOf("."),zipFile.length());
								if(pressName.contains(".gz") || pressName.contains(".GZ")){
									Packer.pack(new String[]{fileNames[i]}, pressName,true);
								}else{
									Packer.pack(new String[]{fileNames[i]}, pressName);
								}
								Packer.pack(new String[]{fileNames[i]}, pressName);
								pathMap.put(pressName, pressName);
							}
							
						}
//							else
//						{
//							zipFile = ConstDef.replacePartion(zipFile, "0");
//							// 获取打包前唯一文件名称
//							zipFile = ConstDef.getUniqueFile(zipFile);
//							Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile);
//							// 打包文件名称中的时间使用打包结束后的时间 
////							zipFile = renameFile(zipFile,tempFileName,"0");
//							if("files".equalsIgnoreCase(task.getLastPack()))
//							{
//								CheckListLog log = new CheckListLog();
//								log.setFileCreateTime(new Date());
//								log.setFileName(new File(zipFile).getName());
//								task.getLogs().add(log);
//							}
//							Map<String, String> pathMap_result = new HashMap<String, String>();//
//							pathMap_result.put(zipFile, zipFile);
//							pathMap.clear();
//							pathMap.put(zipFile, zipFile);
//							// 多重打包时，删除低层文件
//							tempLocalMap.put(zipFile,zipFile);
//							
//						}
						
					}
				}
				catch(Exception e){
					task.getLog().setInterConnStatus(300);
					task.getLog().setErrorReason("打包文件失败，请根据日志检查具体原因!");
		        	throw e;
				}
				putResult(pathMap);
				putLocalMap(tempLocalMap);
			} catch (Exception e) {
				task.getLog().setInterConnStatus(300);
				if(StringUtil.isNull(task.getLog().getErrorReason()))
				{
					task.getLog().setErrorReason("未知异常，请根据日志检查具体原因!");
				}
				LOG.error(getLogInfo()+" FTP 方式 下载数据文件() 失败. ", ftpFileUnit.getFilenameList(), e);
				// 周期性任务失败时，需要生成补采任务直接抛出异常
				isCheckListLog = true;
			} finally {
				latch.countDown();
				if (ftp != null)
					ftp.closeConnect();
			}
		}
		
	}
	
	private void putResult(Map<String,String> map)
	{
		synchronized(pathMapResult)
		{
			pathMapResult.putAll(map);
		}
	}
	
	private void putLocalMap(Map<String,String> map)
	{
		synchronized(localMap)
		{
			localMap.putAll(map);
		}
	}
	
	private String renameFile(String beforeFile,String afterFile,String partion)
	{
		// 打包文件名称中的时间使用打包结束后的时间 
		if(!SysCfg.getInstance().isStartFileTime())
		{
			File tempFile = new File(beforeFile);
			if(tempFile.exists())
			{
				beforeFile = ConstDef.replacePartion(afterFile, partion);
				beforeFile = ConstDef.ParseFilePath(beforeFile, new Timestamp(new Date().getTime()));
				// 获取打包后唯一文件名称
				beforeFile = ConstDef.getUniqueFile(beforeFile); 
				tempFile.renameTo(new File(beforeFile));
			}
			
		}
		return beforeFile;
	}
	
	/**
	 * 获取当前查找的时间通配符以space下的时间通配符文件名
	 * @param ftpFname
	 * @param space 时间间隔，5分钟还是15分钟
	 * @return
	 */
	private List<String> preFiveMinute(String ftpFname,int space){
		List<String> list = new ArrayList<String>();
		if(ftpFname == null){
			return null;
		}
		String[] paths = ftpFname.split("/");
		String fileName = paths[paths.length-1];
		String time = fileName.substring(0,fileName.indexOf("_"));
		for(int i = 1 ; i < space; i++){
			String temp = getMinusData(time,String.valueOf(i));
			String newName = ftpFname.substring(0,ftpFname.lastIndexOf("/")+1)+temp+fileName.substring(fileName.indexOf("_"),fileName.length());
			list.add(newName);
		}
		
		return list;
	}
	
	/**
	 *  计算当前时间前的时间
	 * @param data 当前时间
	 * @param plusVal 比当前时间少几分钟，单位是分钟
	 * @return
	 */
	private   String getMinusData(String data,String plusVal){
		int val = 0;
		if(null != plusVal ){
			val = Integer.valueOf(plusVal);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");    
		Date d = null;
		try {
			d = sdf.parse(data);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(Calendar.MINUTE,-val);
		return sdf.format(calendar.getTime());
	}
	
	private int sumFileSize(List<String> packageFileNames,String fileName)
	{
		FileInputStream fis = null;
		File file = null;
		int fileSize = 0;
		try{
			file = new File(fileName);
			if(file.exists()){
				packageFileNames.add(fileName);
				fis = new FileInputStream(file);
				fileSize = fis.available();
			}
		}
		catch(Exception e){}
		finally{
			try{
				if(fis != null){
					fis.close();
				}
			}
			catch(Exception e){}	
		}
		return fileSize;
	}
}
