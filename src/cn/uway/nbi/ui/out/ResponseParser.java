package cn.uway.nbi.ui.out;

import java.util.Date;
import java.util.List;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dao.nos.LogNossReportInsert;
import cn.uway.nbi.db.dao.nos.NosLog;
import cn.uway.nbi.util.PropertiesXML;

/**
 * 解析总部返回过来的消息
 * 
 * @author liuwx
 */
public class ResponseParser {

	private static final Logger LOG = LoggerFactory.getLogger(ResponseParser.class);

	private String xml;

	public static String REQUES_TTYPE = "REQUEST_TYPE";

	public static String RESPONSE_Type = "RESPONSE_Type";

	public void commonParer() {
	}

	public ResponseParser(String xml) {
		this.xml = xml;

	}

	/**
	 * @param domaintype
	 *            网络类型
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public boolean parser(String domaintype, String requestType) throws Exception {
		boolean resultFlag = true;
		try {

			String strTmp = "";
			if (REQUES_TTYPE.equalsIgnoreCase(requestType)) {
				strTmp = "rnop_service_input_para";
			} else
				strTmp = "rnop_service_output_para";

			PropertiesXML pxml = new PropertiesXML(xml, 0);
			String service_id = pxml.getProperty(strTmp + "/service_instance/service_id");
			String version = pxml.getProperty(strTmp + "/service_instance/version");
			String service_name = pxml.getProperty(strTmp + "/service_instance/service_name");
			String service_desc = pxml.getProperty(strTmp + "/service_instance/service_desc");

			LogNossReportInsert logInfo = new LogNossReportInsert();
			logInfo.service_id = service_id;
			logInfo.version = version;
			logInfo.service_name = service_name;
			logInfo.service_desc = service_desc;

			Element service_content = pxml.getElementsByXpathSingleNode(strTmp + "/service_instance/service_content");

			List<Element> el = service_content.elements();

			// 目前内容节点有且只有一个节点
			if (el != null && el.size() > 0) {
				Element e = el.get(0);
				String tagName = e.getName();
				logInfo.insert_time = new Date();

				if (tagName.equalsIgnoreCase("resultGetFileReq")) {
					logInfo.type = "resultGetFileReq";
					logInfo.result = e.getTextTrim();
				} else if (tagName.equalsIgnoreCase("resultNotifyFileReport")) {
					logInfo.type = "resultNotifyFileReport";
					logInfo.result = e.getTextTrim();
				} else if (tagName.equalsIgnoreCase("DRS104service_content")) {
					Element subEle = (Element) e.selectSingleNode("resultNotifyFileReport");
					if (subEle != null) {
						logInfo.type = "resultNotifyFileReport";
						logInfo.result = e.getTextTrim();
					}
				} else if (tagName.equalsIgnoreCase("DRS105service_content")) {
					/*
					 * <DRS105service_content> <serCaller>陕西</serCaller> <domainType>GSM无线接入网</domainType>
					 * <abnormalRemark>由于文件准备过程中,出现XXX错误</abnormalRemark> <abnormalReason>详细说明错误的原因......</abnormalReason> </DRS105service_content>
					 */
					Element abnormalRemark = (Element) e.selectSingleNode("abnormalRemark");
					Element abnormalReason = (Element) e.selectSingleNode("abnormalReason");

					StringBuilder sb = new StringBuilder();
					logInfo.type = "DRS105";
					if (abnormalRemark != null) {

						sb.append(abnormalRemark.getTextTrim());
						logInfo.result = "abnormalRemark: " + abnormalRemark.getTextTrim();
					}
					if (abnormalReason != null) {
						sb.append(" abnormalRemark: " + abnormalReason.getTextTrim());
					}
					logInfo.result = sb.toString();
				} else

				if (tagName.equalsIgnoreCase("resultnotify")) {
					logInfo.type = "resultnotify";
					logInfo.result = e.getTextTrim();
				}
				NosLog.insertLog(domaintype, logInfo);
			}
		} catch (Exception e) {
			resultFlag = false;
			LOG.error("解析总部返回结果信息，解析出现异常，内容={},原因={}", xml, e);
		}
		return resultFlag;
	}
}
