package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Output_Field_Item complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Output_Field_Item">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Output_Field_name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Output_Field_Item", propOrder = {"outputFieldName"})
public class OutputFieldItem {

	@XmlElement(name = "Output_Field_name", required = true, nillable = true)
	protected String outputFieldName;

	/**
	 * Gets the value of the outputFieldName property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getOutputFieldName() {
		return outputFieldName;
	}

	/**
	 * Sets the value of the outputFieldName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setOutputFieldName(String value) {
		this.outputFieldName = value;
	}

}
