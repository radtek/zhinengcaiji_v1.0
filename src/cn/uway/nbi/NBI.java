package cn.uway.nbi;

import java.io.File;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Properties;

import org.apache.cxf.jaxws.JaxWsServerFactoryBean;
import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.ucloud.UcloudRunner;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import cn.uway.ews.EWS;
import cn.uway.nbi.framework.ClassMgr;
import cn.uway.nbi.task.TaskMgr;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.MemCleaner;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.validate.CheckMappingMgr;
import cn.uway.nbi.ws.impl.IssuedWebserviceImpl;

/**
 * @author liuwx
 * @version 1.0
 */
public class NBI {

	private static final Logger LOG = LoggerFactory.getLogger(NBI.class);

	/** 每次发布请，修改版本号。 */
	//APP_VERSION = "1.1.7.3";
	//APP_VERSION = "1.1.8.0";2015.10.08 zhangp 数据库密码安全
	//APP_VERSION = "1.1.8.1";修改多个任务下载到本地后打为一个包，然后存于本地其它目录
	public static final String APP_VERSION = "1.1.9.2";

	public static void main(String[] strs) {
		boolean b = initLogger(); // 初始化系统日志模块
		if (!b)
			return;
		LOG.info("【程序版本】{}", APP_VERSION);

		printSysInfo();

		LOG.info("NBI starting ...");
		startWS();
		// 加载数据核查模块
		CheckMappingMgr.getInstance().start();
		// 初始化nbi文件路径
		ClassMgr.getInstance().start();// 启动类实体管理器
		TaskMgr.getInstance().start();// 启动任务管理器
		startWebServer();

		startUcloudService();
		
		MemCleaner  memCleaner =new  MemCleaner();
		memCleaner.start();
		
	}

	/**
	 * 启动ucloud服务接口
	 */
	public static void startUcloudService() {
		if (SysCfg.getInstance().isUcloudService()) {
			UcloudRunner runner = new UcloudRunner();
			runner.start();
		}
	}
	
	public static void startWS()
	{
		if(SysCfg.getInstance().isOpenWS())
		{
			JaxWsServerFactoryBean factory=new JaxWsServerFactoryBean();
	        factory.setAddress(SysCfg.getInstance().getWSAddress());
	        factory.setServiceBean(new IssuedWebserviceImpl());
	        factory.create();
//			Endpoint.publish(SysCfg.getInstance().getWSAddress(), new IssuedWebserviceImpl());
		}
	}

	private static void printSysInfo() {
		Properties props = System.getProperties();
		Iterator<Entry<Object, Object>> it1 = props.entrySet().iterator();
		LOG.info(" ==============================================");
		while (it1.hasNext()) {
			Entry<Object, Object> entry = it1.next();
			LOG.info("【系统信息】{}：{}", new Object[]{entry.getKey(), entry.getValue()});
		}
		LOG.info("==============================================");
		Iterator<Entry<String, String>> it2 = System.getenv().entrySet().iterator();
		while (it2.hasNext()) {
			Entry<String, String> entry = it2.next();
			LOG.info("【环境变量】{}：{}", new Object[]{entry.getKey(), entry.getValue()});
		}
		LOG.info("==============================================");
	}

	private static void startWebServer() {
		int port = SysCfg.getInstance().getWebport();
		String webapp = SysCfg.getInstance().getWebapp();
		String contextpath = SysCfg.getInstance().getWebContext();
		EWS ews = new EWS(port, webapp, contextpath);
		try {
			ews.start();
		} catch (Exception e) {
			LOG.error("NBI starting  error... cause: {}", e);
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