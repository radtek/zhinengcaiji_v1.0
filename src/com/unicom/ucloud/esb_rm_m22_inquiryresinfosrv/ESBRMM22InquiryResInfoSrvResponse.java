package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_RM_M22_InquiryResInfoSrvResponse complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_RM_M22_InquiryResInfoSrvResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="SERVICE_FLAG" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="SERVICE_MESSAGE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="INSTANCE_ID" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="TOTAL_RECORD" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="TOTAL_PAGE" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="PAGE_SIZE" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="CURRENT_PAGE" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="ESB_RM_M22_InquiryResInfoSrvOutputCollection" type="{http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv}ESB_RM_M22_InquiryResInfoSrvOutputCollection" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_RM_M22_InquiryResInfoSrvResponse", propOrder = {"serviceflag", "servicemessage", "instanceid", "totalrecord", "totalpage",
		"pagesize", "currentpage", "esbrmm22InquiryResInfoSrvOutputCollection"})
public class ESBRMM22InquiryResInfoSrvResponse {

	@XmlElement(name = "SERVICE_FLAG", required = true, nillable = true)
	protected String serviceflag;

	@XmlElement(name = "SERVICE_MESSAGE", required = true, nillable = true)
	protected String servicemessage;

	@XmlElement(name = "INSTANCE_ID", required = true, nillable = true)
	protected BigDecimal instanceid;

	@XmlElement(name = "TOTAL_RECORD", required = true, nillable = true)
	protected BigDecimal totalrecord;

	@XmlElement(name = "TOTAL_PAGE", required = true, nillable = true)
	protected BigDecimal totalpage;

	@XmlElement(name = "PAGE_SIZE", required = true, nillable = true)
	protected BigDecimal pagesize;

	@XmlElement(name = "CURRENT_PAGE", required = true, nillable = true)
	protected BigDecimal currentpage;

	@XmlElement(name = "ESB_RM_M22_InquiryResInfoSrvOutputCollection", nillable = true)
	protected List<ESBRMM22InquiryResInfoSrvOutputCollection> esbrmm22InquiryResInfoSrvOutputCollection;

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
	 * Gets the value of the instanceid property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getINSTANCEID() {
		return instanceid;
	}

	/**
	 * Sets the value of the instanceid property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setINSTANCEID(BigDecimal value) {
		this.instanceid = value;
	}

	/**
	 * Gets the value of the totalrecord property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getTOTALRECORD() {
		return totalrecord;
	}

	/**
	 * Sets the value of the totalrecord property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setTOTALRECORD(BigDecimal value) {
		this.totalrecord = value;
	}

	/**
	 * Gets the value of the totalpage property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getTOTALPAGE() {
		return totalpage;
	}

	/**
	 * Sets the value of the totalpage property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setTOTALPAGE(BigDecimal value) {
		this.totalpage = value;
	}

	/**
	 * Gets the value of the pagesize property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getPAGESIZE() {
		return pagesize;
	}

	/**
	 * Sets the value of the pagesize property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setPAGESIZE(BigDecimal value) {
		this.pagesize = value;
	}

	/**
	 * Gets the value of the currentpage property.
	 * 
	 * @return possible object is {@link BigDecimal }
	 */
	public BigDecimal getCURRENTPAGE() {
		return currentpage;
	}

	/**
	 * Sets the value of the currentpage property.
	 * 
	 * @param value
	 *            allowed object is {@link BigDecimal }
	 */
	public void setCURRENTPAGE(BigDecimal value) {
		this.currentpage = value;
	}

	/**
	 * Gets the value of the esbrmm22InquiryResInfoSrvOutputCollection property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the esbrmm22InquiryResInfoSrvOutputCollection property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getESBRMM22InquiryResInfoSrvOutputCollection().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link ESBRMM22InquiryResInfoSrvOutputCollection }
	 */
	public List<ESBRMM22InquiryResInfoSrvOutputCollection> getESBRMM22InquiryResInfoSrvOutputCollection() {
		if (esbrmm22InquiryResInfoSrvOutputCollection == null) {
			esbrmm22InquiryResInfoSrvOutputCollection = new ArrayList<ESBRMM22InquiryResInfoSrvOutputCollection>();
		}
		return this.esbrmm22InquiryResInfoSrvOutputCollection;
	}

}
