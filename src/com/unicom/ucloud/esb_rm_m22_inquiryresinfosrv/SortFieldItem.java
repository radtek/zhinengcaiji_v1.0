package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sort_Field_Item complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Sort_Field_Item">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Sort_Field_name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Sort_mod" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sort_Field_Item", propOrder = {"sortFieldName", "sortMod"})
public class SortFieldItem {

	@XmlElement(name = "Sort_Field_name", required = true, nillable = true)
	protected String sortFieldName;

	@XmlElement(name = "Sort_mod", required = true, nillable = true)
	protected String sortMod;

	/**
	 * Gets the value of the sortFieldName property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getSortFieldName() {
		return sortFieldName;
	}

	/**
	 * Sets the value of the sortFieldName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setSortFieldName(String value) {
		this.sortFieldName = value;
	}

	/**
	 * Gets the value of the sortMod property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getSortMod() {
		return sortMod;
	}

	/**
	 * Sets the value of the sortMod property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setSortMod(String value) {
		this.sortMod = value;
	}

}
