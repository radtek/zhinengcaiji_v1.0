package cn.uway.nbi.ui;

import java.util.List;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.NossUploadReportTaskDao;
import cn.uway.nbi.ui.out.ReportRequest;
import cn.uway.nbi.util.PropertiesXML;

/**
 * 解析总部下发过来的请求命令
 */
public class ServiceContentParser {

	private static final Logger LOG = LoggerFactory.getLogger(ServiceContentParser.class);

	private String xml;

	public ServiceContentParser(String xml) {
		this.xml = xml;

	}

	/**
	 * 解析节点
	 * 
	 * @param doc
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String parser() throws Exception {
		Service_common common = null;
		try {
			PropertiesXML pxml = new PropertiesXML(xml, 1);
			String service_id = pxml.getProperty("rnop_service_input_para/service_instance/service_id");
			String version = pxml.getProperty("rnop_service_input_para/service_instance/version");
			String service_name = pxml.getProperty("rnop_service_input_para/service_instance/service_name");
			String service_desc = pxml.getProperty("rnop_service_input_para/service_instance/service_desc");

			common = new Service_common();
			common.service_id = service_id;
			common.version = version;
			common.service_desc = service_desc;
			common.service_name = service_name;

			LOG.info("集团下发请求" + xml);

			Element service_content = pxml.getElementsByXpathSingleNode("rnop_service_input_para/service_instance/service_content");
			List<Element> el = service_content.elements();

			// 目前内容节点有且只有一个节点
			if (el != null && el.size() > 0) {
				Element e = el.get(0);
				String tagName = e.getName();
				// 文件获取请求 <service_id>DRS102</service_id>
				/*
				 * <serCaller>总部</serCaller> <requestid>ZOB_GSM_GR_CONF_201000001</requestid> <domainType>GSM无线接入网</domainType>
				 * <fileType>GSM无线基础数据</fileType> <begintime>2010-07-17-6:00:00</begintime> <endtime>2010-07-18-6:00:00</endtime> <filter>
				 * <objectLevel>BSC</objectLevel> <objectList> <objectID/> </objectList> </filter>
				 */
				if (service_name.equalsIgnoreCase(tagName)) {
					String serCaller = e.elementText("serCaller");
					String requestid = e.elementText("requestid");

					String domainType = e.elementText("domainType");

					String fileType = e.elementText("fileType");
					String begintime = e.elementText("begintime");
					String endtime = e.elementText("endtime");
					String objectLevel = e.selectSingleNode("filter/objectLevel").getText();
					List<Element> objectIDList = (List<Element>) e.selectNodes("filter/objectList/objectID");

					StringBuilder sb = new StringBuilder();
					if (objectIDList != null && objectIDList.size() > 0) {
						for (Element ee : objectIDList) {
							String val = ee.getTextTrim();
							if (StringUtil.isNotNull(val)) {
								sb.append(val).append(";");
							}
						}
					}

					if (ConstDef.DRS102.equalsIgnoreCase(service_id)) {
						NossUploadReportTaskDao dao = new NossUploadReportTaskDao();
						DRS102service_content object = new DRS102service_content();
						object.service_id = service_id;

						object.begintime = begintime;
						object.endtime = endtime;
						object.domainType = domainType;
						object.objectlevel = objectLevel;
						object.fileType = fileType;
						object.objectlist = sb.toString();
						object.requestid = requestid;
						object.serCaller = serCaller;
						object.service_name = service_name;
						object.service_desc = service_desc;
						object.version = version;
						dao.addRequestTask(object);
						return ReportRequest.getDRS102out(common, true);
					}
				}
			}
		} catch (Exception e) {
			LOG.error("集团向省请求获取文件失败，解析出现异常,原因={}", e);
		}
		return ReportRequest.getDRS102out(common, false);
	}

	public static void main(String[] args) {
		String xml = "<rnop_service_input_para>	<service_instance>		<service_id>DRS102</service_id>		<version>R1</version>		<service_name>文件获取请求</service_name>		<service_desc>总部系统向省级系统要求上报数据文件,例如补报或文件查询等</service_desc>		<service_content>			<DRS102service_content>				<serCaller>总部</serCaller>				<requestid>ZOB_ GSM_GR_CONF_201000001</requestid>				<domainType>GSM无线接入网</domainType>				<fileType>GSM无线基础数据</fileType>				<begintime>2010/07/17/ 6:00:00</begintime>				<endtime>2010/07/18 6:00:00</endtime>				<filter>					<objectLevel>BSC</objectLevel>					<objectList>						<objectID/>					</objectList>				</filter>			</DRS102service_content>		</service_content>	</service_instance></rnop_service_input_para>";

		ServiceContentParser p = new ServiceContentParser(xml);
		try {
			p.parser();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
