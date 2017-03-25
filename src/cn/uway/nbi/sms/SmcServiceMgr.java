package cn.uway.nbi.sms;

import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.framework.util.StringUtil;
import cn.uway.nbi.util.SysCfg;
import cn.uway.webservice.impl.SmcServiceSoapBindingStub;

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
		if(StringUtil.isEmpty(str))
		{
			str = SysCfg.getInstance().isOpenSmc();
		}
		if (str == null) {
			logger.warn("是否打开SMC短消息功能配置错误，系统默认SMC短消息功能关闭。");
			return;
		} else {
			isOpenSMC = Boolean.valueOf(str);
		}

		try {
			if (isOpenSMC) {
				String smcUrl = System.getProperty("smc_url");
				if(StringUtil.isEmpty(smcUrl))
				{
					smcUrl = SysCfg.getInstance().getSmsserviceurl();
				}
				URL url = new URL(smcUrl);
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

	public void sendSms(String username, String password, int smc_srcId, Integer smc_level, int smc_sendWay, String content) {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return;
		}

		String to_users = "<PHONE>" + System.getProperty("smc_phone") + "</PHONE><EMAIL>" + System.getProperty("smc_email") + "</EMAIL>";
		try {
			stub.deliver(System.getProperty("smc_username"), System.getProperty("smc_password"), 1, smc_srcId,
					Integer.valueOf(System.getProperty("smc_level")), to_users, smc_sendWay, content, null);
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

	public void sendEmail2(String content, byte[] attachmentfile, String attachment) {
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
	
	public void sendEmail3(String content) {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return;
		}

		String to_users = "<PHONE></PHONE><EMAIL>" + SysCfg.getInstance().getEmail() + "</EMAIL>";
		try {
			stub.deliverEmail(SysCfg.getInstance().getSmsUsername(), SysCfg.getInstance().getSmsPassword(),
					SysCfg.getInstance().getSrcId(), SysCfg.getInstance().getLevel(), to_users, content, null,
					SysCfg.getInstance().getTitle(), null, null);
		} catch (Exception e) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。" + e.getMessage(), e);
		}
	}
	
	public void sendSms(String content) {
		if (stub == null) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。");
			return;
		}

		String to_users = "<PHONE>" + SysCfg.getInstance().getPhone() + "</PHONE><EMAIL>" + SysCfg.getInstance().getEmail() + "</EMAIL>";
		try {
			stub.deliver(SysCfg.getInstance().getSmsUsername(), SysCfg.getInstance().getSmsPassword(), 1, SysCfg.getInstance().getSrcId(),
					SysCfg.getInstance().getLevel(), to_users, 1, content, null);
		} catch (Exception e) {
			logger.error("SMC短消息功能模块异常，通知消息未能发送成功。" + e.getMessage(), e);
		}
	}

	public int sendEmail(EmailPojo pojo) throws Exception {
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
