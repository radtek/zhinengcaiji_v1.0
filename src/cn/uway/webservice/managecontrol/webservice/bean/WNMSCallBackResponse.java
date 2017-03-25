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
 *         &lt;element name="WNMSCallBackResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"wnmsCallBackResult"})
@XmlRootElement(name = "WNMSCallBackResponse")
public class WNMSCallBackResponse {

	@XmlElement(name = "WNMSCallBackResult")
	protected Integer wnmsCallBackResult;

	/**
	 * Gets the value of the wnmsCallBackResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getWNMSCallBackResult() {
		return wnmsCallBackResult;
	}

	/**
	 * Sets the value of the wnmsCallBackResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setWNMSCallBackResult(Integer value) {
		this.wnmsCallBackResult = value;
	}

}
