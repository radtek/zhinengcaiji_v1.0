package cn.uway.webservice.managecontrol.impl;

import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.xfire.client.Client;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.framework.validate.common.ThreadPool;
import cn.uway.webservice.bsa.impl.MsgQueue;
import cn.uway.webservice.managecontrol.EMOSConfigProperties;
import cn.uway.webservice.managecontrol.UwayNoapService;
import cn.uway.webservice.managecontrol.dao.W_EMOSDAO;
import cn.uway.webservice.managecontrol.file.DefaultGenerateExcelFile;
import cn.uway.webservice.managecontrol.mode.ExcelPara;
import cn.uway.webservice.managecontrol.mode.FtpInfo;
import cn.uway.webservice.managecontrol.mode.UwayKpiQueryPara;

/**
 * 
 * 广东联通网络公司全流程管控系统接口
 * 
 * 全流程异步接口存在调用消息未持久化的风险，在NBI中对于此类接口都存在相似风险，NBI重构时，需要考虑这个问题。
 * 
 * @author yanb @ 2014年4月3日
 */
public class UwayNoapServiceImpl implements UwayNoapService {

	private static final Logger LOG = LoggerFactory.getLogger(UwayNoapServiceImpl.class);

	private static final MsgQueue<UwayKpiQueryPara> queue = new MsgQueue<UwayKpiQueryPara>();

	private static volatile boolean isNew = true;

	private static ThreadPool threadPool = new ThreadPool();
	static {
		// 创建线程池，cpu数量*2
		threadPool.createThreadPool(3);
	}

	public UwayNoapServiceImpl() {
		start();
	}

	private synchronized void start() {
		if (isNew) {
			new Thread(new UwayKpiQueryAsyncHandleThread<UwayKpiQueryPara>(queue, threadPool), "UwayKpiQueryAsync thread").start();
			isNew = false;
		}
	}

	/**
	 * 异步接口
	 * 
	 * @param DataTime
	 *            时间
	 * @return 上报的文件名
	 */
	@Override
	public int UwayKpiQueryAsync(String dataTime) {
		LOG.debug("进入UwayKpiQueryAsync查询接口");
		try {
			// 进行校验
			if (null == dataTime || "".equalsIgnoreCase(dataTime) || !isDataTime(dataTime)) {
				return 1;
			}
			queue.put(new UwayKpiQueryPara(dataTime));
		} catch (InterruptedException e) {
			LOG.error("加入队列异步处理队列错误", e);
			return 1;
		} catch (Exception e) {
			LOG.error("加入队列异步处理队列错误", e);
			return 1;
		}
		return 0;
	}

	/**
	 * 是否是时间格式 文档规定 yyyy-mm-dd格式
	 * 
	 * @param dataTime
	 *            dataTime
	 * @return boolean boolean
	 * @throws Exception
	 *             Exception
	 */
	private boolean isDataTime(String dataTime) throws Exception {
		String regex = "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))";
		return WebServiceUtil.matcher(regex, dataTime);
	}

	private String query3GPARAKpi(String dataTime) throws Exception {
		String ftpFileName = getFtpFileName();
		String fileName = WebServiceUtil.getAbsolutePathFileName(ftpFileName);
		int count = generaeFile(dataTime, fileName);
		LOG.debug("即将进入FTP");
		WebServiceUtil.uploadFtp(getFtpInfo(), WebServiceUtil.getUploadFtpFile(fileName, count));
		return getFtpName(ftpFileName);
	}

	private int generaeFile(String dataTime, String fileName) throws Exception {
		W_EMOSDAO wDao = new W_EMOSDAO();
		List<Object> listKpi = wDao.query3GParaKpi(dataTime);
		ExcelPara excelPara = new ExcelPara();
		excelPara.setFiledStyle(getFiledStyle());
		excelPara.setCellValues(listKpi);
		excelPara.setSheetName("Total");
		new DefaultGenerateExcelFile().makeFile(fileName, excelPara);
		return listKpi.size();
	}

	private Map<Integer, String> getFiledStyle() {
		Map<Integer, String> styles = new HashMap<Integer, String>();
		styles.put(2, "0.00%");
		styles.put(3, "0.00%");
		styles.put(4, "0.00%");
		return styles;
	}

	/**
	 * 获取上传到ftp文件名
	 * 
	 * @param btsName
	 *            btsName
	 * @return String String
	 */
	private String getFtpFileName() {
		return "3G无线利用率_日报_" + DateUtil.getDateString_yyyyMMddHHmmss(new Date()) + ".xls";
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
		return getFtpUrl() + EMOSConfigProperties.getProps().get("uway_noap_report_ftp_path") + fileName;
	}

	/**
	 * 获取ftp的url
	 * 
	 * @return String String
	 */
	private String getFtpUrl() {
		return WebServiceUtil.getFtpUrl((String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_ip"), (String) EMOSConfigProperties
				.getProps().get("uway_noap_report_ftp_port"));
	}

	/**
	 * 获取FtpInfo类
	 * 
	 * @return FtpInfo FtpInfo
	 */
	public FtpInfo getFtpInfo() {
		String emosReportFtpIP = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_ip");
		int emosReportFtpPort = Integer.valueOf((String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_port"));
		String emosReportFtpUsername = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_username");
		String emosReportFtpPwd = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_pwd");
		String emosReportFtpEncode = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_encode");
		String emosReportFtpPath = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_path");
		String emosReportFtpMode = (String) EMOSConfigProperties.getProps().get("uway_noap_report_ftp_mode");
		return new FtpInfo(emosReportFtpIP, emosReportFtpPort, emosReportFtpUsername, emosReportFtpPwd, emosReportFtpEncode, emosReportFtpPath,
				emosReportFtpMode);
	}

	class UwayKpiQueryAsyncHandleThread<T> extends AsyncHandleThread<T> {

		public UwayKpiQueryAsyncHandleThread(MsgQueue<T> queue, ThreadPool threadPool) {
			super(queue, threadPool);
		}

		@Override
		public AsyncQueryHandle createAsyncHandle(Object obj) throws Exception {
			return new UwayKpiQueryAsyncHandle((UwayKpiQueryPara) obj);
		}

	}

	class UwayKpiQueryAsyncHandle implements AsyncQueryHandle {

		private final UwayKpiQueryPara uwayKpiQueryPara;

		public UwayKpiQueryAsyncHandle(UwayKpiQueryPara uwayKpiQueryPara) {
			this.uwayKpiQueryPara = uwayKpiQueryPara;
		}

		@Override
		public void run() {
			if (null == uwayKpiQueryPara) {
				return;
			}
			String dataTime = uwayKpiQueryPara.getDataTime();
			String ftpPath = null;
			int rs = -1;
			try {
				// 执行查询
				ftpPath = query3GPARAKpi(dataTime);

				// 完成后回调泰和的接口
				LOG.debug("开始回调泰和接口，参数为，dataTime=" + dataTime + ",ftpPath=" + ftpPath);
				rs = new UwayKpiQueryAsyncBack().callback(dataTime, ftpPath, " ");
			} catch (Exception e) {
				LOG.error("异步查询bts异常：", e);
				LOG.debug("开始回调泰和接口，参数为，dataTime=" + dataTime + ",ftpPath=" + ftpPath + ",异常信息为：" + e.getMessage());
				rs = new UwayKpiQueryAsyncBack().callback(dataTime, ftpPath, e.getMessage());
			}
			LOG.debug("泰合佳厂家性能数据回调结果为：" + (0 == rs ? "数据正常" : "数据异常"));
		}

		/**
		 * 回调泰和的接口
		 */
		class UwayKpiQueryAsyncBack {

			public int callback(String dataTime, String ftpPath, String errorInfo) {
				String gUrl = EMOSConfigProperties.getProps().getProperty("uway_noap_soap_url");
				if (null == gUrl) {
					LOG.error("对方厂商的URL没有配置.");
					return -1;
				}
				LOG.debug("对方厂商的webservice url 是:" + gUrl);
				int result = 0;
				try {
					Client client = new Client(new URL(gUrl));
					Object[] results = client.invoke("UwayKpiQueryAsyncBack", new Object[]{dataTime, ftpPath, null == errorInfo ? "" : errorInfo});
					result = (Integer) results[0];
				} catch (Exception e) {
					LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
				}

				return result;
			}

		}
	}
}
