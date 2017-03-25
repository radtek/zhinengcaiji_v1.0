package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvRequest complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvRequest">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="MsgHeader" type="{http://ucloud.unicom.com/MsgHeader}MsgHeader"/>
 *         &lt;element name="ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputCollection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv}ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputCollection"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvRequest", propOrder = {"msgHeader",
		"esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection"})
public class ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest {

	@XmlElement(name = "MsgHeader", required = true)
	protected MsgHeader msgHeader;

	@XmlElement(name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputCollection", required = true, nillable = true)
	protected ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection;

	/**
	 * Gets the value of the msgHeader property.
	 * 
	 * @return possible object is {@link MsgHeader }
	 */
	public MsgHeader getMsgHeader() {
		return msgHeader;
	}

	/**
	 * Sets the value of the msgHeader property.
	 * 
	 * @param value
	 *            allowed object is {@link MsgHeader }
	 */
	public void setMsgHeader(MsgHeader value) {
		this.msgHeader = value;
	}

	/**
	 * Gets the value of the esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection property.
	 * 
	 * @return possible object is {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection }
	 */
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection getESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection() {
		return esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection;
	}

	/**
	 * Sets the value of the esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection property.
	 * 
	 * @param value
	 *            allowed object is {@link ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection }
	 */
	public void setESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection(ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection value) {
		this.esbsfwnossfwnosImportResChangeNoticeInfoSrvInputCollection = value;
	}

}
