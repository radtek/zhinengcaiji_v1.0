package cn.uway.nbi.task.resolver;

import java.io.IOException;
import java.io.Writer;

/**
 * 用于模板写文件的类
 * 
 * @author yanb @ 2013年8月23日
 */
public class FreeMarkerWriter extends Writer {

	private long lineNum = 0;

	private final Writer writer;

	public FreeMarkerWriter(Writer writer) {
		this.writer = writer;
	}

	public long getLineNum() {
		return this.lineNum;
	}

	public void setLineNum(long lineNum) {
		this.lineNum = lineNum;
	}

	@Override
	public void write(char[] cbuf, int off, int len) throws IOException {
		writer.write(cbuf, off, len);
	}

	@Override
	public void flush() throws IOException {
		writer.flush();

	}

	@Override
	public void close() throws IOException {
		writer.flush();

	}

}
