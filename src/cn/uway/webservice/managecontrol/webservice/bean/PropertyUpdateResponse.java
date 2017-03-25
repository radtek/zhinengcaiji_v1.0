package cn.uway.webservice.managecontrol.webservice.bean;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for anonymous complex type.
 * <p>
 * The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="PropertyUpdateResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"propertyUpdateResult"})
@XmlRootElement(name = "PropertyUpdateResponse")
public class PropertyUpdateResponse {

	@XmlElement(name = "PropertyUpdateResult")
	protected Integer propertyUpdateResult;

	/**
	 * Gets the value of the propertyUpdateResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getPropertyUpdateResult() {
		return propertyUpdateResult;
	}

	/**
	 * Sets the value of the propertyUpdateResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setPropertyUpdateResult(Integer value) {
		this.propertyUpdateResult = value;
	}

}
