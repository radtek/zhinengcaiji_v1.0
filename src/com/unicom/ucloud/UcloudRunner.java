package com.unicom.ucloud;

import java.io.File;

import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import cn.uway.nbi.util.ConstDef;

import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv_ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvPort_Server;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrv_ESBSFWNOSSFWNOSInquiryResInfoSrvPort_Server;

public class UcloudRunner {

	private static final Logger LOG = LoggerFactory.getLogger(UcloudRunner.class);

	public static void main(String[] strs) {
		boolean b = initLogger(); // 初始化系统日志模块
		if (!b)
			return;

		LOG.info("NBI starting ...");

		UcloudRunner runner = new UcloudRunner();
		runner.start();
	}

	public void start() {
		try {
			new ESBSFWNOSSFWNOSInquiryResInfoSrv_ESBSFWNOSSFWNOSInquiryResInfoSrvPort_Server();
		} catch (Exception e) {
			LOG.error("inquiry error", e);
		}

		try {
			new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv_ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvPort_Server();
		} catch (Exception e) {
			LOG.error("ResChangeNotice  error", e);
		}

	}

	/**
	 * 加载系统日志功能
	 */
	private static boolean initLogger() {
		boolean b = true;
		ILoggerFactory loggerFactory = LoggerFactory.getILoggerFactory();
		LoggerContext loggerContext = (LoggerContext) loggerFactory;
		JoranConfigurator jc = new JoranConfigurator();
		try {
			File f = new File(ConstDef.LOGCFG_FILE_URL);
			jc.setContext(loggerContext);
			jc.doConfigure(f);
		} catch (JoranException e) {
			b = false;
			LOG.error("NBI启动失败,原因：系统日志模块加载失败.", e);
		}
		return b;
	}

}