package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_RM_M22_InquiryResInfoSrvOutputCollection complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_RM_M22_InquiryResInfoSrvOutputCollection">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ESB_RM_M22_InquiryResInfoSrvOutputItem" type="{http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv}ESB_RM_M22_InquiryResInfoSrvOutputItem" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_RM_M22_InquiryResInfoSrvOutputCollection", propOrder = {"esbrmm22InquiryResInfoSrvOutputItem"})
public class ESBRMM22InquiryResInfoSrvOutputCollection {

	@XmlElement(name = "ESB_RM_M22_InquiryResInfoSrvOutputItem", nillable = true)
	protected List<ESBRMM22InquiryResInfoSrvOutputItem> esbrmm22InquiryResInfoSrvOutputItem;

	/**
	 * Gets the value of the esbrmm22InquiryResInfoSrvOutputItem property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the esbrmm22InquiryResInfoSrvOutputItem property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getESBRMM22InquiryResInfoSrvOutputItem().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link ESBRMM22InquiryResInfoSrvOutputItem }
	 */
	public List<ESBRMM22InquiryResInfoSrvOutputItem> getESBRMM22InquiryResInfoSrvOutputItem() {
		if (esbrmm22InquiryResInfoSrvOutputItem == null) {
			esbrmm22InquiryResInfoSrvOutputItem = new ArrayList<ESBRMM22InquiryResInfoSrvOutputItem>();
		}
		return this.esbrmm22InquiryResInfoSrvOutputItem;
	}

}
