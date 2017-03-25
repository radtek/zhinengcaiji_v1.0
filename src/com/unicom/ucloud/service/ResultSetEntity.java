package com.unicom.ucloud.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.uway.commons.type.StringUtil;

/**
 * 结果集对象
 * 
 * @author liuwx
 */
public class ResultSetEntity {

	/* 编号 */
	private String id;

	/* 数据源 */
	private DS ds;

	/* sql脚本 */
	private String sql;

	/* 列列表 */
	private List<Column> columnList;

	/* 列映射关系 */
	private Map<String, String> columnMappingMap = new HashMap<String, String>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public DS getDs() {
		return ds;
	}

	public void setDs(DS ds) {
		this.ds = ds;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public List<Column> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<Column> columnList) {
		this.columnList = columnList;
	}

	/*
	 * public Map<String, String> getColumnMappingMap() { return columnMappingMap; }
	 */

	public void setColumnMappingMap(Map<String, String> columnMappingMap) {
		this.columnMappingMap = columnMappingMap;
	}

	public void conver() {
		if (columnList == null || columnList.size() <= 0)
			return;
		for (Column c : columnList) {
			String descTable = c.descTable;
			String value = "";
			if (StringUtil.isNull(descTable)) {
				value = c.desc;
			} else {
				value = descTable + "." + c.desc;
			}
			if (!columnMappingMap.containsKey(c.src))
				columnMappingMap.put(c.src, value);
		}
	}

	public String mappingValue(String src) {
		return columnMappingMap.get(src);
	}

}
