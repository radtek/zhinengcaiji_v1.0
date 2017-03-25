package cn.uway.nbi.task;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.NossUploadReportTaskDao;
import cn.uway.nbi.db.pojo.NossTask;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.t.TI;
import cn.uway.nbi.ui.DRS103service_content;
import cn.uway.nbi.ui.DSR104service_content;
import cn.uway.nbi.ui.DataEntity;
import cn.uway.nbi.ui.FileInfoType;
import cn.uway.nbi.ui.ObjectListMatch;
import cn.uway.nbi.ui.SeqMgr;
import cn.uway.nbi.ui.Unuploadedfileinfo;
import cn.uway.nbi.ui.Uploadedfileinfo;
import cn.uway.nbi.ui.config.ConfigProperties;
import cn.uway.nbi.ui.out.ReportRequest;
import cn.uway.nbi.ui.out.ResponseParser;
import cn.uway.nbi.util.TarUtils;

public class ReportTaskTrigger implements Runnable {

	private NossTask task;

	private TaskMgr taskMgr;

	private String regEx = "(\\d{8})";

	public static String FTP_DIRECTIORY = "FTP_DIRECTORY_";

	public static String compressPath = "filecompresspath";

	public static String G_ = "G_";

	public static String W_ = "W_";

	public static String split = "_";

	public static String CITY_ID = "city_id";

	public static String BSC_ID = "bsc_id";

	public static String RTMR = "_RTMR";

	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

	private static final Logger LOG = LoggerFactory.getLogger(ReportTaskTrigger.class);

	NossUploadReportTaskDao dao = new NossUploadReportTaskDao();

	public ReportTaskTrigger(NossTask task, TaskMgr taskMgr) {
		this.task = task;
		this.taskMgr = taskMgr;
	}

	/**
	 * 初始化方法
	 * 
	 * @throws Exception
	 */
	private void init() throws Exception {
	}

	@SuppressWarnings({"unused", "static-access"})
	public static TI getFtp() {
		ConfigProperties config = ConfigProperties.getInstance();
		String noss_report_ftp_ip = (String) config.getProps().get("noss_report_ftp_ip");
		String noss_report_ftp_port = (String) config.getProps().get("noss_report_ftp_port");
		String noss_report_ftp_username = (String) config.getProps().get("noss_report_ftp_username");
		String noss_report_ftp_pwd = (String) config.getProps().get("noss_report_ftp_pwd");
		String noss_report_ftp_encode = (String) config.getProps().get("noss_report_ftp_encode");
		String noss_report_ftp_path = (String) config.getProps().get("noss_report_ftp_path");
		String noss_report_ftp_mode = (String) config.getProps().get("noss_report_ftp_mode");
		boolean bPasv = false;
		if ("1".equalsIgnoreCase(noss_report_ftp_mode)) {
			bPasv = true;

		}
		TI ti = new TI((int) 0, noss_report_ftp_ip, Integer.valueOf(noss_report_ftp_port), noss_report_ftp_username, noss_report_ftp_pwd,
				noss_report_ftp_path, noss_report_ftp_encode, bPasv, false);
		return ti;
	}

	/**
	 * 解析，数据上报
	 */
	public void report() {
		boolean eFlag = false;// 是否发生异常
		String cause = null;// 发生异常的原因
		try {
			LOG.info("任务开始执行.");
			init();//
			execute();
		} catch (Exception e) {
			// 目前只是一个处理策略
			// 此处只是一个处理策略
			if (e instanceof Exception) {
				eFlag = true;
				cause = e.getMessage();
			}
			LOG.error("执行任务时发生错误.", e);
		} finally {
			if (eFlag)
				TaskMgr.getInstance().newReportTask(task, -1, cause);
			try {
				taskMgr.processAfterReport(task);// 上报完的处理
			} catch (Exception e) {
				LOG.error("上报完后的处理发生错误.", e);
			}
		}
	}

	/**
	 * 解码一条FTP路径
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @return 解码后的路径
	 */
	public String decodeLocalFilePath(String ftpPath, String encode) {
		try {
			String str = StringUtil.isNotNull(encode) ? new String(ftpPath.getBytes("iso_8859_1"), encode) : ftpPath;
			return str;
		} catch (UnsupportedEncodingException e) {
			LOG.error("设置的编码不正确:" + encode, e);
		}
		return ftpPath;
	}

	public Date formatYYYYMMDD(Date d) {

		Calendar cc = Calendar.getInstance();
		cc.setTime(d);
		cc.set(Calendar.HOUR_OF_DAY, 0);
		cc.set(Calendar.MINUTE, 0);
		cc.set(Calendar.SECOND, 0);

		return cc.getTime();
	}

	public boolean isValid(FileInfoType info, String name, String nametmp, List<ObjectListMatch> filterMatchList, String vendor, String filetypePara) {
		// List<ObjectMapping> objectMappingList, List<GRPara> gsmMrList
		String objectList = task.getObjectlist();
		boolean b = false;

		List<String> resultFileList = new ArrayList<String>();

		if (StringUtil.isNotNull(objectList)) {
			String objs[] = objectList.split(";");

			// 如果是GSM MR 需要特殊处理,其对应的参数文件
			if (task.getFiletype().contains(RTMR) && task.getDomaintype().equalsIgnoreCase("GSM")) {
				String level = task.getObjectlevel();

				int paraCount = 0;
				for (String obj : objs) {
					String[] o = obj.split("_");
					String omc = o[0];
					// 有omc ，bsc
					if (o.length > 1) {
						// 参数数据文件，目前只匹配OMC
						String bsc = o[1];
					} else {
						// 只有OMC

					}

					int omcIndex = omc.indexOf("OMC");
					if (omcIndex != -1) {
						if (regFindExist(name, omc.substring(omcIndex), 0)) {
							paraCount++;
						}
					}
				}
				if (paraCount > 0)
					resultFileList.add(name);

			}

			// 如果是MR 需要特殊处理,其对应的参数文件
			else if (task.getFiletype().contains(RTMR) && task.getDomaintype().equalsIgnoreCase("WCDMA")) {

				String level = task.getObjectlevel();

				// 是否按照OMC进行上报
				boolean omcFlag = level.equalsIgnoreCase("OMC");

				// 是否按照BSC进行上报
				boolean bscFlag = level.equalsIgnoreCase("BSC") || level.equalsIgnoreCase("RNC");

				for (ObjectListMatch match : filterMatchList) {
					String omcid = match.omcid;

					String bsc_id = match.bsc_id;

					if (!regFindExist(name, omcid, 0))
						continue;

					boolean isOmcFlag = false;
					if ("HW".equalsIgnoreCase(vendor) || "ZTE".equalsIgnoreCase(vendor)) {
						isOmcFlag = true;
					}

					// 如果按照OMC粒度进行上报，则添加到队列中
					if (omcFlag || isOmcFlag) {
						resultFileList.add(name);
						continue;
					} else if (bscFlag) {
						// 如果按照BSC粒度进行上报，则添加到队列中
						if (!regFindExist(name, bsc_id, 0))
							continue;

						resultFileList.add(name);

						/*
						 * if ( "ERIC".equalsIgnoreCase(vendor) ) { resultFileList.add(name); } else if ( "HW".equalsIgnoreCase(vendor) ) { //
						 * 华为厂家需要将tar.gz文件进行解压之后，获取需要的bsc文件进行上报 UnPacker un = new UnPacker(nametmp); List<String> filterList = new
						 * ArrayList<String>(); String bscnameTmp = new String(bsc_id); bscnameTmp = bscnameTmp.replace("BSC", "RNC");
						 * filterList.add(bscnameTmp); String destDir = SysCfg.getInstance().getCurrentpath() + File.separator + filetypePara +
						 * File.separator + vendor; List<String> resultList = un.unTargzFile(nametmp, destDir, filterList); for (String filterFile :
						 * resultList) { File filterName = new File(filterFile); String insertStr = bscnameTmp; String pDir = filterName.getParent();
						 * String filterNameTmp = filterName.getName(); int index = filterNameTmp.lastIndexOf("_"); if ( index != -1 ) { StringBuilder
						 * sbTmp = new StringBuilder(filterNameTmp); sbTmp.insert(index + 1, insertStr); if ( filterName.exists() ) { String tmp =
						 * pDir + sbTmp.toString(); filterName.renameTo(new File(tmp)); resultFileList.add(sbTmp.toString()); } } } //
						 * 如果按照BSC粒度进行上报，则添加到队列中 if ( !regFindExist(name, bsc_id.replace("BSC", "RNC"), 0) ) continue; resultFileList.add(name); }
						 */

					}
				}
				/*
				 * // 对不同级别的数据文件，过滤规则不同 for (ObjectMapping obj1 : objectMappingList) { // BJ_RTPARA_ERI1_OMC101ECR23_20130723.tar.gz String omcid =
				 * obj1.omcid; String bscname = obj1.clt_bsc_name; if ( level.equalsIgnoreCase(objectLevel_OMC) ) { } if ( regFindExist(name, omcid,
				 * 0) ) { Log.debug(name + "符合过滤文件条件"); // 对此文件进行解压，从解压文件中获取需要上报的BSC文件 // eric 厂家 一个bsc一个文件。 if ( "ERIC".equalsIgnoreCase(vendor) ) {
				 * // 如果没有找到 if ( !regFindExist(name, bscname, 0) ) { continue; } resultFileList.add(name); } else if ( "HW".equalsIgnoreCase(vendor)
				 * ) { // 华为厂家需要将tar.gz文件进行解压之后，获取需要的bsc文件进行上报 UnPacker un = new UnPacker(nametmp); List<String> filterList = new ArrayList<String>();
				 * String bscnameTmp = new String(bscname); bscnameTmp = bscnameTmp.replace("RNC", ""); filterList.add(bscnameTmp); String destDir =
				 * SysCfg.getInstance().getCurrentpath() + File.separator + filetypePara + File.separator + vendor; List<String> resultList =
				 * un.unTargzFile(nametmp, destDir, filterList); for (String filterFile : resultList) { File filterName = new File(filterFile); String
				 * insertStr = "RNC" + bscnameTmp; String pDir = filterName.getParent(); String filterNameTmp = filterName.getName(); int index =
				 * filterNameTmp.lastIndexOf("_"); if ( index != -1 ) { StringBuilder sbTmp = new StringBuilder(filterNameTmp); sbTmp.insert(index +
				 * 1, insertStr); if ( filterName.exists() ) { String tmp = pDir + sbTmp.toString(); filterName.renameTo(new File(tmp));
				 * resultFileList.add(sbTmp.toString()); } } } } } }
				 */
			} else {
				// 非MR的处理方式
				int count = 0;
				for (String obj : objs) {
					if (StringUtil.isNull(obj))
						continue;

					if (regFindExist(name, obj.trim(), 0)) {
						Log.debug(name + "符合过滤文件条件");
						count++;

						resultFileList.add(name);
					}
				}
				if (count > 0) {

					b = true;
				} else {
					b = false;
				}
			}
		}

		return resultFileList.size() > 0;
	}

	/**
	 * 执行模板中所有的数据源的操作
	 * 
	 * @throws Exception
	 */
	private void execute() throws Exception {
		DataEntity entity = dao.queryReportFileInfoByFiletype(task);
		List<FileInfoType> fileInfoListTmp = entity.fileInfoTypeList;
		List<FileInfoType> fileInfoList = new ArrayList<FileInfoType>();
		fileInfoList.addAll(fileInfoListTmp);
		int sizeTmp = fileInfoListTmp.size();

		LOG.info("过滤之后文件大小" + sizeTmp);

		TreeMap<Integer, TI> tiMap = new TreeMap<Integer, TI>();
		tiMap.put(0, getFtp());
		FileInfoType info = null;

		String notifyid = SeqMgr.getInstance().getSeq();

		List<Unuploadedfileinfo> uploadFail = new ArrayList<Unuploadedfileinfo>();
		List<Uploadedfileinfo> uploadSuc = new ArrayList<Uploadedfileinfo>();
		String currentPath = ConfigProperties.getInstance().getCurrentPath();

		if (currentPath.startsWith("\\\\")) {
			if (!currentPath.endsWith("\\"))
				currentPath = currentPath + "\\";
		} else if (!currentPath.endsWith("/")) {
			currentPath = currentPath + "/";
		}

		List<FileInfoType> paraList = new ArrayList<FileInfoType>();

		for (FileInfoType tmp : fileInfoListTmp) {
			if (task.getFiletype().equalsIgnoreCase(tmp.getFiletype())) {
				info = tmp;
				break;
			}

		}
		if (sizeTmp > 0) {
			String domaintype = task.getDomaintype();
			String filetypePara = "";

			if (domaintype.equalsIgnoreCase("GSM")) {
				filetypePara = "GR_PARA";
			} else if (domaintype.equalsIgnoreCase("WCDMA")) {
				filetypePara = "WR_PARA";
			}
			// 参数数据上报是按照天，
			String fTypeMapping = ConfigProperties.getInstance().getPropertiesValue(filetypePara);
			String fTypeDir = currentPath + fTypeMapping + File.separator;

			int fileIndex = 100000;
			File fileDir = new File(fTypeDir);
			if (fileDir.exists()) {
				File[] vendorlist = fileDir.listFiles();
				for (File vendorFile : vendorlist) {

					// 获取厂家目录
					String vendor = vendorFile.getName();
					File[] dateDir = vendorFile.listFiles();
					for (File f : dateDir) {
						String dateFileName = f.getName();
						String dateFileNameTmp = regFind(dateFileName, regEx, 1);

						if (StringUtil.isNull(dateFileNameTmp))
							continue;
						try {
							Date date = format.parse(dateFileNameTmp);

							Date bTime = formatYYYYMMDD(task.getCurrDataTime());
							Date eTime = formatYYYYMMDD(task.getEndDataTime());

							// 参数数据上报是按照天，并拼装成结构进行上报
							if (date.getTime() >= bTime.getTime() && date.getTime() <= eTime.getTime()) {
								File[] files = f.listFiles();

								for (File ff : files) {
									String name = ff.getName();
									String nametmp = ff.getAbsolutePath();
									LOG.info("文件路径：" + name);
									/**
									 * 过滤不符合条件的文件
									 **/
									boolean bFlag = isValid(info, name, nametmp, entity.filterMatchList, vendor, filetypePara);

									if (!bFlag)
										continue;

									FileInfoType infotype = new FileInfoType();
									infotype.setDomaintype(info.getDomaintype());
									infotype.setFileAddr(ff.getName());
									int index = name.lastIndexOf(".");
									if (index <= -1)
										continue;
									String tmpExt = name.substring(index + 1);
									infotype.setFileFormat(tmpExt);

									infotype.setFileGeneration(DateUtil.getDateString(new Date(ff.lastModified())));
									infotype.setFileName(name);
									infotype.setFileNameCompare(name);
									infotype.setFileSize((int) ff.length());
									infotype.setFiletype(filetypePara);
									infotype.setId(fileIndex++);
									infotype.setSerCaller(info.getSerCaller());
									infotype.setTask_id(infotype.getId());
									infotype.setRecordSize(0);
									infotype.setParaFile(ff.getAbsolutePath());
									String fileTypeMappingDir = ConfigProperties.getInstance().getPropertiesValue(FTP_DIRECTIORY + filetypePara);
									infotype.setFileMappingDir(fileTypeMappingDir);
									infotype.setVendorShortening(vendor);

									paraList.add(infotype);
								}
							}
						} catch (ParseException e) {
							LOG.error(" 解析时间目录出现异常, 文件名： " + dateFileNameTmp);
						}
					}
				}
			}
			LOG.debug(" 过滤之后参数文件列表.  ");
			for (FileInfoType in : paraList) {
				LOG.debug(" 过滤之后参数文件列表.  " + in.getFileName());
			}
			fileInfoList.addAll(paraList);
			int size = fileInfoList.size();

			DRS103service_content content = new DRS103service_content();
			content.notifyid = notifyid;
			content.sercaller = info.getSerCaller();
			content.domaintype = info.getDomaintype();
			content.filetype = info.getFiletype();

			content.reportbeginTime = DateUtil.getDateString(new Date());
			content.readyfilenum = String.valueOf(size);
			content.fileinfolist = fileInfoList;
			content.domaintype = info.getDomaintype();
			content.requestid = task.getRequestid();

			// 调用集团上报接口，集团返回的信息。并解析，将解析结果入库。

			String result = ReportRequest.beginReportRequest(content);
			ResponseParser responser = new ResponseParser(result);
			boolean parserResult = true;
			try {
				parserResult = responser.parser(info.getDomaintype(), ResponseParser.RESPONSE_Type);
			} catch (Exception e) {
				parserResult = false;
				LOG.error("开始上报中,解析集团返回的响应信息失败." + parserResult + " result: " + result, e);
			}
			// 获取ftp
			TI ti = getFtp();
			FtpUtils ftp = new FtpUtils(ti.getFtpIp(), ti.getFtpPort(), ti.getUserName(), ti.getUserPwd(), ti.getEncode(), ti.isbPasv());

			String curcompressPath = ConfigProperties.getInstance().getPropertiesValue(compressPath);
			// 开始上传
			for (FileInfoType info1 : fileInfoList) {
				if (StringUtil.isNull(info1.getVendorShortening()) && !info1.getFiletype().contains("_PARA")) {
					LOG.error(task.getId() + " ， domaintype=" + info1.getDomaintype() + " , filename =" + info1.getFileName() + "厂家英文名为空,请现场工程人员配置"
							+ result, new Exception(""));

					continue;
				}
				try {
					String ftpIp = ti.getFtpIp();
					long taskId = task.getId();
					String actionId = "1";
					String localfile = "";
					String fname = "";
					String fileNameTmp = new String(info1.getFileName());
					fileNameTmp = fileNameTmp.replace("\\", "/");
					String curcompressPathTmp = "";
					String timeFileAddrTmp = "";

					if (fileNameTmp.lastIndexOf("/") != -1) {
						// 文件名
						fileNameTmp = fileNameTmp.substring(fileNameTmp.lastIndexOf("/") + 1);
					}

					// 参数数据，上报
					if (info1.getFiletype().contains("_PARA")) {

						localfile = info1.getParaFile();

						fname = "/" + info1.getFileMappingDir() + "/" + fileNameTmp;
					} else {
						// 性能数据，MR数据

						String fileTypeMappingLocalDir = ConfigProperties.getInstance().getPropertiesValue(info1.getFiletype());
						String vendorEnDir = info1.getVendorShortening();
						String dir = currentPath + fileTypeMappingLocalDir + File.separator + vendorEnDir;

						// 时间
						timeFileAddrTmp = new String(info1.getFileName());// getFileAddr()
						timeFileAddrTmp = regFind(timeFileAddrTmp, regEx, 1);
						localfile = new String(dir + "\\" + timeFileAddrTmp + "\\" + fileNameTmp);
						curcompressPathTmp = localfile;

						if (task.getDomaintype().equalsIgnoreCase("GSM") && info1.getFiletype().contains(RTMR)) {
							String fileTypeMappingDir = ConfigProperties.getInstance().getPropertiesValue(FTP_DIRECTIORY + task.getFiletype());

							vendorEnDir = fileTypeMappingDir;

							info1.setFileMappingDir(fileTypeMappingDir);

							curcompressPathTmp = curcompressPath + "\\" + timeFileAddrTmp + "\\" + info1.getFileNameCompare();
							List<String> fileList = new ArrayList<String>();
							fileList.add(localfile);
							File cfile = new File(curcompressPathTmp);
							File cdir = cfile.getParentFile();
							if (!cdir.exists())
								cdir.mkdirs();
							if (!cfile.exists())
								cfile.createNewFile();

							TarUtils tarUtil = new TarUtils();
							tarUtil.execute(fileList, curcompressPathTmp);

							localfile = curcompressPathTmp;
							fileNameTmp = info1.getFileNameCompare();
						}

						fname = "/" + info1.getFileMappingDir() + "/" + fileNameTmp;
					}

					boolean isSuc = true;
					try {
						LOG.debug("localfile : " + localfile + "   ftp path: " + fname);
						isSuc = ftp.uploadFile(localfile, fname);//
						if (isSuc) {
							LOG.debug("id=({}),actionId=({}),文件(" + localfile + "),上传到FTP服务器成功(FTP://" + ftpIp + fname + ")", taskId, actionId);
						} else {
							LOG.debug("id=({}),actionId=({}),文件(" + localfile + "),上传到FTP服务器失败(FTP://" + ftpIp + fname + ")", taskId, actionId);
						}
					} catch (Exception e) {
						isSuc = false;
						LOG.error("id=({}),actionId=({}),文件(" + localfile + "),上传失败(FTP://" + ftpIp + fname + ")原因：" + e, taskId, actionId);
					}
					// 重试三次
					if (!isSuc) {
						for (int i = 0; i < 3; i++) {
							long timeout = 3 * (i + 1);
							Thread.sleep(5 * 1000);
							if (!isSuc) {
								ftp.login();
							}
							LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile, taskId, actionId);
							isSuc = ftp.uploadFile(localfile, fname);//
							if (isSuc) {
								LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "成功.已上传到FTP服务器(FTP://" + ftpIp + fname
										+ ")", taskId, actionId);
								break;
							} else
								LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "失败.", taskId, actionId);
						}
					}
					if (task.getDomaintype().equalsIgnoreCase("GSM") && info1.getFiletype().contains(RTMR)) {

						File gzfile = new File(curcompressPathTmp);
						if (gzfile.exists()) {
							boolean del = gzfile.delete();
							LOG.debug(curcompressPathTmp + "文件删除状态： " + del);
						}
					}
					Thread.sleep(500);

					int state = 0;
					if (isSuc) {
						Uploadedfileinfo upInfo = new Uploadedfileinfo();
						upInfo.fileaddr = info1.getFileAddr();
						upInfo.fileextension = info1.getFileFormat();
						upInfo.filegeneratetime = info1.getFileGeneration();
						upInfo.filename = info1.getFileNameCompare(); //
						upInfo.filesize = "" + info1.getFileSize();
						String endTime = DateUtil.getDateString(new Date());
						upInfo.reportendtime = endTime;

						upInfo.fileMappingDir = info1.getFileMappingDir();
						uploadSuc.add(upInfo);
						/*
						 * sucFlag++;
						 */
						state = 1;
					} else {
						Unuploadedfileinfo failInfo = new Unuploadedfileinfo();

						failInfo.fileaddr = info1.getFileAddr();
						failInfo.fileextension = info1.getFileFormat();
						failInfo.filegeneratetime = info1.getFileGeneration();
						failInfo.filename = info1.getFileNameCompare(); //
						failInfo.filesize = "" + info1.getFileSize();
						String endTime = DateUtil.getDateString(new Date());
						failInfo.reportendtime = endTime;
						failInfo.fileMappingDir = info1.getFileMappingDir();

						uploadFail.add(failInfo);

					}
				} catch (Exception e) {
					Unuploadedfileinfo failInfo = new Unuploadedfileinfo();

					failInfo.fileaddr = info1.getFileAddr();
					failInfo.fileextension = info1.getFileFormat();
					failInfo.filegeneratetime = info1.getFileGeneration();
					failInfo.filename = info1.getFileNameCompare();//
					failInfo.filesize = "" + info1.getFileSize();
					String endTime = DateUtil.getDateString(new Date());
					failInfo.reportendtime = endTime;
					uploadFail.add(failInfo);
					LOG.error("上传失败,原因 ： ", e);

				}
			}

			DSR104service_content content104 = new DSR104service_content();
			content104.notifyid = notifyid;
			content104.sercaller = info.getSerCaller();
			content104.domaintype = info.getDomaintype();
			content104.filetype = info.getFiletype();
			content104.unuploadedfilenum = "" + uploadFail.size();
			content104.uploadedfilenum = "" + uploadSuc.size();
			content104.sucList = uploadSuc;
			content104.failList = uploadFail;
			content104.requestid = task.getRequestid();

			String result1 = ReportRequest.endReportRequest(content104);
			LOG.error("结束上报中,集团返回信息为 ： " + result1);
			ResponseParser responser104 = new ResponseParser(result1);
			try {
				responser104.parser(content104.domaintype, ResponseParser.RESPONSE_Type);
			} catch (Exception e) {
				LOG.error("结束上报中,解析集团返回的响应信息失败." + result1, e);
			}
		} else {
			LOG.warn("无数据文件上报.");
		}

	}

	@Override
	public void run() {
		// TODO Auto-generated method stub

	}

	/**
	 * 通过正则表达式查找
	 * 
	 * @param src
	 * @param regEx
	 * @param group
	 * @return
	 */
	public static String regFind(String src, String regEx, int group) {
		Pattern pat = Pattern.compile(regEx);
		Matcher mat = pat.matcher(src);
		if (mat.find())
			return mat.group(group);
		return null;
	}

	/**
	 * 正则表达式判断是否匹配成功
	 * 
	 * @param src
	 *            输入
	 * @param regEx
	 *            在则表示
	 * @param group
	 * @return 成功 ,失败
	 */
	public static boolean regFindExist(String src, String regEx, int group) {
		if (StringUtil.isNull(regEx))
			return false;
		Pattern pat = Pattern.compile(regEx);
		Matcher mat = pat.matcher(src);
		return mat.find();
	}

	public static void main(String[] args) {
		/*
		 * ReportTaskTrigger t = new ReportTaskTrigger(null, null); String src = "BJ_RTKPI_ERI_R12_BJOMC101_2013070801.tar.gz"; String regEx =
		 * "(\\d{10})"; String ss = regFind(src, regEx, 1); System.out.println(ss); regEx = "BJOMC101"; boolean b = regFindExist(src, regEx, 0);
		 * System.out.println(b); String sss = "好样的"; String mm; try { mm = new String(sss.getBytes("gbk")); System.out.println(mm); } catch
		 * (UnsupportedEncodingException e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		/*
		 * String test =
		 * "<?xml version=\"1.0\" encoding=\"gb2312\"?><rnop_service_output_para><service_instance><service_id>DRS105</service_id><version>R1</version><service_name>文异常通知</service_name><service_desc>指定获取的数据文件准备异常或上报异常发生后通知，上报异常说明和异常原因</service_desc><service_content><resultnotify>更新文件列表时发生异常！</resultnotify></service_content></service_instance></rnop_service_output_para>"
		 * ; ResponseParser responser = new ResponseParser(test); try { responser.parser("WCDMA", ResponseParser.RESPONSE_Type); } catch (Exception e)
		 * { LOG.error("开始上报中,解析集团返回的响应信息失败." + test, e); }
		 */

		String src = "BJ_RTPARA_ERI1_OMC101ECR23_20130723.tar.gz";
		System.out.println(regFindExist(src, "101", 0));
		System.out.println(regFindExist(src, "ECR23", 0));

		String dir = ConfigProperties.getInstance().getCurrentPath();
		System.out.println(dir);

	}
}
