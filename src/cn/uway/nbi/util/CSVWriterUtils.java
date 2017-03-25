package cn.uway.nbi.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.framework.util.StringUtil;

public class CSVWriterUtils {

	protected static Logger LOGGER = LoggerFactory.getLogger(CSVWriterUtils.class);

	private String fileName;

	private static final String SPLIT = ",";

	private BufferedWriter bw;

	public CSVWriterUtils(String fileName) {
		this.fileName = fileName;
		createFile();

	}

	public void writerHeader(List<String> headLine) {
		for (String lineData : headLine) {
			writerCsvFile(lineData);
		}
	}

	private void createFile() {
		try {
			File csv = new File(fileName); // CSV数据文件

			bw = new BufferedWriter(new FileWriter(csv, true)); // 附加
		} catch (IOException e) {
			LOGGER.error("创建数据文件失败", e);
		}
	}

	public int writerCsvFile(List<String[]> lineDataList) {
		int i = 0;
		for (String[] lineData : lineDataList) {
			writerCsvFile(lineData);
			i++;
		}
		return i;
	}

	public int writerCsvFile(String[] lineData) {
		try {
			int len = lineData.length;
			int i = 0;
			StringBuilder sb = new StringBuilder();
			for (String fieldValue : lineData) {
				if (StringUtil.isEmpty(fieldValue)) {
					fieldValue = "";
				}

				if (i < len - 1) {
					if (fieldValue.contains(",")) {
						// sb.append("\"" + fieldValue.replace(",", "，") + "\"").append(SPLIT);
						sb.append(fieldValue.replace(",", "，")).append(SPLIT);
					} else
						sb.append(fieldValue).append(SPLIT);
				} else {

					if (fieldValue.contains(",")) {
						sb.append(fieldValue.replace(",", "，"));
					} else
						sb.append(fieldValue);
				}
				i++;
			}
			bw.write(sb.toString());
			bw.newLine();
			bw.flush();

		} catch (FileNotFoundException e) {
			LOGGER.error("找不到文件" + fileName, e);
		} catch (IOException e) {
			LOGGER.error("出现异常" + fileName, e);
		}
		return 1;
	}

	public void writerCsvFile(String lineData) {
		try {
			bw.write(lineData);
			bw.newLine();
			bw.flush();
		} catch (FileNotFoundException e) {
			LOGGER.error("找不到文件" + fileName, e);
		} catch (IOException e) {
			LOGGER.error("出现异常" + fileName, e);
		}
	}

	public void close() {
		if (bw != null)
			try {
				bw.flush();
				bw.close();
			} catch (IOException e) {
			}
	}

	public static void main(String[] args) {

	}

}
