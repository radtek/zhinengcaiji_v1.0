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
 *         &lt;element name="IndoorWorkOrderSendResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"indoorWorkOrderSendResult"})
@XmlRootElement(name = "IndoorWorkOrderSendResponse")
public class IndoorWorkOrderSendResponse {

	@XmlElement(name = "IndoorWorkOrderSendResult")
	protected Integer indoorWorkOrderSendResult;

	/**
	 * Gets the value of the indoorWorkOrderSendResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getIndoorWorkOrderSendResult() {
		return indoorWorkOrderSendResult;
	}

	/**
	 * Sets the value of the indoorWorkOrderSendResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setIndoorWorkOrderSendResult(Integer value) {
		this.indoorWorkOrderSendResult = value;
	}

}
