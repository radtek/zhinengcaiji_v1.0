package com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputItem complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="PRI_KEY" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="NOTICE_TYPE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="NOTICE_XML" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_1" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_2" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_3" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_4" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_5" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_6" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_7" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_8" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_9" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="RESERVED_10" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrvInputItem", propOrder = {"prikey", "noticetype", "noticexml", "reserved1",
		"reserved2", "reserved3", "reserved4", "reserved5", "reserved6", "reserved7", "reserved8", "reserved9", "reserved10"})
public class ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem {

	@XmlElement(name = "PRI_KEY", required = true, nillable = true)
	protected String prikey;

	@XmlElement(name = "NOTICE_TYPE", required = true, nillable = true)
	protected String noticetype;

	@XmlElement(name = "NOTICE_XML", required = true, nillable = true)
	protected String noticexml;

	@XmlElement(name = "RESERVED_1", required = true, nillable = true)
	protected String reserved1;

	@XmlElement(name = "RESERVED_2", required = true, nillable = true)
	protected String reserved2;

	@XmlElement(name = "RESERVED_3", required = true, nillable = true)
	protected String reserved3;

	@XmlElement(name = "RESERVED_4", required = true, nillable = true)
	protected String reserved4;

	@XmlElement(name = "RESERVED_5", required = true, nillable = true)
	protected String reserved5;

	@XmlElement(name = "RESERVED_6", required = true, nillable = true)
	protected String reserved6;

	@XmlElement(name = "RESERVED_7", required = true, nillable = true)
	protected String reserved7;

	@XmlElement(name = "RESERVED_8", required = true, nillable = true)
	protected String reserved8;

	@XmlElement(name = "RESERVED_9", required = true, nillable = true)
	protected String reserved9;

	@XmlElement(name = "RESERVED_10", required = true, nillable = true)
	protected String reserved10;

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
	 * Gets the value of the noticetype property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getNOTICETYPE() {
		return noticetype;
	}

	/**
	 * Sets the value of the noticetype property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setNOTICETYPE(String value) {
		this.noticetype = value;
	}

	/**
	 * Gets the value of the noticexml property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getNOTICEXML() {
		return noticexml;
	}

	/**
	 * Sets the value of the noticexml property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setNOTICEXML(String value) {
		this.noticexml = value;
	}

	/**
	 * Gets the value of the reserved1 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED1() {
		return reserved1;
	}

	/**
	 * Sets the value of the reserved1 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED1(String value) {
		this.reserved1 = value;
	}

	/**
	 * Gets the value of the reserved2 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED2() {
		return reserved2;
	}

	/**
	 * Sets the value of the reserved2 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED2(String value) {
		this.reserved2 = value;
	}

	/**
	 * Gets the value of the reserved3 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED3() {
		return reserved3;
	}

	/**
	 * Sets the value of the reserved3 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED3(String value) {
		this.reserved3 = value;
	}

	/**
	 * Gets the value of the reserved4 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED4() {
		return reserved4;
	}

	/**
	 * Sets the value of the reserved4 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED4(String value) {
		this.reserved4 = value;
	}

	/**
	 * Gets the value of the reserved5 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED5() {
		return reserved5;
	}

	/**
	 * Sets the value of the reserved5 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED5(String value) {
		this.reserved5 = value;
	}

	/**
	 * Gets the value of the reserved6 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED6() {
		return reserved6;
	}

	/**
	 * Sets the value of the reserved6 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED6(String value) {
		this.reserved6 = value;
	}

	/**
	 * Gets the value of the reserved7 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED7() {
		return reserved7;
	}

	/**
	 * Sets the value of the reserved7 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED7(String value) {
		this.reserved7 = value;
	}

	/**
	 * Gets the value of the reserved8 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED8() {
		return reserved8;
	}

	/**
	 * Sets the value of the reserved8 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED8(String value) {
		this.reserved8 = value;
	}

	/**
	 * Gets the value of the reserved9 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED9() {
		return reserved9;
	}

	/**
	 * Sets the value of the reserved9 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED9(String value) {
		this.reserved9 = value;
	}

	/**
	 * Gets the value of the reserved10 property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRESERVED10() {
		return reserved10;
	}

	/**
	 * Sets the value of the reserved10 property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRESERVED10(String value) {
		this.reserved10 = value;
	}

}
