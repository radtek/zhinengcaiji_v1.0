package cn.uway.nbi.bsa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;

import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

/**
 * BSA 校验规则管理
 * 
 * @author Admin @ 2014-12-19
 */
public class BSARuleMgr {

	private static Map<Integer, BsaRule> ruleMgr = new HashMap<Integer, BsaRule>();

	private final static String file = "./conf/bsa/bsa_mapping.xml";

	public void loadCfg() {

		try {
			PropertiesXML pxml = new PropertiesXML(file);

			List<Element> list = pxml.getElementsByXpath("bsa.rules.rule");

			for (Element ele : list) {
				String idStr = ele.attributeValue("id");

				List<Element> ruleList = ele.elements();

				int id = Integer.valueOf(idStr);
				BsaRule rule = new BsaRule();
				rule.setId(id);
				for (Element eleRule : ruleList) {
					String nameTag = eleRule.attributeValue("name");
					String value = eleRule.getTextTrim();
					if ("type".equalsIgnoreCase(nameTag)) {
						rule.setType(value);

					} else if ("error_level".equalsIgnoreCase(nameTag)) {
						rule.setType(value);
					} else if ("error_desc".equalsIgnoreCase(nameTag)) {
						rule.setType(value);
						System.out.println(value);
					}
					
					
				}
				ruleMgr.put(id, rule);
			}

		} catch (CfgException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		BSARuleMgr mgr = new BSARuleMgr();
		mgr.loadCfg();
	}
}
