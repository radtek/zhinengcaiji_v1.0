package cn.uway.nbi.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTimeUtils {

	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static final String DAY_FORMAT = "yyyyMMdd";

	public static String getCurrentDateTime() {
		Date current = new Date();
		DateFormat dateFormat = new SimpleDateFormat(DATE_TIME_FORMAT);
		return dateFormat.format(current);
	}
	
	public static String getFormatDay(Date date)
	{
		DateFormat dateFormat = new SimpleDateFormat(DAY_FORMAT);
		return dateFormat.format(date);
	}
	
	public static String getFormat(Date date)
	{
		DateFormat dateFormat = new SimpleDateFormat(DATE_TIME_FORMAT);
		return dateFormat.format(date);
	}
	
	public static String format(Date date ,String format)
	{
		DateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}
	public static Date parse(String date) throws ParseException
	{
		DateFormat dateFormat = new SimpleDateFormat(DATE_TIME_FORMAT);
		return dateFormat.parse(date);
	}
	/**
	 *获取startDate与当前时间(yyyyMMdd)之间相差的天数 
	 * @param startDate
	 * @param endDate
	 */
	public static long getDays(String startDate)
	{
		try {
			DateFormat dateFormat = new SimpleDateFormat(DAY_FORMAT);
			long startTimes = dateFormat.parse(startDate).getTime();
			long endTimes = dateFormat.parse(dateFormat.format(new Date())).getTime();
			return (endTimes - startTimes)/(1000 * 60 * 60 * 24);
		} catch (ParseException e) {
		}
		
		return 0;
	}
	
	public static void main(String[] args)
	{
		DateFormat dateFormat = new SimpleDateFormat(DAY_FORMAT);
		try {
			System.out.println(dateFormat.parse("20160801"));
			System.out.println(dateFormat.parse("20160802"));
			System.out.println(dateFormat.parse("20160803"));
			System.out.println(dateFormat.parse("20160804"));
			System.out.println(dateFormat.parse("20160805"));
			System.out.println(dateFormat.parse("20160806"));
			System.out.println(dateFormat.parse("20160807"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
