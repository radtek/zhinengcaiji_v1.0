package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java element interface generated in the
 * com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the Java representation for XML content. The Java representation of XML
 * content can consist of schema derived interfaces and classes representing the binding of schema type definitions, element declarations and model
 * groups. Factory methods for each of these are provided in this class.
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _ESBRMM22InquiryResInfoSrvRequest_QNAME = new QName("http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv",
			"ESB_RM_M22_InquiryResInfoSrvRequest");

	private final static QName _ESBRMM22InquiryResInfoSrvResponse_QNAME = new QName("http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv",
			"ESB_RM_M22_InquiryResInfoSrvResponse");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package:
	 * com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link OutputFieldCollection }
	 */
	public OutputFieldCollection createOutputFieldCollection() {
		return new OutputFieldCollection();
	}

	/**
	 * Create an instance of {@link QueryConditionItem }
	 */
	public QueryConditionItem createQueryConditionItem() {
		return new QueryConditionItem();
	}

	/**
	 * Create an instance of {@link OutputFieldItem }
	 */
	public OutputFieldItem createOutputFieldItem() {
		return new OutputFieldItem();
	}

	/**
	 * Create an instance of {@link MsgHeader }
	 */
	public MsgHeader createMsgHeader() {
		return new MsgHeader();
	}

	/**
	 * Create an instance of {@link QueryConditionCollection }
	 */
	public QueryConditionCollection createQueryConditionCollection() {
		return new QueryConditionCollection();
	}

	/**
	 * Create an instance of {@link ESBRMM22InquiryResInfoSrvOutputItem }
	 */
	public ESBRMM22InquiryResInfoSrvOutputItem createESBRMM22InquiryResInfoSrvOutputItem() {
		return new ESBRMM22InquiryResInfoSrvOutputItem();
	}

	/**
	 * Create an instance of {@link ESBRMM22InquiryResInfoSrvOutputCollection }
	 */
	public ESBRMM22InquiryResInfoSrvOutputCollection createESBRMM22InquiryResInfoSrvOutputCollection() {
		return new ESBRMM22InquiryResInfoSrvOutputCollection();
	}

	/**
	 * Create an instance of {@link ESBRMM22InquiryResInfoSrvResponse }
	 */
	public ESBRMM22InquiryResInfoSrvResponse createESBRMM22InquiryResInfoSrvResponse() {
		return new ESBRMM22InquiryResInfoSrvResponse();
	}

	/**
	 * Create an instance of {@link ESBRMM22InquiryResInfoSrvRequest }
	 */
	public ESBRMM22InquiryResInfoSrvRequest createESBRMM22InquiryResInfoSrvRequest() {
		return new ESBRMM22InquiryResInfoSrvRequest();
	}

	/**
	 * Create an instance of {@link SortFieldCollection }
	 */
	public SortFieldCollection createSortFieldCollection() {
		return new SortFieldCollection();
	}

	/**
	 * Create an instance of {@link SortFieldItem }
	 */
	public SortFieldItem createSortFieldItem() {
		return new SortFieldItem();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBRMM22InquiryResInfoSrvRequest }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv", name = "ESB_RM_M22_InquiryResInfoSrvRequest")
	public JAXBElement<ESBRMM22InquiryResInfoSrvRequest> createESBRMM22InquiryResInfoSrvRequest(ESBRMM22InquiryResInfoSrvRequest value) {
		return new JAXBElement<ESBRMM22InquiryResInfoSrvRequest>(_ESBRMM22InquiryResInfoSrvRequest_QNAME, ESBRMM22InquiryResInfoSrvRequest.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBRMM22InquiryResInfoSrvResponse }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv", name = "ESB_RM_M22_InquiryResInfoSrvResponse")
	public JAXBElement<ESBRMM22InquiryResInfoSrvResponse> createESBRMM22InquiryResInfoSrvResponse(ESBRMM22InquiryResInfoSrvResponse value) {
		return new JAXBElement<ESBRMM22InquiryResInfoSrvResponse>(_ESBRMM22InquiryResInfoSrvResponse_QNAME, ESBRMM22InquiryResInfoSrvResponse.class,
				null, value);
	}

}
