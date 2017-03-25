package cn.uway.nbi.task.templet.function;

import java.io.IOException;
import java.io.Writer;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/**
 * 处理话单数据
 * 
 * @author liuwx
 */
public class CDLData extends AbstractFunction implements TemplateDirectiveModel {

	// private static DecimalFormat df = new DecimalFormat("#.##");
	private static DecimalFormat df4 = new DecimalFormat("#.####");// 精确到4位小数

	// private static DecimalFormat df6 = new DecimalFormat("#.######");
	private static DecimalFormat df2 = new DecimalFormat("#.##");// 精确到2位小数

	@Override
	@SuppressWarnings("rawtypes")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		// 限定方法中必须且必须传递七个参数
		if (params.size() != 7)
			throw new TemplateModelException("Wrong arguments!");
		TemplateSequenceModel datas = (TemplateSequenceModel) params.get("datas");
		// TemplateHashModel indexs = (TemplateHashModel) params.get("indexs");

		// 精度以及纬度
		String longitude_lb_str = params.get("longitude_lb").toString();
		String latitude_lb_str = params.get("latitude_lb").toString();
		String longitude_rb_str = params.get("longitude_rb").toString();
		String latitude_rb_str = params.get("latitude_rb").toString();

		String sep = params.get("sep").toString();
		if (datas == null || datas.size() <= 0)
			return;
		// 存储计算之后的数据
		List<String[]> ldata = new ArrayList<String[]>();
		//
		Map<String, TemplateSequenceModel> ds = new TreeMap<String, TemplateSequenceModel>();

		for (int i = 1; i < datas.size(); i++) {
			TemplateSequenceModel lineData = (TemplateSequenceModel) datas.get(i);
			String initlatitudeStr = lineData.get(0).toString();
			String initlongitudeStr = lineData.get(1).toString();
			// 拼接唯一标识符，防止重复数据
			String key = (int) (Double.parseDouble(initlongitudeStr) * 100) + "-" + (int) (Double.parseDouble(initlatitudeStr) * 100);
			if (!ds.containsKey(key))
				ds.put(key, lineData);
		}

		if (ds.size() > 0) {
			ldata = outCdl(Double.parseDouble(longitude_lb_str), Double.parseDouble(latitude_lb_str), Double.parseDouble(longitude_rb_str),
					Double.parseDouble(latitude_rb_str), ds);
		}
		if (body == null)
			return;
		// 输出，写入文件
		Writer out1 = env.getOut();
		out(out1, ldata, sep);
		body.render(out1);
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
	 * @throws TemplateModelException
	 */
	public static List<String[]> outCdl(double longitudeL, double latitudeL, double longitudeR, double latitudeR,
			Map<String, TemplateSequenceModel> ds) throws TemplateModelException {
		int longitude_lb = -1;
		int latitude_lb = -1;

		// 113.9772 24.59921 116.6004 27.0461

		double stepLongitude = 0.01;
		double stepLatitude = 0.01;
		double Width = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeR, longitudeR);
		double Height = FreemarkerUtils.getDistance(latitudeR, longitudeL, latitudeL, longitudeL);
		stepLongitude = (longitudeR - longitudeL) / Math.ceil(Width);// 4wei
		stepLatitude = (latitudeR - latitudeL) / Math.ceil(Height);

		stepLongitude = round(stepLongitude, 4, df4);
		stepLatitude = round(stepLatitude, 4, df4);

		double lb_longitude = round(longitudeL, 2, df2);
		double rb_latitude = round(latitudeR, 2, df2);

		List<String[]> ldata = new ArrayList<String[]>();
		int co = 0;

		for (double u = lb_longitude; u < longitudeR; u += stepLongitude) // 经度
		{
			longitude_lb = longitude_lb + 1;
			for (double v = rb_latitude; v > latitudeL; v -= stepLatitude) // 纬度
			{
				latitude_lb = latitude_lb + 1;
				double ulb = round(u, 2, df2);
				double vlb = round(v, 2, df2);
				String key = (int) (ulb * 100) + "-" + (int) (vlb * 100);
				co++;
				if (ds.containsKey(key)) {
					TemplateSequenceModel lineData = ds.get(key);
					String[] newLine = new String[2 + lineData.size() - 2];// xml中对应的查询字段脚本不能随意的调换顺序，否则会导致结果不正确
					String[] rc = new String[]{"" + longitude_lb, "" + latitude_lb};
					System.arraycopy(rc, 0, newLine, 0, 2);
					int count = 0;
					for (int j = 2; j < lineData.size(); j++) {
						String vals = lineData.get(j).toString();
						// 为空以0补充
						if (vals == null || "".equals(vals)) {
							vals = "0";
						}
						if (vals != null && "0".equals(vals)) {
							count++;
						}
						newLine[j] = vals;
					}
					if (count != lineData.size() - 2)
						ldata.add(newLine);
				}
			}
			latitude_lb = -1;
		}
		System.out.println(co);
		return ldata;
	}

	/**
	 * 输出，并写入数据
	 * 
	 * @param out
	 * @param datas
	 *            数据
	 * @param sep
	 *            分隔符
	 * @throws IOException
	 */
	private void out(Writer out, List<String[]> datas, String sep) throws IOException {
		// add on 2012-03-20
		if (datas == null || datas.size() <= 0)
			return;
		//
		int count = 0;
		for (String[] ds : datas) {
			for (int j = 0; j < ds.length; j++) {

				out.write(ds[j]);
				if (j != ds.length - 1)
					out.write(sep);
			}

			if (count != datas.size() - 1)
				out.write("\n");
			count++;
		}
		super.setFileLineNum(out, count);
	}

	// 计算两个经纬度间的距离
	public static double rad(double d) {
		return d * 3.1415926535897931 / 180.0;
	}

	// /**
	// * 四舍五入
	// *
	// * @param d
	// * @param len
	// * @return
	// */
	// public static double round(double d, int len)
	// {
	// NumberFormat ddf1 = NumberFormat.getNumberInstance();
	// ddf1.setMaximumFractionDigits(len);
	// String s = ddf1.format(d);
	// return Double.parseDouble(s);
	// }

	/**
	 * 四舍五入
	 * 
	 * @param d
	 * @param len
	 * @return
	 */
	public static double round(double d, int len, DecimalFormat df) {
		String value = df.format(d);
		return Double.parseDouble(value);
	}

	public static void main(String[] args) {

	}

}