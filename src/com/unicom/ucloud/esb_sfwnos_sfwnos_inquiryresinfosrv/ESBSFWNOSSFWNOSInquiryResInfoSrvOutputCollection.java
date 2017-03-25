package com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputCollection complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputCollection">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputItem" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv}ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputItem" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputCollection", propOrder = {"esbsfwnossfwnosInquiryResInfoSrvOutputItem"})
public class ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection {

	@XmlElement(name = "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvOutputItem", nillable = true)
	protected List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem> esbsfwnossfwnosInquiryResInfoSrvOutputItem;

	/**
	 * Gets the value of the esbsfwnossfwnosInquiryResInfoSrvOutputItem property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the esbsfwnossfwnosInquiryResInfoSrvOutputItem property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem }
	 */
	public List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem> getESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem() {
		if (esbsfwnossfwnosInquiryResInfoSrvOutputItem == null) {
			esbsfwnossfwnosInquiryResInfoSrvOutputItem = new ArrayList<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputItem>();
		}
		return this.esbsfwnossfwnosInquiryResInfoSrvOutputItem;
	}

}
