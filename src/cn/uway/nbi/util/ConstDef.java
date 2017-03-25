package cn.uway.nbi.util;

import static cn.uway.nbi.util.ConstDef.F_SEP;

import java.io.BufferedReader;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Clob;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;

/**
 * @author liuwx
 * @version 1.0
 * @created 22-二月-2011 16:10:57
 */
public final class ConstDef {

	public static final String CONF_FILE_URL = "./conf/config.xml";
	
	public static final String SEQ_FILE_URL = "./conf/seq.txt";

	/** 文件分隔符 */
	public static final String F_SEP = File.separator;

	public static final String LOGCFG_FILE_URL = "." + F_SEP + "conf" + F_SEP
			+ "logback.xml";

	/** 任务描述模板 */
	public static final String TEMPLET_PATH_FOR_TASK = "." + F_SEP + "templet"
			+ F_SEP + "task" + F_SEP;

	/** 连接信息模板 */
	public static final String TEMPLET_CONNECTION_INFO = "." + F_SEP
			+ "templet" + F_SEP + "connection-info.xml";

	/**
	 * 性能上报 webservice获取的数据文件
	 */
	public static final String TEMPLET_PATH_FOR_TASK_WS = TEMPLET_PATH_FOR_TASK
			+ "perf_webservice" + F_SEP;

	public static final String ALIAS_MAPING_PATH = "." + F_SEP + "templet"
			+ F_SEP + "mapping" + F_SEP;

	/** 要生成文件的模板 */
	public static final String TEMPLET_PATH_FOR_FILE = "." + F_SEP + "templet"
			+ F_SEP + "file" + F_SEP;

	/**
	 * 性能上报 webservice获取的数据文件
	 */
	public static final String TEMPLET_PATH_FOR_WORKPLAN_WS = TEMPLET_PATH_FOR_TASK
			+ "workplan_webservice" + F_SEP;

	public static final long SCANINTERVAL = 60;// 程序扫描时间间隔(秒)

	public static final long RSCANINTERVAL = 5 * 60;// 扫描补报任务表的时间间隔(秒)

	public static final int MAXREPORTTIME = 60;// 扫描补报任务表的时间间隔(分钟)

	public final static int TASK_THREAD_POOL_SIZE = Runtime.getRuntime()
			.availableProcessors();

	public static int PROVINCE = 1;

	public static int BSA = 2;

	public static int NOSS_REPORT = 4;

	public static int UCLOUD = 5;

	public static final int TRIGGERBEFORE = 1;

	public static final int TRIGGERAFTER = 2;

	public static final int TRIGGEREXCEPTION = 3;

	public static final int BatchUpdateBean = 1;

	public static final int UpdateBean = 2;

	public static final int SMSSEND = 1;

	public static final int EMAILSEND = 2;

	public static final int SMSSEND_OR_EMAILSEND = 3;

	public static final int NOSS_TYPE = 4;
	
	public static final String N_CYC_FILE_TYPE = "NC";//非周期上报文件类型


	public static Map<String, String> checkMap = new HashMap<String, String>();
	static {
		checkMap.put("dt_username", "dt_password");
	}

	/** 取（）之间的内容 */
	public static String getExpression(String str) {

		String result = null;

		int b = str.indexOf("(");
		int e = str.indexOf(")");

		if (b > 0 && e > b) {
			result = str.substring(b + 1, e);
		}

		if (result != null && !result.contains("%%"))
			return null;

		return result;
	}

	public static String ParseFilePath(String strPath, Timestamp timestamp) {
		// 如：zblecp-2006102311.hsmr 文件名包含时间，表示这个时间的数据。
		// 这个时间有是timestamp传递进来的时间
		// 但是，有的文件名是一个时间段，前后有2个时间。
		// 如：Domain125_PSbasicmeasurement_18Jul2008_0900-18Jul2008_1000.csv
		// 现在从strPath传递进来一个参数表示前后时间的间隔数，
		// 如：Domain125_PSbasicmeasurement_%%D%%EM%%Y_%%H%%m-%%ND%%ENM%%NY_%%NH%%Nm.csv|360000
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

		int iHwrIdx = strPath.indexOf("%%TA");
		int iDiff = 0;
		if (iHwrIdx >= 0) {
			// 偏移量 0－9，只支持正偏移
			iDiff = Integer.parseInt(strPath
					.substring(iHwrIdx + 4, iHwrIdx + 5));
			strPath = strPath.replaceAll("%%TA.", "");
		}

		timestamp = new Timestamp(timestamp.getTime() + iDiff * 3600 * 1000);
		String strTime = formatter.format(timestamp);
		
		
		// 增加上周的时间匹配
		Calendar calw = Calendar.getInstance();
		calw.setTimeInMillis(timestamp.getTime());
		calw.add(Calendar.DAY_OF_MONTH, -7);
		// 星期天
		if(calw.get(Calendar.DAY_OF_WEEK) == 1)
		{
			calw.add(Calendar.DAY_OF_MONTH,-6);
		}
		// 星期一到六
		else
		{
			calw.add(Calendar.DAY_OF_MONTH,-(calw.get(Calendar.DAY_OF_WEEK)-2));
		}	
		
		// 上周一
		String lastMonday = formatter.format(new Date(calw.getTimeInMillis()));
		if(strPath.indexOf("%%LMY") >= 0){
			strPath = strPath.replaceAll("%%LMY", lastMonday.substring(0, 4));
		}
		if(strPath.indexOf("%%LMM") >= 0){
			strPath = strPath.replaceAll("%%LMM", lastMonday.substring(4, 6));
		}
		if(strPath.indexOf("%%LMD") >= 0){
			strPath = strPath.replaceAll("%%LMD", lastMonday.substring(6, 8));
		}
		if(strPath.indexOf("%%LMH") >= 0){
			strPath = strPath.replaceAll("%%LMH", lastMonday.substring(8, 10));
		}
		if(strPath.indexOf("%%LMm") >= 0){
			strPath = strPath.replaceAll("%%LMm", lastMonday.substring(10, 12));
		}
		if(strPath.indexOf("%%LMS") >= 0){
			strPath = strPath.replaceAll("%%LMS", lastMonday.substring(12, 14));
		}
		
		// 上周日
		calw.add(Calendar.DAY_OF_MONTH, 6);
		lastMonday = formatter.format(new Date(calw.getTimeInMillis()));
		if(strPath.indexOf("%%LSY") >= 0){
			strPath = strPath.replaceAll("%%LSY", lastMonday.substring(0, 4));
		}
		if(strPath.indexOf("%%LSM") >= 0){
			strPath = strPath.replaceAll("%%LSM", lastMonday.substring(4, 6));
		}
		if(strPath.indexOf("%%LSD") >= 0){
			strPath = strPath.replaceAll("%%LSD", lastMonday.substring(6, 8));
		}
		if(strPath.indexOf("%%LSH") >= 0){
			strPath = strPath.replaceAll("%%LSH", lastMonday.substring(8, 10));
		}
		if(strPath.indexOf("%%LSm") >= 0){
			strPath = strPath.replaceAll("%%LSm", lastMonday.substring(10, 12));
		}
		if(strPath.indexOf("%%LSS") >= 0){
			strPath = strPath.replaceAll("%%LSS", lastMonday.substring(12, 14));
		}
		
		
		if (strPath.indexOf("%%Y") >= 0)
			strPath = strPath.replace("%%Y", strTime.substring(0, 4));
		Calendar calendar = Calendar.getInstance();

		Date date = new Date();
		date.setTime(timestamp.getTime());
		calendar.setTime(new Date());

		calendar.setTime(date);
		int nDayOrYear = calendar.get(Calendar.DAY_OF_YEAR);

		if (strPath.indexOf("%%WEEK") >= 0) {
			int dow = calendar.get(Calendar.DAY_OF_WEEK);
			dow = dow - 1;
			if (dow == 0)
				dow = 7;
			strPath = strPath.replace("%%WEEK", String.valueOf(dow));
		}
		
		if (strPath.indexOf("%%EW") >= 0) {
			switch (calendar.get(Calendar.DAY_OF_WEEK)) {
				case 1 :
					strPath = strPath.replace("%%EW", "Sun");
					break;
				case 2 :
					strPath = strPath.replace("%%EW", "Mon");
					break;
				case 3 :
					strPath = strPath.replace("%%EW", "Tue");
					break;
				case 4 :
					strPath = strPath.replace("%%EW", "Wed");
					break;
				case 5 :
					strPath = strPath.replace("%%EW", "Thu");
					break;
				case 6 :
					strPath = strPath.replace("%%EW", "Fri");
					break;
				case 7 :
					strPath = strPath.replace("%%EW", "Sat");
					break;
			}
		}

		if (nDayOrYear < 10)
			strPath = strPath.replace("%%DayOfYear", "00" + nDayOrYear);
		else if (nDayOrYear < 100)
			strPath = strPath.replace("%%DayOfYear", "0" + nDayOrYear);
		else
			strPath = strPath
					.replace("%%DayOfYear", String.valueOf(nDayOrYear));

		if (strPath.indexOf("%%y") >= 0)
			strPath = strPath.replace("%%y", strTime.substring(2, 4));

		if (strPath.indexOf("%%EM") >= 0) {
			switch (Integer.parseInt(strTime.substring(4, 6))) {
				case 1 :
					strPath = strPath.replace("%%EM", "Jan");
					break;
				case 2 :
					strPath = strPath.replace("%%EM", "Feb");
					break;
				case 3 :
					strPath = strPath.replace("%%EM", "Mar");
					break;
				case 4 :
					strPath = strPath.replace("%%EM", "Apr");
					break;
				case 5 :
					strPath = strPath.replace("%%EM", "May");
					break;
				case 6 :
					strPath = strPath.replace("%%EM", "Jun");
					break;
				case 7 :
					strPath = strPath.replace("%%EM", "Jul");
					break;
				case 8 :
					strPath = strPath.replace("%%EM", "Aug");
					break;
				case 9 :
					strPath = strPath.replace("%%EM", "Sep");
					break;
				case 10 :
					strPath = strPath.replace("%%EM", "Oct");
					break;
				case 11 :
					strPath = strPath.replace("%%EM", "Nov");
					break;
				case 12 :
					strPath = strPath.replace("%%EM", "Dec");
					break;
			}
		}
		// add by liuwx on 2012-02-27
		String fw = null;
		if (strPath.indexOf("%%FM") >= 0) {
			fw = strTime.substring(4, 6);
			try {
				if (Integer.valueOf(fw) < 10) {
					strPath = strPath.replace("%%FM", strTime.substring(5, 6));
				} else
					strPath = strPath.replace("%%FM", strTime.substring(4, 6));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// add

		if (strPath.indexOf("%%M") >= 0)
			strPath = strPath.replace("%%M", strTime.substring(4, 6));

		if (strPath.indexOf("%%d") >= 0)
			strPath = strPath.replace("%%d", strTime.substring(6, 8));

		if (strPath.indexOf("%%D") >= 0)
			strPath = strPath.replace("%%D", strTime.substring(6, 8));

		// add by liuwx 针对天,小时是否补0 ,如果天为0-9 ，则返回0-9 天为10-31返回10-31 ，小时0-9则0-9
		// ，小时10-23则10-23
		if (strPath.indexOf("%%fd") >= 0) {
			strPath = strPath.replace("%%fd", strTime.substring(6, 8));
		}
		String sd = null;
		if (strPath.indexOf("%%FD") >= 0) {
			sd = strTime.substring(6, 8);
			try {
				if (Integer.valueOf(sd) < 10) {
					strPath = strPath.replace("%%FD", strTime.substring(7, 8));
				} else
					strPath = strPath.replace("%%FD", strTime.substring(6, 8));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		String fh = null;
		if (strPath.indexOf("%%FH") >= 0) {
			String strHour = getExpression(strPath);
			if (strHour != null && !strHour.equals("")) {
				String strHourTmp = strHour.replaceAll("%%FH",
						strTime.substring(8, 10));
				int nHour = Util.parseExpression(strHourTmp);

				/*
				 * ChenSijiang 2011-01-18
				 * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
				 */
				if (nHour > 23)
					nHour = 0;

				strPath = strPath.replace("(" + strHour + ")",
						String.valueOf(nHour));
				if (nHour < 10)
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(7, 10));
				else
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(8, 10));
			} else {
				fh = strTime.substring(8, 10);
				if (Integer.valueOf(fh) < 10) {
					strPath = strPath.replace("%%FH", strTime.substring(9, 10));
				} else
					strPath = strPath.replace("%%FH", strTime.substring(8, 10));
			}
		}
		// end add

		if (strPath.indexOf("%%H") >= 0) {
			String strHour = getExpression(strPath);
			if (strHour != null && !strHour.equals("")) {
				String strHourTmp = strHour.replaceAll("%%H",
						strTime.substring(8, 10));
				int nHour = Util.parseExpression(strHourTmp);

				/*
				 * ChenSijiang 2011-01-18
				 * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
				 */
				if (nHour > 23)
					nHour = 0;

				// String temp = strPath.substring(strPath.indexOf("("),
				// strPath.indexOf(")") + 1);

				// if ( temp.contains("%%") )
				strPath = strPath.replace("(" + strHour + ")",
						DateUtil.trimHour(nHour));
				strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
			} else {
				strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
			}
		}

		if (strPath.indexOf("%%h") >= 0)
			strPath = strPath.replaceAll("%%h", strTime.substring(8, 10));

		if (strPath.indexOf("%%m") >= 0)
			strPath = strPath.replace("%%m", strTime.substring(10, 12));

		if (strPath.indexOf("%%s") >= 0)
			strPath = strPath.replace("%%s", strTime.substring(12, 14));

		if (strPath.indexOf("%%S") >= 0)
			strPath = strPath.replace("%%S", strTime.substring(12, 14));

		int singleSepPos = strPath.lastIndexOf("|");// (|)的位置
		int doubleSepPos = strPath.lastIndexOf("||");// (||)的位置

		if (singleSepPos != -1 && singleSepPos != doubleSepPos + 1)
		// if ( strPath.indexOf("|") > 0 )
		{
			String strInterval = "";
			int nInterval = 0;
			strInterval = strPath.substring(singleSepPos + 1);
			strPath = strPath.substring(0, singleSepPos);
			// TODO
			nInterval = Integer.parseInt(strInterval);
			timestamp = new Timestamp(timestamp.getTime() + nInterval);
			strTime = formatter.format(timestamp);

			calendar.setTime(timestamp);

			if (strPath.indexOf("%%NWEEK") >= 0) {
				int dow = calendar.get(Calendar.DAY_OF_WEEK);
				dow = dow - 1;
				if (dow == 0)
					dow = 7;
				strPath = strPath.replace("%%NWEEK", String.valueOf(dow));
			}

			if (strPath.indexOf("%%NY") >= 0)
				strPath = strPath.replace("%%NY", strTime.substring(0, 4));

			if (strPath.indexOf("%%Ny") >= 0)
				strPath = strPath.replace("%%Ny", strTime.substring(2, 4));

			if (strPath.indexOf("%%NEM") >= 0) {
				switch (Integer.parseInt(strTime.substring(4, 6))) {
					case 1 :
						strPath = strPath.replace("%%NEM", "Jan");
						break;
					case 2 :
						strPath = strPath.replace("%%NEM", "Feb");
						break;
					case 3 :
						strPath = strPath.replace("%%NEM", "Mar");
						break;
					case 4 :
						strPath = strPath.replace("%%NEM", "Apr");
						break;
					case 5 :
						strPath = strPath.replace("%%NEM", "May");
						break;
					case 6 :
						strPath = strPath.replace("%%NEM", "Jun");
						break;
					case 7 :
						strPath = strPath.replace("%%NEM", "Jul");
						break;
					case 8 :
						strPath = strPath.replace("%%NEM", "Aug");
						break;
					case 9 :
						strPath = strPath.replace("%%NEM", "Sep");
						break;
					case 10 :
						strPath = strPath.replace("%%NEM", "Oct");
						break;
					case 11 :
						strPath = strPath.replace("%%NEM", "Nov");
						break;
					case 12 :
						strPath = strPath.replace("%%NEM", "Dec");
						break;
				}
			}

			if (strPath.indexOf("%%NM") >= 0)
				strPath = strPath.replace("%%NM", strTime.substring(4, 6));

			if (strPath.indexOf("%%Nd") >= 0)
				strPath = strPath.replace("%%Nd", strTime.substring(6, 8));

			if (strPath.indexOf("%%ND") >= 0)
				strPath = strPath.replace("%%ND", strTime.substring(6, 8));

			if (strPath.indexOf("%%NH") >= 0)
				strPath = strPath.replace("%%NH", strTime.substring(8, 10));

			if (strPath.indexOf("%%NV4") >= 0) {
				int nNum = Integer.parseInt(strTime.substring(8, 10));
				nNum = (nNum + 1) / 4;
				strPath = strPath.replace("%%NV4", "0" + nNum);
			}

			if (strPath.indexOf("%%Nh") >= 0)
				strPath = strPath.replace("%%Nh", strTime.substring(8, 10));

			if (strPath.indexOf("%%Nm") >= 0)
				strPath = strPath.replace("%%Nm", strTime.substring(10, 12));

			if (strPath.indexOf("%%Ns") >= 0)
				strPath = strPath.replace("%%Ns", strTime.substring(12, 14));

			if (strPath.indexOf("%%NS") >= 0)
				strPath = strPath.replace("%%NS", strTime.substring(12, 14));
		}

		return strPath;
	}

	public static String ParseFilePathForDB(String strPath, Timestamp timestamp) {
		// 如：zblecp-2006102311.hsmr 文件名包含时间，表示这个时间的数据。
		// 这个时间有是timestamp传递进来的时间
		// 但是，有的文件名是一个时间段，前后有2个时间。
		// 如：Domain125_PSbasicmeasurement_18Jul2008_0900-18Jul2008_1000.csv
		// 现在从strPath传递进来一个参数表示前后时间的间隔数，
		// 如：Domain125_PSbasicmeasurement_%%D%%EM%%Y_%%H%%m-%%ND%%ENM%%NY_%%NH%%Nm.csv|360000
		// strPath = replace(strPath);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

		int iHwrIdx = strPath.indexOf("%%TA");
		int iDiff = 0;
		if (iHwrIdx >= 0) {
			// 偏移量 0－9，只支持正偏移
			iDiff = Integer.parseInt(strPath
					.substring(iHwrIdx + 4, iHwrIdx + 5));
			strPath = strPath.replaceAll("%%TA.", "");
		}

		timestamp = new Timestamp(timestamp.getTime() + iDiff * 3600 * 1000);
		String strTime = formatter.format(timestamp);
		Calendar calw = Calendar.getInstance();
		calw.setTimeInMillis(timestamp.getTime());
		calw.add(Calendar.DAY_OF_MONTH, -7);
		// 星期天
		if(calw.get(Calendar.DAY_OF_WEEK) == 1)
		{
			calw.add(Calendar.DAY_OF_MONTH,-6);
		}
		// 星期一到六
		else
		{
			calw.add(Calendar.DAY_OF_MONTH,-(calw.get(Calendar.DAY_OF_WEEK)-2));
		}	
		
		// 上周一
		String lastMonday = formatter.format(new Date(calw.getTimeInMillis()));
		if(strPath.indexOf("%%LMY") >= 0){
			strPath = strPath.replaceAll("%%LMY", lastMonday.substring(0, 4));
		}
		if(strPath.indexOf("%%LMM") >= 0){
			strPath = strPath.replaceAll("%%LMM", lastMonday.substring(4, 6));
		}
		if(strPath.indexOf("%%LMD") >= 0){
			strPath = strPath.replaceAll("%%LMD", lastMonday.substring(6, 8));
		}
		if(strPath.indexOf("%%LMH") >= 0){
			strPath = strPath.replaceAll("%%LMH", lastMonday.substring(8, 10));
		}
		if(strPath.indexOf("%%LMm") >= 0){
			strPath = strPath.replaceAll("%%LMm", lastMonday.substring(10, 12));
		}
		if(strPath.indexOf("%%LMS") >= 0){
			strPath = strPath.replaceAll("%%LMS", lastMonday.substring(12, 14));
		}
		
		// 上周日
		calw.add(Calendar.DAY_OF_MONTH, 6);
		lastMonday = formatter.format(new Date(calw.getTimeInMillis()));
		if(strPath.indexOf("%%LSY") >= 0){
			strPath = strPath.replaceAll("%%LSY", lastMonday.substring(0, 4));
		}
		if(strPath.indexOf("%%LSM") >= 0){
			strPath = strPath.replaceAll("%%LSM", lastMonday.substring(4, 6));
		}
		if(strPath.indexOf("%%LSD") >= 0){
			strPath = strPath.replaceAll("%%LSD", lastMonday.substring(6, 8));
		}
		if(strPath.indexOf("%%LSH") >= 0){
			strPath = strPath.replaceAll("%%LSH", lastMonday.substring(8, 10));
		}
		if(strPath.indexOf("%%LSm") >= 0){
			strPath = strPath.replaceAll("%%LSm", lastMonday.substring(10, 12));
		}
		if(strPath.indexOf("%%LSS") >= 0){
			strPath = strPath.replaceAll("%%LSS", lastMonday.substring(12, 14));
		}

		if (strPath.indexOf("%%Y") >= 0)
			strPath = strPath.replace("%%Y", strTime.substring(0, 4));
		Calendar calendar = Calendar.getInstance();

		Date date = new Date();
		date.setTime(timestamp.getTime());
		calendar.setTime(new Date());

		calendar.setTime(date);
		int nDayOrYear = calendar.get(Calendar.DAY_OF_YEAR);

		if (nDayOrYear < 10)
			strPath = strPath.replace("%%DayOfYear", "00" + nDayOrYear);
		else if (nDayOrYear < 100)
			strPath = strPath.replace("%%DayOfYear", "0" + nDayOrYear);
		else
			strPath = strPath
					.replace("%%DayOfYear", String.valueOf(nDayOrYear));

		if (strPath.indexOf("%%y") >= 0)
			strPath = strPath.replace("%%y", strTime.substring(2, 4));

		if (strPath.indexOf("%%EM") >= 0) {
			switch (Integer.parseInt(strTime.substring(4, 6))) {
				case 1 :
					strPath = strPath.replace("%%EM", "Jan");
					break;
				case 2 :
					strPath = strPath.replace("%%EM", "Feb");
					break;
				case 3 :
					strPath = strPath.replace("%%EM", "Mar");
					break;
				case 4 :
					strPath = strPath.replace("%%EM", "Apr");
					break;
				case 5 :
					strPath = strPath.replace("%%EM", "May");
					break;
				case 6 :
					strPath = strPath.replace("%%EM", "Jun");
					break;
				case 7 :
					strPath = strPath.replace("%%EM", "Jul");
					break;
				case 8 :
					strPath = strPath.replace("%%EM", "Aug");
					break;
				case 9 :
					strPath = strPath.replace("%%EM", "Sep");
					break;
				case 10 :
					strPath = strPath.replace("%%EM", "Oct");
					break;
				case 11 :
					strPath = strPath.replace("%%EM", "Nov");
					break;
				case 12 :
					strPath = strPath.replace("%%EM", "Dec");
					break;
			}
		}

		// if (strPath.indexOf("%%M") >= 0)
		// strPath = strPath.replace("%%M", strTime.substring(4, 6));

		// add by on 2013-05-14
		String fw = null;
		if (strPath.indexOf("%%FM") >= 0) {
			fw = strTime.substring(4, 6);
			try {
				if (Integer.valueOf(fw) < 10) {
					strPath = strPath.replace("%%FM", strTime.substring(5, 6));
				} else
					strPath = strPath.replace("%%FM", strTime.substring(4, 6));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// add

		if (strPath.indexOf("%%M") >= 0)
			strPath = strPath.replace("%%M", strTime.substring(4, 6));

		if (strPath.indexOf("%%d") >= 0)
			strPath = strPath.replace("%%d", strTime.substring(6, 8));

		if (strPath.indexOf("%%D") >= 0)
			strPath = strPath.replace("%%D", strTime.substring(6, 8));

		// add by liuwx 针对天,小时是否补0 ,如果天为0-9 ，则返回0-9 天为10-31返回10-31 ，小时0-9则0-9
		// ，小时10-23则10-23
		if (strPath.indexOf("%%fd") >= 0) {
			strPath = strPath.replace("%%fd", strTime.substring(6, 8));
		}
		String sd = null;
		if (strPath.indexOf("%%FD") >= 0) {
			sd = strTime.substring(6, 8);
			try {
				if (Integer.valueOf(sd) < 10) {
					strPath = strPath.replace("%%FD", strTime.substring(7, 8));
				} else
					strPath = strPath.replace("%%FD", strTime.substring(6, 8));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		String fh = null;
		if (strPath.indexOf("%%FH") >= 0) {
			String strHour = getExpression(strPath);
			if (strHour != null && !strHour.equals("")) {
				String strHourTmp = strHour.replaceAll("%%FH",
						strTime.substring(8, 10));
				int nHour = Util.parseExpression(strHourTmp);

				/*
				 * ChenSijiang 2011-01-18
				 * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
				 */
				if (nHour > 23)
					nHour = 0;

				strPath = strPath.replace("(" + strHour + ")",
						String.valueOf(nHour));
				if (nHour < 10)
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(7, 10));
				else
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(8, 10));
			} else {
				fh = strTime.substring(8, 10);
				if (Integer.valueOf(fh) < 10) {
					strPath = strPath.replace("%%FH", strTime.substring(9, 10));
				} else
					strPath = strPath.replace("%%FH", strTime.substring(8, 10));
			}
		}
		// end add

		if (strPath.indexOf("%%H") >= 0) {
			String strHour = getExpression(strPath);
			//by tyler 2016/7/27这里原来的主要逻辑是对括号中的表达式进行数学运算操作，但问题是会同时替换掉表其它括号中的表达式，
			//如：会将convert(datetime, '%%Y.%%M.%%D %%H:00:00')最终替换为convert00
			//if (strHour != null && !strHour.equals("")) {
			if (strHour != null && !strHour.equals("")&&!strHour.contains(",")) {
				String strHourTmp = strHour.replaceAll("%%H",
						strTime.substring(8, 10));
				int nHour = Util.parseExpression(strHourTmp);

				/*
				 * ChenSijiang 2011-01-18
				 * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
				 */
				if (nHour > 23)
					nHour = 0;

				// String temp = strPath.substring(strPath.indexOf("("),
				// strPath.indexOf(")") + 1);

				// if ( temp.contains("%%") )
				strPath = strPath.replace("(" + strHour + ")",
						DateUtil.trimHour(nHour));
				strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
			} else {
				strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
			}
		}
		// ---ADD ON 2013-05-14 END

		if (strPath.indexOf("%%d") >= 0)
			strPath = strPath.replace("%%d", strTime.substring(6, 8));

		if (strPath.indexOf("%%D") >= 0)
			strPath = strPath.replace("%%D", strTime.substring(6, 8));

		if (strPath.indexOf("%%H") >= 0) {
			strPath = strPath.replace("%%H", strTime.substring(8, 10));
		}

		if (strPath.indexOf("%%h") >= 0)
			strPath = strPath.replace("%%h", strTime.substring(8, 10));

		if (strPath.indexOf("%%m") >= 0)
			strPath = strPath.replace("%%m", strTime.substring(10, 12));

		if (strPath.indexOf("%%s") >= 0)
			strPath = strPath.replace("%%s", strTime.substring(12, 14));

		if (strPath.indexOf("%%S") >= 0)
			strPath = strPath.replace("%%S", strTime.substring(12, 14));

		// if ( strPath.indexOf("|") > 0 )
		// {
		// String strInterval = "";
		// int nInterval = 0;
		// strInterval = strPath.substring(strPath.indexOf("|") + 1);
		// strPath = strPath.substring(0, strPath.indexOf("|"));
		//
		//
		//
		Pattern pa = Pattern.compile("\\|\\d+");
		Matcher m = pa.matcher(strPath);
		boolean b = m.find();

		int singleSepPos = strPath.lastIndexOf("|");// (|)的位置
		int doubleSepPos = strPath.lastIndexOf("||");// (||)的位置

		if (b && singleSepPos != -1 && singleSepPos != doubleSepPos + 1) {
			String strInterval = "";
			int nInterval = 0;
			strInterval = strPath.substring(singleSepPos + 1);
			strPath = strPath.substring(0, singleSepPos);
			// TODO
			nInterval = Integer.parseInt(strInterval);
			timestamp = new Timestamp(timestamp.getTime() + nInterval);
			strTime = formatter.format(timestamp);

			if (strPath.indexOf("%%NY") >= 0)
				strPath = strPath.replace("%%NY", strTime.substring(0, 4));

			if (strPath.indexOf("%%Ny") >= 0)
				strPath = strPath.replace("%%Ny", strTime.substring(2, 4));

			if (strPath.indexOf("%%NEM") >= 0) {
				switch (Integer.parseInt(strTime.substring(4, 6))) {
					case 1 :
						strPath = strPath.replace("%%NEM", "Jan");
						break;
					case 2 :
						strPath = strPath.replace("%%NEM", "Feb");
						break;
					case 3 :
						strPath = strPath.replace("%%NEM", "Mar");
						break;
					case 4 :
						strPath = strPath.replace("%%NEM", "Apr");
						break;
					case 5 :
						strPath = strPath.replace("%%NEM", "May");
						break;
					case 6 :
						strPath = strPath.replace("%%NEM", "Jun");
						break;
					case 7 :
						strPath = strPath.replace("%%NEM", "Jul");
						break;
					case 8 :
						strPath = strPath.replace("%%NEM", "Aug");
						break;
					case 9 :
						strPath = strPath.replace("%%NEM", "Sep");
						break;
					case 10 :
						strPath = strPath.replace("%%NEM", "Oct");
						break;
					case 11 :
						strPath = strPath.replace("%%NEM", "Nov");
						break;
					case 12 :
						strPath = strPath.replace("%%NEM", "Dec");
						break;
				}
			}

			if (strPath.indexOf("%%NM") >= 0)
				strPath = strPath.replace("%%NM", strTime.substring(4, 6));

			if (strPath.indexOf("%%Nd") >= 0)
				strPath = strPath.replace("%%Nd", strTime.substring(6, 8));

			if (strPath.indexOf("%%ND") >= 0)
				strPath = strPath.replace("%%ND", strTime.substring(6, 8));

			if (strPath.indexOf("%%NH") >= 0)
				strPath = strPath.replace("%%NH", strTime.substring(8, 10));

			if (strPath.indexOf("%%NV4") >= 0) {
				int nNum = Integer.parseInt(strTime.substring(8, 10));
				nNum = (nNum + 1) / 4;
				strPath = strPath.replace("%%NV4", "0" + nNum);
			}

			if (strPath.indexOf("%%Nh") >= 0)
				strPath = strPath.replace("%%Nh", strTime.substring(8, 10));

			if (strPath.indexOf("%%Nm") >= 0)
				strPath = strPath.replace("%%Nm", strTime.substring(10, 12));

			if (strPath.indexOf("%%Ns") >= 0)
				strPath = strPath.replace("%%Ns", strTime.substring(12, 14));

			if (strPath.indexOf("%%NS") >= 0)
				strPath = strPath.replace("%%NS", strTime.substring(12, 14));
		}

		return strPath;
	}

	/* 在Oracle 数据库中将Clob转换成String类型 */
	public static String ClobParse(Clob clob) throws Exception {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = null;
		try {
			br = new BufferedReader(clob.getCharacterStream());
			String s = null;
			while ((s = br.readLine()) != null)
				sb.append(s);
		} finally {
			if (br != null)
				br.close();
		}
		return sb.toString();
	}

	public static String CreateFolder(String strCurrentPath, int TaskID,
			String strFileName) {
		/*
		 * /w/zte/!20110209{888}!/00.txt
		 */

		String fn = strFileName;

		if (StringUtil.isNotNull(strFileName)) {
			if (strFileName.contains("!") && strFileName.contains("{")
					&& strFileName.contains("}")) {
				int begin = strFileName.indexOf("!");
				int end = strFileName.lastIndexOf("!");
				if (begin > -1 && end > -1 && begin < end) {
					String content = strFileName.substring(begin, end + 1);
					int cBegin = content.indexOf("{");
					int cEnd = content.indexOf("}");
					if (cBegin > -1 && cEnd > -1 && cBegin < cEnd) {
						String dir = content.substring(cBegin + 1, cEnd);
						fn = fn.replace(content, dir);
					}
				}
			}
		}

		if (!(new File(strCurrentPath).isDirectory())) {
			new File(strCurrentPath).mkdir();
		}
		String[] strFolderList = fn.split("/");

		for (int i = 0; i < strFolderList.length - 1; i++) {
			if (strFolderList[i].equals(""))
				continue;
			strFolderList[i] = strFolderList[i].replaceAll("\\W", "_");
			strCurrentPath = strCurrentPath + File.separatorChar
					+ strFolderList[i];
			if (!(new File(strCurrentPath).isDirectory())) {
				new File(strCurrentPath).mkdir();
			}
		}
		return strCurrentPath;
	}

	public static String createLocalFolder(String strCurrentPath, int TaskID,
			String strFileName) {
		File f = new File(strCurrentPath);
		if (!f.exists())
			f.mkdirs();

		String[] strFolderList = strFileName.split("/");

		for (int i = 0; i < strFolderList.length; i++) {
			if (strFolderList[i].equals(""))
				continue;
			try {
				strFolderList[i] = new String(strFolderList[i].getBytes("GBK"),
						"iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			strFolderList[i] = strFolderList[i].replaceAll("\\W", "_");

			strCurrentPath = strCurrentPath + File.separatorChar
					+ strFolderList[i];
			new File(strCurrentPath).mkdirs();
		}
		return strCurrentPath;
	}

	/**
	 * 1：小时，2：天，3：周，4：月。
	 * 
	 * @param period
	 * @return
	 */
	public static int getPeriodValue(String period) {
		if (period.endsWith("H")) {
			return 1;
		} else if (period.endsWith("D")) {
			return 2;
		} else if (period.endsWith("W")) {
			return 3;
		} else if (period.endsWith("M")) {
			return 4;
		} else {
			return -1;
		}
	}

	public static String ParseFilePathForDB2(String strPath, Timestamp timestamp) {
		// 如：zblecp-2006102311.hsmr 文件名包含时间，表示这个时间的数据。
		// 这个时间有是timestamp传递进来的时间
		// 但是，有的文件名是一个时间段，前后有2个时间。
		// 如：Domain125_PSbasicmeasurement_18Jul2008_0900-18Jul2008_1000.csv
		// 现在从strPath传递进来一个参数表示前后时间的间隔数，
		// 如：Domain125_PSbasicmeasurement_%%D%%EM%%Y_%%H%%m-%%ND%%ENM%%NY_%%NH%%Nm.csv|360000
		// strPath = replace(strPath);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

		int iHwrIdx = strPath.indexOf("%%TA");
		int iDiff = 0;
		if (iHwrIdx >= 0) {
			// 偏移量 0－9，只支持正偏移
			iDiff = Integer.parseInt(strPath
					.substring(iHwrIdx + 4, iHwrIdx + 5));
			strPath = strPath.replaceAll("%%TA.", "");
		}

		timestamp = new Timestamp(timestamp.getTime() + iDiff * 3600 * 1000);
		String strTime = formatter.format(timestamp);

		if (strPath.indexOf("%%Y") >= 0)
			strPath = strPath.replace("%%Y", strTime.substring(0, 4));
		Calendar calendar = Calendar.getInstance();

		Date date = new Date();
		date.setTime(timestamp.getTime());
		calendar.setTime(new Date());

		calendar.setTime(date);
		int nDayOrYear = calendar.get(Calendar.DAY_OF_YEAR);

		if (nDayOrYear < 10)
			strPath = strPath.replace("%%DayOfYear", "00" + nDayOrYear);
		else if (nDayOrYear < 100)
			strPath = strPath.replace("%%DayOfYear", "0" + nDayOrYear);
		else
			strPath = strPath
					.replace("%%DayOfYear", String.valueOf(nDayOrYear));

		if (strPath.indexOf("%%y") >= 0)
			strPath = strPath.replace("%%y", strTime.substring(2, 4));

		if (strPath.indexOf("%%EM") >= 0) {
			switch (Integer.parseInt(strTime.substring(4, 6))) {
				case 1 :
					strPath = strPath.replace("%%EM", "Jan");
					break;
				case 2 :
					strPath = strPath.replace("%%EM", "Feb");
					break;
				case 3 :
					strPath = strPath.replace("%%EM", "Mar");
					break;
				case 4 :
					strPath = strPath.replace("%%EM", "Apr");
					break;
				case 5 :
					strPath = strPath.replace("%%EM", "May");
					break;
				case 6 :
					strPath = strPath.replace("%%EM", "Jun");
					break;
				case 7 :
					strPath = strPath.replace("%%EM", "Jul");
					break;
				case 8 :
					strPath = strPath.replace("%%EM", "Aug");
					break;
				case 9 :
					strPath = strPath.replace("%%EM", "Sep");
					break;
				case 10 :
					strPath = strPath.replace("%%EM", "Oct");
					break;
				case 11 :
					strPath = strPath.replace("%%EM", "Nov");
					break;
				case 12 :
					strPath = strPath.replace("%%EM", "Dec");
					break;
			}
		}

		// if (strPath.indexOf("%%M") >= 0)
		// strPath = strPath.replace("%%M", strTime.substring(4, 6));

		// add by on 2013-05-14
		String fw = null;
		if (strPath.indexOf("%%FM") >= 0) {
			fw = strTime.substring(4, 6);
			try {
				if (Integer.valueOf(fw) < 10) {
					strPath = strPath.replace("%%FM", strTime.substring(5, 6));
				} else
					strPath = strPath.replace("%%FM", strTime.substring(4, 6));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// add

		if (strPath.indexOf("%%M") >= 0)
			strPath = strPath.replace("%%M", strTime.substring(4, 6));

		if (strPath.indexOf("%%d") >= 0)
			strPath = strPath.replace("%%d", strTime.substring(6, 8));

		if (strPath.indexOf("%%D") >= 0)
			strPath = strPath.replace("%%D", strTime.substring(6, 8));

		// add by liuwx 针对天,小时是否补0 ,如果天为0-9 ，则返回0-9 天为10-31返回10-31 ，小时0-9则0-9
		// ，小时10-23则10-23
		if (strPath.indexOf("%%fd") >= 0) {
			strPath = strPath.replace("%%fd", strTime.substring(6, 8));
		}
		String sd = null;
		if (strPath.indexOf("%%FD") >= 0) {
			sd = strTime.substring(6, 8);
			try {
				if (Integer.valueOf(sd) < 10) {
					strPath = strPath.replace("%%FD", strTime.substring(7, 8));
				} else
					strPath = strPath.replace("%%FD", strTime.substring(6, 8));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		String fh = null;
		if (strPath.indexOf("%%FH") >= 0) {
			String strHour = getExpression(strPath);
			if (strHour != null && !strHour.equals("")) {
				String strHourTmp = strHour.replaceAll("%%FH",
						strTime.substring(8, 10));
				int nHour = Util.parseExpression(strHourTmp);

				/*
				 * ChenSijiang 2011-01-18
				 * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
				 */
				if (nHour > 23)
					nHour = 0;

				strPath = strPath.replace("(" + strHour + ")",
						String.valueOf(nHour));
				if (nHour < 10)
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(7, 10));
				else
					strPath = strPath.replaceAll("%%FH",
							strTime.substring(8, 10));
			} else {
				fh = strTime.substring(8, 10);
				if (Integer.valueOf(fh) < 10) {
					strPath = strPath.replace("%%FH", strTime.substring(9, 10));
				} else
					strPath = strPath.replace("%%FH", strTime.substring(8, 10));
			}
		}
		// end add

		// if (strPath.indexOf("%%H") >= 0) {
		// String strHour = getExpression(strPath);
		// if (strHour != null && !strHour.equals("")) {
		// String strHourTmp = strHour.replaceAll("%%H",
		// strTime.substring(8, 10));
		// int nHour = Util.parseExpression(strHourTmp);
		//
		// /*
		// * ChenSijiang 2011-01-18
		// * 如果现在是23点，那么(%%H+1)会变成24，应该是不存在24点的说法。所以此处改成，如果小时过了23之后，变为0.
		// */
		// if (nHour > 23)
		// nHour = 0;
		//
		// // String temp = strPath.substring(strPath.indexOf("("),
		// // strPath.indexOf(")") + 1);
		//
		// // if ( temp.contains("%%") )
		// strPath = strPath.replace("(" + strHour + ")",
		// DateUtil.trimHour(nHour));
		// strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
		// } else {
		// strPath = strPath.replaceAll("%%H", strTime.substring(8, 10));
		// }
		// }
		// ---ADD ON 2013-05-14 END

		if (strPath.indexOf("%%d") >= 0)
			strPath = strPath.replace("%%d", strTime.substring(6, 8));

		if (strPath.indexOf("%%D") >= 0)
			strPath = strPath.replace("%%D", strTime.substring(6, 8));

		if (strPath.indexOf("%%H") >= 0) {
			strPath = strPath.replace("%%H", strTime.substring(8, 10));
		}

		if (strPath.indexOf("%%h") >= 0)
			strPath = strPath.replace("%%h", strTime.substring(8, 10));

		if (strPath.indexOf("%%m") >= 0)
			strPath = strPath.replace("%%m", strTime.substring(10, 12));

		if (strPath.indexOf("%%s") >= 0)
			strPath = strPath.replace("%%s", strTime.substring(12, 14));

		if (strPath.indexOf("%%S") >= 0)
			strPath = strPath.replace("%%S", strTime.substring(12, 14));

		// if ( strPath.indexOf("|") > 0 )
		// {
		// String strInterval = "";
		// int nInterval = 0;
		// strInterval = strPath.substring(strPath.indexOf("|") + 1);
		// strPath = strPath.substring(0, strPath.indexOf("|"));
		//
		//
		//
		Pattern pa = Pattern.compile("\\|\\d+");
		Matcher m = pa.matcher(strPath);
		boolean b = m.find();

		int singleSepPos = strPath.lastIndexOf("|");// (|)的位置
		int doubleSepPos = strPath.lastIndexOf("||");// (||)的位置

		if (b && singleSepPos != -1 && singleSepPos != doubleSepPos + 1) {
			String strInterval = "";
			int nInterval = 0;
			strInterval = strPath.substring(singleSepPos + 1);
			strPath = strPath.substring(0, singleSepPos);
			// TODO
			nInterval = Integer.parseInt(strInterval);
			timestamp = new Timestamp(timestamp.getTime() + nInterval);
			strTime = formatter.format(timestamp);

			if (strPath.indexOf("%%NY") >= 0)
				strPath = strPath.replace("%%NY", strTime.substring(0, 4));

			if (strPath.indexOf("%%Ny") >= 0)
				strPath = strPath.replace("%%Ny", strTime.substring(2, 4));

			if (strPath.indexOf("%%NEM") >= 0) {
				switch (Integer.parseInt(strTime.substring(4, 6))) {
					case 1 :
						strPath = strPath.replace("%%NEM", "Jan");
						break;
					case 2 :
						strPath = strPath.replace("%%NEM", "Feb");
						break;
					case 3 :
						strPath = strPath.replace("%%NEM", "Mar");
						break;
					case 4 :
						strPath = strPath.replace("%%NEM", "Apr");
						break;
					case 5 :
						strPath = strPath.replace("%%NEM", "May");
						break;
					case 6 :
						strPath = strPath.replace("%%NEM", "Jun");
						break;
					case 7 :
						strPath = strPath.replace("%%NEM", "Jul");
						break;
					case 8 :
						strPath = strPath.replace("%%NEM", "Aug");
						break;
					case 9 :
						strPath = strPath.replace("%%NEM", "Sep");
						break;
					case 10 :
						strPath = strPath.replace("%%NEM", "Oct");
						break;
					case 11 :
						strPath = strPath.replace("%%NEM", "Nov");
						break;
					case 12 :
						strPath = strPath.replace("%%NEM", "Dec");
						break;
				}
			}

			if (strPath.indexOf("%%NM") >= 0)
				strPath = strPath.replace("%%NM", strTime.substring(4, 6));

			if (strPath.indexOf("%%Nd") >= 0)
				strPath = strPath.replace("%%Nd", strTime.substring(6, 8));

			if (strPath.indexOf("%%ND") >= 0)
				strPath = strPath.replace("%%ND", strTime.substring(6, 8));

			if (strPath.indexOf("%%NH") >= 0)
				strPath = strPath.replace("%%NH", strTime.substring(8, 10));

			if (strPath.indexOf("%%NV4") >= 0) {
				int nNum = Integer.parseInt(strTime.substring(8, 10));
				nNum = (nNum + 1) / 4;
				strPath = strPath.replace("%%NV4", "0" + nNum);
			}

			if (strPath.indexOf("%%Nh") >= 0)
				strPath = strPath.replace("%%Nh", strTime.substring(8, 10));

			if (strPath.indexOf("%%Nm") >= 0)
				strPath = strPath.replace("%%Nm", strTime.substring(10, 12));

			if (strPath.indexOf("%%Ns") >= 0)
				strPath = strPath.replace("%%Ns", strTime.substring(12, 14));

			if (strPath.indexOf("%%NS") >= 0)
				strPath = strPath.replace("%%NS", strTime.substring(12, 14));
		}

		return strPath;
	}
	
	public static String replaceRc(String fileName,Task task)
	{
		if(fileName != null && fileName.indexOf("%%RC") > 0)
		{
			if(task instanceof RTask)
			{
				fileName = fileName.replace("%%RC", ((RTask)task).getCounter()+1+"");
			}
			else
			{
				fileName = fileName.replace("%%RC", "0");
			}   
		}
		return fileName;
	}
	
	public static String replaceUniqueExtend(String fileName,String ue)
	{
		if(fileName != null && fileName.indexOf("%%UE") > 0)
		{
			fileName = fileName.replace("%%UE", ue);
		}
		return fileName;
	}
	
	public static String replacePartion(String fileName,String partion)
	{
		if(fileName != null && fileName.indexOf("%%PARTION") > 0)
		{
			fileName = fileName.replace("%%PARTION", partion);
		}
		return fileName;
	}
	/**
	 * 根据%%UE获取唯一文件名称
	 * @param fileName
	 * @return
	 */
	public static String getUniqueFile(String fileName)
	{
		int ue = 0;
		boolean flag = fileName.indexOf("%%UE") > 0;
		if(!flag)
		{
			return fileName;
		}
		String ueFileName = null;
		while(flag)
		{
			ueFileName = replaceUniqueExtend(fileName, ue+"");
			if(!new File(ueFileName).exists())
			{
				break;
			}
			ue++;
		}
		return ueFileName;
	}

	public static void main(String[] args) throws ParseException {
		// String aa = "abdasd00";
		// System.out.println(aa.lastIndexOf("|"));
		// System.out.println(aa.lastIndexOf("||"));
		// Date d = DateUtil.getDate("2010-11-05 00:00:00");
		Date d = DateUtil.getDate("2011-2-1 00:00:00");
		String strPath = "                MAX_RSP_SEQ "
				+ "  FROM CLT_CM_R_3G_T_ACCESS_PARA_ZTE"
				+ " WHERE STAMPTIME = TO_DATE('%%Y-%%M-%%D %%H:%%m:%%S', 'YYYY-MM-DD HH24:MI:SS')) APZ,"
				+ "   (SELECT DISTINCT OMCID, SYSTEM, CELLID, CARRIERID, NOM_PWR"
				+ "  FROM CLT_CM_R_3G_T_CARRIER_ZTE"
				+ " WHERE STAMPTIME = TO_DATE('%%Y-%%FM-%%D %%H:%%m:%%S', 'YYYY-MM-DD HH24:MI:SS')) TCZ,";

		strPath = "%%%Y%%M%%D%";
		strPath = ParseFilePathForDB(strPath, new Timestamp(d.getTime()));
		
		
		
		System.out.println(strPath);


	}

}