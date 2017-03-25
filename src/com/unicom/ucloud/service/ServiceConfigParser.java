package com.unicom.ucloud.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

public class ServiceConfigParser {

	protected static Logger logger = LoggerFactory.getLogger(ServiceConfigParser.class);

	private String mappingfile = "./conf/ucloud/ucloud.xml";

	private PropertiesXML propertiesXML;

	private static ServiceConfigParser instance = null;

	Map<String, Map<String, String>> mmMap = new HashMap<String, Map<String, String>>();

	private Map<String, DS> dsMap = new HashMap<String, DS>();

	/* Map<服务实体名entity_name，模板> */
	private Map<String, Templet> templetMap = new HashMap<String, Templet>();

	private Map<String, ServiceEntity> ServiceEntityMap = new HashMap<String, ServiceEntity>();

	public ServiceConfigParser() {
		load(mappingfile);
	}

	public static ServiceConfigParser getInstance() {
		if (instance != null) {
			return instance;
		}
		return new ServiceConfigParser();
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
		String provide = "ucloud.services.service_provide.service";

		loadSyncModeTempletMapping(provide);

		String service_consume = "ucloud.services.service_consume.service";
		loadSyncModeTempletMapping(service_consume);
		loadDs();

		loadTemplet();

	}

	private void loadDs() {
		List<Element> e = propertiesXML.getElementsByXpath("ucloud.ds");

		for (Element en : e) {
			DS ds = new DS();

			String id = en.attributeValue("id");
			ds.setId(id);
			List<Element> pList = en.elements();
			Map<String, String> pMap = new HashMap<String, String>();

			for (Element pe : pList) {
				String name = pe.attributeValue("name");
				String value = pe.getText();
				pMap.put(name, value);
			}

			// <property name="url">jdbc:oracle:thin:@192.168.15.223:1521:ora10
			// </property>
			// <property
			// name="driver">oracle.jdbc.driver.OracleDriver</property>
			// <property name="username">gnoap</property>
			// <property name="password">uwaysoft</property>
			//
			ds.setDriver(pMap.get("driver"));
			ds.setUrl(pMap.get("url"));
			ds.setUsername(pMap.get("username"));
			ds.setPassword(pMap.get("password"));
			if (!dsMap.containsKey(id))
				dsMap.put(id, ds);
			mmMap.put(id, pMap);
		}
	}

	public void loadTemplet() {

		List<Element> e = propertiesXML.getElementsByXpath("ucloud.templet");

		for (Element en : e) {
			Templet templet = new Templet();
			String id = en.attributeValue("service_id");
			List<Element> pList = en.elements();
			Map<String, String> pMap = new HashMap<String, String>();
			List<ResultSetEntity> rsList = new ArrayList<ResultSetEntity>();

			templet.setServiceId(id);

			String entity_name = en.attributeValue("entity_name");

			templet.setEntity_name(entity_name);

			String mappingid = en.attributeValue("mapping_service_id");
			templet.setMappingServiceId(mappingid);

			Map<String, List<Column>> ignoreColumnMap = new HashMap<String, List<Column>>();

			for (Element pe : pList) {

				ResultSetEntity rs = new ResultSetEntity();
				String rid = pe.attributeValue("id");

				rs.setId(rid);
				String dsid = pe.attributeValue("ds");
				rs.setDs(dsMap.get(dsid));
				List<Column> cList = new ArrayList<Column>();

				List<Column> ignoreList = new ArrayList<Column>();

				List<Element> sList = pe.elements();
				for (Element ee : sList) {
					String nodeName = ee.getName();
					if (nodeName.equalsIgnoreCase("sql")) {
						String sql = ee.getText();
						rs.setSql(sql);

					} else if (nodeName.equalsIgnoreCase("mapping")) {

						List<Element> colList = ee.elements();
						for (Element col : colList) {
							Column c = new Column();
							String src = col.attributeValue("src");
							String desc = col.attributeValue("dest");
							String desctable = col.attributeValue("desttable");
							String ignore = col.attributeValue("ignore");

							c.src = src;
							c.desc = desc;
							c.descTable = desctable;
							c.ignore = ignore;
							if (StringUtil.isNotNull(ignore) && ("1".equalsIgnoreCase(ignore) || "true".equalsIgnoreCase(ignore))) {
								ignoreList.add(c);
							}
							cList.add(c);
						}

						rs.setColumnList(cList);

					}
				}
				rsList.add(rs);
				ignoreColumnMap.put(rid, ignoreList);

			}
			templet.setResultSetList(rsList);
			templet.setIgnoreColumnMap(ignoreColumnMap);
			templetMap.put(entity_name, templet);
		}
	}

	/**
	 * @return Map<类型，文件名>
	 */
	private void loadSyncModeTempletMapping(String xpath) {
		int type = 1;
		if (xpath.contains("service_consume"))
			type = 2;
		List<Element> e = propertiesXML.getElementsByXpath(xpath);
		for (Element enn : e) {
			ServiceEntity entity = new ServiceEntity();

			List<Element> list = enn.elements();
			for (Element en : list) {
				String tagName = en.getName();
				String value = en.getText();
				entity.setType(type);
				if (StringUtil.isNull(value))
					value = "";
				else {
					value = value.trim();
				}

				if ("service_id".equalsIgnoreCase(tagName)) {
					entity.setService_id(value);
				}

				if ("service_name_en".equalsIgnoreCase(tagName)) {
					entity.setService_name_en(value);
				}
				if ("service_url".equalsIgnoreCase(tagName)) {
					entity.setService_url(value);

				}
				if ("service_name_cn".equalsIgnoreCase(tagName)) {
					entity.setService_name_cn(value);
				}
				if (StringUtil.isNull(entity.getService_name_en()))
					continue;
			}
			if (!ServiceEntityMap.containsKey(entity.getService_id()) && StringUtil.isNotNull(entity.getService_id()))
				ServiceEntityMap.put(entity.getService_id().toUpperCase(), entity);
		}
	}

	public Map<String, ServiceEntity> getServiceEntityMap() {
		return ServiceEntityMap;
	}

	public void setServiceEntityMap(Map<String, ServiceEntity> serviceEntityMap) {
		ServiceEntityMap = serviceEntityMap;
	}

	public Map<String, DS> getDsMap() {
		return dsMap;
	}

	public void setDsMap(Map<String, DS> dsMap) {
		this.dsMap = dsMap;
	}

	public Map<String, Templet> getTempletMap() {
		return templetMap;
	}

	public void setTempletMap(Map<String, Templet> templetMap) {
		this.templetMap = templetMap;
	}

}
