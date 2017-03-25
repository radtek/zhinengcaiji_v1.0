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
 *         &lt;element name="WNMSWorkOrderSendResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"wnmsWorkOrderSendResult"})
@XmlRootElement(name = "WNMSWorkOrderSendResponse")
public class WNMSWorkOrderSendResponse {

	@XmlElement(name = "WNMSWorkOrderSendResult")
	protected Integer wnmsWorkOrderSendResult;

	/**
	 * Gets the value of the wnmsWorkOrderSendResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getWNMSWorkOrderSendResult() {
		return wnmsWorkOrderSendResult;
	}

	/**
	 * Sets the value of the wnmsWorkOrderSendResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setWNMSWorkOrderSendResult(Integer value) {
		this.wnmsWorkOrderSendResult = value;
	}

}
