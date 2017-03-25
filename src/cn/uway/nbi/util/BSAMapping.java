package cn.uway.nbi.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.exception.CfgException;

public class BSAMapping {

	protected static Logger logger = LoggerFactory.getLogger(BSAMapping.class);

	private static BSAMapping instance = null;

	private static final String mappingfile = "./conf/bsa/bsa_mapping.xml";

	/* Map<同步类型，模板文件名称> */
	private Map<String, String> bsaTempletMapping = new HashMap<String, String>();

	private PropertiesXML propertiesXML;

	public BSAMapping() {
		load(mappingfile);

	}

	public static BSAMapping getInstance() {
		if (instance != null) {
			return instance;
		}
		return new BSAMapping();
	}

	/**
	 * 加载系统配置文件
	 */
	private void load(String loaclpath) {
		try {
			if (loaclpath == null || loaclpath.trim().length() == 0) {
				propertiesXML = new PropertiesXML();
			} else {
				propertiesXML = new PropertiesXML(loaclpath);
			}
			init();
		} catch (CfgException e) {
			logger.error("加载[original]系统配置文件信息失败,原因:", e);
		}
	}

	/**
	 * 重新加载
	 */
	public void reload() {
		propertiesXML = null;
		load(null);

	}

	/**
	 * 初始化
	 */
	private void init() {
		loadSyncModeTempletMapping();

	}

	/**
	 * 加载同步类型，以及模板对应名
	 * 
	 * @return Map<类型，文件名>
	 */
	private Map<String, String> loadSyncModeTempletMapping() {
		List<Element> e = propertiesXML.getElementsByXpath("bsa.syncmodes.syncmode");
		for (Element en : e) {
			String id = en.attributeValue("id");
			if (StringUtil.isNull(id))
				continue;
			String xmlFileName = en.getTextTrim();
			if (!bsaTempletMapping.containsKey(id))
				bsaTempletMapping.put(id.toLowerCase(), xmlFileName);
		}
		return bsaTempletMapping;
	}

	public Map<String, String> getBsaTempletMapping() {

		return bsaTempletMapping;
	}
}
