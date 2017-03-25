package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java element interface generated in the
 * com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the Java representation for XML content. The Java representation of XML
 * content can consist of schema derived interfaces and classes representing the binding of schema type definitions, element declarations and model
 * groups. Factory methods for each of these are provided in this class.
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest_QNAME = new QName(
			"http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv", "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvRequest");

	private final static QName _ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse_QNAME = new QName(
			"http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv", "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvResponse");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package:
	 * com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection }
	 */
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection() {
		return new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection();
	}

	/**
	 * Create an instance of {@link ResponseCollection }
	 */
	public ResponseCollection createResponseCollection() {
		return new ResponseCollection();
	}

	/**
	 * Create an instance of {@link ErrorItem }
	 */
	public ErrorItem createErrorItem() {
		return new ErrorItem();
	}

	/**
	 * Create an instance of {@link ErrorCollection }
	 */
	public ErrorCollection createErrorCollection() {
		return new ErrorCollection();
	}

	/**
	 * Create an instance of {@link MsgHeader }
	 */
	public MsgHeader createMsgHeader() {
		return new MsgHeader();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem }
	 */
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem() {
		return new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem();
	}

	/**
	 * Create an instance of {@link ResponseItem }
	 */
	public ResponseItem createResponseItem() {
		return new ResponseItem();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest }
	 */
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest() {
		return new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest();
	}

	/**
	 * Create an instance of {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse }
	 */
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse() {
		return new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv", name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvRequest")
	public JAXBElement<ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest> createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest(
			ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest value) {
		return new JAXBElement<ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest>(_ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest_QNAME,
				ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <} {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse }{@code >}
	 */
	@XmlElementDecl(namespace = "http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv", name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvResponse")
	public JAXBElement<ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse> createESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse(
			ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse value) {
		return new JAXBElement<ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse>(_ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse_QNAME,
				ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse.class, null, value);
	}

}
