package cn.uway.webservice.managecontrol.webservice.bean;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElementRef;
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
 *         &lt;element name="BTSname" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="Details" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"btSname", "details"})
@XmlRootElement(name = "WNMSWorkOrderSend")
public class WNMSWorkOrderSend {

	@XmlElementRef(name = "BTSname", namespace = "http://tempuri.org/", type = JAXBElement.class)
	protected JAXBElement<String> btSname;

	@XmlElementRef(name = "Details", namespace = "http://tempuri.org/", type = JAXBElement.class)
	protected JAXBElement<String> details;

	/**
	 * Gets the value of the btSname property.
	 * 
	 * @return possible object is {@link JAXBElement }{@code <}{@link String } {@code >}
	 */
	public JAXBElement<String> getBTSname() {
		return btSname;
	}

	/**
	 * Sets the value of the btSname property.
	 * 
	 * @param value
	 *            allowed object is {@link JAXBElement }{@code <}{@link String } {@code >}
	 */
	public void setBTSname(JAXBElement<String> value) {
		this.btSname = value;
	}

	/**
	 * Gets the value of the details property.
	 * 
	 * @return possible object is {@link JAXBElement }{@code <}{@link String } {@code >}
	 */
	public JAXBElement<String> getDetails() {
		return details;
	}

	/**
	 * Sets the value of the details property.
	 * 
	 * @param value
	 *            allowed object is {@link JAXBElement }{@code <}{@link String } {@code >}
	 */
	public void setDetails(JAXBElement<String> value) {
		this.details = value;
	}

}
