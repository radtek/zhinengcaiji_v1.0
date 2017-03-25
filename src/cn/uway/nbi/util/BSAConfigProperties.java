package cn.uway.nbi.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

public class BSAConfigProperties {

	private static final Logger LOG = LoggerFactory
			.getLogger(BSAConfigProperties.class);

	static private BSAConfigProperties _instance; // 单态模式,唯一实例

	static private String separator = System.getProperty("file.separator");

	static private String initPath = "./conf/bsa" + separator;

	static Properties prop = null;

	private BSAConfigProperties() {
		getProps();
	}

	static synchronized public BSAConfigProperties getInstance() {
		if (_instance == null) {
			_instance = new BSAConfigProperties();
		}
		return _instance;
	}

	public static synchronized Properties getProps() {

		try {
			if (prop == null) {
				File propfile = null;
				propfile = new File(initPath + "bas.properties");
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

	public boolean isExtendBIDToHex() {
		String result = (String) BSAConfigProperties.getProps().get(
				"Extend_BID_HEX");
		if (StringUtil.isNotNull(result)) {
			result = result.trim();
			if (result.equalsIgnoreCase("1")) {
				return true;
			}
		}
		return false;
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
		String GR_CONF = BSAConfigProperties.getInstance().getPropertiesValue(
				"WR_CONF");
		System.out.println(GR_CONF);
	}
}
