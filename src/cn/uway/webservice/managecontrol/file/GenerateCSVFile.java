package cn.uway.webservice.managecontrol.file;

import java.io.FileWriter;

import au.com.bytecode.opencsv.CSVWriter;

/**
 * 生成csv文件
 * 
 * @author yanb @ 2013年10月9日
 */
public class GenerateCSVFile implements GenerateFile {

	/**
	 * 分割符号
	 */
	protected static final char DEFAULTSEPARATOR = ',';

	protected CSVWriter writer;

	/**
	 * 构造函数
	 * 
	 * @param title
	 *            标题
	 */
	public GenerateCSVFile(String fileName) throws Exception {
		this(fileName, DEFAULTSEPARATOR);
	}

	/**
	 * 构造函数
	 * 
	 * @param title
	 *            标题
	 * @param defaultSeparator
	 *            分割符号
	 */
	public GenerateCSVFile(String fileName, char defaultSeparator) throws Exception {
		writer = new CSVWriter(new FileWriter(fileName), defaultSeparator);
	}

	/**
	 * 生成excel通用接口
	 * 
	 * @param fileName
	 *            文件名
	 * @param context
	 *            生成的数据 传入参数为String[]
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
	 *            生成的数据 传入参数为String[]
	 */
	@Override
	public void makeFile(String fileName, Object context, boolean append) throws Exception {
		String[] entries = (String[]) context;
		writer.writeNext(entries);
		writer.flush();
	}

	public void close() throws Exception {
		writer.close();
	}
}
