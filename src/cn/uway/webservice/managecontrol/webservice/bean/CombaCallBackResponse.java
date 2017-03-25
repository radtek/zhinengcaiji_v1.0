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
 *         &lt;element name="CombaCallBackResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"combaCallBackResult"})
@XmlRootElement(name = "CombaCallBackResponse")
public class CombaCallBackResponse {

	@XmlElement(name = "CombaCallBackResult")
	protected Integer combaCallBackResult;

	/**
	 * Gets the value of the combaCallBackResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getCombaCallBackResult() {
		return combaCallBackResult;
	}

	/**
	 * Sets the value of the combaCallBackResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setCombaCallBackResult(Integer value) {
		this.combaCallBackResult = value;
	}

}
