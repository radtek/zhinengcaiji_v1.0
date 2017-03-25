package cn.uway.nbi.task.templet.function;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Freemarker工具类用于前端ftl调用此类方法
 * 
 * @author liuwx 2011-6-5
 */
public class FreemarkerUtils {

	// 计算两个经纬度间的距离
	public static double getDistance(double lat1, double lng1, double lat2, double lng2) {
		double EARTH_RADIUS = 6378.137;
		double radLat1 = rad(lat1);
		double radLat2 = rad(lat2);
		double a = radLat1 - radLat2;
		double b = rad(lng1) - rad(lng2);
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
		s = s * EARTH_RADIUS;
		// s=Math.round(s);
		s = round(s * 10000, 0) / 10000;

		return s;
	}

	// 计算两个经纬度间的距离
	public static double rad(double d) {
		return d * 3.1415926535897931 / 180.0;
	}

	/**
	 * 四舍五入
	 * 
	 * @param d
	 * @param len
	 * @return
	 */
	public static double round(double d, int len) {
		String s = null;
		if (len > 0) {
			NumberFormat ddf1 = NumberFormat.getNumberInstance();
			ddf1.setMaximumFractionDigits(len);
			s = ddf1.format(d);
		} else {
			return Math.round(d);
		}
		return Double.parseDouble(s);
	}

	/**
	 * 取得此精度纬度在大格子中的行列位置
	 * 
	 * @param initlongitude
	 * @param initlatitude
	 * @param longitudeL
	 * @param latitudeL
	 * @param longitudeR
	 * @param latitudeR
	 * @return
	 */
	public static List<String> getPosition(double longitudeL, double latitudeL, double longitudeR, double latitudeR) {
		int longitude_lb = -1;
		int latitude_lb = -1;

		// 113.9772 24.59921 116.6004 27.0461

		double stepLongitude = 0.01;
		double stepLatitude = 0.01;
		double Width = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeR, longitudeR);
		double Height = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeL, longitudeL);
		stepLongitude = (longitudeR - longitudeL) / Math.ceil(Width);// 4wei
		stepLatitude = (latitudeR - latitudeL) / Math.ceil(Height);

		stepLongitude = round(stepLongitude, 4);
		stepLatitude = round(stepLatitude, 4);

		double lb_longitude = round(longitudeL, 2);
		double rb_latitude = round(latitudeR, 2);

		List<String> pois = new ArrayList<String>();

		for (double u = lb_longitude; u < longitudeR; u += stepLongitude) // 经度
		{
			longitude_lb = longitude_lb + 1;
			for (double v = rb_latitude; v > latitudeL; v -= stepLatitude) // 纬度
			{
				latitude_lb = latitude_lb + 1;
				double ulb = round(u, 2);
				double vlb = round(v, 2);
				String key = (int) (ulb * 100) + "-" + (int) (vlb * 100);
				pois.add(key + "||" + longitude_lb + "-" + latitude_lb);
			}
			latitude_lb = -1;
		}
		return pois;
	}

	/**
	 * 分成多个格子
	 * 
	 * @param longitudeL
	 * @param latitudeL
	 * @param longitudeR
	 * @param latitudeR
	 * @return
	 */
	public static String grid(double longitudeL, double latitudeL, double longitudeR, double latitudeR) {

		int xLength = 0;
		int yLength = 0;
		int longitude_lb = -1;
		int latitude_lb = -1;

		double stepLongitude = 0.01;
		double stepLatitude = 0.01;
		double Width = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeR, longitudeR);
		double Height = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeL, longitudeL);
		stepLongitude = (longitudeR - longitudeL) / Math.ceil(Width);// 4wei
		stepLatitude = (latitudeR - latitudeL) / Math.ceil(Height);

		stepLongitude = round(stepLongitude, 4);
		stepLatitude = round(stepLatitude, 4);

		double lb_longitude = round(longitudeL, 2);
		double rb_latitude = round(latitudeR, 2);

		for (double u = lb_longitude; u < longitudeR; u += stepLongitude) // 经度
		{
			longitude_lb = longitude_lb + 1;
			for (double v = rb_latitude; v > latitudeL; v -= stepLatitude) // 纬度
			{
				latitude_lb = latitude_lb + 1;
			}
			if (yLength == 0)
				yLength = latitude_lb;
			latitude_lb = -1;
		}
		xLength = longitude_lb;
		return xLength + "|" + yLength;
	}

	/**
	 * 根 据传入的日期时间格式，在页面上直接取得当前时间的格式化结果 如果格式为空或者错误，将返回yyyy-MM-dd HH:mm:ss 页面调用${datetime("yyyy")}/${datetime('yyyy')}
	 * 
	 * @see com.yourcompany.ExtendedFreemarkerManager#createConfiguration
	 * @author Sunshine
	 */

	public static void main(String s[]) {
		double rs = getDistance(112.9243432, 22.62416393, 114.0601374, 23.94302242);
		System.out.println(rs);
	}

}
