package cn.uway.webservice.managecontrol.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.webservice.managecontrol.AddComplaintService;
import cn.uway.webservice.managecontrol.dao.AddComplaintDAO;
import cn.uway.webservice.managecontrol.dao.AddComplaintDAOImpl;
import cn.uway.webservice.perfservice.Parser;

/**
 * 网优申告数据接口 见文档：湖北电信网优申告数据接口20141017.docx、个性化湖北_网优申告接口说明.docx
 * 
 * @author jiangl @ 2014年10月23日
 */
public class AddComplaintImpl implements AddComplaintService {

	private static final Logger LOG = LoggerFactory.getLogger(AddComplaintImpl.class);

	private AddComplaintDAO addComplaintDAO = new AddComplaintDAOImpl();

	HashMap<String, String> xmlMap = new HashMap<String, String>();

	@Override
	public String getComplaint(String xmlString) {
		Log.info("申告系统传送过来XML信息：" + xmlString);

		try {
			// 解析
			xmlMap = parser(xmlString);

			if (xmlMap.get("return_status").contains("2")) {

				return returnString(xmlMap);
			}
			// 校验
			checkData(xmlMap);
			if (xmlMap.get("return_status").contains("2")) {
				return returnString(xmlMap);
			}
			// 导入
			addComplaintDAO.insertData(xmlMap);
		} catch (Exception e) {
			xmlMap.remove("return_status");
			xmlMap.remove("info");
			xmlMap.put("return_status", "2");
			xmlMap.put("info", "数据有异常");

		}

		return returnString(xmlMap);
	}

	/**
	 * 拼接 返回 xml
	 * 
	 * @return
	 */

	public String  returnString(HashMap<String,String> xmlMap){
		Log.info("返回申告系统 XML:"+ "<xml><result>" +xmlMap.get("return_status")+"</result><info>"+xmlMap.get("info")+"</reuslt></xml>");
		return "<xml><result>" +xmlMap.get("return_status")+"</result><info>"+xmlMap.get("info")+"</info></xml>";
		

	}

	/**
	 * 校验数据是否正确,完整
	 * 
	 * @return
	 */
	public void checkData(HashMap<String, String> xmlMap) {

		// 状态 默认为1
		String status = "1";
		// 校验信息
		String info = "";
		// xml 应该传过来的字段
		String dataListString = "GENERATION_TYPE,SVC_ID,SVC_CITY_NAME,SVC_COUNTY_NAME,SVC_MOBILE,SVC_CUSTOMER,SVC_CONTACTER,SVC_CONTACT_PHONE,SVC_BUG_ADDRESS,SVC_CUSTOMER_TYPE,SVC_MEMBER_ATT,SVC_COMPLAINT_STATE,SVC_CRM_SYSNAME,SVC_COMPLAINT_CATEGORY,SVC_CONTROL_TYPE,SVC_PHENOMENA_TYPE,SVC_PHENOMENA_SUBTYPE,SVC_DETAILED_DESCRIPTION,SVC_PRO_INFORMATION,SVC_EMERGENCY_LEVEL,SVC_ACCEPT_TIME,SVC_EXPECT_CLOSED_TIME,SVC_IS_REVISIT,SVC_REVISIT_TIME,SVC_CUSTOMER_FEEDBACK,SVC_CUSTOMER_SATISFACTION,SVC_CLOSED_TIME,SVC_CLOSER,SVC_CLOSED_DESCRIPTION";
		for (String dataName : dataListString.split(",")) {
			if (xmlMap.get(dataName) == null) {
				status = "2";
				info = info + dataName + "字段缺失;";
			} else {
				if ("GENERATION_TYPE".equals(dataName)) {
					if (xmlMap.get(dataName).toString().length() < 1) {
						status = "2";
						info = info + "GENERATION_TYPE 字段值为空;";
					} else {
						if (!isInt(xmlMap.get(dataName).toString())) {
							status = "2";
							info = info + "GENERATION_TYPE 字段不为 int型;";
						}
					}
				}

				// 判断是否为时间格式

				if ("SVC_CLOSED_TIME".equals(dataName)) {
					if (xmlMap.get(dataName).toString().length() > 0) {
						if (!isDate(xmlMap.get(dataName).toString())) {
							status = "2";
							info = info + "SVC_CLOSED_TIME 字段值应为日期格式;";
						}

					}
				}

				if ("SVC_ACCEPT_TIME".equals(dataName)) {
					if (xmlMap.get(dataName).toString().length() > 0) {
						if (!isDate(xmlMap.get(dataName).toString())) {
							status = "2";
							info = info + "SVC_ACCEPT_TIME 字段值应为日期格式;";
						}

					}
				}

				if ("SVC_REVISIT_TIME".equals(dataName)) {
					if (xmlMap.get(dataName).toString().length() > 0) {
						if (!isDate(xmlMap.get(dataName).toString())) {
							status = "2";
							info = info + "SVC_REVISIT_TIME 字段值应为日期格式;";
						}

					}
				}

				if ("SVC_EXPECT_CLOSED_TIME".equals(dataName)) {
					if (xmlMap.get(dataName).toString().length() > 0) {
						if (!isDate(xmlMap.get(dataName).toString())) {
							status = "2";
							info = info + "SVC_EXPECT_CLOSED_TIME 字段值应为日期格式;";
						}

					}
				}

			}

		}

		xmlMap.remove("return_status");
		xmlMap.remove("info");
		xmlMap.put("return_status", status);
		xmlMap.put("info", info);

	}

	/**
	 * 解析 xml数据
	 * 
	 * @param xmlString
	 * @return
	 */
	public HashMap<String, String> parser(String xmlString) {
		HashMap<String, String> resMap = new HashMap<String, String>();

		Document doc = null;
		if (null == xmlString || "".equals(xmlString.trim())) {
			// 1 代表成功 ，非1 代表失败
			resMap.put("return_status", "2");
			resMap.put("info", "xml为空");
			return resMap;
		}

		try {
			if (doc == null) {
				doc = DocumentHelper.parseText(xmlString);
			}
		} catch (DocumentException e) {
			LOG.error("通过web service 获取的xml 数据不是规范的xml，解析失败！" + e.getLocalizedMessage());
			resMap.put("return_status", "2");
			resMap.put("info", "xml不是规范格式");
			return resMap;

		}

		Element root = doc.getRootElement();
		for (Iterator<?> it = root.elementIterator(); it.hasNext();) {
			Element element = (Element) it.next();
			System.out.println(element.getName());
			resMap.put(element.getName(), element.getTextTrim());

		}

		resMap.put("return_status", "1");
		resMap.put("info", "成功");
		return resMap;

	}

	/**
	 * 判断 字符串是否为日期型
	 * 
	 * @param dataString
	 * @return
	 */
	public boolean isDate(String dataString) {
		boolean returnValue = false;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			// 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
			format.setLenient(false);
			format.parse(dataString);
			returnValue = true;
		} catch (ParseException e) {
			returnValue = false;
		} catch (Exception e) {
			returnValue = false;
		}

		return returnValue;
	}

	/**
	 * 判断 字符串是否为int型
	 * 
	 * @param dataString
	 * @return
	 */
	public boolean isInt(String dataString) {
		boolean returnValue = false;

		try {
			Integer.parseInt(dataString);
			returnValue = true;
		} catch (Exception e) {
			returnValue = false;
		}

		return returnValue;
	}

	public static void main(String[] arg){
		AddComplaintImpl noapsvcserviceimpl=new AddComplaintImpl();
		String xmlString="";
		xmlString="	<xml>	"+
		"	<GENERATION_TYPE>1</GENERATION_TYPE>"+
		"	<SVC_ID>申告流水号</SVC_ID>	"+
		"	<SVC_CITY_NAME>城市</SVC_CITY_NAME>	"+
		"	<SVC_COUNTY_NAME>行政区</SVC_COUNTY_NAME>	"+
		"	<SVC_MOBILE>申告手机号码</SVC_MOBILE>	"+
		"	<SVC_CUSTOMER>申告用户姓名</SVC_CUSTOMER>	"+
		"	<SVC_CONTACTER>联系人</SVC_CONTACTER>	"+
		"	<SVC_CONTACT_PHONE>联系电话</SVC_CONTACT_PHONE>	"+
		"	<SVC_BUG_ADDRESS>障碍地址</SVC_BUG_ADDRESS>	"+
		"	<SVC_CUSTOMER_TYPE>客户类型</SVC_CUSTOMER_TYPE>	"+
		"	<SVC_MEMBER_ATT>会员属性</SVC_MEMBER_ATT>	"+
		"	<SVC_COMPLAINT_STATE>申告单状态</SVC_COMPLAINT_STATE>	"+
		"	<SVC_CRM_SYSNAME>CRM系统产品名称</SVC_CRM_SYSNAME>	"+
		"	<SVC_COMPLAINT_CATEGORY>业务类别</SVC_COMPLAINT_CATEGORY>	"+
		"	<SVC_CONTROL_TYPE>客服管控分类</SVC_CONTROL_TYPE>	"+
		"	<SVC_PHENOMENA_TYPE>客服现象大类</SVC_PHENOMENA_TYPE>	"+
		"	<SVC_PHENOMENA_SUBTYPE>客服现象小类</SVC_PHENOMENA_SUBTYPE>	"+
		"	<SVC_DETAILED_DESCRIPTION>详细描述</SVC_DETAILED_DESCRIPTION>	"+
		"	<SVC_PRO_INFORMATION>预处理信息</SVC_PRO_INFORMATION>	"+
		"	<SVC_EMERGENCY_LEVEL>紧急程度</SVC_EMERGENCY_LEVEL>	"+
		"	<SVC_ACCEPT_TIME>2014-01-01 04:01:01</SVC_ACCEPT_TIME>	"+
		"	<SVC_EXPECT_CLOSED_TIME>2014-01-01 03:01:01</SVC_EXPECT_CLOSED_TIME>	"+
		"	<SVC_IS_REVISIT>是否回访</SVC_IS_REVISIT>	"+
		"	<SVC_REVISIT_TIME>2014-01-01 02:01:01</SVC_REVISIT_TIME>	"+
		"	<SVC_CUSTOMER_FEEDBACK>用户反馈</SVC_CUSTOMER_FEEDBACK>	"+
		"	<SVC_CUSTOMER_SATISFACTION>客户满意度</SVC_CUSTOMER_SATISFACTION>	"+
		"	<SVC_CLOSED_TIME>2014-01-01 01:01:01</SVC_CLOSED_TIME>	"+
		"	<SVC_CLOSER>结案人</SVC_CLOSER>	"+
		"	<SVC_CLOSED_DESCRIPTION>结案描述</SVC_CLOSED_DESCRIPTION>	"+
		"	</xml>	";
		
		//xmlString="<xml><a>hello</a><b>hello23</b></xml>";
		String xml =noapsvcserviceimpl.getComplaint(xmlString);
		System.out.println(xml);
		//noapsvcserviceimpl.hello();

	}

}
