package cn.uway.webservice.managecontrol.file;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 默认生成excel文件
 * 
 * @author yanb @ 2013年10月9日
 */
public class DefaultGenerateExcelFile extends GenerateExcelFile {

	@Override
	@SuppressWarnings("unchecked")
	protected void writeCellData(Workbook wb, Row row, Object lineData, Map<Integer, String> styles) {
		List<Object> lineValues = (List<Object>) lineData;
		for (int j = 0; j < lineValues.size(); j++) {
			Cell dCell = row.createCell(j);
			writeCellValue(wb, lineValues.get(j), dCell, styles.get(j));
		}
	}

	private void writeCellValue(Workbook wb, Object obj, Cell dCell, String style) {

		if (obj instanceof Date) {
			writeDataTime(wb, dCell, (Date) obj, style);
		} else if (obj instanceof Float) {
			writeDecimalData(wb, dCell, (Float) obj, style);
		} else if (obj instanceof Double) {
			writeDecimalData(wb, dCell, (Double) obj, style);
		} else if (obj instanceof Boolean) {
			dCell.setCellValue((Boolean) obj);
		} else if (obj instanceof Integer) {
			dCell.setCellValue((Integer) obj);
		} else if (obj instanceof Long) {
			dCell.setCellValue((Long) obj);
		} else if (obj instanceof Short) {
			dCell.setCellValue((Short) obj);
		} else if (obj instanceof Byte) {
			dCell.setCellValue((Byte) obj);
		} else {
			dCell.setCellValue(String.valueOf(obj));
		}
	}

	public void close() throws Exception {
		return;
	}
}
