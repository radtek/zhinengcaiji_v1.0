package cn.uway.webservice.managecontrol.file;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

/**
 * 生成json文件
 * 
 * @author yanb @ 2013年10月9日
 */
public abstract class GenerateJsonFile implements GenerateFile {

	@Override
	public void makeFile(String fileName, Object context) throws Exception {
		makeFile(fileName, context, false);
	}

	@Override
	public void makeFile(String fileName, Object context, boolean append) throws Exception {
		if (null == fileName || "".equalsIgnoreCase(fileName) || null == context) {
			throw new Exception("传入生成excel的参数不正确。");
		}
		FileOutputStream out = new FileOutputStream(fileName, append);
		OutputStreamWriter write = new OutputStreamWriter(out, "UTF-8");
		try {
			write.write(getJson(context));
		} finally {
			if (write != null)
				write.close();
		}
	}

	protected abstract String getJson(Object context);

}
