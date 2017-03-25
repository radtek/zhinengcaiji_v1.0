package cn.uway.nbi.task.t;

import static cn.uway.nbi.util.ConstDef.F_SEP;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.ucloud.util.MergeFile;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.task.resolver.FileInfo;
import cn.uway.nbi.task.resolver.Resolver;
import cn.uway.nbi.task.resolver.ResolverResult;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.DateTimeUtils;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;

/**
 * 传输对象
 * 
 * @author YangJian
 * @since 1.0
 */
public class TO {

	private int id; // 传输对象编号
	
	private int actionId;

	private List<Resolver> resolvers; // 解释器集

	/**
	 * to节点中的包名
	 */
	private String packerName;// 打包文件名
	
	private String checkName;
	
	private String xmlName;
	
	private String chkName;
	
	private String finishTime;

	private Map<String, String> unPackerFileName;// 打包之前的临时文件名，上传后删除本地文件

	//
	private Task task;
	
	private boolean rtaskFlag = false;

	// Map<模板中的文件名,临时文件存在的绝对路径>
	// private Map<String, String> allDataFiles;// 所有的数据文件，如果需要打包，那么就为打包的原始文件名

	// private Map<String, FileInfo> allDataFiles;// 所有的数据文件，如果需要打包，那么就为打包的原始文件名

	private Map<Integer, Map<String, FileInfo>> toUploadFileMap;// 所有的数据文件，如果需要打包，那么就为打包的原始文件名

	private List<FileInfo> uploadFileResultList;

	private String packFilePath;// 打包后的绝对路径名

	private static Logger LOG = LoggerFactory.getLogger(TO.class);

	private static final String CURRPATH = SysCfg.getInstance().getCurrentpath();

	private static String _R_N = "\r\n";
	
	// 统计数据库生成到文件中的记录总数
	private long totalRecord = 0;


	public TO() {
		// allDataFiles = new HashMap<String, FileInfo>();

		uploadFileResultList = new ArrayList<FileInfo>();

		toUploadFileMap = new HashMap<Integer, Map<String, FileInfo>>();

		unPackerFileName = new HashMap<String, String>();
	}

	/**
	 * 处理所有的数据
	 */
	public void resolve() throws Exception {
		processData();
		packing();
		// 文件个数
		if(uploadFileResultList.size() > 0)
		{
			createXmlFile(uploadFileResultList.size());
			createCheckFile();
			createChkFile();
		}
		
	}
	
	/**
	 * 生成chk文件,保存文件名，精准化平台需求
	 */
	private void createChkFile(){
		if(!StringUtil.isNull(chkName))
		{
			String fn = MergeFile.getInstance().createChkFile(uploadFileResultList);
			// 将生成的文件加入要上传的列表
			FileInfo fileInfo = new FileInfo();
			fileInfo.setFileName(fn);
			uploadFileResultList.add(fileInfo);
		}
	}
	/**
	 * cba接口生成check文件
	 */
	private void createCheckFile() throws Exception
	{
		if(!StringUtil.isNull(checkName))
		{
			FileWriter fw = null;
			try
			{
				String dir = SysCfg.getInstance().getCurrentpath()+File.separator+task.getId()+File.separator;
				checkName = ConstDef.ParseFilePath(checkName, new Timestamp(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
				File checkFile = new File(dir+checkName);
				fw = new FileWriter(checkFile);
				if(StringUtil.isNull(finishTime))
				{
					finishTime = "Finish Time:%%Y%%M%%D %%h:%%m:%%s";
				}
				fw.write(ConstDef.ParseFilePath(finishTime, new Timestamp(new Date().getTime())));
				fw.flush();
				
				// 将生成的文件加入要上传的列表
				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileName(dir+checkName);
				uploadFileResultList.add(fileInfo);
			}
			catch(Exception e)
			{
				LOG.info(getInfo()+"生成check文件失败："+e);
			}
			finally
			{
				if(fw != null)
				{
					fw.close();
				}
			}
		}
	}
	
	/**
	 * cba接口生成check文件
	 */
	private void createXmlFile(int size) throws Exception
	{
		if(!StringUtil.isNull(xmlName))
		{
			
			String xmlPath = ConstDef.TEMPLET_PATH_FOR_TASK+xmlName;
			File file = new File(xmlPath);
			if (!file.exists() || !file.isFile()) {
				LOG.debug("File not found. xml file = "
						+ xmlPath);
				return;
			}

			Document document = null;
			SAXReader reader = new SAXReader();
			FileInputStream input = null;
			try {
				input = new FileInputStream(xmlPath);
				reader.setEncoding(SysCfg.getInstance().getCbaEncoding());
				document = reader.read(input);
			} catch (Exception e) {
				LOG.error("载入xml文件时发生异常", e);
			} finally {
				if (input != null) {
					try {
						input.close();
					} catch (IOException e) {
					}
				}
			}

			List<Element> elList = (List<Element>) document.selectNodes("beans/bean/property");
			String name = null;
			
			// 根据模板修改相应节点的值
			for(Element el: elList)
			{
				name = el.attributeValue("name");
				if("expRowNum".equals(name))
				{
					Element e = el.element("value");
					e.setText(String.valueOf(totalRecord));
				}
				else if("dataFileSeqList".equals(name))
				{
					StringBuffer buffer = new StringBuffer();
					for(int i=1;i<=size;i++)
					{
						buffer.append(i);
						if(i!=size)
						{
							buffer.append(",");
						}
					}
					Element e = el.element("value");
					e.setText(buffer.toString());
				}else if("taskID".equals(name))
				{
					Element e = el.element("value");
					e.setText(String.valueOf(task.getLog().getTaskId()));
				}
				else if("dataTime".equals(name))
				{
					Element e = el.element("value");
					e.setText(DateTimeUtils.getFormat(task.getCurrDataTime()));
				}
				else if("dataType".equals(name))
				{
					Element e = el.element("value");
					e.setText(task.getLog().getDataType());
				}
				else if("filePath".equals(name))
				{
					Element e = el.element("value");
					e.setText(task.getLog().getFilePath());
				}
				else if("uploadFileCount".equals(name))
				{
					Element e = el.element("value");
					e.setText(String.valueOf(uploadFileResultList.size()));
				}
			}
			FileWriter out = null;
			try
			{
				// 将修改后document内容写到新的xml中
				xmlName = ConstDef.ParseFilePath(xmlName, new Timestamp(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
				String dir = SysCfg.getInstance().getCurrentpath()+File.separator+task.getId()+File.separator;
				out = new FileWriter(dir+xmlName);
				document.write(out);
				out.flush();
				
				// 将生成的文件加入要上传的列表
				FileInfo fileInfo = new FileInfo();
				fileInfo.setFileName(dir+xmlName);
				uploadFileResultList.add(fileInfo);
			}
			catch(Exception e)
			{
				LOG.info(getInfo()+"生成xml文件失败："+e);
			}
			finally
			{
				if(out != null)
				{
					out.close();
				}
			}
		}
	}

	/**
	 * 解析to的数据(调用Resolver解析数据的方法)
	 */
	private void processData() throws Exception {
		LOG.info(getInfo()+"开始收集数据.");
		int serviceSize = SysCfg.getInstance().getResolveThreads() < resolvers.size()?SysCfg.getInstance().getResolveThreads():resolvers.size();
		ExecutorService dsExecutor = Executors.newFixedThreadPool(serviceSize);
		CountDownLatch latch = new CountDownLatch(resolvers.size());
		try
		{
			for (Resolver r : resolvers) {
				r.setLogInfo(this.getInfo());
				dsExecutor.submit(new ResolveThread(latch,r));
			}
			dsExecutor.shutdown();
			latch.await();
		}
		catch(Exception e)
		{
			LOG.debug(getInfo()+" resolve下载文件失败");
		}
		finally
		{
			if(!dsExecutor.isShutdown())
				dsExecutor.shutdown();
		}
		if(rtaskFlag)
		{
			throw new Exception(getInfo()+" 收集数据失败.");
		}
	}
	
	private class ResolveThread implements Runnable
	{
		private CountDownLatch latch;
		private Resolver r;
		public ResolveThread(CountDownLatch latch,Resolver r)
		{
			this.latch = latch;
			this.r = r;
		}
		@Override
		public void run() {
			try{
				r.parseResolveNode();
				ResolverResult result = r.resolve();
	                
				Map<String, FileInfo> fileInfoMap = result.getUploadFileInfoMap();

				// Map<String, String> fNames = result.getUploadFileMap();
				// allDataFiles.putAll(fileInfoMap);
				if (r.getControllog() != null) {
					String log = outControlLog(fileInfoMap, r);

					FileInfo fileInfo = new FileInfo();
					fileInfo.setFileName(log);
					fileInfo.setCount(999999);
					// allDataFiles.put(log, fileInfo);

					// add on 20131206
					fileInfoMap.put(log, fileInfo);
					// end add
				}
				// FTP下载下来的文件，上传完成后删除
				if(null != result.getLocalFileInfoMap())
				{
					unPackerFileName.putAll(result.getLocalFileInfoMap());
				}
				putUploadFile(r.hashCode(),fileInfoMap);
			}
			catch(Exception e)
			{
				LOG.info(getInfo()+" 收集数据失败，原因:"+e);
				rtaskFlag = true;
			}
			finally
			{
				latch.countDown();
			}
			
		}
	}
	
	private void putUploadFile(int hash,Map<String,FileInfo> fileInfoMap)
	{
		synchronized(toUploadFileMap)
		{
			toUploadFileMap.put(hash, fileInfoMap);
		}
	}

	public String outControlLog(Map<String, FileInfo> fNames, Resolver r) throws IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(Calendar.getInstance().getTime());

		String outFile = CURRPATH + F_SEP + r.getControllog();
		FileWriter fw = null;
		try {
			fw = new FileWriter(outFile);
			for (FileInfo f : fNames.values()) {
				File file = new File(f.getFileName());
				if (file.exists()) {
					fw.write("[" + file.getName() + "]" + _R_N);
					fw.write("  TIME=" + time + _R_N);
					fw.write("  SIZE=" + file.length() + _R_N);
					fw.write("  MD5=" + Util.getSHA1OrMD5(file, "MD5") + _R_N);
					// fw.write("  sha1=" + Util.getSHA1OrMD5(file, "SHA-1") +
					// _R_N);
					// fw.write("  crc32=" + Util.getCRC32(file) + _R_N);
					fw.flush();
				}
			}

		} finally {
			if (fw != null)
				fw.close();
		}
		return outFile;

	}

	/**
	 * 将解析后的文件打包
	 * 
	 * @return
	 */
	private void packing() throws Exception{
		if (StringUtil.isNull(packerName)) {

			Map<String, FileInfo> mFileInfo = new HashMap<String, FileInfo>();

			// Set<Entry<String, FileInfo>> set = allDataFiles.entrySet();

			for (Map<String, FileInfo> enMap : toUploadFileMap.values()) {

				for (Entry<String, FileInfo> en : enMap.entrySet()) {

					// for (Entry<String, FileInfo> en : set) {
					totalRecord += en.getValue().getCount();
					String key = en.getKey();
					String val = en.getValue().getFileName();

					FileInfo fileInfo1 = new FileInfo();
					fileInfo1.setFileName(val);
					fileInfo1.setDirName(en.getValue().getDirName());
					fileInfo1.setCount(en.getValue().getCount());
					fileInfo1.setDataType(en.getValue().getDataType());

					// 一般通过key来确定打包名。
					if (Util.isPackageExt(key) && !key.equalsIgnoreCase(val)) {
						// String ext = Util.getPackageExt(key);
						// String valpack = val + ext;
						// Packer.pack(Arrays.asList(val), valpack);
						String ext = Util.getPackageExt(key);
						String valpack = val + ext;

						FileInfo fileInfo = new FileInfo();
						fileInfo.setFileName(valpack);
						fileInfo.setDirName(en.getValue().getDirName());
						fileInfo.setCount(en.getValue().getCount());
						fileInfo.setDataType(en.getValue().getDataType());

						if (!task.getTempletPath().contains("协调单")) {
							File f = new File(val);
							if (f.exists() && f.length() > 0) {
								/*
								 * valpack = valpack.replace("\\", "/"); Packer.pack(Arrays.asList(val), valpack);
								 * 
								 * FileInfo fileInfoPK = new FileInfo(); fileInfoPK.setFileName(valpack);
								 * fileInfoPK.setCount(en.getValue().getCount());
								 * 
								 * fileInfoPK.setDataType(en.getValue() .getDataType());
								 * 
								 * // m.put(key, valpack);
								 * 
								 * mFileInfo.put(key, fileInfoPK);
								 */

								// add on 20140228
								String valFile = val.replace("\\", "/");
								FileInfo fileInfoVal = new FileInfo();
								fileInfoVal.setFileName(valFile);
								fileInfoVal.setDirName(en.getValue().getDirName());
								fileInfoVal.setCount(en.getValue().getCount());

								fileInfoVal.setDataType(en.getValue().getDataType());
								mFileInfo.put(key, fileInfoVal);
							}
						} else {
							// m.put(key, valpack);
							mFileInfo.put(key, fileInfo);
						}

						unPackerFileName.put(key, val);
					} else {
						mFileInfo.put(key, fileInfo1);
					}
				}
			}

			uploadFileResultList.addAll(mFileInfo.values());
			return;
		} else {
			/**
			 * <pre>
			 * 
			 * packerName = ConstDef.ParseFilePath(packerName, new Timestamp(task.getCurrDataTime().getTime()));
			 * this.packFilePath = SysCfg.getInstance().getCurrentpath() + F_SEP + packerName;
			 * 
			 * List&lt;String&gt; infos = new ArrayList&lt;String&gt;();
			 * 
			 * for (FileInfo info : allDataFiles.values()) {
			 * 	infos.add(info.getFileName());
			 * }
			 * Packer.pack(new ArrayList&lt;String&gt;(infos), packFilePath);
			 * 
			 * </pre>
			 */
			try{
				// 判断是否解析器解析后，产生的所有上报文件打包再进行上传
				packerName = ConstDef.replaceRc(packerName, task);
				String toPackageName = packerName;
				packerName = ConstDef.ParseFilePath(packerName, new Timestamp(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
				this.packFilePath = SysCfg.getInstance().getCurrentpath() + F_SEP + packerName;
				toPackageName = SysCfg.getInstance().getCurrentpath() + F_SEP + toPackageName;

				List<String> upLoadList = new ArrayList<String>();

				for (Map<String, FileInfo> fileInfoMap : toUploadFileMap.values()) {

					for (FileInfo info : fileInfoMap.values()) {
						totalRecord += info.getCount();
						upLoadList.add(info.getFileName());
					}
				}
				int maxFileSize = SysCfg.getInstance().getMaxFileSize();
				if(maxFileSize != 0)
				{
					int fileSize = 0;
					List<String> packageFileNames = new ArrayList<String>();
					int partion = 0;
					String pFile = packFilePath;
					for(int i=0;i<upLoadList.size();i++)
					{
						int singleFileSize = sumFileSize(packageFileNames,upLoadList.get(i));
						fileSize += singleFileSize;
						// 单个文件（打包列表中已经有文件）或总大小超过最大压缩大小时，回退这个文件，打包这个文件前的文件列表
						if((singleFileSize > maxFileSize&&packageFileNames.size()>1) 
								|| (fileSize > maxFileSize&&packageFileNames.size()!=1))
						{
							packageFileNames.remove(upLoadList.get(i));
							i--;
						}
						if(fileSize >= maxFileSize || i==upLoadList.size()-1)
						{
							packFilePath = ConstDef.replacePartion(packFilePath, partion+"");
							// 获取打包前唯一文件名称
							packFilePath = ConstDef.getUniqueFile(packFilePath);
							// 进行压缩
							Packer.pack(packageFileNames, packFilePath);
							packFilePath = renameFile(packFilePath,toPackageName,partion+"");
							
							if("to".equalsIgnoreCase(task.getLastPack()))
							{
								CheckListLog log = new CheckListLog();
								log.setFileCreateTime(new Date());
								log.setFileName(new File(packFilePath).getName());
								task.getLogs().add(log);
							}
							FileInfo fileInfo = new FileInfo();
							fileInfo.setFileName(packFilePath);
							fileInfo.setCount(999999);
							uploadFileResultList.add(fileInfo);
							packageFileNames.clear();
							packFilePath = pFile;
							fileSize = 0;
							partion++;
						}
					}
				}
				else
				{
					packFilePath = ConstDef.replacePartion(packFilePath, "0");
					// 获取打包前唯一文件名称
					this.packFilePath = ConstDef.getUniqueFile(packFilePath); 
					
					// 进行压缩
					Packer.pack(new ArrayList<String>(upLoadList), packFilePath);
					packFilePath = renameFile(packFilePath,toPackageName,"0");
					
					if("to".equalsIgnoreCase(task.getLastPack()))
					{
						CheckListLog log = new CheckListLog();
						log.setFileCreateTime(new Date());
						log.setFileName(new File(packFilePath).getName());
						task.getLogs().add(log);
					}
					FileInfo fileInfo = new FileInfo();
					fileInfo.setFileName(packFilePath);
					fileInfo.setCount(999999);
					uploadFileResultList.add(fileInfo);
				}
			}
			catch(Exception e){
				task.getLog().setErrorReason("打包文件失败，请根据日志检查具体原因!");
				throw e;
			}
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

	/**
	 * 获取需要上传的文件名
	 * 
	 * @return
	 */
	public List<FileInfo> getUploadFilesList() {
		return uploadFileResultList;
	}

	/**
	 * 获取需要上传的文件名
	 * 
	 * @return
	 */
	/*
	 * public List<FileInfo> getUploadFiles() { List<FileInfo> list = new ArrayList<FileInfo>(); if (StringUtil.isNotNull(packFilePath)) { FileInfo
	 * fileInfo = new FileInfo(); fileInfo.setFileName(packFilePath); fileInfo.setCount(999999);
	 * 
	 * list.add(fileInfo); } else { list.addAll(allDataFiles.values()); } return list; }
	 */
	/**
	 * 获取所的文件名
	 * 
	 * @return
	 */
	public List<String> getAllFiles() {

		List<String> infos = new ArrayList<String>();

		for (FileInfo info : uploadFileResultList) {
			infos.add(info.getFileName());
		}
		return infos;
	}

	/**
	 * 获取所的文件名
	 * 
	 * @return
	 */
	/*
	 * public List<String> getAllFiles() { List<String> list = new ArrayList<String>(); if (StringUtil.isNotNull(packFilePath))
	 * list.add(packFilePath);
	 * 
	 * List<String> infos = new ArrayList<String>();
	 * 
	 * for (FileInfo info : allDataFiles.values()) { infos.add(info.getFileName()); } list.addAll(infos); return list; }
	 */
	public Map<String, String> getUnPackerFileName() {
		return unPackerFileName;
	}
	
	private String getInfo()
	{
		return "任务ID:"+task.getId()+" action id:"+this.id+" to id:"+this.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
		for (Resolver r : resolvers)
			r.setTask(task);
	}

	public List<Resolver> getResolvers() {
		return resolvers;
	}

	public void setResolvers(List<Resolver> resolvers) {
		this.resolvers = resolvers;
	}

	public String getPackerName() {
		return packerName;
	}

	public void setPackerName(String packerName) {
		this.packerName = packerName;
	}

	public int getActionId() {
		return actionId;
	}

	public void setActionId(int actionId) {
		this.actionId = actionId;
	}

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	public String getXmlName() {
		return xmlName;
	}

	public void setXmlName(String xmlName) {
		this.xmlName = xmlName;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getChkName() {
		return chkName;
	}

	public void setChkName(String chkName) {
		this.chkName = chkName;
	}
	
}
