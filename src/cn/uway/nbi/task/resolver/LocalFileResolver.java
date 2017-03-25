package cn.uway.nbi.task.resolver;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpFileUnit.SingleFileEntry;
import cn.uway.nbi.task.ds.LocalFileDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FilePackageInfo;
import cn.uway.nbi.util.FileUtil;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;

/**
 * 本地文件型解释器
 * 
 * @author YangJian
 * @since 1.0
 */
@IDMember(id = 200)
public class LocalFileResolver extends Resolver {

	protected List<String> fnameList;

	private static final Logger LOG = LoggerFactory.getLogger(LocalFileResolver.class);

	/**
	 * 解析resolve节点,因resolve节点下的内容结构不定，所以开放给子类
	 */
	@SuppressWarnings("unchecked")
	public void parseResolveNode() {
		List<Element> list = element.elements();

		for (Element ee : list) {
			String tagName = ee.getName();
			String rarname = ee.attributeValue("name");

			List<String> fnameList = new ArrayList<String>();
			FtpFileUnit ftpFileUnitTmp = new FtpFileUnit();// raw FTP

			ftpFileUnitTmp.setName(rarname);

			List<SingleFileEntry> fnameEntryList = new ArrayList<SingleFileEntry>();
			if ("files".equals(tagName)) {

				List<Element> filesElement = ee.elements();
				for (Element ele : filesElement) {
					String file = ele.getText();
					if (StringUtil.isNotNull(file)) {
						fnameList.add(file.trim());

						String singleFileExt = ele.attributeValue("single_package_ext");
						SingleFileEntry entry = new FtpFileUnit().new SingleFileEntry();
						entry.fileName = file.trim();
						entry.singleFileExt = singleFileExt;

						fnameEntryList.add(entry);
					}
				}
				ftpFileUnitTmp.setFilenameList(fnameList);
				ftpFileUnitTmp.setFilenameEntryList(fnameEntryList);

				ftpRawUnitMap.put(rarname, ftpFileUnitTmp);
			}
		}

	}

	@Override
	public ResolverResult resolve() throws Exception {
		task.getLog().setInterConnStatus(0);
		ResolverResult resolverResult = new ResolverResult();
		
		if(task.getPeriod().equals(ConstDef.N_CYC_FILE_TYPE)){//非周期性上报
			LocalFileDS local_ds = (LocalFileDS) ds;
			List listPath = local_ds.getAbsPaths();

			Map<String, FileInfo> infoMap = new HashMap<String, FileInfo>();

			resolverResult.setUploadFileInfoMap(infoMap);
			
			if(listPath!=null && listPath.size()>0){
				for(int i=0;i<listPath.size();i++){
					
					String path = (String) listPath.get(i);
					File file = new File(path);
					
					//获取路径下所有文件路径
					Map<String,String> map = FileUtil.recursiveFile(file,path);
					
					for(Map.Entry<String, String> entry: map.entrySet()) {
						 
						FileInfo fileInfo = new FileInfo();
						fileInfo.setDirName(path);
						fileInfo.setFileName(entry.getValue());
						fileInfo.setCount(888888);
						infoMap.put(entry.getKey(), fileInfo);
				    }
					
				}
				
				resolverResult.getUploadFileInfoMap().putAll(infoMap);
			}else{
				task.getLog().setInterConnStatus(1);
				throw new Exception("没有配置非周期上报的数据源！");
			}
		}else{
			
			Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
			resolverResult.setUploadFileInfoMap(recordCountMap);
	
			Map<String, String> pathMapResult = new HashMap<String, String>();
	
			LOG.info("开始进行本地 数据收集!");
	
			String curDir = null;
			String localdir = "";
	
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
	
			// for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
			for (Entry<String, FtpFileUnit> entity : ftpRawUnitMap.entrySet()) {
	
				Map<String, String> pathMap = new HashMap<String, String>();
	
				FtpFileUnit ftpFileUnit = entity.getValue();
	
				String zipFile = ftpFileUnit.getName();
				try {
	
					// 如果打包文件名不为空，则进行参数替换,例如省参数。
					if (zipFile != null && !"".equals(zipFile.trim())) {
						zipFile = ProvinceNameMgr.replaceProvince(zipFile, task.getTemplet().getInclude().getProviceMap());
						zipFile = processParaMap(zipFile, "${", "}", null);
						zipFile = ConstDef.ParseFilePath(zipFile, new Timestamp(task.getCurrDataTime().getTime()));
						// 打包全路径名.
						zipFile = curDir + File.separator + zipFile;
					}
	
					// 本地文件 目录.
					for (SingleFileEntry entry : ftpFileUnit.getFilenameEntryList()) {
	
						String fName = entry.fileName;
	
						String singleFileExt = entry.singleFileExt;
	
						LOG.debug(fName + " 文件匹配处理----------开始 ");
	
						fName = ProvinceNameMgr.replaceProvince(fName, task.getTemplet().getInclude().getProviceMap());
						fName = processParaMap(fName, "${", "}", null);
	
						String tmpFile = ConstDef.ParseFilePath(fName, new Timestamp(task.getCurrDataTime().getTime()));
						String ftpFname = tmpFile;
	
						File file = new File(ftpFname);
	
						String fileName = file.getName();
						// 如果找的到就添加到集合中，如果找不到，用正着表达式进行匹配。
						if (file.exists()) {
	
							String ftpFnameExt = commpareFile(ftpFname, singleFileExt);
							pathMap.put(ftpFnameExt, ftpFnameExt);
						} else {
							// 用正着表达式进行匹配。 ftpFname作为正则表达式参数进行匹配。
							// 目前只对一级目录进行匹配
							File parDir = file.getParentFile();
							String parDirName = parDir.getAbsolutePath();
							if (parDir.exists()) {
								String[] files = parDir.list();
	
								for (String fileTmp : files) {
									String regEx1 = fileName.replace("*", "(\\w)*");
									if (findByRegex(fileTmp, regEx1 + "$", 0)) {
										String subTmpFile = parDirName + File.separator + fileTmp;
	
										subTmpFile = commpareFile(subTmpFile, singleFileExt);
	
										pathMap.put(subTmpFile, subTmpFile);
										LOG.debug(subTmpFile + "文件成功匹配表达式： " + fileTmp + " 并添加到上报集合中");
									}
								}
							}
						}
	
						LOG.debug(fName + "  文件匹配处理 ---------结束 ");
					}
	
					if (StringUtil.isNotNull(zipFile)) {
						if (pathMap.size() > 0) {
							Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile);
							LOG.debug(zipFile + "文件已经成功压缩");
							Map<String, String> pathMap_result = new HashMap<String, String>();//
							pathMap_result.put(zipFile, zipFile);
							pathMap.clear();
							pathMap.put(zipFile, zipFile);
							pathMapResult.putAll(pathMap);
						} else {
							LOG.debug("由于数据源为空，" + zipFile + "文件未能压缩。");
						}
	
					} else {
						pathMapResult.putAll(pathMap);
					}
				} catch (Exception e) {
					LOG.error("本地文件匹配失败.， 文件列表={ } ", ftpFileUnit.getFilenameList(), e);
					// 周期性任务失败时，需要生成补采任务时，直接抛出异常
					task.getLog().setInterConnStatus(1);
					task.getLog().setErrorReason("打包本地数据失败，请根据日志检查具体原因!");
					throw e;
				}
			}
			if(pathMapResult.size() == 0)
			{
				task.getLog().setInterConnStatus(1);
				task.getLog().setErrorReason("本地目录下没有文件，请检查原因!");
				throw new Exception("本地目录下没有文件，请检查原因!");
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
					String destFilePath = new String(packageNameResolver);
		
					String packageNameTmp = new String(destFilePath);
		
					packageNameTmp = curDir + File.separator + packageNameTmp;
		
					boolean isValidate = task.getTemplet().includeValidate();
					boolean isLoop = task.getTemplet().getInclude().isLoop();
					if (!isValidate || !isLoop) {
		
						// 目前只替换省份的展位符
						packageNameTmp = ProvinceNameMgr.replaceProvince(packageNameTmp, task.getTemplet().getInclude().getProviceMap());
		
						packageNameTmp = processParaMap(packageNameTmp, "${", "}", null);
						packageNameTmp = ConstDef.ParseFilePath(packageNameTmp, new Timestamp(task.getCurrDataTime().getTime()));
						FilePackageInfo tmpInfo = Packer.getFilePackExt(packageNameTmp);
		
						LOG.debug(packageNameTmp + " 文件已经成功压缩");
		
						// 如果是文件扩展名，则打包
						if (tmpInfo.isFileExt()) {
							// 将files节点中的所有的文件都打包成
							List<String> fileList = new ArrayList<String>();
							fileList.addAll(pathMapResult.values());
		
							Packer.pack(fileList, packageNameTmp);
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
						}
					}
		
				}
			}catch(Exception e){
				// 周期性任务失败时，需要生成补采任务时，直接抛出异常
				task.getLog().setInterConnStatus(1);
				task.getLog().setErrorReason("打包本地数据失败，请根据日志检查具体原因!");
				throw e;
			}
			resolverResult.getUploadFileInfoMap().putAll(infoMap);
			
		}

		return resolverResult;
	}

	public String commpareFile(String subTmpFile, String singleFileExt) throws Exception {
		String result = subTmpFile;
		if (StringUtil.isNotNull(singleFileExt)) {
			String subTmpFilePack = subTmpFile + (singleFileExt.startsWith(".") ? singleFileExt : "." + singleFileExt);
			ArrayList<String> aList = new ArrayList<String>();
			aList.add(subTmpFile);
			Packer.pack(aList.toArray(new String[0]), subTmpFilePack);
			LOG.debug(subTmpFile + "文件已经成功压缩");
			result = subTmpFilePack;
		}

		return result;

	}

	public static boolean isRegexMatch(String src, String regex) {
		if (StringUtil.isNull(src))
			return false;
		// JS_20121230_a.sh JS_20121230_*.sh
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(src);

		return m.find();// 返回true

	}

	// 通过正则表达式查找
	private static boolean findByRegex(String str, String regEx, int group) {
		String resultValue = null;
		if (regEx == null || (regEx != null && "".equals(regEx.trim()))) {
			return false;
		}

		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		// JS_20121230_a.sh JS_20121230_(\\w)*.sh
		boolean result = m.find();// 查找是否有匹配的结果
		if (result) {
			resultValue = m.group(group);// 找出匹配的结果
		}
		return StringUtil.isNotNull(resultValue);
	}

	public static void main(String[] args) {
		// String ss = "/home/win/ftp/ff";
		// File ff = new File(ss);
		// boolean eFlag = ff.exists();
		// System.out.println(eFlag);
		// File p = ff.getParentFile();
		// System.out.println(p.getAbsolutePath());
		// JS_20121230_a.sh JS_20121230_*.sh JS_20121230_(\\w)*.sh

		boolean b = isRegexMatch("JS_20121230_aasdfas.sh", "JS_20121230_(\\w)*.sh");
		System.out.println(b);
		boolean b1 = findByRegex("HW_XA_1X_1_20140612.000000.csv", "HW_XA_1X_(\\w)(\\w)*_20140612.000000.csv", 0);
		System.out.println(b1);

	}
}