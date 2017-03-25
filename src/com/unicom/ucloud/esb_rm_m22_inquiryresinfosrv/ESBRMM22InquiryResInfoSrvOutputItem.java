package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import java.math.BigDecimal;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_RM_M22_InquiryResInfoSrvOutputItem complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_RM_M22_InquiryResInfoSrvOutputItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Record_num" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="Result" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_RM_M22_InquiryResInfoSrvOutputItem", propOrder = {"recordNum", "result"})
public class ESBRMM22InquiryResInfoSrvOutputItem {

	@XmlElement(name = "Record_num", required = true, nillable = true)
	protected BigDecimal recordNum;

	@XmlElement(name = "Result", required = true, nillable = true)
	protected String result;

	/**
	 * Gets the value of the recordNum property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getRecordNum() {
		return recordNum;
	}

	/**
	 * Sets the value of the recordNum property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setRecordNum(BigDecimal value) {
		this.recordNum = value;
	}

	/**
	 * Gets the value of the result property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getResult() {
		return result;
	}

	/**
	 * Sets the value of the result property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setResult(String value) {
		this.result = value;
	}

}
