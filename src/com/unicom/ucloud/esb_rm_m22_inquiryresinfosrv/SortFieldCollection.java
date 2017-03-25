package com.unicom.ucloud.esb_rm_m22_inquiryresinfosrv;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sort_Field_Collection complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Sort_Field_Collection">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Sort_Field_Item" type="{http://ucloud.unicom.com/ESB_RM_M22_InquiryResInfoSrv}Sort_Field_Item" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sort_Field_Collection", propOrder = {"sortFieldItem"})
public class SortFieldCollection {

	@XmlElement(name = "Sort_Field_Item", nillable = true)
	protected List<SortFieldItem> sortFieldItem;

	/**
	 * Gets the value of the sortFieldItem property.
	 * <p>
	 * This accessor method returns a reference to the live list, not a snapshot. Therefore any modification you make to the returned list will be
	 * present inside the JAXB object. This is why there is not a <CODE>set</CODE> method for the sortFieldItem property.
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getSortFieldItem().add(newItem);
	 * </pre>
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link SortFieldItem }
	 */
	public List<SortFieldItem> getSortFieldItem() {
		if (sortFieldItem == null) {
			sortFieldItem = new ArrayList<SortFieldItem>();
		}
		return this.sortFieldItem;
	}

}
