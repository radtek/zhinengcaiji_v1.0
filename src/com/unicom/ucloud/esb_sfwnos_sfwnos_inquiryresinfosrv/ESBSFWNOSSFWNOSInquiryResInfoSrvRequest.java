package com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ESB_SFWNOS_SFWNOS_InquiryResInfoSrvRequest complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ESB_SFWNOS_SFWNOS_InquiryResInfoSrvRequest">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="MsgHeader" type="{http://ucloud.unicom.com/MsgHeader}MsgHeader"/>
 *         &lt;element name="Entity_Name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Output_Field_Collection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv}Output_Field_Collection"/>
 *         &lt;element name="Query_Condition_Collection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv}Query_Condition_Collection"/>
 *         &lt;element name="Sort_Field_Collection" type="{http://ucloud.unicom.com/ESB_SFWNOS_SFWNOS_InquiryResInfoSrv}Sort_Field_Collection"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ESB_SFWNOS_SFWNOS_InquiryResInfoSrvRequest", propOrder = {"msgHeader", "entityName", "outputFieldCollection",
		"queryConditionCollection", "sortFieldCollection"})
public class ESBSFWNOSSFWNOSInquiryResInfoSrvRequest {

	@XmlElement(name = "MsgHeader", required = true)
	protected MsgHeader msgHeader;

	@XmlElement(name = "Entity_Name", required = true, nillable = true)
	protected String entityName;

	@XmlElement(name = "Output_Field_Collection", required = true, nillable = true)
	protected OutputFieldCollection outputFieldCollection;

	@XmlElement(name = "Query_Condition_Collection", required = true, nillable = true)
	protected QueryConditionCollection queryConditionCollection;

	@XmlElement(name = "Sort_Field_Collection", required = true, nillable = true)
	protected SortFieldCollection sortFieldCollection;

	/**
	 * Gets the value of the msgHeader property.
	 * 
	 * @return possible object is {@link MsgHeader }
	 */
	public MsgHeader getMsgHeader() {
		return msgHeader;
	}

	/**
	 * Sets the value of the msgHeader property.
	 * 
	 * @param value
	 *            allowed object is {@link MsgHeader }
	 */
	public void setMsgHeader(MsgHeader value) {
		this.msgHeader = value;
	}

	/**
	 * Gets the value of the entityName property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getEntityName() {
		return entityName;
	}

	/**
	 * Sets the value of the entityName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setEntityName(String value) {
		this.entityName = value;
	}

	/**
	 * Gets the value of the outputFieldCollection property.
	 * 
	 * @return possible object is {@link OutputFieldCollection }
	 */
	public OutputFieldCollection getOutputFieldCollection() {
		return outputFieldCollection;
	}

	/**
	 * Sets the value of the outputFieldCollection property.
	 * 
	 * @param value
	 *            allowed object is {@link OutputFieldCollection }
	 */
	public void setOutputFieldCollection(OutputFieldCollection value) {
		this.outputFieldCollection = value;
	}

	/**
	 * Gets the value of the queryConditionCollection property.
	 * 
	 * @return possible object is {@link QueryConditionCollection }
	 */
	public QueryConditionCollection getQueryConditionCollection() {
		return queryConditionCollection;
	}

	/**
	 * Sets the value of the queryConditionCollection property.
	 * 
	 * @param value
	 *            allowed object is {@link QueryConditionCollection }
	 */
	public void setQueryConditionCollection(QueryConditionCollection value) {
		this.queryConditionCollection = value;
	}

	/**
	 * Gets the value of the sortFieldCollection property.
	 * 
	 * @return possible object is {@link SortFieldCollection }
	 */
	public SortFieldCollection getSortFieldCollection() {
		return sortFieldCollection;
	}

	/**
	 * Sets the value of the sortFieldCollection property.
	 * 
	 * @param value
	 *            allowed object is {@link SortFieldCollection }
	 */
	public void setSortFieldCollection(SortFieldCollection value) {
		this.sortFieldCollection = value;
	}

}
