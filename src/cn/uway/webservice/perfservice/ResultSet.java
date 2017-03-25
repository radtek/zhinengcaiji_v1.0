package cn.uway.webservice.perfservice;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.util.ResultSetHelperService;
import cn.uway.webservice.perfservice.store.FileCacheStore;

/**
 * 对应的一个sql语句的结果集 ResultSet
 * 
 * @author liuwx 2013-4-27
 */
public class ResultSet implements Cloneable {

	private FileCacheStore cacheStore;

	public FileCacheStore getCacheStore() {
		return cacheStore;
	}

	public void setCacheStore(FileCacheStore cacheStore) {
		this.cacheStore = cacheStore;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		for (String column : this.headLine.keySet()) {
			sb.append(column + ",\t");
		}
		for (Map<String, String> row : this.resultView) {
			sb.append("\n");
			for (String column : row.values()) {
				sb.append(column + ",\t");
			}
		}
		return sb.toString();
	}

	private static final Logger LOG = LoggerFactory.getLogger(ResultSet.class);

	private ResultSetHelperService rsHelper = new ResultSetHelperService();

	private List<String> groupKey;

	public List<String> getGroupKey() {
		return groupKey;
	}

	public void setGroupKey(List<String> groupKey) {
		this.groupKey = groupKey;
	}

	/**
	 * 字段 头
	 */
	private String[] heads = null;

	/**
	 * 关键字的拼接 key , 数据行
	 */
	// private Map<String, List<String[]>> data = new HashMap<String, List<String[]>>();

	/**
	 * Map&lt;字段名,字段索引&gt;
	 */
	private Map<String, Integer> headLine = new LinkedHashMap<String, Integer>();

	/**
	 * Map<时间以及其他key字段组成的字符串,List<一行数据>>
	 */
	private List<Map<String, String>> resultView = new ArrayList<Map<String, String>>();

	/**
	 * Map<order by field,List<Map<字段,值>>>
	 */
	// private Map<String, List<Map<String, String>>> result = new HashMap<String, List<Map<String, String>>>();

	public String[] getHeads() {
		// convertHeadLineTo();
		return heads;
	}

	public void setHeads(String[] heads) {
		this.heads = heads;
	}

	public Map<String, Integer> getHeadLine() {
		return headLine;
	}

	/**
	 * 获取整个结果集 List&lt;Map&lt;列名, 数据&gt;&gt;
	 * 
	 * @return
	 */
	public List<Map<String, String>> getResultView() {
		return this.resultView;
	}

	public void setResultView(List<Map<String, String>> resultView) {
		this.resultView = resultView;
	}

	public void setHeadLine(Map<String, Integer> headLine) {
		this.headLine = headLine;
	}

	/**
	 * 获取表头
	 * 
	 * @param rs
	 *            java.sql.ResultSet
	 */
	public void setHeadLine(java.sql.ResultSet rs) {
		try {
			String[] names = rsHelper.getColumnNames(rs);
			heads = names;
			for (int i = 0; i < names.length; i++) {
				this.headLine.put(names[i], i);
			}
			System.out.println(headLine);
		} catch (SQLException e) {
			LOG.debug("获取结果集表头 失败，" + e.getLocalizedMessage());
		}
	}

	/**
	 * @param rs
	 * @param timeColumn
	 *            关键字段列名集合
	 */
	public void setResultData(java.sql.ResultSet rs, List<String> groupColumns) {
		try {
			String lineKey = null;
			StringBuffer key = new StringBuffer();
			String[] tmp = null;
			List<String[]> rData = new ArrayList<String[]>();
			if (rs.next()) {
				for (String item : groupColumns) {
					key.append(rs.getString(item)).append("_");
				}
				tmp = rsHelper.getColumnValues(rs, false);
				rData.add(tmp);
			}
			lineKey = key.toString();
			Map<String, List<String[]>> tmpMap = new HashMap<String, List<String[]>>();

			StringBuffer keyTmp = null;

			while (rs.next()) {
				keyTmp = new StringBuffer();
				for (String item : groupColumns) {
					keyTmp.append(rs.getString(item)).append("_");
				}
				if (lineKey.equalsIgnoreCase(keyTmp.toString())) {
					tmp = rsHelper.getColumnValues(rs, false);
					if (tmp == null)
						continue;
					rData.add(tmp);
				} else {

					tmpMap.put(lineKey.toString(), new ArrayList<String[]>(rData));
					lineKey = keyTmp.toString();

				}
			}
			// 最后一组数据
			tmpMap.put(lineKey, new ArrayList<String[]>(rData));
			// data = tmpMap;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询DB,设置resultView属性
	 * 
	 * @param
	 * @param timeColumn
	 *            关键字段列名集合
	 */
	public void setResultData3(java.sql.ResultSet rs, List<String> groupColumns, List<String> lineKeyList, FileCacheStore store) {
		// Map<String, List<Map<String, String>>> mdata = new HashMap<String, List<Map<String, String>>>();

		try {

			String[] row = null;
			String groupKey = null;
			String lineKey = null;
			String[] headArr = rsHelper.getColumnNames(rs);
			store.setHeadArr(headArr);

			Map<String, Integer> headIndexMap = new HashMap<String, Integer>();
			int i = 0;
			for (String head : headArr) {
				headIndexMap.put(head, i);
				i++;
			}
			store.setHeadIndexMap(headIndexMap);

			while (rs.next()) {

				groupKey = rsHelper.getKey(rs, groupColumns);
				lineKey = rsHelper.getKey(rs, lineKeyList);

				row = rsHelper.getRowValuesStringArr(rs);
				// modify
				/*
				 * if (mdata.containsKey(key)) { mdata.get(key).add(row); } else { List<Map<String, String>> dataList = new ArrayList<Map<String,
				 * String>>(); dataList.add(row); mdata.put(key, dataList); }
				 */
				store.addElement(lineKey, row, groupKey, headArr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// this.result = mdata;
	}

	/**
	 * 查询DB,设置resultView属性
	 * 
	 * @param
	 * @param timeColumn
	 *            关键字段列名集合
	 */
	public void setResultData1(java.sql.ResultSet rs) {
		try {
			Map<String, String> row = null;
			while (rs.next()) {
				row = new LinkedHashMap<String, String>();
				row = rsHelper.getRowValues(rs);
				this.resultView.add(row);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		ResultSet newRS = new ResultSet();
		// newRS.data = this.data;
		newRS.headLine = this.headLine;
		newRS.heads = this.heads;
		newRS.resultView = this.resultView;
		newRS.rsHelper = this.rsHelper;
		return newRS;
	}

	/*
	 * public Map<String, List<String[]>> getData() { convertResultViewTo(); return data; }
	 * 
	 * public void setData(Map<String, List<String[]>> resultData) { this.data = resultData; }
	 */

	/**
	 * headLine to heads
	 */
	public void convertHeadLineTo() {
		this.heads = this.headLine.keySet().toArray(new String[]{});
	}

	/**
	 * resultView to data
	 */
	// public void convertResultViewTo() {
	// StringBuffer sb = null;
	// for (Map<String, String> row : this.resultView) {
	// if (row == null || row.size() == 0) {
	// continue;
	// }
	// sb = new StringBuffer();
	// for (String item : this.groupKey) {
	// sb.append(row.get(item)).append("_");
	// }
	// if (this.data.containsKey(sb.toString())) {
	// List<String[]> list = this.data.get(sb.toString());
	// list.add(row.values().toArray(new String[]{}));
	// } else {
	// List<String[]> list = new ArrayList<String[]>();
	// list.add(row.values().toArray(new String[]{}));
	// this.data.put(sb.toString(), list);
	// }
	// }
	// }

}
