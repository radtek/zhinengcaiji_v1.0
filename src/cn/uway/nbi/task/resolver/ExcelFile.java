package cn.uway.nbi.task.resolver;

import java.util.ArrayList;
import java.util.List;

/**
 * excel文件数据bean
 * 
 * @author yanb @ 2013年10月15日
 */
public class ExcelFile {

	/**
	 * 版本号
	 */
	private int version;

	/**
	 * sheet名
	 */
	private String sheetName;

	/**
	 * 表头
	 */
	private String[] tableHeader;

	/**
	 * 样式bean
	 */
	private List<ExcelFileStyle> excelFileStyles = new ArrayList<ExcelFileStyle>();

	public String[] getTableHeader() {
		return this.tableHeader;
	}

	public void setTableHeader(String[] tableHeader) {
		this.tableHeader = tableHeader;
	}

	public int getVersion() {
		return this.version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getSheetName() {
		return this.sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	public List<ExcelFileStyle> getExcelFileStyles() {
		return this.excelFileStyles;
	}

	public void setExcelFileStyles(List<ExcelFileStyle> excelFileStyles) {
		this.excelFileStyles = excelFileStyles;
	}

	public void setExcelFileStyles(ExcelFileStyle excelFileStyles) {
		this.excelFileStyles.add(excelFileStyles);
	}

}
