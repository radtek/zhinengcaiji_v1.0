package cn.uway.webservice.managecontrol.file;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import cn.uway.webservice.managecontrol.mode.ExcelPara;

/**
 * 生成excel文件
 * 
 * @author yanb @ 2013年10月9日
 */
public abstract class GenerateExcelFile implements GenerateFile {

	/**
	 * 生成excel通用接口
	 * 
	 * @param fileName
	 *            文件名
	 * @param context
	 *            生成的数据 传入参数为ExcelPara 其中List<Object> cellValues中的Object为每行的数据， 在默认生成excel类DefaultGenerateExcelFile中Object为list
	 *            <object>，如果DefaultGenerateExcelFile不能处理复杂的业务 ，请重写方法writeCellValue
	 */
	@Override
	public void makeFile(String fileName, Object context) throws Exception {
		makeFile(fileName, context, false);
	}

	/**
	 * 生成excel通用接口
	 * 
	 * @param fileName
	 *            文件名
	 * @param context
	 *            生成的数据 传入参数为ExcelPara 其中List<Object> cellValues中的Object为每行的数据， 在默认生成excel类DefaultGenerateExcelFile中Object为list
	 *            <object>，如果DefaultGenerateExcelFile不能处理复杂的业务 ，请重写方法writeCellValue
	 */
	@Override
	public void makeFile(String fileName, Object context, boolean append) throws Exception {

		if (null == fileName || "".equalsIgnoreCase(fileName) || null == context || !(context instanceof ExcelPara)) {
			throw new Exception("传入生成excel的参数不正确。");
		}
		generateExcel(fileName, (ExcelPara) context);
	}

	protected void generateExcel(String fileName, ExcelPara excelPara) throws Exception {
		// 建立新HSSFWorkbook对象
		Workbook wb = new WorkbookFactory().createWorkbook(fileName, excelPara.getVersion());

		// 建立新的sheet对象
		Sheet sheet = createSheet(wb, excelPara);
		FileOutputStream fileOut = new FileOutputStream(fileName, true);
		List<Object> listValues = excelPara.getCellValues();
		try {
			writeRowData(wb, sheet, listValues, excelPara.getFiledStyle());
			wb.write(fileOut);
			fileOut.flush();
		} finally {
			fileOut.close();
		}
	}

	protected void writeRowData(Workbook wb, Sheet sheet, List<Object> listValues, Map<Integer, String> styles) {

		for (int i = 0; i < listValues.size(); i++) {
			// 建立新行
			Row row = sheet.createRow(i);
			writeCellData(wb, row, listValues.get(i), styles);
		}
	}

	protected Sheet createSheet(Workbook wb, ExcelPara excelPara) {
		return wb.createSheet(excelPara.getSheetName());
	}

	/**
	 * 时间输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param dateTime
	 *            dateTime
	 */
	protected void writeDataTime(SXSSFWorkbook wb, HSSFCell dCell, Date dateTime) {
		writeDataTime(wb, dCell, dateTime, null);
	}

	/**
	 * 时间输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param dateTime
	 *            dateTime
	 * @param style
	 *            m/d/yy h:mm
	 */
	protected void writeDataTime(Workbook wb, Cell dCell, Date dateTime, String style) {
		// 设置cell为日期类型的值
		dCell.setCellValue(dateTime);
		if (null != style) {
			// 设置该cell日期的显示格式
			dCell.setCellStyle(createBuiltinFormat(wb, style));
		}

	}

	/**
	 * 小数输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param dateTime
	 *            dateTime
	 */
	protected void writeDecimalData(Workbook wb, HSSFCell dCell, double data) {
		writeDecimalData(wb, dCell, data, null);
	}

	/**
	 * 小数输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param dateTime
	 *            dateTime
	 * @param style
	 *            格式为0.00 输出两位小数
	 */
	protected void writeDecimalData(Workbook wb, Cell dCell, double data, String style) {
		// 设置cell为日期类型的值
		dCell.setCellValue(data);
		if (null != style) {
			// 设置该cell日期的显示格式
			dCell.setCellStyle(createBuiltinFormat(wb, style));
		}
	}

	/**
	 * 整数输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param data
	 *            data
	 */
	protected void writeIntegerData(Workbook wb, Cell dCell, long data) {
		writeDecimalData(wb, dCell, data, null);
	}

	/**
	 * 整数输出
	 * 
	 * @param wb
	 *            wb
	 * @param dCell
	 *            dCell
	 * @param data
	 *            data
	 * @param style
	 *            style
	 */
	protected void writeIntegerData(Workbook wb, HSSFCell dCell, long data, String style) {
		// 设置cell为日期类型的值
		dCell.setCellValue(data);
		if (null != style) {
			// 设置该cell日期的显示格式
			dCell.setCellStyle(createBuiltinFormat(wb, style));
		}
	}

	private CellStyle createBuiltinFormat(Workbook wb, String style) {
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat(style));
		return cellStyle;
	}

	protected abstract void writeCellData(Workbook wb, Row row, Object lineData, Map<Integer, String> styles);

	class WorkbookFactory {

		private final static int WRITE_FILE_NUM2007 = 2000;

		public Workbook createWorkbook(String fileName, int version) throws Exception {
			if (version > 2003) {
				return createSXSSFWorkbook(fileName);
			} else {
				return createHSSFWorkbook(fileName);
			}
		}

		private Workbook createHSSFWorkbook(String fileName) throws Exception {
			return new HSSFWorkbook();
		}

		private Workbook createSXSSFWorkbook(String fileName) throws Exception {
			return new SXSSFWorkbook(WRITE_FILE_NUM2007);
		}
	}
}
