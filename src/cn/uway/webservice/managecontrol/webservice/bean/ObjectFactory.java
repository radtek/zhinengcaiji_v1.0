package cn.uway.webservice.managecontrol.webservice.bean;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java element interface generated in the org.tempuri package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the Java representation for XML content. The Java representation of XML
 * content can consist of schema derived interfaces and classes representing the binding of schema type definitions, element declarations and model
 * groups. Factory methods for each of these are provided in this class.
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _IndoorWorkOrderSendDetails_QNAME = new QName("http://tempuri.org/", "Details");

	private final static QName _IndoorWorkOrderSendBTSname_QNAME = new QName("http://tempuri.org/", "BTSname");

	private final static QName _TianYueCallBackFTPpath_QNAME = new QName("http://tempuri.org/", "FTPpath");

	private final static QName _WNMSCallBackNodeState_QNAME = new QName("http://tempuri.org/", "NodeState");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: org.tempuri
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link TianYueCallBack }
	 */
	public TianYueCallBack createTianYueCallBack() {
		return new TianYueCallBack();
	}

	/**
	 * Create an instance of {@link IndoorWorkOrderSend }
	 */
	public IndoorWorkOrderSend createIndoorWorkOrderSend() {
		return new IndoorWorkOrderSend();
	}

	/**
	 * Create an instance of {@link IndoorWorkOrderSendResponse }
	 */
	public IndoorWorkOrderSendResponse createIndoorWorkOrderSendResponse() {
		return new IndoorWorkOrderSendResponse();
	}

	/**
	 * Create an instance of {@link WNMSCallBack }
	 */
	public WNMSCallBack createWNMSCallBack() {
		return new WNMSCallBack();
	}

	/**
	 * Create an instance of {@link PropertyCallBack }
	 */
	public PropertyCallBack createPropertyCallBack() {
		return new PropertyCallBack();
	}

	/**
	 * Create an instance of {@link WNMSCallBackResponse }
	 */
	public WNMSCallBackResponse createWNMSCallBackResponse() {
		return new WNMSCallBackResponse();
	}

	/**
	 * Create an instance of {@link TianYueCallBackResponse }
	 */
	public TianYueCallBackResponse createTianYueCallBackResponse() {
		return new TianYueCallBackResponse();
	}

	/**
	 * Create an instance of {@link CombaCallBack }
	 */
	public CombaCallBack createCombaCallBack() {
		return new CombaCallBack();
	}

	/**
	 * Create an instance of {@link EMOSCallBackResponse }
	 */
	public EMOSCallBackResponse createEMOSCallBackResponse() {
		return new EMOSCallBackResponse();
	}

	/**
	 * Create an instance of {@link WNMSWorkOrderSend }
	 */
	public WNMSWorkOrderSend createWNMSWorkOrderSend() {
		return new WNMSWorkOrderSend();
	}

	/**
	 * Create an instance of {@link TianYueUpdate }
	 */
	public TianYueUpdate createTianYueUpdate() {
		return new TianYueUpdate();
	}

	/**
	 * Create an instance of {@link WNMSChangeAsyncbackResponse }
	 */
	public WNMSChangeAsyncbackResponse createWNMSChangeAsyncbackResponse() {
		return new WNMSChangeAsyncbackResponse();
	}

	/**
	 * Create an instance of {@link EMOSCallBack }
	 */
	public EMOSCallBack createEMOSCallBack() {
		return new EMOSCallBack();
	}

	/**
	 * Create an instance of {@link CombaUpdate }
	 */
	public CombaUpdate createCombaUpdate() {
		return new CombaUpdate();
	}

	/**
	 * Create an instance of {@link WNMSWorkOrderSendResponse }
	 */
	public WNMSWorkOrderSendResponse createWNMSWorkOrderSendResponse() {
		return new WNMSWorkOrderSendResponse();
	}

	/**
	 * Create an instance of {@link PropertyUpdate }
	 */
	public PropertyUpdate createPropertyUpdate() {
		return new PropertyUpdate();
	}

	/**
	 * Create an instance of {@link CombaCallBackResponse }
	 */
	public CombaCallBackResponse createCombaCallBackResponse() {
		return new CombaCallBackResponse();
	}

	/**
	 * Create an instance of {@link WNMSChangeAsyncback }
	 */
	public WNMSChangeAsyncback createWNMSChangeAsyncback() {
		return new WNMSChangeAsyncback();
	}

	/**
	 * Create an instance of {@link CombaUpdateResponse }
	 */
	public CombaUpdateResponse createCombaUpdateResponse() {
		return new CombaUpdateResponse();
	}

	/**
	 * Create an instance of {@link PropertyCallBackResponse }
	 */
	public PropertyCallBackResponse createPropertyCallBackResponse() {
		return new PropertyCallBackResponse();
	}

	/**
	 * Create an instance of {@link PropertyUpdateResponse }
	 */
	public PropertyUpdateResponse createPropertyUpdateResponse() {
		return new PropertyUpdateResponse();
	}

	/**
	 * Create an instance of {@link CombaAlarmAsyncback }
	 */
	public CombaAlarmAsyncback createCombaAlarmAsyncback() {
		return new CombaAlarmAsyncback();
	}

	/**
	 * Create an instance of {@link CombaAlarmAsyncbackResponse }
	 */
	public CombaAlarmAsyncbackResponse createCombaAlarmAsyncbackResponse() {
		return new CombaAlarmAsyncbackResponse();
	}

	/**
	 * Create an instance of {@link TianYueUpdateResponse }
	 */
	public TianYueUpdateResponse createTianYueUpdateResponse() {
		return new TianYueUpdateResponse();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "Details", scope = IndoorWorkOrderSend.class)
	public JAXBElement<String> createIndoorWorkOrderSendDetails(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendDetails_QNAME, String.class, IndoorWorkOrderSend.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = IndoorWorkOrderSend.class)
	public JAXBElement<String> createIndoorWorkOrderSendBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, IndoorWorkOrderSend.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = TianYueCallBack.class)
	public JAXBElement<String> createTianYueCallBackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, TianYueCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = TianYueCallBack.class)
	public JAXBElement<String> createTianYueCallBackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, TianYueCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = PropertyCallBack.class)
	public JAXBElement<String> createPropertyCallBackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, PropertyCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = PropertyCallBack.class)
	public JAXBElement<String> createPropertyCallBackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, PropertyCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = WNMSCallBack.class)
	public JAXBElement<String> createWNMSCallBackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, WNMSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "NodeState", scope = WNMSCallBack.class)
	public JAXBElement<String> createWNMSCallBackNodeState(String value) {
		return new JAXBElement<String>(_WNMSCallBackNodeState_QNAME, String.class, WNMSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = WNMSCallBack.class)
	public JAXBElement<String> createWNMSCallBackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, WNMSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "Details", scope = WNMSWorkOrderSend.class)
	public JAXBElement<String> createWNMSWorkOrderSendDetails(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendDetails_QNAME, String.class, WNMSWorkOrderSend.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = WNMSWorkOrderSend.class)
	public JAXBElement<String> createWNMSWorkOrderSendBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, WNMSWorkOrderSend.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = CombaCallBack.class)
	public JAXBElement<String> createCombaCallBackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, CombaCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = CombaCallBack.class)
	public JAXBElement<String> createCombaCallBackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, CombaCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = TianYueUpdate.class)
	public JAXBElement<String> createTianYueUpdateFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, TianYueUpdate.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = EMOSCallBack.class)
	public JAXBElement<String> createEMOSCallBackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, EMOSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "NodeState", scope = EMOSCallBack.class)
	public JAXBElement<String> createEMOSCallBackNodeState(String value) {
		return new JAXBElement<String>(_WNMSCallBackNodeState_QNAME, String.class, EMOSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = EMOSCallBack.class)
	public JAXBElement<String> createEMOSCallBackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, EMOSCallBack.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = PropertyUpdate.class)
	public JAXBElement<String> createPropertyUpdateFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, PropertyUpdate.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = CombaUpdate.class)
	public JAXBElement<String> createCombaUpdateFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, CombaUpdate.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = WNMSChangeAsyncback.class)
	public JAXBElement<String> createWNMSChangeAsyncbackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, WNMSChangeAsyncback.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "NodeState", scope = WNMSChangeAsyncback.class)
	public JAXBElement<String> createWNMSChangeAsyncbackNodeState(String value) {
		return new JAXBElement<String>(_WNMSCallBackNodeState_QNAME, String.class, WNMSChangeAsyncback.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = WNMSChangeAsyncback.class)
	public JAXBElement<String> createWNMSChangeAsyncbackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, WNMSChangeAsyncback.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "FTPpath", scope = CombaAlarmAsyncback.class)
	public JAXBElement<String> createCombaAlarmAsyncbackFTPpath(String value) {
		return new JAXBElement<String>(_TianYueCallBackFTPpath_QNAME, String.class, CombaAlarmAsyncback.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "NodeState", scope = CombaAlarmAsyncback.class)
	public JAXBElement<String> createCombaAlarmAsyncbackNodeState(String value) {
		return new JAXBElement<String>(_WNMSCallBackNodeState_QNAME, String.class, CombaAlarmAsyncback.class, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}
	 */
	@XmlElementDecl(namespace = "http://tempuri.org/", name = "BTSname", scope = CombaAlarmAsyncback.class)
	public JAXBElement<String> createCombaAlarmAsyncbackBTSname(String value) {
		return new JAXBElement<String>(_IndoorWorkOrderSendBTSname_QNAME, String.class, CombaAlarmAsyncback.class, value);
	}

}
