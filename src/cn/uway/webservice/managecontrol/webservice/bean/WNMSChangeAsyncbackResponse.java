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
 *         &lt;element name="WNMSChangeAsyncbackResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"wnmsChangeAsyncbackResult"})
@XmlRootElement(name = "WNMSChangeAsyncbackResponse")
public class WNMSChangeAsyncbackResponse {

	@XmlElement(name = "WNMSChangeAsyncbackResult")
	protected Integer wnmsChangeAsyncbackResult;

	/**
	 * Gets the value of the wnmsChangeAsyncbackResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getWNMSChangeAsyncbackResult() {
		return wnmsChangeAsyncbackResult;
	}

	/**
	 * Sets the value of the wnmsChangeAsyncbackResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setWNMSChangeAsyncbackResult(Integer value) {
		this.wnmsChangeAsyncbackResult = value;
	}

}
