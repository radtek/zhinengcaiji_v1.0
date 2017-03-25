/*
 * 
 */

package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

import com.unicom.ucloud.service.ServiceMgr;

/**
 * This class was generated by Apache CXF 2.2.7 Mon Apr 08 14:28:02 CST 2013 Generated source version: 2.2.7
 */

@WebServiceClient(name = "ESB_RM_M22_InquiryResInfoSrv",
// wsdlLocation =
// "file:/G:/code/workSpaceEclipse/workSpaceEclipse/nbi_1_ucloub/Web/WEB-INF/META-INF/esb_rm_m22_inquiryresinfosrv/ESB_RM_M22_InquiryResInfoSrv.WSDL",
targetNamespace = "http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv")
public class ESBRMM22InquiryResInfoSrv_Service extends Service {

	public final static URL WSDL_LOCATION;

	public final static QName SERVICE = new QName("http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv", "ESB_RM_M22_InquiryResInfoSrv");

	public final static QName ESBRMM22InquiryResInfoSrvPort = new QName("http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv",
			"ESB_RM_M22_InquiryResInfoSrvPort");
	static {
		URL url = null;
		try {
			// url = new
			// URL("http://localhost:8000/nbi/services/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv?wsdl");

			ServiceMgr smgr = ServiceMgr.getInstance();
			String address = smgr.getWebserviceUrl("ESB_RM_M22_90001");

			url = new URL(address);
		} catch (MalformedURLException e) {
			System.err
					.println("Can not initialize the default wsdl from file:/G:/code/workSpaceEclipse/workSpaceEclipse/nbi_1_ucloub/Web/WEB-INF/META-INF/esb_sfwnos_sfwnos_00005/ESB_SFTNMS_SFTNMS_ImportResChangeNoticeInfoSrv.WSDL");
			// e.printStackTrace();
		} catch (Exception e) {
			System.err.println("need to config wsdl  esb_sfwnos_sfwnos_00005  ESB_SFTNMS_SFTNMS_ImportResChangeNoticeInfoSrv.WSDL");
		}

		WSDL_LOCATION = url;
	}

	public ESBRMM22InquiryResInfoSrv_Service(URL wsdlLocation) {
		super(wsdlLocation, SERVICE);
	}

	public ESBRMM22InquiryResInfoSrv_Service(URL wsdlLocation, QName serviceName) {
		super(wsdlLocation, serviceName);
	}

	public ESBRMM22InquiryResInfoSrv_Service() {
		super(WSDL_LOCATION, SERVICE);
	}

	/**
	 * @return returns ESBRMM22InquiryResInfoSrv
	 */
	@WebEndpoint(name = "ESB_RM_M22_InquiryResInfoSrvPort")
	public ESBRMM22InquiryResInfoSrv getESBRMM22InquiryResInfoSrvPort() {
		return super.getPort(ESBRMM22InquiryResInfoSrvPort, ESBRMM22InquiryResInfoSrv.class);
	}

	/**
	 * @param features
	 *            A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy. Supported features not in the <code>features</code>
	 *            parameter will have their default values.
	 * @return returns ESBRMM22InquiryResInfoSrv
	 */
	@WebEndpoint(name = "ESB_RM_M22_InquiryResInfoSrvPort")
	public ESBRMM22InquiryResInfoSrv getESBRMM22InquiryResInfoSrvPort(WebServiceFeature... features) {
		return super.getPort(ESBRMM22InquiryResInfoSrvPort, ESBRMM22InquiryResInfoSrv.class, features);
	}

}