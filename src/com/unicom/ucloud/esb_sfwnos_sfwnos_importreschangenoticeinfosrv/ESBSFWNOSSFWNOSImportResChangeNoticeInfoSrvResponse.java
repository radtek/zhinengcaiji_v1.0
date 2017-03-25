package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvResponse complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="SERVICE_FLAG" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Instance_id" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="SERVICE_MESSAGE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="ErrorCollection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv}ErrorCollection" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="ResponseCollection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv}ResponseCollection" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvResponse", propOrder = {"serviceflag", "instanceId", "servicemessage",
		"errorCollection", "responseCollection"})
public class ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse {

	@XmlElement(name = "SERVICE_FLAG", required = true, nillable = true)
	protected String serviceflag;

	@XmlElement(name = "Instance_id", required = true, nillable = true)
	protected BigDecimal instanceId;

	@XmlElement(name = "SERVICE_MESSAGE", required = true, nillable = true)
	protected String servicemessage;

	@XmlElement(name = "ErrorCollection", nillable = true)
	protected List<ErrorCollection> errorCollection;

	@XmlElement(name = "ResponseCollection", nillable = true)
	protected List<ResponseCollection> responseCollection;

	/**
	 * Gets the value of the serviceflag property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getSERVICEFLAG() {
		return serviceflag;
	}

	/**
	 * Sets the value of the serviceflag property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setSERVICEFLAG(String value) {
		this.serviceflag = value;
	}

	/**
	 * Gets the value of the instanceId property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getInstanceId() {
		return instanceId;
	}

	/**
	 * Sets the value of the instanceId property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setInstanceId(BigDecimal value) {
		this.instanceId = value;
	}

	/**
	 * Gets the value of the servicemessage property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getSERVICEMESSAGE() {
		return servicemessage;
	}

	/**
	 * Sets the value of the servicemessage property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setSERVICEMESSAGE(String value) {
		this.servicemessage = value;
	}

	/**
	 * Gets the value of the errorCollection property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the errorCollection property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getErrorCollection().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link ErrorCollection }
	 */
	public List<ErrorCollection> getErrorCollection() {
		if (errorCollection == null) {
			errorCollection = new ArrayList<ErrorCollection>();
		}
		return this.errorCollection;
	}

	/**
	 * Gets the value of the responseCollection property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the responseCollection property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getResponseCollection().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link ResponseCollection }
	 */
	public List<ResponseCollection> getResponseCollection() {
		if (responseCollection == null) {
			responseCollection = new ArrayList<ResponseCollection>();
		}
		return this.responseCollection;
	}

}
