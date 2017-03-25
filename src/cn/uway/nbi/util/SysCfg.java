package cn.uway.nbi.util;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.des.DESDecryptor;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.exception.CfgException;

/**
 * 系统配置管理类
 * 
 * @author YangJian
 * @version 1.0
 * @since 1.0
 */
public final class SysCfg {

	protected static Logger logger = LoggerFactory.getLogger(SysCfg.class);

	private static SysCfg instance = null;

	private PropertiesXML propertiesXML;
	
	private String realDbUser;

	private String realDbPwd;

	private String realUrl;

	private String realService;

	// private static String loaclpath;

	public SysCfg(String configpath) {
		// loaclpath = configpath;
		load(configpath);
	}

	public SysCfg() {
		load(null);
	}

	public static SysCfg getInstance() {
		if (instance != null) {
			return instance;
		}
		return new SysCfg();
	}

	public static SysCfg getInstance(String configpath) {
		if (instance != null) {
			return instance;
		}
		return new SysCfg(configpath);
	}

	/**
	 * 加载系统配置文件
	 */
	private void load(String loaclpath) {
		try {
			if (loaclpath == null || loaclpath.trim().length() == 0) {
				propertiesXML = new PropertiesXML();
			} else {
				propertiesXML = new PropertiesXML(loaclpath);
			}
			// 2015-09-18 zhangp
			// 如果数据库用户密码为login/login，则为解密方式，从login用户的project_login_info同义词中取加密码字符串，解密得到真正的用户名与密码
            String dbDriver = getDbDriver();
            String dbUrl = getDbUrl().toLowerCase();
			String dbUser = getDbUserName().toLowerCase();
			String dbPwd = getDbPassword().toLowerCase();
			String dbNum = getDBNum().toLowerCase();
			String dbConnType = getDBConnType().toLowerCase();
			if (dbUser.equals("login") && dbPwd.equals("login") && (StringUtil.isNotNull(dbNum) && StringUtil.isNotNull(dbConnType))) {
				String sql = "SELECT * FROM TB_LOGIN_INFO  where db_num=? and conn_type =? ";  //
				Connection con = null;
				PreparedStatement st = null;
				ResultSet rs = null;
				try {
					con = DBUtil.getConnection(dbDriver, dbUrl, "login", "login");
					String loginInfo = null;
					st = con.prepareStatement(sql);

					st.setString(1, dbNum);
					st.setString(2, dbConnType);
					logger.debug("query for - " + sql);
					rs = st.executeQuery();
//					ResultSetMetaData m = rs.getMetaData();
					if (rs.next()) {
						loginInfo = rs.getString("LOGIN_INFO");
						logger.debug("query ok - " + sql);

					} else {
						throw new Exception("select出来的记录数为0");
					}

					DESDecryptor desDecryptor = new DESDecryptor();
					String result = desDecryptor.desDecrypt(loginInfo, "UWAY@SOFT2009");
					if (desDecryptor.getLastException() != null) {
						throw desDecryptor.getLastException();
					}
					// result = result.toLowerCase().replace("user id=", "").replace("password=", "");
					result = result.toLowerCase();

					String[] split = result.split(";");
					for (String name : split) {
						if (name.startsWith("url")) {
							name = name.replace("url={", "");
							StringBuilder sb = new StringBuilder(name);
							sb.deleteCharAt(name.length() - 1);
							realUrl = sb.toString();

							if (sb.toString().contains("@") && sb.toString().toUpperCase().contains("DESCRIPTION"))
								realService = sb.substring(sb.lastIndexOf("@") + 1);

						} else if (name.startsWith("username")) {
							name = name.replace("username={", "");
							StringBuilder sb = new StringBuilder(name);
							sb.deleteCharAt(name.length() - 1);
							realDbUser = sb.toString();
						} else if (name.startsWith("password")) {
							name = name.replace("password={", "");
							StringBuilder sb = new StringBuilder(name);
							sb.deleteCharAt(name.length() - 1);
							realDbPwd = sb.toString();
						}
					}
				} catch (Throwable e) {
					logger.error("在tb_login_info同义词中获取数据库账户时出现异常:" + sql, e);
				} finally {
					DBUtil.close(rs, st, con);
				}
			}
		} catch (CfgException e) {
			logger.error("加载[original]系统配置文件信息失败,原因:", e);
		}
	}

	public void reload() {
		propertiesXML = null;
		load(null);
	}

	/**
	 * 获取版本号，默认空字符串
	 * 
	 * @return
	 */
	public String getEdition() {
		String e = propertiesXML.getProperty("nbi_cfg.system.version.edition");
		if (StringUtil.isNull(e)) {
			e = "";
		}
		return e;
	}

	/** 获取本地计算pid */
	public String getHostPid() {
		String e = propertiesXML.getProperty("nbi_cfg.system.pid");
		if (StringUtil.isNull(e)) {
			e = "";
		}
		return e;
	}

	/**
	 * 忽略templet/task/*.xml中的配置的sql中表名不存在的错误。
	 * 
	 * @return
	 */
	public boolean ignoreTable() {
		boolean b = true;
		String e = propertiesXML.getProperty("nbi_cfg.system.ignore");
		if (StringUtil.isNull(e)) {
			b = false;
		}
		return b;
	}

	public int getModelId() {
		String e = propertiesXML.getProperty("nbi_cfg.system.model");
		if (StringUtil.isNull(e)) {
			return 1;
		}
		return Integer.valueOf(e);
	}

	/**
	 * 是否开启ucloud服务
	 * 
	 * @return
	 */
	public boolean isUcloudService() {
		boolean b = false;
		String str = propertiesXML.getProperty("nbi_cfg.system.ucloud_service");
		if (StringUtil.isNull(str)) {
			return b;
		}
		str = str.toLowerCase().trim();
		if (str.equals("on") || str.equals("true")) {
			b = true;
		} else if (str.equals("off") || str.equals("false")) {
			b = false;
		} else if (str.equals("1")) {
			b = true;
		}
		return b;
	}

	/**
	 * 获取发布时间（yyyy-mm-dd hh:mm:ss），默认空字符串
	 * 
	 * @return
	 */
	public String getReleaseTime() {
		String d = propertiesXML.getProperty("config.system.version.releaseTime");
		if (StringUtil.isNull(d)) {
			return "";
		}
		try {
			d = DateUtil.getDateString(DateUtil.getDate(d));
		} catch (Exception e) {
			return "";
		}
		return d;
	}

	/**
	 * 获取当前路径，用于临时文件存放等
	 */
	public String getCurrentpath() {
		String s = propertiesXML.getProperty("nbi_cfg.system.currentpath");
		if (StringUtil.isNull(s)) {
			s = "c:\\";
		}

		File file = new File(s);
		if (!file.exists()) {
			logger.info(s + "目录OK" + file.mkdirs());
		} else {
			logger.info(s + "目录OK");
		}

		return s;
	}

	/**
	 * 获取当前路径，用于临时文件存放等
	 */
	public String get7ZCompressPath() {
		String s = propertiesXML.getProperty("nbi_cfg.other.win_7zpath");
		if (StringUtil.isNull(s)) {
			return null;
		}
		return s.trim();
	}

	/**
	 * 7z压缩工具
	 */
	public boolean isExist7ZCompressPath() {
		String s = propertiesXML.getProperty("nbi_cfg.other.win_7zpath");
		if (StringUtil.isNull(s)) {
			return false;
		}
		return true;
	}

	/**
	 * 获取当前路径，用于临时文件存放等
	 */
	public String getFTpServerCharset() {
		String s = propertiesXML.getProperty("nbi_cfg.system.ftpservercharset");
		if (StringUtil.isNull(s))
			s = "iso-8859-1";
		return s;
	}

	/**
	 * 是否删除本地生成的临时文件
	 */
	public boolean isDelLocalFile() {
		String del = propertiesXML.getProperty("nbi_cfg.system.dellocalfile");
		boolean flag = false;
		if (del != null && (del.contains("true") || del.contains("on")))
			flag = true;
		return flag;
	}

	/**
	 * 获取上报任务扫描时间周期(单位:毫秒)
	 * 
	 * @return
	 */
	public long getTaskScanPeroid() {
		String period = propertiesXML.getProperty("nbi_cfg.system.taskscanperiod");
		long lPeriod = ConstDef.SCANINTERVAL;
		if (period != null)
			lPeriod = Long.parseLong(period);
		return lPeriod * 1000;
	}

	/**
	 * 获取补报任务扫描时间周期(单位:毫秒)
	 * 
	 * @return
	 */
	public long getRTaskScanPeroid() {
		String period = propertiesXML.getProperty("nbi_cfg.system.rtaskscanperiod");
		long lPeriod = ConstDef.RSCANINTERVAL;
		if (period != null)
			lPeriod = Long.parseLong(period);
		return lPeriod * 1000;
	}

	/**
	 * 获取最大上报时间(单位:分钟)
	 * 
	 * @return
	 */
	public int getMaxReportTime() {
		String reportTime = propertiesXML.getProperty("nbi_cfg.system.maxreporttime");
		// int lPeriod = MAXREPORTTIME;
		int lReport = 0;
		if (reportTime != null && !"".equals(reportTime))
			lReport = Integer.parseInt(reportTime);
		return lReport;
	}

	/**
	 * 任务池大小配置
	 * 
	 * @return
	 */
	public int getTaskPoolSize() {
		String del = propertiesXML.getProperty("nbi_cfg.system.taskpoolsize");
		if (StringUtil.isNull(del))
			return 15;
		return Integer.parseInt(del);
	}

	/** 是否为 oracle 数据库 */
	public boolean isOracle() {
		String strDriver = propertiesXML.getProperty("nbi_cfg.db.dbpooltype");

		return strDriver.contains("oracle");
	}

	/** 是否为 sybase 数据库 */
	public boolean isSybase() {
		String strDriver = propertiesXML.getProperty("nbi_cfg.db.dbpooltype");

		return strDriver.contains("sybase");
	}

	/**
	 * 获取数据库连接池类型，默认类型 (dbcp=1),其他类型 c3p0=2
	 * 
	 * @return
	 */
	public int getDbPoolType() {
		int type = 1;
		String dbpooltype = propertiesXML.getProperty("nbi_cfg.db.dbpooltype");
		if (StringUtil.isNull(dbpooltype)) {
			return type;
		}
		try {
			type = Integer.valueOf(dbpooltype);
		} catch (NumberFormatException e) {
			type = 1;
			return type;
		}
		if (type < 0 || type > 5) {
			type = 1;
		}

		return type;
	}

	/**
	 * 获取连接池名称，默认值：S3_DB_POOL
	 * 
	 * @return
	 */
	public String getPoolName() {
		String dbName = propertiesXML.getProperty("nbi_cfg.db.name");

		if (StringUtil.isNull(dbName)) {
			dbName = "S3_DB_POOL";
		}

		return dbName;
	}

	/**
	 * 获取连接池类型，默认值：javax.sql.DataSource
	 * 
	 * @return
	 */
	public String getPoolType() {
		String name = propertiesXML.getProperty("nbi_cfg.db.type");

		if (StringUtil.isNull(name)) {
			name = "javax.sql.DataSource";
		}

		return name;
	}

	/**
	 * 获取数据库驱动类，默认值：oracle.jdbc.driver.OracleDriver
	 * 
	 * @return
	 */
	public String getDbDriver() {
		String driver = propertiesXML.getProperty("nbi_cfg.db.driverClassName");

		if (StringUtil.isNull(driver)) {
			driver = "oracle.jdbc.driver.OracleDriver";
		}

		return driver;
	}

	/**
	 * 获取数据库连接字符串，默认值为空字符串
	 * 
	 * @return
	 */
	public String getDbUrl() {
		if (realUrl != null)
			return realUrl;
		String url = propertiesXML.getProperty("nbi_cfg.db.url");
		if (StringUtil.isNull(url)) {
			url = "";
		}
		return url;
	}

	/**
	 * 获取数据库服务名，默认为空字符串
	 * 
	 * @return
	 */
	public String getDbService() {
		if (realService != null)
			return realService;
		String service = propertiesXML.getProperty("nbi_cfg.db.service");
		if (StringUtil.isNull(service)) {
			service = "";
		}
		return service;
	}

	/**
	 * 获取数据库用户名，默认为空字符串
	 * 
	 * @return
	 */
	public String getDbUserName() {
		if (realDbUser != null) {
			return realDbUser;
		}
		String user = propertiesXML.getProperty("nbi_cfg.db.user");
		if (StringUtil.isNull(user)) {
			user = "login";
		}
		return user;
	}

	/**
	 * 获取数据库密码，默认为空字符串
	 * 
	 * @return
	 */
	public String getDbPassword() {
		if (realDbPwd != null) {
			return realDbPwd;
		}
		String pwd = propertiesXML.getProperty("nbi_cfg.db.password");
		if (StringUtil.isNull(pwd)) {
			pwd = "login";
		}
		return pwd;
	}

	/**
	 * 获取连接池最大活动连接数，默认值：12
	 * 
	 * @return
	 */
	public int getPoolMaxActive() {
		int ma = 12;
		try {
			ma = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.db.maxActive"));
		} catch (Exception e) {
			return 12;
		}

		if (ma <= 0) {
			ma = 12;
		}
		return ma;
	}

	/**
	 * 获取连接池最大活动空闲连接数，默认值：5
	 * 
	 * @return
	 */
	public int getPoolMaxIdle() {
		int maxIdle = 5;
		try {
			maxIdle = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.db.maxIdle"));
		} catch (Exception e) {
		}
		if (maxIdle <= 0) {
			maxIdle = 5;
		}
		return maxIdle;
	}

	/**
	 * 获取连接池最大等待数，默认值：10000
	 * 
	 * @return
	 */
	public int getPoolMaxWait() {
		int maxWait = 10000;
		try {
			maxWait = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.db.maxWait"));
		} catch (Exception e) {
		}
		if (maxWait <= 0) {
			maxWait = 10000;
		}
		return maxWait;
	}

	/**
	 * 执行SELECT时的超时时间，单位为秒，默认60秒
	 * 
	 * @return
	 */
	public int getQueryTimeout() {
		int timeout = 60;
		try {
			timeout = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.db.queryTimeout"));
		} catch (Exception e) {
		}
		if (timeout <= 0) {
			timeout = 60;
		}
		return timeout;
	}

	/**
	 * 获取数据库连接验证语句，默认值：select sysdate from dual
	 * 
	 * @return
	 */
	public String getDbValidationQueryString() {
		String sql = propertiesXML.getProperty("nbi_cfg.db.validationQuery");
		if (StringUtil.isNull(sql)) {
			sql = "select sysdate from dual";
		}
		return sql;
	}

	/**
	 * 是否删除sqlldr文件，默认值：true
	 * 
	 * @return
	 */
	public boolean isDeleteLog() {
		boolean b = true;

		try {
			b = Boolean.parseBoolean(propertiesXML.getProperty("nbi_cfg.externalTool.sqlldr.delLog"));
		} catch (Exception e) {
		}
		return b;
	}

	/**
	 * 获取sqlldr字符集，默认值：ZHS16GBK
	 * 
	 * @return
	 */
	public String getSqlldrCharset() {
		String s = propertiesXML.getProperty("nbi_cfg.externalTool.sqlldr.charset");

		if (StringUtil.isNull(s)) {
			s = "ZHS16GBK";
		}

		return s;
	}

	/**
	 * 是否开启告警模块 true 开启, false 关闭
	 */
	public boolean isEnableAlarm() {
		boolean b = false;
		String on = propertiesXML.getProperty("nbi_cfg.module.alarm.enable");
		if (StringUtil.isNotNull(on)) {
			on = on.toLowerCase().trim();
			if (on.equals("on") || on.equals("true"))
				b = true;
		}
		return b;
	}

	/**
	 * 是否开启Web模块，默认为true | on
	 * 
	 * @return
	 */
	public boolean isEnableWeb() {
		boolean b = false;
		String str = propertiesXML.getProperty("nbi_cfg.module.web.enable");
		if (StringUtil.isNull(str)) {
			return b;
		}
		str = str.toLowerCase().trim();
		if (str.equals("on") || str.equals("true")) {
			b = true;
		} else if (str.equals("off") || str.equals("false")) {
			b = false;
		}
		return b;
	}

	public int getWebPort() {
		int port = 8080;
		try {
			port = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.module.web.port"));
		} catch (Exception e) {
		}
		if (port <= 0) {
			port = 8080;
		}
		return port;
	}

	public String getWebCharset() {
		return propertiesXML.getProperty("nbi_cfg.module.web.charset");
	}

	public String getWinrarPath() {
		String s = propertiesXML.getProperty("nbi_cfg.other.winrarpath");
		if (StringUtil.isNull(s)) {
			return null;
		}
		return s.trim();
	}

	public String getBsasnapcell() {
		return propertiesXML.getProperty("nbi_cfg.other.bsasnapcell");
	}

	public String getRTasksort() {
		String result = "ASC";
		String value = propertiesXML.getProperty("nbi_cfg.system.rtasksort");
		if (StringUtil.isNull(value))
			return result;
		if (!"1".equals(value))
			result = "DESC";
		return result;
	}

	public int getRTaskMaxAction() {
		int count = 30;
		String maxcount = propertiesXML.getProperty("nbi_cfg.system.rtaskmaxaction");
		if (StringUtil.isNotNull(maxcount))
			return Integer.parseInt(maxcount);
		return count;
	}

	public int getTaskMaxAction() {
		int count = 10;
		String maxcount = propertiesXML.getProperty("nbi_cfg.system.taskmaxaction");
		if (StringUtil.isNotNull(maxcount))
			return Integer.parseInt(maxcount);
		return count;
	}

	public String getServiceAddress() {
		return propertiesXML.getProperty("nbi_cfg.webserver.serveraddress");
	}

	//
	public int getObtainSheetPeriod() {
		// liangww add 2011-10-09
		int period = 30;
		String str = null;

		str = propertiesXML.getProperty("nbi_cfg.webserver.obtainsheetperiod");

		if (StringUtil.isNotNull(str)) {
			period = Integer.valueOf(str);
		}

		return period;
	}
	public String isOpenSmc() {
		String url = propertiesXML.getProperty("nbi_cfg.interface.sms.isOpenSMC");

		if (StringUtil.isNull(url)) {
			return null;
		}
		return url;
	}
	public String getSmsserviceurl() {
		String url = propertiesXML.getProperty("nbi_cfg.interface.sms.smsserviceurl");

		if (StringUtil.isNull(url)) {
			return null;
		}
		return url;
	}
	
	public String getEmail() {
		String email = propertiesXML.getProperty("nbi_cfg.interface.sms.email");

		if (StringUtil.isNull(email)) {
			return null;
		}
		return email;
	}
	
	public String getPhone() {
		String phone = propertiesXML.getProperty("nbi_cfg.interface.sms.phone");

		if (StringUtil.isNull(phone)) {
			return null;
		}
		return phone;
	}
	
	public int getSendWay() {
		String sendWay = propertiesXML.getProperty("nbi_cfg.interface.sms.sendWay");

		if (StringUtil.isNull(sendWay)) {
			return 1;
		}
		return Integer.parseInt(sendWay);
	}
	
	public int getLevel() {
		String level = propertiesXML.getProperty("nbi_cfg.interface.sms.level");

		if (StringUtil.isNull(level)) {
			return 1;
		}
		return Integer.parseInt(level);
	}
	
	public int getType() {
		String type = propertiesXML.getProperty("nbi_cfg.interface.sms.type");

		if (StringUtil.isNull(type)) {
			return 1;
		}
		return Integer.parseInt(type);
	}
	
	public int getSrcId() {
		String srcId = propertiesXML.getProperty("nbi_cfg.interface.sms.srcId");

		if (StringUtil.isNull(srcId)) {
			return 1;
		}
		return Integer.parseInt(srcId);
	}
	
	public String getTitle() {
		String title = propertiesXML.getProperty("nbi_cfg.interface.sms.title");

		if (StringUtil.isNull(title)) {
			return "smc";
		}
		return title;
	}

	public String getDtServiceUrl() {
		String url = propertiesXML.getProperty("nbi_cfg.webserver.dtserviceurl");

		if (StringUtil.isNull(url)) {
			return null;
		}
		return url;
	}

	public int getWebport() {
		String url = propertiesXML.getProperty("nbi_cfg.web.port");

		if (StringUtil.isNull(url)) {
			return 8088;
		}
		return Integer.valueOf(url);
	}

	public String getWebapp() {
		String url = propertiesXML.getProperty("nbi_cfg.web.webapp");

		if (StringUtil.isNull(url)) {
			return "./Web";
		}
		return "./" + url;
	}

	public String getWebContext() {
		String url = propertiesXML.getProperty("nbi_cfg.web.webcontext");

		if (StringUtil.isNull(url)) {
			return "/nbi";
		}
		return "/" + url;
	}

	public String getSnapCellDataDir() {
		String url = propertiesXML.getProperty("nbi_cfg.other.snapcelldatadir");

		if (StringUtil.isNull(url)) {
			return null;
		}
		url = url.replace("//", "\\").replace("\\\\", "\\");
		if (url.lastIndexOf("\\") == url.length() - 1)
			url = url.substring(0, url.length() - 1);
		return url;
	}

	public String getTedb_global() {
		String url = propertiesXML.getProperty("nbi_cfg.other.tedb_global");

		if (StringUtil.isNull(url)) {
			return null;
		}
		url = url.replace("//", "\\").replace("\\\\", "\\");
		if (url.lastIndexOf("\\") == url.length() - 1)
			url = url.substring(0, url.length() - 1);
		return url;
	}

	//
	public int getSubmitDealSheetPeriod() {
		// liangww add 2011-10-09
		int period = 30;
		String str = null;

		str = propertiesXML.getProperty("nbi_cfg.webserver.submitdealsheetperiod");

		if (StringUtil.isNotNull(str)) {
			period = Integer.valueOf(str);
		}
		return period;
	}

	public String getSmsUsername() throws Exception {
		String url = propertiesXML.getProperty("nbi_cfg.interface.sms.username");

		if (StringUtil.isNull(url)) {
			throw new Exception("请配置发送短信用户名");
		}
		return url;
	}

	public String getSmsPassword() throws Exception {
		String url = propertiesXML.getProperty("nbi_cfg.interface.sms.password");

		if (StringUtil.isNull(url)) {
			throw new Exception("请配置短信发送密码");
		}
		return url;
	}
	
	public String getDBNum() {
		String db_num = propertiesXML.getProperty("nbi_cfg.db.dbNum");

		if (StringUtil.isNull(db_num)) {
			db_num = "";
		}
		return db_num;
	}
	
	public String getDBConnType() {
		String connType = propertiesXML.getProperty("nbi_cfg.db.connType");

		if (StringUtil.isNull(connType)) {
			connType = "";
		}
		return connType;
	}

	public int getBsaDeduceSchedule() {

		String hour = propertiesXML.getProperty("nbi_cfg.interface.bsa.reloaddeducetimer");

		if (StringUtil.isNull(hour)) {
			return 6;
		}
		return Integer.valueOf(hour);
	}

	/**
	 * 是否开启数据核查模板,控制全局
	 * 
	 * @return
	 */
	public boolean isEnableDataCheck() {
		boolean b = false;
		String str = propertiesXML.getProperty("nbi_cfg.system.datacheck");
		if (StringUtil.isNull(str)) {
			return b;
		}
		str = str.toLowerCase().trim();
		logger.debug("nbi_cfg.system.datacheck：" + str);
		if (str.equals("on") || str.equals("true") || str.equals("1")) {
			b = true;
		} else if (str.equals("off") || str.equals("false")) {
			b = false;
		}
		logger.debug("数据核查的结果是：" + str);
		return b;
	}

	/**
	 * 是否记录日志表到库中
	 * 
	 * @return
	 */
	public boolean isTableLog() {
		boolean b = true;
		String str = propertiesXML.getProperty("nbi_cfg.system.tablelog");
		if (StringUtil.isNull(str)) {
			return b;
		}
		str = str.toLowerCase().trim();
		if (str.equals("on") || str.equals("true")) {
			b = true;
		} else if (str.equals("off") || str.equals("false")) {
			b = false;
		} else if (str.equals("1")) {
			b = true;
		}
		return b;
	}
	
	/** 打包文件名中的时间：true使用任务开始时间，false使用打包结束后的时间 */
	public boolean isStartFileTime() {
		String e = propertiesXML.getProperty("nbi_cfg.package.fileTime");
		if (StringUtil.isNull(e)) {
			return true;
		}
		return "start".equalsIgnoreCase(e);
	}
	
	public int getCompressRatio() {
		String e = propertiesXML.getProperty("nbi_cfg.package.compressRatio");
		if (StringUtil.isNull(e)) {
			return 1;
		}
		return Integer.parseInt(e);
	}
	
	public int getMaxFileSize() {
		String e = propertiesXML.getProperty("nbi_cfg.package.maxFileSize");
		if (StringUtil.isNull(e)) {
			return 0;
		}
		// 1:6压缩
		return Integer.parseInt(e)*1024*1024*getCompressRatio();
	}
	
	public int getSaveTime() {
		String e = propertiesXML.getProperty("nbi_cfg.package.saveTime");
		if (StringUtil.isNull(e)) {
			return 0;
		}
		return Integer.parseInt(e);
	}
	
	public boolean isCheckListLog()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.isCheckListLog");
		if (StringUtil.isNull(e)) {
			return false;
		}
		return "true".equalsIgnoreCase(e);
	}
	
	public boolean autoRTask()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.autoRTask");
		if (StringUtil.isNull(e)) {
			return false;
		}
		return "true".equalsIgnoreCase(e);
	}
	
	public boolean isSameFileName()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.sameFileName");
		if (StringUtil.isNull(e)) {
			return true;
		}
		return "true".equalsIgnoreCase(e);
	}
	
	public String getFCompile()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.fCompile");
		if (StringUtil.isNull(e)) {
			return "";
		}
		return e.trim();
	}
	
	public int getMaxCounter()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.maxCounter");
		if (StringUtil.isNull(e)) {
			return 3;
		}
		return Integer.parseInt(e);
	}

	public int getFtpThreads()
	{
		String e = propertiesXML.getProperty("nbi_cfg.system.ftpThreads");
		if (StringUtil.isNull(e)) {
			return 5;
		}
		return Integer.parseInt(e);
	}
	
	public int getResolveThreads()
	{
		String e = propertiesXML.getProperty("nbi_cfg.system.resolveThreads");
		if (StringUtil.isNull(e)) {
			return 5;
		}
		return Integer.parseInt(e);
	}
	
	public String getCbaEncoding()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.cbaEncoding");
		if (StringUtil.isNull(e)) {
			return "UTF-8";
		}
		return e;
	}
	
	public long getDelyTime()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.delyTime");
		if (StringUtil.isNull(e)) {
			return 0L;
		}
		return Long.parseLong(e)*60*1000;
	}
	
	public String getDateFormat()
	{
		String e = propertiesXML.getProperty("nbi_cfg.package.dateFormat");
		if (StringUtil.isNull(e)) {
			return "yyyy-MM-dd HH:mm:SS";
		}
		return e;
	}
	
	public Properties getProperties()
	{
		Properties p = new Properties();
		String value = propertiesXML.getProperty("nbi_cfg.checkDB.name");
		if (StringUtil.isNull(value)) {
			value = "S3_DB_POOL";
		}
		p.put("name", value);
		value = propertiesXML.getProperty("nbi_cfg.checkDB.type");

		if (StringUtil.isNull(value)) {
			value = "javax.sql.DataSource";
		}
		p.put("type", value);
		value = propertiesXML.getProperty("nbi_cfg.checkDB.driverClassName");

		if (StringUtil.isNull(value)) {
			value = "oracle.jdbc.driver.OracleDriver";
		}
		p.put("driverClassName", value);
		value = propertiesXML.getProperty("nbi_cfg.checkDB.url");
		if (StringUtil.isNull(value)) {
			value = "";
		}	
		p.put("url", value);
		int intValue = 12;
		try {
			intValue = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.checkDB.maxActive"));
		} catch (Exception e) {
			intValue =12;
		}

		if (intValue <= 0) {
			intValue = 12;
		}
		p.put("maxActive", intValue);
		value = propertiesXML.getProperty("nbi_cfg.checkDB.user");
		if (StringUtil.isNull(value)) {
			value = "login";
		}
		p.put("username", value);
		value = propertiesXML.getProperty("nbi_cfg.checkDB.password");
		if (StringUtil.isNull(value)) {
			value = "login";
		}
		p.put("password", value);
		try {
			intValue = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.checkDB.maxIdle"));
		} catch (Exception e) {
			intValue = 5;
		}
		if (intValue <= 0) {
			intValue = 5;
		}
		p.put("maxIdle", String.valueOf(intValue));
		try {
			intValue = Integer.parseInt(propertiesXML.getProperty("nbi_cfg.checkDB.maxWait"));
		} catch (Exception e) {
			intValue = 10000;
		}
		if (intValue <= 0) {
			intValue = 10000;
		}
		p.put("maxWait", String.valueOf(intValue));
		value = propertiesXML.getProperty("nbi_cfg.checkDB.validationQuery");
		if (StringUtil.isNull(value)) {
			value = "select sysdate from dual";
		}
		p.put("validationQuery", value);
		
		return p;
	}
	
	public String getWSAddress()
	{
		String e = propertiesXML.getProperty("nbi_cfg.WS.address");
		if (StringUtil.isNull(e)) {
			return "http://localhost:8787/issuedWebservice";
		}
		return e;
	}
	
	public boolean isOpenWS()
	{
		String e = propertiesXML.getProperty("nbi_cfg.WS.isOpenWS");
		if (StringUtil.isNull(e)) {
			return false;
		}
		return "true".equals(e);
	}
	
	public static void main(String[] args) {
		System.out.println(SysCfg.getInstance().get7ZCompressPath());
	}
}
