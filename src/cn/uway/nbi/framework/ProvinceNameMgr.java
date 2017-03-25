package cn.uway.nbi.framework;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

/**
 * 省名称管理器
 * 
 * @author litp 2011-6-16
 */
public class ProvinceNameMgr implements Module {

	/** 省的中英文对应名：<名称通配符,对应的名称> */
	private Map<String, String> provinceMap;

	/** 城市的中英文对应名：<城市id,<名称通配符,对应的名称>> */
	private Map<String, Map<String, String>> cityMap;

	private Document doc;

	private final static Logger LOG = LoggerFactory.getLogger(ProvinceNameMgr.class);

	private String fileName = null;// ALIAS_MAPING_PATH + "mapping.xml";

	public ProvinceNameMgr() {

	}

	public ProvinceNameMgr(String mappingPath) {
		this.fileName = mappingPath;
		initialize();
		start();
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String replaceAllName(String str, int cityId) {
		return replaceAllName(str, String.valueOf(cityId));
	}

	public String replaceAllName(String str, String cityId) {
		if (StringUtils.isEmpty(str))
			return str;

		Set<Entry<String, String>> pSet = provinceMap.entrySet();
		for (Entry<String, String> e : pSet) {
			String aliasName = e.getKey();
			String name = e.getValue();
			str = str.replace(aliasName, name);
		}
		if (StringUtils.isEmpty(cityId))
			return str;

		if (cityMap.containsKey(cityId)) {
			Map<String, String> nameMap = cityMap.get(cityId);
			Set<Entry<String, String>> set = nameMap.entrySet();
			for (Entry<String, String> e : set) {
				String aliasName = e.getKey();
				String name = e.getValue();
				str = str.replace(aliasName, name);
			}
		}
		return str;
	}

	public static String replaceAllName(String str, String cityId, Map<String, String> provinceMap, Map<String, Map<String, String>> cityMap) {
		if (StringUtils.isEmpty(str))
			return str;

		Set<Entry<String, String>> pSet = provinceMap.entrySet();
		for (Entry<String, String> e : pSet) {
			String aliasName = e.getKey();
			String name = e.getValue();
			str = str.replace(aliasName, name);
		}
		if (StringUtils.isEmpty(cityId))
			return str;

		if (cityMap.containsKey(cityId)) {
			Map<String, String> nameMap = cityMap.get(cityId);
			Set<Entry<String, String>> set = nameMap.entrySet();
			for (Entry<String, String> e : set) {
				String aliasName = e.getKey();
				String name = e.getValue();
				str = str.replace(aliasName, name);
			}
		}
		return str;
	}

	public String replaceProvince(String str) {
		if (StringUtils.isEmpty(str))
			return str;
		Set<Entry<String, String>> pSet = provinceMap.entrySet();
		for (Entry<String, String> e : pSet) {
			String aliasName = e.getKey();
			String name = e.getValue();
			str = str.replace(aliasName, name);
		}
		return str;
	}

	public static String replaceProvince(String str, Map<String, String> provinceMap) {
		if (StringUtils.isEmpty(str))
			return str;
		Set<Entry<String, String>> pSet = provinceMap.entrySet();
		for (Entry<String, String> e : pSet) {
			String aliasName = e.getKey();
			String name = e.getValue();
			str = str.replace(aliasName, name);
		}
		return str;
	}

	private void parse() throws Exception {
		LOG.info("开始解析名称映射文件:({})", fileName);
		clear();
		InputStream in = null;
		try {
			in = new FileInputStream(fileName);
			doc = new SAXReader().read(in);
			if (doc.selectSingleNode("/mapping") == null)
				throw new Exception("未发现根节点mapping");
			// 注意加载顺序
			loadMapping();

		} finally {
			if (doc != null)
				doc.clearContent();
			if (in != null)
				in.close();
		}
		LOG.info("名称映射文件({})解析完毕！", fileName);
	}

	@SuppressWarnings("unchecked")
	private void loadMapping() throws Exception {
		Element p = (Element) doc.selectSingleNode("/mapping/province");
		if (p == null)
			throw new Exception("没有province节点或者为空");

		String cn = p.attributeValue("province_cn");
		String en = p.attributeValue("province_en");
		String code = p.attributeValue("province_code");

		if (StringUtils.isEmpty(cn))
			throw new Exception("province节点的province_cn不能为空！");
		if (StringUtils.isEmpty(en))
			throw new Exception("province节点的province_en不能为空！");
		provinceMap.put("${province_cn}", cn);
		provinceMap.put("${province_en}", en);
		if (StringUtil.isNotNull(code))
			provinceMap.put("${province_code}", code);

		List<Element> list = p.elements();
		for (Element e : list) {
			String tagName = e.getName();
			if (!"city".equals(tagName))
				continue;

			String cityId = e.attributeValue("city_id");
			Map<String, String> nameMap = getProperties(e);
			nameMap.put("${city_id}", cityId);
			cityMap.put(cityId, nameMap);
		}
	}

	/**
	 * 加载property节点
	 * 
	 * @throws Exception
	 */
	private Map<String, String> getProperties(Element parentE) throws Exception {
		@SuppressWarnings("unchecked")
		List<Element> es = parentE.elements();
		if (es == null || es.isEmpty())
			throw new Exception("子元素为空,载入失败");
		Map<String, String> eMap = new HashMap<String, String>();
		for (Element e : es) {
			String tagName = e.getName();
			if ("property".equals(tagName)) {
				String name = e.attributeValue("name");
				String content = e.getText();
				eMap.put("${" + name + "}", content);
			}
		}
		return eMap;
	}

	@Override
	public String getName() {
		return "ProvinceNameMgr";
	}

	@Override
	public void initialize() {
		provinceMap = new HashMap<String, String>();
		cityMap = new HashMap<String, Map<String, String>>();
	}

	@Override
	public void dispose() {

	}

	@Override
	public void start() {
		try {
			parse();
		} catch (Exception e) {
			LOG.error("", e);
		}
	}

	@Override
	public void stop() {

	}

	private void clear() {
		if (provinceMap != null)
			provinceMap.clear();
		if (cityMap != null)
			cityMap.clear();
	}

	public Map<String, String> getProvinceMap() {
		return provinceMap;
	}

	public void setProvinceMap(Map<String, String> provinceMap) {
		this.provinceMap = provinceMap;
	}

	public Map<String, Map<String, String>> getCityMap() {
		return cityMap;
	}

	public void setCityMap(Map<String, Map<String, String>> cityMap) {
		this.cityMap = cityMap;
	}

	public boolean isReplace() {
		if (cityMap == null || provinceMap == null || provinceMap.size() <= 0 || cityMap.size() <= 0)
			return false;

		return true;

	}

}
