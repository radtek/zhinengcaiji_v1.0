package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ResponseItem complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ResponseItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="REQUEST_ID" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="PRI_KEY" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ResponseItem", propOrder = {"requestid", "prikey"})
public class ResponseItem {

	@XmlElement(name = "REQUEST_ID", required = true, nillable = true)
	protected String requestid;

	@XmlElement(name = "PRI_KEY", required = true, nillable = true)
	protected String prikey;

	/**
	 * Gets the value of the requestid property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getREQUESTID() {
		return requestid;
	}

	/**
	 * Sets the value of the requestid property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setREQUESTID(String value) {
		this.requestid = value;
	}

	/**
	 * Gets the value of the prikey property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getPRIKEY() {
		return prikey;
	}

	/**
	 * Sets the value of the prikey property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setPRIKEY(String value) {
		this.prikey = value;
	}

}
