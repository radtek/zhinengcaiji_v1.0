package com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Query_Condition_Item complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Query_Condition_Item">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Query_Field_name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Operation" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Query_Condition_VLAUE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Relation" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Query_Condition_Item", propOrder = {"queryFieldName", "operation", "queryConditionVLAUE", "relation"})
public class QueryConditionItem {

	@XmlElement(name = "Query_Field_name", required = true, nillable = true)
	protected String queryFieldName;

	@XmlElement(name = "Operation", required = true, nillable = true)
	protected String operation;

	@XmlElement(name = "Query_Condition_VLAUE", required = true, nillable = true)
	protected String queryConditionVLAUE;

	@XmlElement(name = "Relation", required = true, nillable = true)
	protected String relation;

	/**
	 * Gets the value of the queryFieldName property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getQueryFieldName() {
		return queryFieldName;
	}

	/**
	 * Sets the value of the queryFieldName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setQueryFieldName(String value) {
		this.queryFieldName = value;
	}

	/**
	 * Gets the value of the operation property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getOperation() {
		return operation;
	}

	/**
	 * Sets the value of the operation property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setOperation(String value) {
		this.operation = value;
	}

	/**
	 * Gets the value of the queryConditionVLAUE property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getQueryConditionVLAUE() {
		return queryConditionVLAUE;
	}

	/**
	 * Sets the value of the queryConditionVLAUE property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setQueryConditionVLAUE(String value) {
		this.queryConditionVLAUE = value;
	}

	/**
	 * Gets the value of the relation property.
	 * 
	 * @return possible object is {@link String }
	 */
	public String getRelation() {
		return relation;
	}

	/**
	 * Sets the value of the relation property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 */
	public void setRelation(String value) {
		this.relation = value;
	}

}
