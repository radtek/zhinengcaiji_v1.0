package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.NossTask;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.task.ReportTaskTrigger;
import cn.uway.nbi.ui.CltTask;
import cn.uway.nbi.ui.ConnectionMgr;
import cn.uway.nbi.ui.DRS102service_content;
import cn.uway.nbi.ui.DataEntity;
import cn.uway.nbi.ui.FileInfoType;
import cn.uway.nbi.ui.ObjectListMatch;
import cn.uway.nbi.ui.SeqMgr;
import cn.uway.nbi.ui.config.ConfigProperties;
import cn.uway.nbi.ui.consume.ReportRequestService;
import cn.uway.nbi.util.ConstDef;

@IDMember(id = ConstDef.NOSS_TYPE)
public class NossUploadReportTaskDao extends AbstractDAO<NossTask> {

	private String regEx = "(\\d{8})";

	private String regEx_10 = "(\\d{10})";

	private static final Logger LOG = LoggerFactory.getLogger(NossUploadReportTaskDao.class);

	private java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static String w_sql = " select * from ( select t.omcid  omc_info  ,t.city_id ||'_'||t.bsc_id bsc_info, t.vendor,   'OMC'||t.omcid  omc_id, 'BSC'|| t.bsc_id  bsc_id,t.vendor||'_OMC'||omcid||'_BSC'||bsc_id   object, ven.shortening  from ne_bsc_w t, cfg_city_map_hq_id hq,cfg_vendorinfo ven where t.city_id = hq.city_id  and t.vendor=ven.vendor   and t.rnc_state is not null  ) where 1=1  ";

	private static String g_sql = "select * from ( select distinct hq.prov_enname || 'OMC' || omc.engle_name  omc_info, hq.prov_enname || 'OMC' || omc.engle_name || '_' || hq.en_name || 'BSC' || to_number(substr(bsc.ne_sys_id, 7, 3)) as BSC_info, bsc.vendor  vendor,  'OMC' || omc.engle_name  omc_id,  'BSC' || to_number(substr(bsc.ne_sys_id, 7, 3))  bsc_id , bsc.vendor||'_'|| 'OMC' || omc.engle_name||'_'|| 'BSC' || to_number(substr(bsc.ne_sys_id, 7, 3)) object,  ven.shortening from ne_omc_g omc,  cfg_city_map_hq_id hq,  ne_bsc_g bsc,  cfg_vendorinfo  ven  where omc.city_id = hq.city_id  and bsc.vendor=ven.vendor  and omc.city_id = bsc.city_id  )  where 1=1  ";

	private static String objectLevel_OMC = "OMC";

	private static String objectLevel_BSC = "BSC";

	private static String objectLevel_RNC = "RNC";

	public static String objectLevel_CELl = "CELL";

	/*
	 * 当数据上报到集团ftp后，更新任务状态为已经上报状态.
	 */
	@Override
	public boolean update(NossTask task) throws Exception {
		StringBuilder sb = new StringBuilder("update noss_upload_report_task t set state=1 where t.id=" + task.getId());
		String tableName = "noss_upload_report_task";

		boolean flag = DBUtil.executeUpdate(sb.toString(), task.getDomaintype()) == 1 ? true : false;
		long taskId = task.getId();
		LOG.debug("taskId:" + taskId + "  成功更新" + tableName + "表");
		return flag;
	}

	/**
	 * 通过网络类型获取需要上报的任务列表
	 * 
	 * @param domainType
	 *            网络类型
	 * @return 需要上报的任务
	 */
	private List<NossTask> queryNossReportTasks(String domainType) {
		String sql = "select  case when  t.curr_data_time is null then begintime else curr_data_time end  curr_data_time ,id ,service_id,version,service_name,service_desc,sercaller,requestid,domaintype,filetype,begintime,endtime,objectlevel,objectlist ,state    from  noss_upload_report_task t where case when  t.curr_data_time is null then begintime else curr_data_time end <=t.endtime and state=0 ";
		LOG.debug("加载任务sql语句: " + sql);

		List<NossTask> list = new ArrayList<NossTask>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Map<Long, NossTask> map = new HashMap<Long, NossTask>();
		try {
			conn = ConnectionMgr.getConnection(domainType);
			st = conn.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				NossTask task = new NossTask();
				task.setTask(true);
				task.setId(rs.getLong("id"));

				task.setService_id(rs.getString("service_id"));
				Date begintime = rs.getTimestamp("begintime");
				Date currDate = rs.getTimestamp("CURR_DATA_TIME");

				if (begintime == null) {
					Log.warn(task.getId() + "需要配置任务时间begintime");
					continue;
				}
				if (currDate == null) {
					currDate = begintime;
				}
				task.setCurrDataTime(currDate);
				Date endtime = rs.getTimestamp("endtime");
				task.setEndDataTime(endtime);
				String version = rs.getString("version");
				task.setVersion(version);

				String service_name = rs.getString("service_name");
				task.setService_name(service_name);

				String service_desc = rs.getString("service_desc");
				task.setService_desc(service_desc);
				String sercaller = rs.getString("sercaller");
				task.setSercaller(sercaller);
				String requestid = rs.getString("requestid");
				task.setRequestid(requestid);
				String domaintype = rs.getString("domaintype");
				task.setDomaintype(domaintype);

				String filetype = rs.getString("filetype");
				task.setFiletype(filetype);

				task.setTempletPath("");
				task.setUsed(rs.getInt("state") == 1 ? true : false);
				task.setReportTime(null);
				task.setObjectlevel(rs.getString("objectlevel"));
				task.setObjectlist(rs.getString("objectlist"));

				list.add(task);
				map.put(task.getId(), task);
			}
		} catch (Exception e) {
			LOG.error(" 加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	}

	/**
	 * 加载G，W网上报任务
	 */
	@Override
	public List<NossTask> loadTasks() throws Exception {
		List<NossTask> result = new ArrayList<NossTask>();
		List<NossTask> list = queryNossReportTasks(ReportRequestService.gflag);
		List<NossTask> listW = queryNossReportTasks(ReportRequestService.wflag);

		result.addAll(list);
		result.addAll(listW);
		return result;
	}

	/**
	 * @param objectList
	 *            集团下发的objectlist
	 * @return 拼接成需要的sql条件
	 */
	public String getObjectListSql(String objectList) {
		if (StringUtil.isNull(objectList)) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		String[] objs = objectList.split(";");
		if (objs != null && objs.length > 0) {
			for (String obj : objs) {
				if (StringUtil.isNull(obj))
					continue;
				sb.append("'").append(obj).append("',");
			}
		}
		if (sb.length() > 0)
			sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}

	/**
	 * 总部下发的objectlist和采集任务中对应objectlist对应关系对象列表
	 * 
	 * @param task
	 *            总部下发的任务
	 * @return 对应的匹配列表
	 */
	public List<ObjectListMatch> getObjectListMetch(NossTask task) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 封装成对象放到列表中。
		List<ObjectListMatch> fileInfoList = new ArrayList<ObjectListMatch>();

		try {
			String domain = task.getDomaintype();
			// String filetype = task.getFiletype();
			String level = task.getObjectlevel();
			conn = ConnectionMgr.getConnection(domain);
			StringBuffer objApp = new StringBuffer();

			String objectSql = getObjectListSql(task.getObjectlist());

			if (domain.equalsIgnoreCase(ReportRequestService.gflag)) {
				objApp.append(g_sql);
				if (objectLevel_OMC.equalsIgnoreCase(level)) {
					if (StringUtil.isNotNull(objectSql))
						objApp.append("  and  omc_info in (").append(objectSql).append(") ");
				} else if (objectLevel_BSC.equalsIgnoreCase(level) || objectLevel_RNC.equalsIgnoreCase(level)) {
					if (StringUtil.isNotNull(objectSql))
						objApp.append("  and  BSC_info in (").append(objectSql).append(") ");
				}
			} else if (domain.equalsIgnoreCase(ReportRequestService.wflag)) {
				objApp.append(w_sql);
				if (objectLevel_OMC.equalsIgnoreCase(level)) {
					if (StringUtil.isNotNull(objectSql))
						objApp.append("  and  omc_info in (").append(objectSql).append(") ");
				} else if (objectLevel_BSC.equalsIgnoreCase(level) || objectLevel_RNC.equalsIgnoreCase(level)) {
					if (StringUtil.isNotNull(objectSql))
						objApp.append("  and  BSC_info in (").append(objectSql).append(") ");
				}
			}

			String strSQL = objApp.toString();
			LOG.debug(this + ": 集团请求对象与优网网元对应关系脚本: " + strSQL);
			pstmt = conn.prepareStatement(strSQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ObjectListMatch fileinfo = new ObjectListMatch();
				fileinfo.omcInfo = (rs.getString("omc_info"));
				fileinfo.bscInfo = (rs.getString("bsc_Info"));
				fileinfo.vendor = (rs.getString("vendor"));
				fileinfo.omcid = (rs.getString("omc_id"));
				fileinfo.bsc_id = (rs.getString("bsc_id"));
				fileinfo.object = (rs.getString("object"));
				fileinfo.shortEning = (rs.getString("shortEning"));
				fileInfoList.add(fileinfo);
			}
		} catch (Exception e) {
			LOG.error(this + "-GetCollectInfo.", e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return fileInfoList;
	}

	/**
	 * @param task
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	public DataEntity queryReportFileInfoByFiletype(NossTask task) throws Exception {

		DataEntity entity = new DataEntity();
		String domain = task.getDomaintype();
		String filetype = task.getFiletype();

		List<FileInfoType> fileInfoList = new ArrayList<FileInfoType>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuilder filetype_sb = new StringBuilder();

		String currDomain = "";

		if (domain.equalsIgnoreCase(ReportRequestService.gflag)) {
			currDomain = "G_";
			if (filetype.equalsIgnoreCase("GR_RTKPI"))
				filetype_sb.append("('GR_RTKPI')");// ,'GR_PARA')
			else if (filetype.equalsIgnoreCase("GR_RTMR")) {
				filetype_sb.append("('GR_RTMR')"); // ,'GR_PARA'
			}
		} else {
			currDomain = "W_";
			if (filetype.equalsIgnoreCase("WR_RTKPI") || filetype.equalsIgnoreCase("GR_RTKPI"))
				filetype_sb.append("('GR_RTKPI')");// ,'WR_PARA',
													// 'GR_RTKPI','GR_PARA'
			else if (filetype.equalsIgnoreCase("WR_RTMR")) {
				filetype_sb.append("('GR_RTMR')");// ,'WR_PARA','GR_RTMR','GR_PARA'
			}
		}
		List<CltTask> allCltTaskList = new ArrayList<CltTask>();

		// 集团下发请求获取对象列表
		String objectList = task.getObjectlist();
		// 集团下发请求获取对象级别
		String level = task.getObjectlevel();
		// 是否按照OMC进行上报
		boolean omcFlag = level.equalsIgnoreCase(objectLevel_OMC);

		// 是否按照BSC进行上报
		boolean bscFlag = level.equalsIgnoreCase(objectLevel_BSC) || level.equalsIgnoreCase(objectLevel_RNC);

		List<ObjectListMatch> objectMatchList = getObjectListMetch(task);

		/* 集团下发请求参数，匹配对应的优网任务表 */
		List<ObjectListMatch> filterMatchList = new ArrayList<ObjectListMatch>();

		String objs[] = objectList.split(";");

		for (String obj : objs) {
			if (StringUtil.isNull(obj))
				continue;
			for (ObjectListMatch match : objectMatchList) {
				// 如果按照OMC粒度进行上报，则添加到队列中
				if (omcFlag) {
					if (obj.equalsIgnoreCase(match.omcInfo)) {
						filterMatchList.add(match);
					}
				} else if (bscFlag) {
					// 如果按照BSC粒度进行上报，则添加到队列中
					if (obj.equalsIgnoreCase(match.bscInfo)) {
						filterMatchList.add(match);
					}
				}

			}
		}
		allCltTaskList = getAllCltTask(task);

		StringBuilder taskIdMatch = new StringBuilder();
		String taskIds = " ";

		// 过滤获取所有符合要求的任务

		for (CltTask taskPara : allCltTaskList) {
			String object = taskPara.bsclist;

			if (StringUtil.isNull(object))
				continue;

			// 厂家+OMC+BSC
			String[] objects = object.split(",");

			String taskId = taskPara.task_id;

			boolean taskFlag = false;

			for (String obj : objects) {
				boolean matchFlag = false;
				String[] taskObjectList = obj.split("_");
				// String ven = taskObjectList[0];
				String omc = taskObjectList[1];
				String bsc = "";
				if (taskObjectList.length > 2) {
					bsc = taskObjectList[2];
				}

				for (ObjectListMatch match : filterMatchList) {

					// 如果按照OMC粒度进行上报，则添加到队列中
					if (omcFlag) {
						if (omc.equalsIgnoreCase(match.omcid)) {

							matchFlag = true;
							break;
						}
					} else if (bscFlag) {
						// 如果按照BSC粒度进行上报，则添加到队列中
						if (obj.equalsIgnoreCase(match.object)) {
							matchFlag = true;
							break;
						}
					}
				}
				if (matchFlag) {
					taskFlag = true;
					break;
				}

			}
			if (taskFlag)
				taskIdMatch.append(taskId).append(",");

		}
		// 匹配符合条件的任务id
		if (taskIdMatch.length() > 0) {
			taskIdMatch.deleteCharAt(taskIdMatch.length() - 1);
			taskIds = taskIdMatch.toString();
		}

		String taskIdCondition = "";
		if (StringUtil.isNotNull(taskIds)) {
			taskIdCondition = " and  task.task_id in (" + taskIds + ")";
		}

		Map<String, FileInfoType> fMap = new HashMap<String, FileInfoType>();
		Connection conn = null;
		try {
			conn = ConnectionMgr.getConnection(domain);
			StringBuffer m_Build = new StringBuffer();
			m_Build.append("select a.*,v.vendor,v.shortening from  (select  info.*  ,task.domaintype,task.filetype ,task.vendor from noss_file_info info,clt_conf_noss_task task  where task.isused=1 and  info.task_id=task.task_id and task.domaintype='"
					+ domain
					+ "' "
					+ taskIdCondition
					+ " and  filetype in "
					+ filetype_sb.toString()
					+ " ) a  left join cfg_vendorinfo  v on a.vendor =v.vendor");

			String strSQL = m_Build.toString();
			LOG.debug(this + ":  SQL执行成功: " + strSQL);
			pstmt = conn.prepareStatement(strSQL);
			rs = pstmt.executeQuery();
			Properties vendorPro = ConfigProperties.getProps();

			while (rs.next()) {
				try {
					FileInfoType fileinfo = new FileInfoType();
					fileinfo.setFileName(rs.getString("fileName"));

					if (fMap.containsKey(fileinfo.getFileName()))
						continue;

					fileinfo.setSerCaller(rs.getString("serCaller"));
					fileinfo.setFileAddr(rs.getString("fileAddr"));
					fileinfo.setFileFormat(rs.getString("fileFormat"));

					fileinfo.setDomaintype(rs.getString("domaintype"));
					String tmpFiletype = rs.getString("filetype");

					if (fileinfo.getDomaintype().equalsIgnoreCase("WCDMA")) {
						tmpFiletype = tmpFiletype.replace("GR_", "WR_");

					}
					fileinfo.setFiletype(tmpFiletype);

					String fileMappingDir = ConfigProperties.getInstance().getPropertiesValue(
							ReportTaskTrigger.FTP_DIRECTIORY + fileinfo.getFiletype());

					fileinfo.setFileMappingDir(fileMappingDir);

					Date d = rs.getDate("fileGeneration");
					String generateDate = null;
					if (d != null)
						generateDate = format.format(new Date(d.getTime()));

					fileinfo.setFileGeneration(generateDate);
					fileinfo.setFileSize(rs.getInt("fileSize"));
					fileinfo.setTask_id(rs.getLong("task_id"));
					fileinfo.setId(rs.getLong("id"));

					List<String> vendorList = new ArrayList<String>();

					Iterator<Entry<Object, Object>> it = vendorPro.entrySet().iterator();

					while (it.hasNext()) {
						Entry<Object, Object> en = it.next();
						String key = (String) en.getKey();

						if (key.startsWith(currDomain)) {
							String value = (String) en.getValue();
							if (StringUtil.isNotNull(value))
								vendorList.add(value.trim());
						}

					}

					String fileName = new String(fileinfo.getFileName());
					fileName = fileName.replace("\\", "/");
					int index = fileName.lastIndexOf("/");
					if (index != -1) {
						fileName = fileName.substring(index + 1);
					}

					String name = new String(fileName);

					name = name.replace("\\", "/");

					// 文件名
					name = name.substring(name.lastIndexOf("/") + 1);

					String fileTypeMappingDir = ConfigProperties.getInstance().getPropertiesValue(
							ReportTaskTrigger.FTP_DIRECTIORY + task.getFiletype());

					fileinfo.setFileMappingDir(fileTypeMappingDir);

					fileinfo.setFileName(name);

					fileinfo.setFileNameCompare(name);

					String vsShort = "";

					// 通过文件名来查找厂家,确定是哪个厂家的数据文件
					for (String vendorValue : vendorList) {
						String venTmpValue = regFind(fileinfo.getFileAddr(), vendorValue, 0);
						if (StringUtil.isNotNull(venTmpValue)) {
							vsShort = venTmpValue;
							break;
						}
					}
					if (StringUtil.isNull(vsShort))
						LOG.warn(fileinfo + "厂家英文名为空, 关联不上，需检验表noss_file_info 和 clt_conf_noss_task 厂家关联关系 ");

					fileinfo.setVendorShortening(StringUtil.isNull(vsShort) ? "" : vsShort);

					/**
					 * 将不在范围时间内的数据文件过滤掉。
					 **/
					Date date = null;
					String time = regFind(fileName, regEx_10, 1);
					if (StringUtil.isNull(time)) {
						time = regFind(fileName, regEx, 1);
						SimpleDateFormat formatDay = new SimpleDateFormat("yyyyMMdd"); // yyyyMMDDHHmmss
						try {
							date = formatDay.parse(time);
						} catch (ParseException e) {
							LOG.error("解析天时间出现异常.原因: ", e);
						}
					} else {
						SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHH"); // yyyyMMDDHHmmss
						try {
							date = format.parse(time);
						} catch (ParseException e) {
							LOG.error("解析小时时间出现异常.原因: ", e);
						}
					}

					if (StringUtil.isNull(time))
						continue;

					if (date == null)
						continue;

					// 如果是G网MR数据上报，需要将每个文件打包成tar.gz文件
					if (task.getFiletype().contains(ReportTaskTrigger.RTMR) && task.getDomaintype().equalsIgnoreCase("GSM")) {
						if (fileName.endsWith(".asc.gz")) {
							String nametmp = new String(fileName);
							nametmp = nametmp.replace(".asc.gz", ".asc.tar.gz");
							fileinfo.setFileNameCompare(nametmp);
						}
					}

					Date bTime = task.getCurrDataTime();
					Date eTime = task.getEndDataTime();
					if (date.getTime() >= bTime.getTime() && date.getTime() <= eTime.getTime()) {
						fMap.put(fileinfo.getFileName(), fileinfo);
					}
				} catch (Exception e) {
					LOG.error(this + "-queryReportFileInfoByFiletype: 查询sql异常.", e);
				}
			}
			fileInfoList.addAll(fMap.values());
		} catch (Exception e) {
			LOG.error(this + "-GetCollectInfo.", e);
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		entity.fileInfoTypeList = fileInfoList;
		entity.matchCltTaskList = allCltTaskList;
		entity.filterMatchList = filterMatchList;
		return entity;

	}

	/**
	 * 通过总部下发的objectlist，查找clt_conf_noss_task表中的ojbectlist,找到匹配的任务id
	 * 
	 * @param task
	 *            集团下发的任务
	 * @return
	 */
	public List<CltTask> getAllCltTask(NossTask task) {
		String domainType = task.getDomaintype();
		String filetype = task.getFiletype();
		// String objectlist = task.getObjectlist();

		String filetypeTmp = new String(filetype);
		filetypeTmp = filetypeTmp.replace("GR_", "").replace("WR_", "");

		String sql = "select t.task_id,t.dev_id,t.group_id,t.objectlist ,mac.omcid  from  clt_conf_noss_task  t ,"
				+ "clt_conf_noss_mac  mac where t.filetype   like '%" + filetypeTmp + "%'   and t.dev_id = mac.dev_id  and  t.domaintype='"
				+ domainType + "'";
		List<CltTask> list = new ArrayList<CltTask>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = ConnectionMgr.getConnection(domainType);
			st = conn.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				CltTask mrinfo = new CltTask();
				mrinfo.task_id = (rs.getString("task_id"));
				mrinfo.dev_id = rs.getString("dev_id");
				mrinfo.group_id = rs.getString("GROUP_ID");
				mrinfo.bsclist = rs.getString("objectlist");

				if (StringUtil.isNull(mrinfo.bsclist)) {
					LOG.warn(mrinfo.task_id + "任务,OBJECTLIST为空，请配置.");
					continue;
				}
				list.add(mrinfo);
			}
		} catch (Exception e) {
			LOG.error(" 加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;

	}

	public void addRequestTask(DRS102service_content content) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into noss_upload_report_task");
		sql.append("(id,service_id, version, service_name, service_desc, sercaller, requestid, domaintype, filetype, begintime, endtime, objectlevel, objectlist)");
		sql.append("values");
		sql.append("(" + SeqMgr.getInstance().getSeq() + ",?,?,?,?,?,?,?,?,?,?,?,?)");
		sql.append("");
		PreparedStatement ps = null;

		Connection conn = null;
		try {
			conn = ConnectionMgr.getConnection(content.domainType);

			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, content.service_id);
			ps.setString(2, content.version);

			ps.setString(3, content.service_name);
			ps.setString(4, content.service_desc);

			ps.setString(5, content.serCaller);
			ps.setString(6, content.requestid);

			/*
			 * public String domainType; public String fileType; public String begintime; public String endtime; objectlevel, objectlist
			 */
			ps.setString(7, content.domainType);
			ps.setString(8, content.fileType);
			StringBuilder begintimeTmp = new StringBuilder();
			if (!StringUtil.isNull(content.begintime)) {
				content.begintime = content.begintime.replace("/", "-");
				begintimeTmp = new StringBuilder(content.begintime);
			}

			StringBuilder endtimeTmp = new StringBuilder();
			if (!StringUtil.isNull(content.endtime)) {

				content.endtime = content.endtime.replace("/", "-");
				endtimeTmp = new StringBuilder(content.endtime);
			}

			ps.setTimestamp(9, StringUtil.isNull(begintimeTmp.toString()) ? null : new Timestamp(format.parse(begintimeTmp.toString()).getTime()));
			ps.setTimestamp(10, StringUtil.isNull(endtimeTmp.toString()) ? null : new Timestamp(format.parse(endtimeTmp.toString()).getTime()));

			ps.setString(11, content.objectlevel);
			ps.setString(12, content.objectlist);

			ps.executeUpdate();
		} catch (Exception e) {
			LOG.error(" 记录数据库日志时异常 ,sql:" + sql, e);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
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
	 * 通过正则表达式查找
	 * 
	 * @param src
	 * @param regEx
	 * @param group
	 * @return
	 */
	public static boolean regFindExist(String src, String regEx, int group) {
		if (StringUtil.isNull(regEx))
			return false;
		Pattern pat = Pattern.compile(regEx);
		Matcher mat = pat.matcher(src);
		return mat.find();
	}

	public static void main(String[] args) {

		DRS102service_content content = new DRS102service_content();
		content.serCaller = "1";
		content.requestid = "1";
		content.domainType = "GSM";
		content.fileType = "1";
		content.begintime = "2013-01-01 06:00:00";
		content.endtime = "2013-01-01 08:00:00";
		content.objectlevel = "1";
		content.objectlist = "1";
		content.service_id = "1";
		content.version = "1";
		content.service_name = "1";
		content.service_desc = "1";

		/*
		 * NossUploadReportTaskDao dao = new NossUploadReportTaskDao(); dao.addRequestTask(content);
		 */

		String result = regFind("G/HW/AA", "HW", 0);
		System.out.println(result);

	}

}
