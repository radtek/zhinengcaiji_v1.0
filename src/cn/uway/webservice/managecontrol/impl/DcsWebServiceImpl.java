package cn.uway.webservice.managecontrol.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.webservice.managecontrol.DcsWebService;
import cn.uway.webservice.managecontrol.EMOSConfigProperties;
import cn.uway.webservice.managecontrol.dao.DcsDAO;
import cn.uway.webservice.managecontrol.dao.DcsDAOImpl;
import cn.uway.webservice.managecontrol.file.GenerateCSVFile;
import cn.uway.webservice.managecontrol.file.GenerateFile;
import cn.uway.webservice.managecontrol.mode.FtpInfo;

/**
 * 区域深度覆盖实现
 * 
 * @author yanb @ 2014年5月23日
 */
public class DcsWebServiceImpl implements DcsWebService {

	private static final Logger LOG = LoggerFactory.getLogger(DcsWebServiceImpl.class);

	private static final String DCS_SCENCE_FILE = "UWAY_DCS_SCENCE_";

	private static final String DCS_SCENCE_CELL__FILE = "UWAY_DCS_SCENCE_CELL_";

	private static final String DCS_SCENCE_BUILDING_FILE = "UWAY_DCS_SCENCE_BUILDING_";

	private DcsDAO dcsDAO = new DcsDAOImpl();

	/**
	 * 区域信息同步查询
	 * 
	 * @return String ftp路径
	 */
	@Override
	public String dcsSceneSyncQuery() {
		String fileName = getFileName(DCS_SCENCE_FILE);
		GenerateFile generateFile = null;
		try {
			generateFile = new GenerateCSVFile(fileName);
			generateFile.makeFile(fileName, DcsConstants.DCSSCENE_TITLE);
			List<String[]> lits = dcsDAO.queryDcsScene();
			for (String[] list : lits) {
				generateFile.makeFile(fileName, list);
			}
			LOG.debug("即将进入FTP");
			WebServiceUtil.uploadFtp(getFtpInfo(), WebServiceUtil.getUploadFtpFile(fileName, lits.size()));
			return getFtpName(getFtpFileName(DCS_SCENCE_FILE));
		} catch (Exception e) {
			LOG.error("区域信息同步查询错误", e);
		} finally {
			if (null != generateFile) {
				try {
					generateFile.close();
				} catch (Exception e) {
					LOG.error("区域信息同步查询错误", e);
				}
			}
		}
		return "";
	}

	/**
	 * 区域与小区关系同步查询服务
	 * 
	 * @return String ftp路径
	 */
	@Override
	public String dcsSceneCellSyncQuery() {
		String fileName = getFileName(DCS_SCENCE_CELL__FILE);
		GenerateFile generateFile = null;
		try {
			generateFile = new GenerateCSVFile(fileName);
			generateFile.makeFile(fileName, DcsConstants.DCSSCENECELL_TITLE);
			List<String[]> lits = dcsDAO.queryDcsSceneCell();
			for (String[] list : lits) {
				generateFile.makeFile(fileName, list);
			}
			LOG.debug("即将进入FTP");
			WebServiceUtil.uploadFtp(getFtpInfo(), WebServiceUtil.getUploadFtpFile(fileName, lits.size()));
			return getFtpName(getFtpFileName(DCS_SCENCE_CELL__FILE));
		} catch (Exception e) {
			LOG.error(" 区域与小区关系同步查询服务错误", e);
		} finally {
			if (null != generateFile) {
				try {
					generateFile.close();
				} catch (Exception e) {
					LOG.error("区域信息同步查询错误", e);
				}
			}
		}
		return "";
	}

	/**
	 * 区域与楼宇关系同步查询服务
	 * 
	 * @return String ftp路径
	 */
	@Override
	public String dcsSceneBuildingSyncQuery() {
		String fileName = getFileName(DCS_SCENCE_BUILDING_FILE);
		GenerateFile generateFile = null;
		try {
			generateFile = new GenerateCSVFile(fileName);
			generateFile.makeFile(fileName, DcsConstants.DCSSCENEBUILDING_TITLE);
			List<String[]> lits = dcsDAO.queryDcsSceneBuilding();
			for (String[] list : lits) {
				generateFile.makeFile(fileName, list);
			}
			LOG.debug("即将进入FTP");
			WebServiceUtil.uploadFtp(getFtpInfo(), WebServiceUtil.getUploadFtpFile(fileName, lits.size()));
			return getFtpName(getFtpFileName(DCS_SCENCE_BUILDING_FILE));
		} catch (Exception e) {
			LOG.error("区域与楼宇关系同步查询服务", e);
		} finally {
			if (null != generateFile) {
				try {
					generateFile.close();
				} catch (Exception e) {
					LOG.error("区域信息同步查询错误", e);
				}
			}
		}
		return "";
	}

	/**
	 * 获取到文件名
	 * 
	 * @param file
	 *            文件类型名
	 * @return 返回文件类型名+日期
	 */
	private String getFileName(String file) {
		return WebServiceUtil.getAbsolutePathFileName(file + WebServiceUtil.getDateStringForYYYYMMDD(new Date()) + ".csv");
	}

	/**
	 * 获取到文件名
	 * 
	 * @param file
	 *            文件类型名
	 * @return 返回文件类型名+日期
	 */
	private String getFtpFileName(String file) {
		return file + WebServiceUtil.getDateStringForYYYYMMDD(new Date()) + ".csv";
	}

	/**
	 * 获取文件在ftp上的名字
	 * 
	 * @param btsName
	 *            btsName
	 * @param fileName
	 *            fileName
	 * @return String String
	 */
	private String getFtpName(String fileName) {
		return getFtpUrl() + EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_path") + fileName;
	}

	/**
	 * 获取ftp的url
	 * 
	 * @return String String
	 */
	private String getFtpUrl() {
		return WebServiceUtil.getFtpUrl((String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_ip"), (String) EMOSConfigProperties
				.getProps().get("uway_dcs_report_ftp_port"));
	}

	/**
	 * 获取FtpInfo类
	 * 
	 * @return FtpInfo FtpInfo
	 */
	public FtpInfo getFtpInfo() {
		String emosReportFtpIP = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_ip");
		int emosReportFtpPort = Integer.valueOf((String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_port"));
		String emosReportFtpUsername = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_username");
		String emosReportFtpPwd = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_pwd");
		String emosReportFtpEncode = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_encode");
		String emosReportFtpPath = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_path");
		String emosReportFtpMode = (String) EMOSConfigProperties.getProps().get("uway_dcs_report_ftp_mode");
		return new FtpInfo(emosReportFtpIP, emosReportFtpPort, emosReportFtpUsername, emosReportFtpPwd, emosReportFtpEncode, emosReportFtpPath,
				emosReportFtpMode);
	}
}
