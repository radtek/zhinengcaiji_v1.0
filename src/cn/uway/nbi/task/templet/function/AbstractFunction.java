package cn.uway.nbi.task.templet.function;

import java.io.Writer;

import cn.uway.nbi.task.resolver.FreeMarkerWriter;

/**
 * freemarker抽象类
 * 
 * @author yanb @ 2013年8月23日
 */
public abstract class AbstractFunction {

	/**
	 * 设置行数
	 * 
	 * @param out
	 *            输出类
	 */
	protected void setFileLineNum(Writer out, int count) {
		FreeMarkerWriter fout = (FreeMarkerWriter) out;
		fout.setLineNum(count);
	}

	/**
	 * 设置行数
	 * 
	 * @param out
	 *            输出类
	 */
	protected void setFileLineNum(Writer out) {
		FreeMarkerWriter fout = (FreeMarkerWriter) out;
		fout.setLineNum(fout.getLineNum() + 1);
	}

}
