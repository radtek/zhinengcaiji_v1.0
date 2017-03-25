package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.unicom.ucloud.service.ServiceMgr;

public final class ESBRMM22InquiryResInfoSrv_Client_Client {

	private ESBRMM22InquiryResInfoSrv_Client_Client() {
	}

	public static void main(String args[]) throws Exception {

		JaxWsProxyFactoryBean bean = new JaxWsProxyFactoryBean();
		bean.getInInterceptors().add(new LoggingInInterceptor());
		bean.getInFaultInterceptors().add(new LoggingOutInterceptor());
		bean.setServiceClass(ESBRMM22InquiryResInfoSrv.class);

		ServiceMgr smgr = ServiceMgr.getInstance();
		String addressTmp = smgr.getWebserviceUrl("ESB_RM_M22_90001");
		String address = new String(addressTmp);
		address = address.replace("?wsdl", "").replace("?WSDL", "");

		bean.setAddress(address);
		ESBRMM22InquiryResInfoSrv bService = (ESBRMM22InquiryResInfoSrv) bean.create();

		ESBRMM22InquiryResInfoSrvRequest request = new ESBRMM22InquiryResInfoSrvRequest();

		MsgHeader header = null;
		header = new MsgHeader();
		/*
		 * header.setPAGESIZE(new BigDecimal(1)); header.setSOURCEAPPID("10"); header.setSOURCEAPPNAME("11"); header.setSOURCEMODID("12");
		 * header.setSOURCEMODNAME("13"); header.setTARGETMODID("SFWNOS_RM_CELL_REL"); header.setTARGETMODNAME("SFWNOS_RM_CELL_REL");
		 * header.setTOKEN("16"); header.setUSERID(new BigDecimal(1)); header.setUSERNAME("18");
		 * header.setSUBMITDATE(DateTest.convertToXMLGregorianCalendar(new Date())); header.setPAGESIZE(new BigDecimal(1)); header.setCURRENTPAGE(new
		 * BigDecimal(1)); header.setTOTALRECORD(new BigDecimal(107)); header.setPROVINCECODE("19"); header.setENVIRONMENTNAME("20");
		 */

		request.setMsgHeader(header);
		request.setEntityName("SFWNOS_RM_ANTENNA_SYSTEM");

		OutputFieldCollection output = new OutputFieldCollection();
		OutputFieldItem item = new OutputFieldItem();
		// item.setOutputFieldName("DEVICE_MODEL");
		item.setOutputFieldName("PHYSICAL_DEVICE_ID");
		output.getOutputFieldItem().add(item);

		QueryConditionCollection query = new QueryConditionCollection();
		QueryConditionItem item2 = new QueryConditionItem();
		// item2.setQueryFieldName("ANTENNA_HEIGHT");
		item2.setQueryFieldName("PHYSICAL_DEVICE_ID");
		item2.setOperation(" = ");
		item2.setQueryConditionVLAUE("0080307680007030");
		query.getQueryConditionItem().add(item2);
		SortFieldCollection sort = new SortFieldCollection();
		SortFieldItem sItem = new SortFieldItem();
		// sItem.setSortFieldName("PHYSICAL_DEVICE_ID");
		sItem.setSortFieldName("PHYSICAL_DEVICE_ID");
		sItem.setSortMod("ASC");
		sort.getSortFieldItem().add(sItem);

		request.setOutputFieldCollection(output);
		request.setQueryConditionCollection(query);
		request.setSortFieldCollection(sort);

		ESBRMM22InquiryResInfoSrvResponse response = bService.process(request);

		System.out.println("process.result=" + response.getSERVICEFLAG().toString());

		System.exit(0);
	}

	public static void main2(String[] args) {

	}

}
