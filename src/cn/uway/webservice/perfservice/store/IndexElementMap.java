package cn.uway.webservice.perfservice.store;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 * 主键存储集合
 * 
 * @author liuwx
 */
public class IndexElementMap implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * Map<主键，索引元素>
	 */
	public Map<String, IndexElement> indexMap = new TreeMap<String, IndexElement>();

	/**
	 * Map<分组主键，Map<一行数据对应的主键,位置>>
	 */
	public transient Map<String, Map<String, IndexElement>> indexGroupMap = new TreeMap<String, Map<String, IndexElement>>();

}
