package cn.uway.nbi.task.resolver;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author yanb @ 2013年10月14日
 */
public class ExcelDataFormart {

	private static final Logger LOG = LoggerFactory.getLogger(ExcelDataFormart.class);

	private static final String INT_REGIX = "^-?[0-9]\\d*$";

	private static final String FLOAT_REGIX = "^-?([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0)$";

	/**
	 * 存放excel样式的map，key为模板文件中配置的模板名+index字段(目前因为要兼容前面的代码，这样设计的，以后重构这里可以考虑更合理的方式 )，但是为了和数组，list对齐，在存入数据时，把index的值减一， 因此代码中key是从0开始，与模板中的从1开始不一样
	 */
	private final Map<Integer, ExcelFileStyle> styleMap = new HashMap<Integer, ExcelFileStyle>();

	/**
	 * 加入样式
	 * 
	 * @param flag
	 *            唯一标示 目前暂时利用的是模板中的<mapping name="河北联通资源情况_小区(GSM)_%%Y%%M%%D.xls" templet="河北联通资源情况_小区(GSM)" > templet属性作为标示，因为要兼容老代码
	 * @param excelFileStyle
	 *            excelFileStyle
	 */
	public void addStyle(ExcelFileStyle excelFileStyle) {
		styleMap.put(excelFileStyle.getIndex() - 1, excelFileStyle);
	}

	public boolean isContain(int index) {
		return styleMap.containsKey(index);
	}

	public boolean isInteger(String value) {
		if (null != value) {
			return matcher(INT_REGIX, value);
		}
		return false;
	}

	public Long newInteger(String value) {
		return new Long(value);
	}

	public Double newFloat(String value) {
		return new Double(value);
	}

	public boolean isFloat(String value) {
		if (null != value) {
			return matcher(FLOAT_REGIX, value);
		}
		return false;
	}

	public static void main(String[] args) {
		ExcelDataFormart excelDataFormart = new ExcelDataFormart();
		System.out.println(excelDataFormart.isFloat("4000"));
		System.out.println(excelDataFormart.isFloat("000"));
		System.out.println(excelDataFormart.isFloat("0.0"));
		System.out.println(excelDataFormart.isFloat("400.0"));
		System.out.println(excelDataFormart.isInteger("0"));
		System.out.println(excelDataFormart.isInteger("112"));
		System.out.println(excelDataFormart.isInteger("11.2"));
	}

	public Map<Integer, String> getAllStyle() {
		Map<Integer, String> styles = new HashMap<Integer, String>();
		for (Map.Entry<Integer, ExcelFileStyle> entry : styleMap.entrySet()) {
			styles.put(entry.getValue().getIndex(), entry.getValue().getStyle());
		}
		return styles;
	}

	/**
	 * 目前支持的格式还比较少，以后遇到实际情况在增加
	 * 
	 * @param index
	 *            index
	 * @param value
	 *            value
	 * @return Object
	 * @throws Exception
	 *             Exception
	 */
	public Object getFiledType(int index, String value) throws Exception {
		ExcelFileStyle excelFileStyle = styleMap.get(index);
		if (null == excelFileStyle) {
			LOG.error("没找到具体的列，请查看列索引配置是否正确。列索引为：" + (index + 1));
			throw new Exception("没找到具体的列，请查看列索引配置是否正确。列索引为：" + (index + 1));
		}
		String type = excelFileStyle.getFiledType();
		return getType(type, value);
	}

	private Object getType(String type, String value) throws Exception {
		if (type.equalsIgnoreCase("float") || type.equalsIgnoreCase("double")) {
			return new Double("".equalsIgnoreCase(value) ? "0" : value);
		} else if (type.equalsIgnoreCase("int") || type.equalsIgnoreCase("long")) {
			return new Long("".equalsIgnoreCase(value) ? "0" : value);
		} else if ("".equalsIgnoreCase(value) && type.equalsIgnoreCase("date")) {
			return stringToDate(value);
		} else if ("".equalsIgnoreCase(value) && type.equalsIgnoreCase("boolean")) {
			return new Boolean(value);
		} else {
			return value;
		}
	}

	private static Date stringToDate(String date) throws Exception {
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		return timeFormat.parse(date);
	}

	public Object getFiledType(String filedName, String value) throws Exception {
		String type = null;
		for (Map.Entry<Integer, ExcelFileStyle> entry : styleMap.entrySet()) {
			ExcelFileStyle excelFileStyle = entry.getValue();
			String name = excelFileStyle.getFiledName();
			if (name.equals(filedName)) {
				type = excelFileStyle.getFiledType();
				break;
			}
		}
		if (null == type) {
			LOG.error("没找到具体的列，请查看列索引配置是否正确。列名为：" + filedName);
			throw new Exception("没找到具体的列，请查看列索引配置是否正确。列名为：" + filedName);
		}
		return getType(type, value);
	}

	/**
	 * 正则匹配
	 * 
	 * @param regex
	 *            正则表达式
	 * @param value
	 *            需要匹配的值
	 * @return boolean 是否满足
	 */
	private boolean matcher(String regex, String value) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(value);
		if (!matcher.matches()) {
			return false;
		}
		return true;
	}
}
