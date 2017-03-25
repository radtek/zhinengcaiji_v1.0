package cn.uway.webservice.managecontrol.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.task.resolver.FileInfo;
import cn.uway.nbi.task.t.TI;
import cn.uway.nbi.util.SysCfg;
import cn.uway.webservice.managecontrol.mode.FtpInfo;

/**
 * 工具类
 * 
 * @author yanb @ 2013年10月9日
 */
public class WebServiceUtil {

	private static final Logger LOG = LoggerFactory.getLogger(WebServiceUtil.class);

	private static final String G_FLAG = "g";

	private static final String W_FLAG = "w";

	/**
	 * 获取网络类型
	 * 
	 * @param NETWORK_TYPE
	 *            NETWORK_TYPE 0G网，1w网
	 * @return String String
	 */
	public static String getNetType(int NETWORK_TYPE) {
		if (NETWORK_TYPE == 0) {
			return G_FLAG;
		} else {
			return W_FLAG;
		}
	}

	/**
	 * 获取全路径文件名
	 * 
	 * @param fileName
	 *            fileName
	 * @return String String
	 */
	public static String getAbsolutePathFileName(String fileName) {
		String dataDir = SysCfg.getInstance().getCurrentpath();
		if (!dataDir.endsWith("/"))
			dataDir = dataDir + "/";
		return dataDir + fileName;
	}

	/**
	 * 获取ftp的url
	 * 
	 * @return String String
	 */
	public static String getFtpUrl(String ftpIP, String ftpPort) {
		return "ftp://" + ftpIP + ":" + ftpPort;
	}

	/**
	 * 上传
	 * 
	 * @param fileName
	 *            fileName
	 * @param lineCount
	 *            lineCount
	 * @throws Exception
	 *             Exception
	 */
	public static void uploadFtp(FtpInfo ftpInfo, List<FileInfo> files) throws Exception {
		LOG.debug("开始向FTP上传文件,文件名为:" + files.toString());
		TI ti = getFtp(ftpInfo);
		ti.transport(files, 0, 0, null);
		LOG.debug("向FTP上传文件结束,文件名为:" + files.toString());
	}

	/**
	 * 获取TI类
	 * 
	 * @return TI TI
	 */
	public static TI getFtp(FtpInfo ftpInfo) {
		boolean bPasv = false;
		if ("1".equalsIgnoreCase(ftpInfo.getEmosReportFtpMode())) {
			bPasv = true;
		}
		TI ti = new TI(0, ftpInfo.getEmosReportFtpIP(), ftpInfo.getEmosReportFtpPort(), ftpInfo.getEmosReportFtpUsername(),
				ftpInfo.getEmosReportFtpPwd(), ftpInfo.getEmosReportFtpPath(), ftpInfo.getEmosReportFtpEncode(), bPasv, true);
		return ti;
	}

	/**
	 * 上传
	 * 
	 * @param fileName
	 *            fileName
	 * @param lineCount
	 *            lineCount
	 * @throws Exception
	 *             Exception
	 */
	public static List<FileInfo> getUploadFtpFile(String fileName, int lineCount) throws Exception {
		LOG.debug("准备向FTP上传文件,文件名为:" + fileName);
		List<FileInfo> list = new ArrayList<FileInfo>();
		FileInfo fileInfo = new FileInfo();
		fileInfo.setCount(lineCount);
		fileInfo.setFileName(fileName);
		list.add(fileInfo);
		return list;
	}

	/**
	 * 正则匹配
	 * 
	 * @param regex
	 *            正则表达式
	 * @param value
	 *            需要匹配的值
	 * @return boolean 是否满足
	 */
	public static boolean matcher(String regex, String value) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(value);
		if (!matcher.matches()) {
			return false;
		}
		return true;
	}

	/**
	 * 格式化时间
	 * 
	 * @param date
	 *            date
	 * @return String String
	 */
	public static String getDateStringForYYYYMMDD(Date date) {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat f = new SimpleDateFormat(pattern);
		return f.format(date);
	}
}
