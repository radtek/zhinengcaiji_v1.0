package cn.uway.webservice.perfservice.store;

import java.io.Serializable;

/**
 * 索引，用于记录对象在文件中的位置
 * 
 * @author liuwx
 */
public class IndexElement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public long beginPos;

	public long endPos;
}
