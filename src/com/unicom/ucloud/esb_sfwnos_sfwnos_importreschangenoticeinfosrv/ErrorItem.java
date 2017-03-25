package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ErrorItem complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ErrorItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ENTITY_NAME" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="PRI_KEY" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="ERROR_MESSAGE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ErrorItem", propOrder = {"entityname", "prikey", "errormessage"})
public class ErrorItem {

	@XmlElement(name = "ENTITY_NAME", required = true, nillable = true)
	protected String entityname;

	@XmlElement(name = "PRI_KEY", required = true, nillable = true)
	protected String prikey;

	@XmlElement(name = "ERROR_MESSAGE", required = true, nillable = true)
	protected String errormessage;

	/**
	 * Gets the value of the entityname property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getENTITYNAME() {
		return entityname;
	}

	/**
	 * Sets the value of the entityname property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setENTITYNAME(String value) {
		this.entityname = value;
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

	/**
	 * Gets the value of the errormessage property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getERRORMESSAGE() {
		return errormessage;
	}

	/**
	 * Sets the value of the errormessage property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setERRORMESSAGE(String value) {
		this.errormessage = value;
	}

}
