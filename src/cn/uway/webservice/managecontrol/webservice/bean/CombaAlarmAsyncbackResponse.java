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
 *         &lt;element name="CombaAlarmAsyncbackResult" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {"combaAlarmAsyncbackResult"})
@XmlRootElement(name = "CombaAlarmAsyncbackResponse")
public class CombaAlarmAsyncbackResponse {

	@XmlElement(name = "CombaAlarmAsyncbackResult")
	protected Integer combaAlarmAsyncbackResult;

	/**
	 * Gets the value of the combaAlarmAsyncbackResult property.
	 * 
	 * @return possible object is {@link Integer }
	 */
	public Integer getCombaAlarmAsyncbackResult() {
		return combaAlarmAsyncbackResult;
	}

	/**
	 * Sets the value of the combaAlarmAsyncbackResult property.
	 * 
	 * @param value
	 *            allowed object is {@link Integer }
	 */
	public void setCombaAlarmAsyncbackResult(Integer value) {
		this.combaAlarmAsyncbackResult = value;
	}

}
