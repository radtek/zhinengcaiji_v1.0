package cn.uway.nbi.ui.consume;

import java.net.MalformedURLException;
import java.net.URL;

import org.codehaus.xfire.client.Client;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.ui.config.ConfigProperties;

/**
 * 上报请求服务类
 * 
 * @author liuwx
 */
public class ReportRequestService {

	private static final Logger LOG = LoggerFactory.getLogger(ReportRequestService.class);

	@SuppressWarnings("static-access")
	static String gUrl = ConfigProperties.getInstance().getProps().getProperty("report_url_g");

	@SuppressWarnings("static-access")
	static String wUrl = ConfigProperties.getInstance().getProps().getProperty("report_url_w");

	public static String gflag = "GSM";

	public static String wflag = "WCDMA";

	private static String startReportData = "startReportData";

	private static String endReportData = "endReportData";

	public void processRequest(String type) {
		String url = gUrl;
		if (wflag.equalsIgnoreCase(type))
			url = wUrl;
		url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("GetNbiSQL", new String[]{"NBI_PERF_MSC_1X"});
			System.out.println(results[0]);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param type
	 *            网络类型 gsm ,wcdma
	 * @param paraXml
	 *            开始调用集团上报接口，输入参数为xml文档
	 * @return 集团接口服务返回过来的结果(xml)
	 */
	public String startReportData(String type, String paraXml) {
		String result = "";
		String url = gUrl;
		if (wflag.equalsIgnoreCase(type))
			url = wUrl;
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke(startReportData, new String[]{paraXml});
			result = (String) results[0];
		} catch (Exception e) {
			LOG.error("网络类型={" + type + "},调用集团开始上报请求服务接口失败，请求参数={},原因={}", paraXml, e);
		}
		return result;

	}

	/**
	 * @param type
	 *            网络类型 gsm ,wcdma
	 * @param paraXml
	 *            开始调用集团上报结束接口，输入参数为xml文档
	 * @return 集团接口服务返回过来的结果(xml)
	 */
	public String endReportData(String type, String paraXml) {
		String result = "";
		String url = gUrl;
		if (wflag.equalsIgnoreCase(type))
			url = wUrl;
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke(endReportData, new String[]{paraXml});
			System.out.println(results[0]);
		} catch (Exception e) {
			LOG.error("网络类型={" + type + "},调用集团结束上报请求服务接口失败，请求参数={},原因={}", paraXml, e);
		}
		return result;
	}

	public static void main(String[] args) {
		ReportRequestService request = new ReportRequestService();
		request.processRequest(gflag);
	}

}
