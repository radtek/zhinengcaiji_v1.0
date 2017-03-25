package com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java element interface generated in the
 * com.unicom.ucloud.esbsfwnossfwnosinquiryresinfosrv package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the Java representation for XML content. The Java representation of XML
 * content can consist of schema derived interfaces and classes representing the binding of schema type definitions, element declarations and model
 * groups. Factory methods for each of these are provided in this class.
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _ESBSFWNOSSFWNOSInquiryResInfoSrvResponse_QNAME = new QName(
			"http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv", "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvResponse");

	private final static QName _ESBSFWNOSSFWNOSInquiryResInfoSrvRequest_QNAME = new QName(
			"http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv", "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvRequest");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package:
	 * com.unicom.ucloud.esbsfwnossfwnosinquiryresinfosrv
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection }
	 */
	public ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection createESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection() {
		return new ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection();
	}

	/**
	 * Create an instance of {@link SortFieldCollection }
	 */
	public SortFieldCollection createSortFieldCollection() {
		return new SortFieldCollection();
	}

	/**
	 * Create an instance of {@link OutputFieldItem }
	 */
	public OutputFieldItem createOutputFieldItem() {
		return new OutputFieldItem();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSInquiryResInfoSrvResponse }
	 */
	public ESBSFWNOSSFWNOSInquiryResInfoSrvResponse createESBSFWNOSSFWNOSInquiryResInfoSrvResponse() {
		return new ESBSFWNOSSFWNOSInquiryResInfoSrvResponse();
	}

	/**
	 * Create an instance of {@link QueryConditionCollection }
	 */
	public QueryConditionCollection createQueryConditionCollection() {
		return new QueryConditionCollection();
	}

	/**
	 * Create an instance of {@link QueryConditionItem }
	 */
	public QueryConditionItem createQueryConditionItem() {
		return new QueryConditionItem();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem }
	 */
	public ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem createESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem() {
		return new ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSInquiryResInfoSrvRequest }
	 */
	public ESBSFWNOSSFWNOSInquiryResInfoSrvRequest createESBSFWNOSSFWNOSInquiryResInfoSrvRequest() {
		return new ESBSFWNOSSFWNOSInquiryResInfoSrvRequest();
	}

	/**
	 * Create an instance of {@link MsgHeader }
	 */
	public MsgHeader createMsgHeader() {
		return new MsgHeader();
	}

	/**
	 * Create an instance of {@link SortFieldItem }
	 */
	public SortFieldItem createSortFieldItem() {
		return new SortFieldItem();
	}

	/**
	 * Create an instance of {@link OutputFieldCollection }
	 */
	public OutputFieldCollection createOutputFieldCollection() {
		return new OutputFieldCollection();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBSFWNOSSFWNOSInquiryResInfoSrvResponse }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv", name = "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvResponse")
	public JAXBElement<ESBSFWNOSSFWNOSInquiryResInfoSrvResponse> createESBSFWNOSSFWNOSInquiryResInfoSrvResponse(
			ESBSFWNOSSFWNOSInquiryResInfoSrvResponse value) {
		return new JAXBElement<ESBSFWNOSSFWNOSInquiryResInfoSrvResponse>(_ESBSFWNOSSFWNOSInquiryResInfoSrvResponse_QNAME,
				ESBSFWNOSSFWNOSInquiryResInfoSrvResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBSFWNOSSFWNOSInquiryResInfoSrvRequest }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv", name = "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvRequest")
	public JAXBElement<ESBSFWNOSSFWNOSInquiryResInfoSrvRequest> createESBSFWNOSSFWNOSInquiryResInfoSrvRequest(
			ESBSFWNOSSFWNOSInquiryResInfoSrvRequest value) {
		return new JAXBElement<ESBSFWNOSSFWNOSInquiryResInfoSrvRequest>(_ESBSFWNOSSFWNOSInquiryResInfoSrvRequest_QNAME,
				ESBSFWNOSSFWNOSInquiryResInfoSrvRequest.class, null, value);
	}

}
