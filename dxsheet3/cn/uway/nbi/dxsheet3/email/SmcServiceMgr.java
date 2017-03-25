package cn.uway.nbi.dxsheet3.email;

import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.extfaces.SmcServiceSoapBindingStub;

public class SmcServiceMgr {

	private static Logger logger = LoggerFactory.getLogger(SmcServiceMgr.class);

	private SmcServiceSoapBindingStub stub = null;

	private static SmcServiceMgr smcImpl = null;

	public static SmcServiceMgr getInitialize() {
		if (smcImpl != null)
			return smcImpl;

		smcImpl = new SmcServiceMgr();
		return smcImpl;
	}

	private SmcServiceMgr() {
		boolean isOpenSMC = false;
		String str = System.getProperty("isOpenSMC");
		if (str == null) {
			logger.warn("是否打开SMC短消息功能配置错误，系统默认SMC短消息功能关闭。");
			return;
		} else {
			isOpenSMC = Boolean.valueOf(str);
		}

		try {
			if (isOpenSMC) {
				URL url = new URL(System.getProperty("smc_url"));
				stub = new SmcServiceSoapBindingStub(url, null);
			} else {
				logger.warn("SMC短消息功能未打开。");
			}
		} catch (Exception e) {
			logger.error("系统连不上SMC短消息功能模块，原因：" + e.getMessage(), e);
			stub = null;
		}
	}

	public void send(String content) {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return;
		}

		String to_users = "<PHONE>" + System.getProperty("smc_phone") + "</PHONE><EMAIL>" + System.getProperty("smc_email") + "</EMAIL>";
		try {
			stub.deliver(System.getProperty("smc_username"), System.getProperty("smc_password"), 1, Integer.valueOf(System.getProperty("smc_srcId")),
					Integer.valueOf(System.getProperty("smc_level")), to_users, Integer.valueOf(System.getProperty("smc_sendWay")), content, null);
		} catch (Exception e) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。" + e.getMessage(), e);
		}
	}

	public void sendEmail(String content, byte[] attachmentfile, String attachment) {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return;
		}

		String to_users = "<PHONE>" + System.getProperty("smc_phone") + "</PHONE><EMAIL>" + System.getProperty("smc_email") + "</EMAIL>";
		try {
			stub.deliverEmail(System.getProperty("smc_username"), System.getProperty("smc_password"),
					Integer.valueOf(System.getProperty("smc_srcId")), Integer.valueOf(System.getProperty("smc_level")), to_users, content, null,
					System.getProperty("smc_title"), attachmentfile, attachment);
		} catch (Exception e) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。" + e.getMessage(), e);
		}
	}

	public int sendEomsEmail(EmailPojo pojo) throws Exception {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return -1;
		}
		StringBuffer to_users = new StringBuffer();
		String[] users = pojo.getTousers().split(",");
		for (String string : users) {
			to_users.append("<EMAIL>" + string + "</EMAIL>");
		}

		return stub.deliverEmail(pojo.getUsername(), pojo.getPassword(), pojo.getSrcId(), pojo.getLevel(), to_users.toString(), pojo.getContent(),
				pojo.getSendTime(), pojo.getSmcTitle(), pojo.getAttachmentfile(), pojo.getAttachment());

	}
}
