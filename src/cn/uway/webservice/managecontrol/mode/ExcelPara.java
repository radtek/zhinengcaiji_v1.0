package cn.uway.webservice.managecontrol.mode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 、 生成excel文件的参数
 * 
 * @author yanb @ 2013年10月9日
 */
public class ExcelPara {

	/**
	 * 版本 2003或者2007
	 */
	private int version = 2003;

	/**
	 * sheet名
	 */
	private String sheetName;

	/**
	 * excel中没列字段的样式，map中key值为列号，从0开始，value为具体的样式格式；
	 */
	private Map<Integer, String> filedStyle = new HashMap<Integer, String>();

	/**
	 * 每行值，list中的object可以根据实际情况，自己定义，可以是集合类也可以是一个具体的javabean，在默认（ DefaultGenerateExcelFile）生成excel类中， object是一个list<object>对象
	 */
	private List<Object> cellValues;

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Map<Integer, String> getFiledStyle() {
		return this.filedStyle;
	}

	public void setFiledStyle(Map<Integer, String> filedStyle) {
		this.filedStyle = filedStyle;
	}

	public String getSheetName() {
		return this.sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	public List<Object> getCellValues() {
		return this.cellValues;
	}

	public void setCellValues(List<Object> cellValues) {
		this.cellValues = cellValues;
	}
}
