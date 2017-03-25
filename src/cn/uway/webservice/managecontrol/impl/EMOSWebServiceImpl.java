package cn.uway.webservice.managecontrol.impl;

import java.lang.reflect.Proxy;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.xfire.MessageContext;
import org.codehaus.xfire.client.Client;
import org.codehaus.xfire.client.XFireProxy;
import org.codehaus.xfire.handler.AbstractHandler;
import org.codehaus.xfire.transport.http.CommonsHttpMessageSender;
import org.jdom.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.framework.validate.common.ThreadPool;
import cn.uway.webservice.bsa.impl.MsgQueue;
import cn.uway.webservice.managecontrol.EMOSConfigProperties;
import cn.uway.webservice.managecontrol.EMOSWebService;
import cn.uway.webservice.managecontrol.dao.EMOSDAO;
import cn.uway.webservice.managecontrol.file.DefaultGenerateJsonFile;
import cn.uway.webservice.managecontrol.mode.EmosPara;
import cn.uway.webservice.managecontrol.mode.FtpInfo;
import cn.uway.webservice.managecontrol.webservice.client.ITescommService;
import cn.uway.webservice.managecontrol.webservice.client.TescommCallBackServiceClient;

/**
 * 广东联通网络公司全流程管控系统接口 全流程异步接口存在调用消息未持久化的风险，在NBI中对于此类接口都存在相似风险，NBI重构时，需要考虑这个问题。
 * 
 * @author yanb @ 2014年4月3日
 */
public class EMOSWebServiceImpl implements EMOSWebService {

	private static final Logger LOG = LoggerFactory.getLogger(EMOSWebServiceImpl.class);

	private static final MsgQueue<EmosPara> queue = new MsgQueue<EmosPara>();

	private static volatile boolean isNew = true;

	static Map<Integer, String> resultMap = new HashMap<Integer, String>();

	private static ThreadPool threadPool = new ThreadPool();
	static {
		// 创建线程池，cpu数量*2
		threadPool.createThreadPool(3);
		resultMap.put(0, "正常");
		resultMap.put(1, "基站不存在");
		resultMap.put(2, "文件存在但无数据");
		resultMap.put(3, "FTP连接错误");
	}

	public EMOSWebServiceImpl() {
		start();
	}

	private synchronized void start() {
		if (isNew) {
			new Thread(new EmosHandleThread<EmosPara>(queue, threadPool), "EMOS async thread").start();
			isNew = false;
		}
	}

	/**
	 * 同步查询接口
	 * 
	 * @param BTSName
	 *            BTSName
	 * @param type
	 *            type
	 * @return String String
	 */
	@Override
	public String EMOSQuery(String BTSName, int type) {
		LOG.debug("进入EMOSQuery查询接口");
		try {
			BTSName = replaceBtsName(BTSName);
			if (null == BTSName || "".equalsIgnoreCase(BTSName.trim()) || !isExistBtsName(BTSName, WebServiceUtil.getNetType(type))) {
				return getFtpUrl();
			}
			return queryBtsName(BTSName, type);

		} catch (Exception e) {

			LOG.error("EMOSQuery查询结构异常，", e);
		}
		return null;
	}

	/**
	 * 异步查询接口
	 * 
	 * @param BTSName
	 *            BTSName
	 * @param type
	 *            type
	 * @return String String
	 */
	@Override
	public int EMOSAsyncQuery(String BTSName, int type) {
		LOG.debug("进入EMOSAsyncQuery查询接口");
		try {
			BTSName = replaceBtsName(BTSName);
			// 进行校验
			if (null == BTSName || "".equalsIgnoreCase(BTSName) || !isExistBtsName(BTSName, WebServiceUtil.getNetType(type))) {
				return 1;
			}
			queue.put(new EmosPara(BTSName, type));
		} catch (InterruptedException e) {
			LOG.error("加入队列异步处理队列错误", e);
			return 1;
		} catch (Exception e) {
			LOG.error("加入队列异步处理队列错误", e);
			return 1;
		}
		return 0;
	}

	private String queryBtsName(String BTSName, int type) throws Exception {
		String netType = WebServiceUtil.getNetType(type);
		String ftpFileName = getFtpFileName(BTSName);
		String fileName = WebServiceUtil.getAbsolutePathFileName(ftpFileName);
		EMOSDAO emosDao = EMOSDAO.createDao(netType);
		int count = emosDao.getFileLineCount();
		// 直接用json类生成json数据，这里涉及到数据不是很大，如果数据大的情况下，不能这样实现，最好的方式还是从数据库取出一行就记录一行
		new DefaultGenerateJsonFile().makeFile(fileName, emosDao.queryBTSName(BTSName));
		LOG.debug("即将进入FTP");
		WebServiceUtil.uploadFtp(getFtpInfo(), WebServiceUtil.getUploadFtpFile(fileName, count));
		return getFtpName(ftpFileName);
	}

	/**
	 * 处理btsname 泰和传入的btsname 带有{}符号
	 * 
	 * @param btsName
	 *            btsName
	 * @return String String去除{}后的btsname
	 */
	private String replaceBtsName(String btsName) {
		if (null != btsName && btsName.contains("{")) {
			return btsName.substring(1, btsName.length() - 1);
		}
		return btsName;
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
		return getFtpUrl() + "/" + EMOSConfigProperties.getProps().get("emos_report_ftp_path") + fileName;
	}

	/**
	 * 获取ftp的url
	 * 
	 * @return String String
	 */
	private String getFtpUrl() {
		return WebServiceUtil.getFtpUrl((String) EMOSConfigProperties.getProps().get("emos_local_url_ip"), (String) EMOSConfigProperties.getProps()
				.get("emos_report_ftp_port"));
	}

	/**
	 * 获取FtpInfo类
	 * 
	 * @return FtpInfo FtpInfo
	 */
	public FtpInfo getFtpInfo() {
		String emosReportFtpIP = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_ip");
		int emosReportFtpPort = Integer.valueOf((String) EMOSConfigProperties.getProps().get("emos_report_ftp_port"));
		String emosReportFtpUsername = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_username");
		String emosReportFtpPwd = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_pwd");
		String emosReportFtpEncode = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_encode");
		String emosReportFtpPath = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_path");
		String emosReportFtpMode = (String) EMOSConfigProperties.getProps().get("emos_report_ftp_mode");
		return new FtpInfo(emosReportFtpIP, emosReportFtpPort, emosReportFtpUsername, emosReportFtpPwd, emosReportFtpEncode, emosReportFtpPath,
				emosReportFtpMode);
	}

	/**
	 * 获取上传到ftp文件名
	 * 
	 * @param btsName
	 *            btsName
	 * @return String String
	 */
	private String getFtpFileName(String btsName) {
		return btsName + "_" + DateUtil.getDateString_yyyyMMddHHmmss(new Date()) + ".txt";
	}

	/**
	 * bts是否存在
	 * 
	 * @param btsName
	 *            btsName
	 * @param netType
	 *            netType
	 * @return boolean boolean
	 * @throws Exception
	 *             Exception
	 */
	private boolean isExistBtsName(String btsName, String netType) throws Exception {
		return EMOSDAO.createDao(netType).isExistBTSName(btsName);
	}

	class EmosHandleThread<T> extends AsyncHandleThread<T> {

		public EmosHandleThread(MsgQueue<T> queue, ThreadPool threadPool) {
			super(queue, threadPool);
		}

		@Override
		public AsyncQueryHandle createAsyncHandle(Object obj) throws Exception {
			return new EmosThreadHandle((EmosPara) obj);
		}

	}

	/**
	 * 异步处理类
	 * 
	 * @author yanb @ 2013年9月27日
	 */
	class EmosThreadHandle implements AsyncQueryHandle {

		private final EmosPara emosPara;

		public EmosThreadHandle(EmosPara emosPara) {
			this.emosPara = emosPara;
		}

		@Override
		public void run() {
			if (null == emosPara) {
				return;
			}
			String btsName = emosPara.getBtsName();
			String ftpPath = null;
			int rs = -1;
			try {
				// 执行查询
				ftpPath = queryBtsName(btsName, emosPara.getNetType());

				// 完成后回调泰和的接口
				rs = new EmosCallBack().emoscallback(btsName, ftpPath, "ff");
			} catch (Exception e) {
				LOG.error("异步查询bts异常：", e);
				rs = new EmosCallBack().emoscallback(btsName, ftpPath, e.getMessage());
			}
			LOG.debug("泰合佳厂家性能数据回调结果为：" + resultMap.get(rs) + ",值为:" + rs);
		}
	}

	/**
	 * 回调泰和的接口
	 */
	class EmosCallBack {

		private final String app_id = "APP.PM.OPT.NE.FILE_RECEIVE.TESCOMM.COOLTEST.APP";

		private final String userName = "UWAY.NIOS_APP";

		public int emoscallback(String btsName, String ftpPath, String errorInfo) {
			String gUrl = EMOSConfigProperties.getProps().getProperty("emos_url_g");
			if (null == gUrl) {
				LOG.debug("对方厂商的URL没有配置.");
			}
			LOG.debug("对方厂商的webservice url 是:" + gUrl + ",参数是：btsName=" + btsName + " ftpPath=" + ftpPath);
			int result = 0;
			try {

				TescommCallBackServiceClient tescommCallBackServiceClient = new TescommCallBackServiceClient(gUrl);
				ITescommService service = tescommCallBackServiceClient.getBasicHttpBinding_ITescommService();
				XFireProxy proxy = (XFireProxy) Proxy.getInvocationHandler(service);
				Client client = proxy.getClient();
				client.setProperty(CommonsHttpMessageSender.HTTP_TIMEOUT, "0");
				client.addOutHandler(new ClientAuthenticationHandler(userName, app_id, "authcode", "eventid"));
				Object[] results = client.invoke("EMOSCallBack", new Object[]{btsName, null == ftpPath ? getFtpUrl() : ftpPath, errorInfo});
				result = (Integer) results[0];

			} catch (Exception e) {
				LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
			}

			return result;
		}

		/**
		 * 客服端调用增加消息头
		 */
		class ClientAuthenticationHandler extends AbstractHandler {

			private String userName = null;

			private String serviceCode = null;

			private String eventID = "";

			private String authCode = "";

			public ClientAuthenticationHandler(String userName, String serviceCode) {
				this.userName = userName;
				this.serviceCode = serviceCode;
			}

			public ClientAuthenticationHandler(String userName, String serviceCode, String eventID, String authCode) {
				this.userName = userName;
				this.serviceCode = serviceCode;
				this.eventID = eventID;
				this.authCode = authCode;
			}

			/**
			 * 设置消息头
			 */
			@Override
			public void invoke(MessageContext context) throws Exception {
				Element el = new Element("Header");
				context.getOutMessage().setHeader(el);

				Element serviceCode_el = new Element("ServiceCode", "ns1", "cn.com.boco.HermesService");
				serviceCode_el.addContent(serviceCode);

				Element userName_el = new Element("UserName", "ns2", "cn.com.boco.HermesService");
				userName_el.addContent(userName);

				Element authCode_el = new Element("AuthCode", "ns3", "cn.com.boco.HermesService");
				authCode_el.addContent(authCode);

				Element eventId_el = new Element("EventId", "ns4", "cn.com.boco.HermesService");
				eventId_el.addContent(eventID);

				el.addContent(serviceCode_el);
				el.addContent(userName_el);
				el.addContent(authCode_el);
				el.addContent(eventId_el);
			}

		}
	}

}
