package cn.uway.webservice.managecontrol;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

public class EMOSConfigProperties {

	private static final Logger LOG = LoggerFactory.getLogger(EMOSConfigProperties.class);

	static private EMOSConfigProperties _instance; // 单态模式,唯一实例

	static private String separator = System.getProperty("file.separator");

	static private String initPath = "./conf/emos" + separator;

	static Properties prop = null;

	private EMOSConfigProperties() {
		getProps();
	}

	static synchronized public EMOSConfigProperties getInstance() {
		if (_instance == null) {
			_instance = new EMOSConfigProperties();
		}
		return _instance;
	}

	public static synchronized Properties getProps() {

		try {
			if (prop == null) {
				File propfile = null;
				propfile = new File(initPath + "props.properties");
				prop = new Properties();
				FileInputStream fis = new FileInputStream(propfile);
				prop.load(fis);
				fis.close();
			}
		} catch (Exception ex) {
			LOG.error("加载属性文件{}失败,原因={}", "props.properties", ex);
		}
		return prop;
	}

	public String getCurrentPath() {
		String result = (String) prop.get("curr_report_data_path");
		if (StringUtil.isNotNull(result))
			result = result.trim();
		return result;
	}

	public Properties getProperties() {
		return prop;
	}

	public String getPropertiesValue(String para) {
		String result = (String) prop.get(para);

		if (StringUtil.isNotNull(result))
			result = result.trim();
		return result;

	}

	public static void main(String[] args) {
		String GR_CONF = EMOSConfigProperties.getInstance().getPropertiesValue("WR_CONF");
		System.out.println(GR_CONF);
	}
}
