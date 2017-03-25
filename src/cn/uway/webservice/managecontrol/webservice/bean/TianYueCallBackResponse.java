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
 *         &lt;element name="TianYueCallBackResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"tianYueCallBackResult"})
@XmlRootElement(name = "TianYueCallBackResponse")
public class TianYueCallBackResponse {

	@XmlElement(name = "TianYueCallBackResult")
	protected Integer tianYueCallBackResult;

	/**
	 * Gets the value of the tianYueCallBackResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getTianYueCallBackResult() {
		return tianYueCallBackResult;
	}

	/**
	 * Sets the value of the tianYueCallBackResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setTianYueCallBackResult(Integer value) {
		this.tianYueCallBackResult = value;
	}

}
