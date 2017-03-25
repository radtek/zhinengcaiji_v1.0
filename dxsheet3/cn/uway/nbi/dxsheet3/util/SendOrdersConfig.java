package cn.uway.nbi.dxsheet3.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;
import cn.uway.nbi.dxsheet3.task.OrdersSend;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

public class SendOrdersConfig {

	private static Logger log = LoggerFactory.getLogger(SendOrdersConfig.class);

	public static String GLOBAL_CONF_PATH = "./conf/workorder/"; // 配置文件地址头

	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static SendOrdersConfig config = new SendOrdersConfig();

	private static PropertiesXML propertiesXML;

	private Map<String, Element> cptsConfigMap = null; // 配置

	private Map<String, String> orderStateMap = null; // 工单状态

	private Map<String, String> oedersTemplateMap = null; // 申报模板

	private Map<String, String> confirmNoticeMap = null; // 通知模板

	private Map<String, String> returnparaMap = null; // 返回值

	public static Map<String, OrdersSend> threadMap = new ConcurrentHashMap<String, OrdersSend>();

	public static Map<String, Integer> threadCountMap = new ConcurrentHashMap<String, Integer>();

	public static Map<String, SheetDeclareParameter> orderFileStateMap = null;

	private String authKey; // 我方发给局方的验证

	private String eomsfix; // 固定值标志

	private String eomscityid; // city字段

	private String eomsnetaout; // auth内容

	private String eomsConfig; // 从配置文件读取值标志

	private String eomsAuthKey; // 局方key验证

	public static String eoms_eoms_ip;

	static {
		try {
			orderFileStateMap = (Map<String, SheetDeclareParameter>) SerializeDiskFile.getInstance().readSerialize("eoms_orderFileStateMap");
			if (orderFileStateMap == null) {
				orderFileStateMap = new ConcurrentHashMap<String, SheetDeclareParameter>(); // 工单更新失败
			}

			propertiesXML = new PropertiesXML(GLOBAL_CONF_PATH + System.getProperty("eoms_deployment_province", "gd") + File.separator
					+ "ordersConfig.xml");
		} catch (CfgException e) {
		}
	}

	public static synchronized SimpleDateFormat getDf() {
		return df;
	}

	public static synchronized void setDf(SimpleDateFormat df) {
		SendOrdersConfig.df = df;
	}

	public static SendOrdersConfig getInstance() {
		return config;
	}

	public SendOrdersConfig() {
		init();
		loadTemplate();
		loadXML();
	}

	private void loadTemplate() {
		try {
			// 工单申报
			FileInputStream in = new FileInputStream(GLOBAL_CONF_PATH + System.getProperty("eoms_deployment_province", "gd") + File.separator
					+ "ordersComplaintTemplate.properties");
			InputStreamReader reader = new InputStreamReader(in, "gbk");

			Properties p = new Properties();
			p.load(reader);
			for (Object o : p.keySet()) {
				oedersTemplateMap.put(o.toString(), p.getProperty(o.toString()));
			}

			reader.close();
			in.close();

			// 工单确认
			in = new FileInputStream(GLOBAL_CONF_PATH + System.getProperty("eoms_deployment_province", "gd") + File.separator
					+ "ordersConfirmNoticeTemplate.properties");
			reader = new InputStreamReader(in, "gbk");

			p = new Properties();
			p.load(reader);
			for (Object o : p.keySet()) {
				confirmNoticeMap.put(o.toString(), p.getProperty(o.toString()));
			}

			reader.close();
			in.close();

			// 工单返回信息
			in = new FileInputStream(GLOBAL_CONF_PATH + System.getProperty("eoms_deployment_province", "gd") + File.separator
					+ "ordersReturnPara.properties");
			reader = new InputStreamReader(in, "gbk");

			p = new Properties();
			p.load(reader);
			for (Object o : p.keySet()) {
				returnparaMap.put(o.toString(), p.getProperty(o.toString()));
			}

			reader.close();
			in.close();
		} catch (Exception e) {
			log.error("装载模板异常", e);
		}
	}

	private void loadXML() {
		loadcpts();
		loadorderStates();
	}

	private void init() {
		cptsConfigMap = new HashMap<String, Element>();
		oedersTemplateMap = new HashMap<String, String>();
		confirmNoticeMap = new HashMap<String, String>();
		returnparaMap = new HashMap<String, String>();
		orderStateMap = new HashMap<String, String>();
	}

	/**
	 * 读取单据状态
	 */
	private void loadorderStates() {
		List<Element> ls = propertiesXML.getElementsByXpath("cfg.orderStates.orderState");
		for (Element element : ls) {
			String id = element.attributeValue("id");
			String desc = element.attributeValue("desc");
			orderStateMap.put(id, desc);
		}
	}

	/**
	 * 读取省无线中心
	 */
	private void loadcpts() {
		List<Element> ls = propertiesXML.getElementsByXpath("cfg.cpts.cpt");
		for (Element element : ls) {
			String id = element.attributeValue("id");
			cptsConfigMap.put(id, element);
		}
	}

	/**
	 * 获取配置文件中的属性值
	 * 
	 * @param key
	 * @param attributeValue
	 * @return
	 */
	public String getCptsConfigValueByKey(String key, String attributeValue) {
		String ret = "";
		if (key != null && attributeValue != null) {
			ret = cptsConfigMap.get(key).attributeValue(attributeValue);
		}

		return ret;
	}

	/**
	 * 工单通知
	 * 
	 * @return
	 */
	public Map<String, String> getConfirmNoticeMap() {
		return this.confirmNoticeMap;
	}

	/**
	 * 工单申报
	 * 
	 * @return
	 */
	public Map<String, String> getOrdersTemplate() {
		return this.oedersTemplateMap;
	}

	/**
	 * 返回值
	 * 
	 * @return
	 */
	public Map<String, String> getReturnparaMap() {
		return this.returnparaMap;
	}

	/**
	 * 单据状态
	 * 
	 * @return
	 */
	public Map<String, String> getOrderStateMap() {
		return this.orderStateMap;
	}

	/**
	 * 固定值标志
	 * 
	 * @return
	 */
	public String getEomsFix() {
		if (eomsfix == null) {
			eomsfix = System.getProperty("eoms_fix", "eoms_fix_");
		}
		return eomsfix;
	}

	/**
	 * 配置标志
	 * 
	 * @return
	 */
	public String getEomsConfig() {
		if (eomsConfig == null) {
			eomsConfig = System.getProperty("eoms_config", "eoms_config_");
		}
		return eomsConfig;
	}

	/**
	 * city
	 * 
	 * @return
	 */
	public String getEomscityid() {
		if (eomscityid == null) {
			eomscityid = System.getProperty("eoms_cityid", "cityid");
		}
		return eomscityid;
	}

	/**
	 * auth内容
	 * 
	 * @return
	 */
	public String getEomsnetaout() {
		if (eomsnetaout == null) {
			eomsnetaout = System.getProperty("eoms_netaout");
		}
		return eomsnetaout;
	}

	/**
	 * 验证双方约定
	 * 
	 * @return
	 */
	public String getAuthKey() {
		if (authKey == null) {
			String ip = System.getProperty("eoms_my_ip", Util.getRealIp());
			String eoms_yanvalue = System.getProperty("eoms_yanvalue");
			if (eoms_yanvalue == null)
				return authKey;

			String key = System.getProperty("eoms_flowid", "1") + ip + eoms_yanvalue;
			log.debug(key);
			authKey = Util.getMd5Encrypt(key);
		}
		return authKey;
	}

	/**
	 * 局方验证Key
	 * 
	 * @param string
	 * @return
	 */
	public String getEomsAuthKey(String string) {
		if (eomsAuthKey == null) {
			String eoms_yanvalue = System.getProperty("eoms_yanvalue");
			if (eoms_yanvalue == null || string == null)
				return null;

			eomsAuthKey = System.getProperty("eoms_flowid", "1") + string + eoms_yanvalue;
		}
		return eomsAuthKey;
	}

	/**
	 * 获得标签的内容
	 * 
	 * @param filedValue
	 * @param key
	 * @param cityid
	 * @return
	 */
	private String opCharacters(String filedValue, String key, String cityid) {
		String configeoms = this.getEomsConfig();
		String fixeoms = this.getEomsFix();

		if (filedValue != null && filedValue.trim().length() >= 1) {
			if (filedValue.startsWith(configeoms) && cityid != null) {
				filedValue = this.getCptsConfigValueByKey(cityid, filedValue.substring(configeoms.length()));
			} else if (filedValue.startsWith(fixeoms)) {
				filedValue = filedValue.substring(fixeoms.length());
			}
		}
		return filedValue;
	}

	/**
	 * 组装发送Web的XML格式的参数
	 * 
	 * @param order
	 * @return
	 */
	public String getPerfFaultSend(Map<String, String> order) {
		String eoms_netaout = this.getEomsnetaout();
		String authKey = this.getAuthKey();
		if (eoms_netaout == null || authKey == null)
			return null;

		StringBuffer sb = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>");

		sb.append("<Service>");
		// 网络验证，双方协定
		sb.append(eoms_netaout);

		sb.append("<Data>");
		String ret = "<key>value</key>";

		String cityid = this.getEomscityid();

		List<String> listKys = new ArrayList<String>(order.keySet());
		Collections.sort(listKys);
		for (String key : listKys) {
			if (!key.equalsIgnoreCase(cityid)) {
				String value = order.get(key);
				if (value == null || key.equalsIgnoreCase("starttime")) {
					continue;
				}
				// 前面三个数字是另外加上去的，用来排序用，以保证输出的数据顺序与要求一致
				// key = key.substring(3);
				value = opCharacters(value, key, order.get(cityid));
				sb.append(ret.replace("key", key).replace("value", value));
			}
		}
		sb.append("</Data></Service>");

		return sb.toString().replace("{authKey}", authKey).replace("{flowId}", System.getProperty("eoms_flowid", "1"));
	}
}
