package cn.uway.nbi.task.resolver;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FilePackageInfo;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;

/**
 * FTP型数据源解释器
 * 
 * @author litp 2011-5-18
 */
@IDMember(id = 211)
public class WorkorderFTPToFTPResolver extends LocalFileResolver {

	private static final Logger LOG = LoggerFactory
			.getLogger(WorkorderFTPToFTPResolver.class);

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
				ftpRawUnitMap.put(rarname, ftpFileUnitTmp);
			}

		}
	}

	@Override
	public ResolverResult resolve() throws Exception {
		Map<String, String> pathMapResult = new HashMap<String, String>();
		ResolverResult resolverResult = new ResolverResult();
		Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
		resolverResult.setUploadFileInfoMap(recordCountMap);

		LOG.info("开始进行FTP数据收集!");
		FTPFileDS ds = (FTPFileDS) getDs();

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

		// for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
		for (Entry<String, FtpFileUnit> entity : ftpRawUnitMap.entrySet()) {

			Map<String, String> pathMap = new HashMap<String, String>();

			FtpFileUnit ftpFileUnit = entity.getValue();

			FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(),
					ds.getUsername(), ds.getPassword(), ds.getEncode(),
					ds.isbPasv());
			String zipFile = ftpFileUnit.getName();
			try {

				// 如果打包文件名不为空，则进行参数替换,例如省参数。
				if (zipFile != null && !"".equals(zipFile.trim())) {
					zipFile = ProvinceNameMgr.replaceProvince(zipFile, task
							.getTemplet().getInclude().getProviceMap());
					zipFile = processParaMap(zipFile, "${", "}", null);
					zipFile = ConstDef.ParseFilePath(zipFile, new Timestamp(
							task.getCurrDataTime().getTime()));
					// 打包全路径名.
					zipFile = SysCfg.getInstance().getCurrentpath()
							+ File.separator + zipFile;
				}

				// 通过通配符下载数据文件
				for (String fName : ftpFileUnit.getFilenameList()) {

					fName = ProvinceNameMgr.replaceProvince(fName, task
							.getTemplet().getInclude().getProviceMap());
					fName = processParaMap(fName, "${", "}", null);

					String tmpFile = ConstDef.ParseFilePath(fName,
							new Timestamp(task.getCurrDataTime().getTime()));
					String ftpFname = tmpFile;

					String localPath = curDir + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					String dir = localPath.substring(0, localPath.length()
							- ftpFname.length());
					File f = new File(dir);
					if (!f.exists())
						f.mkdir();

					// String localFName = localPath + tmpFile;
					// 下载文件
					DownStructer result = ftp.downFile(ftpFname, dir);

					for (String tmp : result.getSuc()) {
						pathMap.put(tmp, tmp);
					}
				}

				if (StringUtil.isNotNull(zipFile)) {
					// Packer.packTarFile(
					// pathMap.values().toArray(
					// new String[pathMap.values().size()]),
					// zipFile);

					Packer.pack(
							pathMap.values().toArray(
									new String[pathMap.values().size()]),
							zipFile);

					Map<String, String> pathMap_result = new HashMap<String, String>();//
					pathMap_result.put(zipFile, zipFile);
					pathMap.clear();
					pathMap.put(zipFile, zipFile);
					pathMapResult.putAll(pathMap);
				}
			} catch (Exception e) {
				LOG.error("FTP 方式 下载数据文件()失败. ", ftpFileUnit.getFilenameList(),
						e);
			} finally {
				if (ftp != null)
					ftp.closeConnect();
			}
		}

		Map<String, FileInfo> infoMap = new HashMap<String, FileInfo>();

		// 解析器节点中是否有打包属性(package_name)
		if (StringUtil.isNull(packageNameResolver)) {

			if (pathMapResult != null && !pathMapResult.isEmpty()) {
				Iterator<Entry<String, String>> it = pathMapResult.entrySet()
						.iterator();
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
					packageNameTmp = ProvinceNameMgr.replaceProvince(
							packageNameTmp, task.getTemplet().getInclude()
									.getProviceMap());

					packageNameTmp = processParaMap(packageNameTmp, "${", "}",
							null);

					FilePackageInfo tmpInfo = Packer
							.getFilePackExt(packageNameTmp);
					// 如果是文件扩展名，则打包
					if (tmpInfo.isFileExt()) {
						// 将files节点中的所有的文件都打包成
						List<String> fileList = new ArrayList<String>();
						fileList.addAll(pathMapResult.values());

						Packer.pack(fileList, packageNameTmp);

						FileInfo fileInfo = new FileInfo();
						fileInfo.setFileName(packageNameTmp);
						fileInfo.setCount(999999);
						infoMap.put(packageNameTmp, fileInfo);
					}
				}

			}
		}
		resolverResult.getUploadFileInfoMap().putAll(infoMap);
		return resolverResult;
	}
}
