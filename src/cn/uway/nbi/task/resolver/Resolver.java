package cn.uway.nbi.task.resolver;

import static cn.uway.nbi.util.ConstDef.F_SEP;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.task.resolver.DBResolver.MappingInfo;
import cn.uway.nbi.task.t.Strategy;
import cn.uway.nbi.task.templet.file.FreeMarkerMgr;
import cn.uway.nbi.task.templet.file.Obj;
import cn.uway.nbi.task.triggerbean.TriggerBean;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FilePackageInfo;
import cn.uway.nbi.util.Packer;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;

/**
 * 数据源解释器
 * 
 * @author YangJian
 * @since 1.0
 */
public abstract class Resolver {

	protected DS ds;

	protected Map<Integer, DS> dsMap;

	protected Task task;

	protected Element element;

	protected static final String CURRPATH = SysCfg.getInstance().getCurrentpath();

	private static final Logger LOG = LoggerFactory.getLogger(Resolver.class);

	protected String controllog;

	// protected FtpFileUnit ftpFileUnit = new FtpFileUnit();// raw FTP

	/* Map<主键，ftp上传实体> // raw FTP */
	protected Map<String, FtpFileUnit> ftpRawUnitMap = new HashMap<String, FtpFileUnit>();

	/* Map<主键，ftp上传实体> */
	protected Map<String, FtpFileUnit> ftpUnitMap = new HashMap<String, FtpFileUnit>();

	protected Map<String, ParaEntry> paraMap = new HashMap<String, ParaEntry>();

	protected Map<Integer, Strategy> strategyMap = new HashMap<Integer, Strategy>();
	
	/**
	 * 任务ID,ACTION ID,TO ID的拼接信息
	 */
	private String logInfo;

	public class WsInfo {

		public String wsURL;

		public String wsParam;

		public String encode = "utf-8";

		public String table_keys;
	}

	/**
	 * resolver节点中的打包名称 add on 20131203
	 */
	protected String packageNameResolver = null;

	public DS getDs() {
		return ds;
	}

	public void setDs(DS ds) {
		this.ds = ds;
	}

	public Map<Integer, DS> getDsMap() {
		return dsMap;
	}

	public void setDsMap(Map<Integer, DS> dsMap) {
		this.dsMap = dsMap;
	}

	public Map<String, ParaEntry> getParaMap() {
		return paraMap;
	}

	public void setParaMap(Map<String, ParaEntry> paraMap) {
		this.paraMap = paraMap;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public String getControllog() {
		return controllog;
	}

	public String getPackageNameResolver() {
		return packageNameResolver;
	}

	public void setPackageNameResolver(String packageNameResolver) {
		this.packageNameResolver = packageNameResolver;
	}

	public void setControllog(String controllog) {
		this.controllog = controllog;
	}

	public void setElement(Element element) {
		this.element = element;
	}

	public Map<Integer, Strategy> getStrategyMap() {
		return strategyMap;
	}

	public void setStrategyMap(Map<Integer, Strategy> strategyMap) {
		this.strategyMap = strategyMap;
	}
	
	public String getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(String logInfo) {
		this.logInfo = logInfo;
	}

	protected void processStrategy(MappingInfo info) throws Exception {
		String strategyId = info.strategyId;
		if (StringUtil.isNotNull(strategyId)) {
			String[] idTmp = strategyId.split(",");

			for (String id : idTmp) {
				if (StringUtil.isNull(id))
					continue;
				Strategy strategy = this.strategyMap.get(Integer.valueOf(id));
				if (strategy != null) {
					for (TriggerBean tri : strategy.getTriggerList()) {
						if (tri == null) {

							LOG.warn(task + " id: " + id + " , strategyId:" + strategyId + " triggerBean is null ");
							continue;
						}
						tri.trigger(task);
					}
				}
			}
		}
	}

	public List<String> readFileHead(String fileName, String split) {
		List<String> out = new ArrayList<String>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF-8"));
			String oneLine = br.readLine();
			if (oneLine != null) {
				String fields[] = oneLine.split(split);

				for (String f : fields) {
					if (Util.isNullOrEmplet(f))
						continue;
					out.add(f);
				}
			}
		} catch (FileNotFoundException e) {
			LOG.error("读取ftl模板出现异常 或者不存在 " + fileName, e);
		} catch (IOException e) {
			LOG.error("读取ftl模板出现异常，或者不存在 " + fileName, e);
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException e) {

			}
		}
		return out;

	}

	public List<String> readFileHeadStrList(String fileName, String split) {
		List<String> out = new ArrayList<String>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF-8"));
			String oneLine = br.readLine();
			String sencond = br.readLine();
			if (oneLine != null) {
				out.add(oneLine);
			}
			if (!sencond.startsWith("<#assign")) {
				out.add(sencond);
			}
		} catch (FileNotFoundException e) {
			LOG.error("读取ftl模板出现异常，或者不存在 " + fileName, e);
		} catch (IOException e) {
			LOG.error("读取ftl模板出现异常，或者不存在 " + fileName, e);
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException e) {

			}
		}
		return out;

	}

	/**
	 * 解析resolve节点,因resolve节点下的内容结构不定，所以开放给子类
	 */
	public abstract void parseResolveNode();

	/**
	 * 进行解释
	 * 
	 * @return
	 * @throws Exception
	 */
	public abstract ResolverResult resolve() throws Exception;

	public String fileNameProcess(String fileName) {
		if (paraMap == null || paraMap.size() == 0)
			return fileName;

		Iterator<Entry<String, ParaEntry>> it = paraMap.entrySet().iterator();
		String fileNameResult = new String(fileName);

		while (it.hasNext()) {
			Entry<String, ParaEntry> entry = it.next();
			String key = entry.getKey();
			ParaEntry paraEntry = entry.getValue();

			Date now = new Date();
			if ("now".equalsIgnoreCase(key)) {

				if (StringUtil.isNotNull(paraEntry.getFormat())) {

					fileNameResult = fileNameResult.replace("${now}", paraEntry.getFormat());
				}

				fileNameResult = ConstDef.ParseFilePath(fileNameResult, new Timestamp(now.getTime()));

			} else if ("yesterday".equalsIgnoreCase(key)) {
				if (StringUtil.isNotNull(paraEntry.getFormat())) {

					fileNameResult = fileNameResult.replace("${yesterday}", paraEntry.getFormat());
				}

				fileNameResult = ConstDef.ParseFilePath(fileNameResult, new Timestamp(now.getTime() - 24 * 60 * 60 * 1000));
			}
		}
		//add by tyler.lee:2015.8.14主要用于标识此文件是正常文件(正常任务nbi_cfg_task表中)还是重传文件(补传任务nbi_cfg_rtask表中)，
		//此处实现是用%%TF匹配配置的值如：(0|1，0代表正常文件，1代表重传文件)
		ParaEntry pe = paraMap.get("%%TF");
		if(pe!=null){
			String[] vals = pe.getRawValue().split("\\|");
			String val = vals[0];
			if(vals.length>=2&&(task instanceof RTask)){
				val = vals[1];
			}
			fileNameResult = fileNameResult.replace("%%TF", val);
		}
		return fileNameResult;
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

		fileName = ConstDef.ParseFilePath(fileName, new Timestamp(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
		fileName = Util.filterPackageExt(fileName);// 判断是否是对单个文件打包,并取打包之前的名字
		// 如果是补报任务就需要对文件名进行操作
		//2014-12-24 jiangl 修改， 与 朱丽珍 商量后  把补报 时，文件名加补报次数 功能去掉，直接还是原来的名字
		/*
		if (!task.isTask()) {
			int index = fileName.lastIndexOf(".");
			if (index != -1)
				fileName = fileName.substring(0, index) + "_" + (((RTask) task).getCounter() + 1) + fileName.substring(index);
		}
       */
		String dirFile = CURRPATH + F_SEP + task.getId() + F_SEP;
		File f = new File(dirFile);
		if (!f.exists())
			f.mkdirs();

		String resultFile = dirFile + fileName;

		return resultFile;
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
		c.setTime(new Date(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
		root.put("YEAR", String.valueOf(c.get(Calendar.YEAR)));
		root.put("MONTH", String.valueOf(c.get(Calendar.MONTH) + 1));
		root.put("DAY", String.valueOf(c.get(Calendar.DAY_OF_MONTH)));
		root.put("HOUR", String.valueOf(c.get(Calendar.HOUR_OF_DAY)));
		root.put("MINUTE", String.valueOf(c.get(Calendar.MINUTE)));
		root.put("SECOND", String.valueOf(c.get(Calendar.SECOND)));

		processParaMap(null, null, null, root);
		//
		FreeMarkerMgr.getInstance().process(root, templetFile, templetOut);
		if(out!=null)
		{
			out.flush();
			out.close();
		}
		return templetOut.getLineNum();
	}

	public String processParaMap(String sql, String leftFlag, String rightFlag, Map<String, Object> root) {
		if (task.getParaMap() != null && !task.getParaMap().isEmpty()) {
			Set<Entry<String, String>> set = task.getParaMap().entrySet();
			for (Entry<String, String> en : set) {
				if (StringUtil.isNotNull(sql))
					sql = sql.replace(leftFlag + en.getKey() + rightFlag, en.getValue());
				if (root != null)
					root.put(en.getKey(), en.getValue());
			}
		}
		return sql;
	}

	public Map<String, String> ftpFileProcess(DS dstemp) throws Exception {

		Map<String, String> pathMap1 = new HashMap<String, String>();//

		FTPFileDS ds = (FTPFileDS) dstemp;

		ftpUnitMap = ds.getFtpFileUnitMap();

		FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());
		// String ftpPath = ds.getPath();
		// if ( ftpPath.charAt(ftpPath.length() - 1) != '/'
		// && ftpPath.charAt(ftpPath.length() - 1) != '\\' )
		// ftpPath = ftpPath + "/";

		String curDir = SysCfg.getInstance().getCurrentpath().replace("\\", "/");
		String dir = null;

		for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
			Map<String, String> pathMap = new HashMap<String, String>();//
			for (String fName : ftpFileUnit.getFilenameList()) {
				// fName=ProvinceNameMgr.getInstance().replaceAllName(fName,
				// task.getCityId());
				String tmpFile = ConstDef.ParseFilePath(fName, new Timestamp(task.getCurrDataTime().getTime()));
				String ftpFname = tmpFile;

				String localPath = curDir + File.separator + ftpFname;
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
				ftp.closeConnect();
			}
			if (dir != null && pathMap.size() > 0) {
				String zipFile = SysCfg.getInstance().getCurrentpath() + File.separator + ftpFileUnit.getName();
				if (StringUtil.isNotNull(zipFile)) {
					zipFile = ConstDef.ParseFilePath(zipFile, new Timestamp(task.getCurrDataTime().getTime()));
					Packer.pack(pathMap.values().toArray(new String[pathMap.values().size()]), zipFile);

					pathMap.clear();
					pathMap1.put(zipFile, zipFile);
				}
			}
		}

		return pathMap1;
	}

	/**
	 * 打包以及 获取包名
	 * 
	 * @param destFilePath
	 *            打包文文件名
	 * @param info
	 * @param cityId
	 * @param isReplaceCitys
	 * @param b
	 * @return
	 * @throws Exception
	 */
	protected String packageProcess(String destFilePath, MappingInfo info, String cityId, boolean isReplaceCitys, boolean b) throws Exception {
		// add on 20131203 , 如果是文件扩展名则打包

		String packageNameTmp = new String(destFilePath);

		FilePackageInfo rawFilename = Packer.getFilePackExt(info.fileName);

		FilePackageInfo csvTmp = Packer.getFilePackExt(destFilePath);

		String tmpName = new String(packageNameTmp);

		// .gz格式需要特殊处理

		String tmpLower = rawFilename.getFileName().toLowerCase();

		if (!tmpLower.endsWith(".tar.gz") && tmpLower.endsWith(".gz")) {
			tmpName = tmpName + "." + rawFilename.getFileExt();
		} else {

			if (csvTmp.getFileExt() != null) {
				if (!rawFilename.getFileExt().equalsIgnoreCase(csvTmp.getFileExt())) {

					int index = packageNameTmp.lastIndexOf(".");

					if (index > 0) {
						tmpName = packageNameTmp.substring(0, index);
						tmpName = tmpName + "." + rawFilename.getFileExt();
					} else {
						tmpName = new String(packageNameTmp);
					}
				}
			} else {
				int index = packageNameTmp.lastIndexOf(".");

				if (index > 0) {
					tmpName = packageNameTmp.substring(0, index);
					tmpName = tmpName + "." + rawFilename.getFileExt();
				}
			}
		}

		FilePackageInfo filePackageInfo = Packer.getFilePackExt(tmpName);

		// 如果是文件扩展名，则打包
		if (filePackageInfo.isFileExt()) {
			List<String> fileList = new ArrayList<String>();
			fileList.add(destFilePath);

			packageNameTmp = tmpName;

			Packer.pack(fileList, tmpName);

		} else {
			// 如果不是文件扩展名，则判断是否有打包属性 mappinginfo (package_name)
			if (StringUtil.isNotNull(info.packageName)) {

				String packageNameTmp1 = new String(info.packageName);
				packageNameTmp = getDestFilePath(packageNameTmp1, cityId);

				if (isReplaceCitys)// 替换城市相关占位符
				{
					packageNameTmp = ProvinceNameMgr.replaceAllName(packageNameTmp, cityId, task.getTemplet().getInclude().getProviceMap(), task
							.getTemplet().getInclude().getCityMap());
				} else if (b)// 替换省相关占位符
				{
					packageNameTmp = ProvinceNameMgr.replaceProvince(packageNameTmp, task.getTemplet().getInclude().getProviceMap());
				}
				packageNameTmp = processParaMap(packageNameTmp, "${", "}", null);

				FilePackageInfo tmpInfo1 = Packer.getFilePackExt(packageNameTmp1);

				FilePackageInfo tmpInfo = Packer.getFilePackExt(packageNameTmp + "." + tmpInfo1.getFileExt());
				// 如果是文件扩展名，则打包
				if (tmpInfo.isFileExt()) {
					List<String> fileList = new ArrayList<String>();
					fileList.add(destFilePath);

					packageNameTmp = tmpInfo.getFileName();

					Packer.pack(fileList, tmpInfo.getFileName());
				}
			}
		}
		// end add
		return packageNameTmp;
	}

}
