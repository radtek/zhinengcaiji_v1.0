package cn.uway.nbi.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 将excel文件转换为csv文件的工具。
 * 
 * @since 1.1
 */
public class ExcelToCsvUtil {

	private File source;

	private String keyId;

	private long taskId;

	protected static Logger logger = LoggerFactory.getLogger(ExcelToCsvUtil.class);

	/**
	 * 构造方法。
	 * 
	 * @param excelFile
	 *            要转换的excel文件
	 * @param taskInfo
	 *            所属任务的信息
	 * @throws FileNotFoundException
	 *             传入参数为<code>null</code>、文件不存在、非文件时
	 */
	public ExcelToCsvUtil(File excelFile) throws FileNotFoundException {
		super();
		if (excelFile == null) {
			throw new FileNotFoundException(keyId + "-传入的文件路径为null");
		}
		if (!excelFile.exists()) {
			throw new FileNotFoundException(keyId + "-文件不存在:" + excelFile.getAbsolutePath());
		}
		if (excelFile.isDirectory()) {
			throw new FileNotFoundException(keyId + "-传入的路径为目录，非文件:" + excelFile.getAbsolutePath());
		}
		this.source = excelFile;
	}

	/**
	 * 构造方法。
	 * 
	 * @param excelFile
	 *            要转换的excel文件
	 * @param taskInfo
	 *            所属任务的信息
	 * @throws FileNotFoundException
	 *             传入参数为<code>null</code>、文件不存在、非文件时
	 */
	public ExcelToCsvUtil(File excelFile, long taskId) throws FileNotFoundException {
		super();
		this.taskId = taskId;
		if (excelFile == null) {
			throw new FileNotFoundException(keyId + "-传入的文件路径为null");
		}
		if (!excelFile.exists()) {
			throw new FileNotFoundException(keyId + "-文件不存在:" + excelFile.getAbsolutePath());
		}
		if (excelFile.isDirectory()) {
			throw new FileNotFoundException(keyId + "-传入的路径为目录，非文件:" + excelFile.getAbsolutePath());
		}
		this.source = excelFile;
	}

	/**
	 * 将EXCEL文件转为一个或多个CSV文件，使用逗号作为分隔符。
	 * 
	 * @return 转换后的所有CSV文件的本地路径，不会返回<code>null</code>
	 * @throws Exception
	 *             转换时出错
	 */
	public List<String> toCsv(String cvsname) throws Exception {
		return toCsv(null, cvsname);
	}

	/**
	 * 将EXCEL(2007)文件转为一个或多个CSV文件，使用逗号作为分隔符。
	 * 
	 * @return 转换后的所有CSV文件的本地路径，不会返回<code>null</code>
	 * @throws Exception
	 *             转换时出错
	 */
	public List<String> toCsvXLSX(Character splitChar, String cvsname) throws Exception {
		List<String> ret = new ArrayList<String>();
		CSVWriterUtils csvWriter = null;
		Character sp = (splitChar == null ? ',' : splitChar);
		try {
			File dir = new File(SysCfg.getInstance().getCurrentpath() + File.separator + taskId + File.separator + source.getName() + File.separator);
			if (!dir.exists()) {
				if (!dir.mkdirs()) {
					throw new Exception(keyId + "-创建文件夹失败:" + dir.getAbsolutePath());
				}
			}

			XSSFWorkbook xssfWorkbook = new XSSFWorkbook(source.getAbsolutePath());
			int sheetID = 1;
			// 循环工作表Sheet
			for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
				XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);

				if (xssfSheet == null || xssfSheet.getLastRowNum() < 1)
					continue;
				File csvFile = new File(dir, cvsname.replace("%%WORKSheetID%%", sheetID + "") + ".csv");
				csvWriter = new CSVWriterUtils(csvFile.getAbsolutePath());
				int columnsCount = xssfSheet.getRow(0).getLastCellNum();

				// 循环行Row
				for (int rowNum = 0; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
					XSSFRow xssfRow = xssfSheet.getRow(rowNum);
					String[] cols = new String[columnsCount];

					if (xssfRow == null) {
						continue;
					}

					// 循环列Cell
					for (int cellNum = 0; cellNum <= xssfRow.getLastCellNum(); cellNum++) {
						XSSFCell xssfCell = xssfRow.getCell(cellNum);
						if (xssfCell == null) {
							continue;
						}

						String content = getValue(xssfCell);
						content = content == null ? "" : content.replace('\r', ' ').replace('\n', ' ').replace(sp, ' ');
						content.replace("\"", "");
						cols[cellNum] = content;

					}
					csvWriter.writerCsvFile(cols);
				}

				sheetID = sheetID + 1;
				ret.add(csvFile.getAbsolutePath());
			}

			logger.debug(keyId + "-CSV文件已转换完成,所在目录:" + dir.getAbsolutePath());

		} catch (Exception e) {
			logger.error("EXCEL表格转换成 CSV文件出现异常：" + e.toString());

		} finally {
			if (csvWriter != null)
				csvWriter.close();
		}
		return ret;
	}

	/**
	 * 将EXCEL文件转为一个或多个CSV文件。
	 * 
	 * @param splitChar
	 *            CSV文件的分隔符，如果传入<code>null</code>，则默认使用逗号分隔
	 * @return 转换后的所有CSV文件的本地路径，不会返回<code>null</code>
	 * @throws Exception
	 *             转换时出错
	 */
	public List<String> toCsv(Character splitChar, String cvsname) throws Exception {
		List<String> ret = new ArrayList<String>();
		CSVWriterUtils csvWriter = null;

		try {
			File dir = new File(SysCfg.getInstance().getCurrentpath() + File.separator + taskId + File.separator + source.getName() + File.separator);
			if (!dir.exists()) {
				if (!dir.mkdirs()) {
					throw new Exception(keyId + "-创建文件夹失败:" + dir.getAbsolutePath());
				}
			}

			Workbook wb = Workbook.getWorkbook(source);
			logger.debug(keyId + "-开始将EXCEL文件转换为CSV文件:" + source.getAbsolutePath());
			Sheet[] sheets = wb.getSheets();
			int sheetID = 1;
			for (Sheet sheet : sheets) {
				File csvFile = new File(dir, cvsname.replace("%%WORKSheetID%%", sheetID + "") + ".csv");
				int columnsCount = sheet.getRow(0).length;
				int rowCount = sheet.getRows();
				if (rowCount < 1)
					continue;
				String[] cols = new String[columnsCount];

				Character sp = (splitChar == null ? ',' : splitChar);

				csvWriter = new CSVWriterUtils(csvFile.getAbsolutePath());

				for (int i = 0; i < rowCount; i++) {
					Cell[] cells = sheet.getRow(i);
					for (int j = 0; j < columnsCount; j++) {
						String content = j > cells.length - 1 ? "" : cells[j].getContents();
						content = content == null ? "" : content.replace('\r', ' ').replace('\n', ' ').replace(sp, ' ');
						content.replace("\"", "");
						cols[j] = content;
					}

					csvWriter.writerCsvFile(cols);

				}

				ret.add(csvFile.getAbsolutePath());
				sheetID = sheetID + 1;
			}
			logger.debug(keyId + "-CSV文件已转换完成,所在目录:" + dir.getAbsolutePath());

		} catch (Exception e) {
			if (e.toString().contains("Unable to recognize OLE stream")) {
				ret = toCsvXLSX(null, cvsname);
			} else {
				logger.error("EXCEL表格转换成 CSV文件出现异常：" + e.toString());
			}

		} finally {
			if (csvWriter != null)
				csvWriter.close();
		}
		return ret;

	}

	private String getValue(XSSFCell xssfCell) {
		if (xssfCell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
			return String.valueOf(xssfCell.getBooleanCellValue());
		} else if (xssfCell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
			return String.valueOf(xssfCell.getNumericCellValue());
		} else {
			return String.valueOf(xssfCell.getStringCellValue());
		}
	}

	public static void main(String[] args) throws Exception {

		ExcelToCsvUtil exceltocsvutil = new ExcelToCsvUtil(new File("F:\\工作表.xlsx"), 5001);
		exceltocsvutil.toCsv(null, "320_WORKDATA_125_%%WORKSheetID%%_20140903");
	}
}
