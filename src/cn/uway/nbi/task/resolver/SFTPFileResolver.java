package cn.uway.nbi.task.resolver;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.sftp.SFTPClient.SFTPFileEntry;
import cn.uway.nbi.sftp.SFTPUtils;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.task.ds.SFTPFileDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FilePackageInfo;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;

/**
 * SFTP型数据源解释器
 * 
 * @author litp 2011-5-18
 */
@IDMember(id = 203)
public class SFTPFileResolver extends LocalFileResolver {

	private static final Logger LOG = LoggerFactory.getLogger(SFTPFileResolver.class);
	
	private Map<String, String> pathMapResult = new HashMap<String, String>();
	private ResolverResult resolverResult = new ResolverResult();
	private Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
	private Map<String,String> localMap = new HashMap<String,String>();
	private boolean rtaskFlag = false;
	

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
				ftpRawUnitMap.put(filesId, ftpFileUnitTmp);
			}

		}
	}

	@Override
	public ResolverResult resolve() throws Exception {
		task.getLog().setInterConnStatus(300);
		resolverResult.setUploadFileInfoMap(recordCountMap);
		resolverResult.setLocalFileInfoMap(localMap);

		LOG.info(getLogInfo()+" 开始进行SFTP数据收集!");
		SFTPFileDS ds = (SFTPFileDS) getDs();

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

				dsExecutor.submit(new SFtpDownFile(ds,curDir,entity,latch));
			}
			dsExecutor.shutdown();
			latch.await();
		}
		catch(Exception e)
		{
			LOG.debug(getLogInfo()+" 下载文件失败");
		}
		finally
		{
			if(!dsExecutor.isShutdown())
				dsExecutor.shutdown();
		}
		
		if(rtaskFlag)
		{
			throw new Exception(getLogInfo()+" SFTP下载文件失败");
		}
		Map<String, FileInfo> infoMap = new HashMap<String, FileInfo>();
        try
        {
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
        catch(Exception e)
        {
        	task.getLog().setInterConnStatus(300);
			task.getLog().setErrorReason("打包文件失败，请根据日志检查具体原因!");
        	throw e;
        }
		resolverResult.getUploadFileInfoMap().putAll(infoMap);
		return resolverResult;
	}
	
	private class SFtpDownFile implements Runnable
	{
		private SFTPFileDS ds;
		private String curDir;
		private Entry<String, FtpFileUnit> entity;
		private CountDownLatch latch;
		public SFtpDownFile(SFTPFileDS ds,String curDir,Entry<String, FtpFileUnit> entity,CountDownLatch latch)
		{
			this.ds = ds;
			this.curDir = curDir;
			this.entity = entity;
			this.latch = latch;
		}
		public void run(){
			Map<String, String> pathMap = new HashMap<String, String>();
			Map<String, String> tempLocalMap = new HashMap<String, String>();
			FtpFileUnit ftpFileUnit = entity.getValue();
			
			SFTPUtils sftp = new SFTPUtils(ds.getId(),ds.getUsername(),ds.getPassword(),ds.getPort(),ds.getIp(),ds.getEncode(),ds.getMaxPoolSize());
			
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

					List<SFTPFileEntry> fileList = null;
					
					try
					{
						fileList = sftp.listFilesRecursive(ftpFname);
					}
					catch(Exception e)
					{
						task.getLog().setInterConnStatus(301);
						task.getLog().setErrorReason("请检查SFTP连接是否正常或是否有权限LIST数据!");
						throw e;
					}
					List<String> sftpFiles = sftp.downLoadFile(fileList, curDir);
					
					
					// 周期性任务失败时，需要生成补采任务时，直接抛出异常
					if((null == sftpFiles || sftpFiles.size()==0) )
					{
						task.getLog().setInterConnStatus(300);
						task.getLog().setErrorReason("FTP下载文件失败或该目录下没有所需文件，文件目录："+ftpFname);
						throw new Exception(getLogInfo()+" FTP下载文件失败或该目录下没有所需文件，文件目录："+ftpFname);
					}

					for (String tmp : sftpFiles) {
						pathMap.put(tmp, tmp);
					}
					// 文件上传后删除FTP下载下来的文
					putLocalMap(pathMap);
				}
				
				/* add by tyler 2016-03-16如果zipFile不为空，那么就返回打包的名称，否则返回下载的原始文件名 */
				try
				{
					if (StringUtil.isNotNull(zipFile)) {
						if(maxFileSize != 0)
						{
							String[] fileNames = pathMap.values().toArray(new String[pathMap.values().size()]);
							pathMap.clear();
							int fileSize = 0;
							List<String> packageFileNames = new ArrayList<String>();
							int partion = 0;
							String pFile = zipFile;
							for(int i=0;i<fileNames.length;i++)
							{
								int singleFileSize = sumFileSize(packageFileNames,fileNames[i]);
								fileSize += singleFileSize;
								
								// 单个文件（打包列表中已经有文件）或总大小超过最大压缩大小时，回退这个文件，打包这个文件前的文件列表
								if((singleFileSize > maxFileSize&&packageFileNames.size()>1) 
										|| (fileSize > maxFileSize&&packageFileNames.size()!=1))
								{
									packageFileNames.remove(fileNames[i]);
									i--;
								}
								
								if(fileSize >= maxFileSize || i==fileNames.length-1)
								{
									zipFile = ConstDef.replacePartion(zipFile, partion+"");
									// 获取打包前唯一文件名称
									zipFile = ConstDef.getUniqueFile(zipFile);
									Packer.pack(packageFileNames, zipFile);
									// 打包文件名称中的时间使用打包结束后的时间 
									zipFile = renameFile(zipFile,tempFileName,partion+"");
									// 多重打包时，删除低层文件
									tempLocalMap.put(zipFile,zipFile);
									pathMap.put(zipFile, zipFile);
									packageFileNames.clear();
									zipFile = pFile;
									fileSize = 0;
									partion++;
									
									if("file".equalsIgnoreCase(task.getLastPack()))
									{
										CheckListLog log = new CheckListLog();
										log.setFileCreateTime(new Date());
										log.setFileName(new File(zipFile).getName());
										task.getLogs().add(log);
									}
								}
							}
						}
						else
						{
							zipFile = ConstDef.replacePartion(zipFile, "0");
							// 获取打包前唯一文件名称
							zipFile = ConstDef.getUniqueFile(zipFile);
							Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile);
							// 打包文件名称中的时间使用打包结束后的时间 
							zipFile = renameFile(zipFile,tempFileName,"0");
							Map<String, String> pathMap_result = new HashMap<String, String>();//
							pathMap_result.put(zipFile, zipFile);
							pathMap.clear();
							pathMap.put(zipFile, zipFile);
							// 多重打包时，删除低层文件
							tempLocalMap.put(zipFile,zipFile);
							if("file".equalsIgnoreCase(task.getLastPack()))
							{
								CheckListLog log = new CheckListLog();
								log.setFileCreateTime(new Date());
								log.setFileName(new File(zipFile).getName());
								task.getLogs().add(log);
							}
						}
						
					}
				}
				catch(Exception e)
				{
					task.getLog().setInterConnStatus(300);
					task.getLog().setErrorReason("打包文件失败，请根据日志检查具体原因!");
					throw e;
				}
				
				putResult(pathMap);
				putLocalMap(tempLocalMap);
			} catch(Exception e){
				LOG.error(getLogInfo()+" FTP 方式 下载数据文件() 失败. ", ftpFileUnit.getFilenameList(), e);
				if(StringUtil.isNull(task.getLog().getErrorReason()))
				{
					task.getLog().setInterConnStatus(300);
					task.getLog().setErrorReason("未知异常，请根据日志检查具体原因!");
				}
				rtaskFlag = true;
			} finally {
				latch.countDown();
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
