package com.unicom.ucloud.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * XMLGregorianCalendar类型和Date类型之间的相互转换
 */

public class CalendarConverUtil {

	/**
	 * 将时间Date类型转化为XMLGregorianCalendar类型
	 * 
	 * @param date
	 *            时间字段
	 * @return XMLGregorianCalendar对象
	 * @throws DatatypeConfigurationException
	 */
	public static XMLGregorianCalendar convertToXMLGregorianCalendar(Date date) throws DatatypeConfigurationException {

		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		XMLGregorianCalendar gc = null;
		gc = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
		return gc;
	}

	/**
	 * @param cal
	 * @return
	 * @throws Exception
	 */
	public static Date convertToDate(XMLGregorianCalendar cal) throws Exception {
		if (cal == null)
			return null;
		GregorianCalendar ca = cal.toGregorianCalendar();
		return ca.getTime();
	}

	public static void main(String[] args) throws DatatypeConfigurationException {
	}
}
