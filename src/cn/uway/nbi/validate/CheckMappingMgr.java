package cn.uway.nbi.validate;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.util.PropertiesXML;
import cn.uway.nbi.util.SysCfg;

/**
 * 数据核查模块解析类
 */
public class CheckMappingMgr {

	private static Logger LOG = LoggerFactory.getLogger(CheckMappingMgr.class);

	private static Map<String, CheckMapping> checkMap;

	private static String fileDir = "./conf/datacheck";

	private static String CHECK_MODULE = "datacheck";

	private static String CHECK_MODULE_EXT = ".xml";

	private static boolean isCheck = false;

	private static final CheckMappingMgr instance = new CheckMappingMgr();

	private CheckMappingMgr() {
		checkMap = new HashMap<String, CheckMapping>();
		isCheck = SysCfg.getInstance().isEnableDataCheck();

	}

	public synchronized static CheckMappingMgr getInstance() {
		return instance;
	}

	public Map<String, CheckMapping> getCheckMap() {
		return checkMap;
	}

	/**
	 * 定时加载数据核查模块
	 */
	public void start() {
		load();
	}

	/**
	 * 加载数据核查模块
	 */
	private void load() {
		File dir = new File(fileDir);
		if (!dir.exists()) {
			LOG.warn(fileDir + "目录 数据核查配置文件不存在.");
			return;
		}

		File[] files = dir.listFiles();

		synchronized (checkMap) {
			checkMap.clear();
			for (File file : files) {
				String sbsPath = file.getAbsolutePath();

				String fileMapping = file.getName();
				if (fileMapping.toLowerCase().startsWith(CHECK_MODULE) && fileMapping.toLowerCase().endsWith(CHECK_MODULE_EXT)) {
					parser(sbsPath);
					break;
				}

			}
		}
	}

	public boolean isCheck() {

		return isCheck;
	}

	public static void parser(String datacheck) {
		try {
			PropertiesXML pXml = new PropertiesXML(datacheck);

			Element root = pXml.getRootPropertyName("checkmodule");

			List<Element> eList = pXml.getChildElementsByPropertyName("checkmodule");

			for (Element el : eList) {
				String tagName = el.getName();
				String dataType = el.attributeValue("data_type");
				String functionName = el.attributeValue("name");
				boolean isusedFlag = false;
				String isused = el.attributeValue("isused");
				if (!StringUtil.isNull(isused)) {
					isused = isused.toLowerCase().trim();
					if (isused.equals("on") || isused.equals("true") || isused.equals("1")) {
						isusedFlag = true;
					} else if (isused.equals("off") || isused.equals("false")) {
						isusedFlag = false;
					}
				}
				List<Element> mappingList = el.elements();
				for (Element mapping : mappingList) {
					String level = mapping.attributeValue("level");
					if (StringUtil.isNull(level))
						level = "";

					String name = mapping.attributeValue("name");
					if (StringUtil.isNull(name))
						name = "";

					String ne_sys_id = mapping.attributeValue("ne_sys_id");
					if (StringUtil.isNull(ne_sys_id))
						ne_sys_id = "";

					CheckMapping mappingEntity = new CheckMapping();

					mappingEntity.setDataType(dataType);
					mappingEntity.setLevel(level);
					mappingEntity.setName(name);
					mappingEntity.setNameFunction(functionName);
					mappingEntity.setNe_sys_id(ne_sys_id);

					mappingEntity.setUsed(isusedFlag);

					if (!checkMap.containsKey(name))
						checkMap.put(name, mappingEntity);

				}
			}
		} catch (Exception e) {
			LOG.error("加载数据核查映射文件失败", e);
		}
	}

	/**
	 * 通过文件名，查找对应的核查映射对象
	 * 
	 * @param fileName
	 *            文件名
	 * @return 核查映射对象
	 */
	public CheckMapping findByFileName(String fileName) {
		CheckMapping checkMapping = null;
		if (checkMap != null && !checkMap.isEmpty()) {
			Iterator<Entry<String, CheckMapping>> it = checkMap.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, CheckMapping> en = it.next();
				String fileNameRegex = en.getKey();
				String result = regFind(fileName, fileNameRegex, 0);
				if (StringUtil.isNull(result))
					continue;

				checkMapping = en.getValue();
				break;
			}
		}
		return checkMapping;
	}

	/**
	 * 通过正则表达式查找
	 * 
	 * @param src
	 * @param regEx
	 * @param group
	 * @return
	 */
	public static String regFind(String src, String regEx, int group) {
		Pattern pat = Pattern.compile(regEx);
		Matcher mat = pat.matcher(src);
		if (mat.find())
			return mat.group(group);
		return null;
	}

	public static void main(String[] args) {
		CheckMappingMgr parser = new CheckMappingMgr();

		parser.load();

	}
}
