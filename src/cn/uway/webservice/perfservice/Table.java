package cn.uway.webservice.perfservice;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.task.resolver.WSResolver;

/**
 * 需要上报的结果集合
 * 
 * @author liuwx 2013-4-27
 */
public class Table {

	/**
	 * ftl模板中对应的的一行表头
	 */
	private String[] oneLineFields;

	private List<String> outField;

	private List<String> headStrList;

	/**
	 * ftl模板中对应的第二行表头,性能数据上报中规范中要求有二行表头.
	 */
	private String[] secondLineFields;

	/**
	 * 主键对应的索引
	 */
	private Map<String, Integer> keyFieldsIndexMap;

	/**
	 * 结果集 中对应的key ,模板中需要指定
	 */
	private String[] keyFields;

	/**
	 * 分组排序
	 */
	private String[] orderByList;

	private Map<String, Integer> orderByIndex;

	/**
	 * TR列表
	 */
	private List<TR> trList;

	/**
	 * 将多个TR节点的结果集合，进行合并成一个结果集合
	 */
	// private ResultSet resultSet;

	private String dataType;

	private Task task;

	public List<String> getHeadStrList() {
		return headStrList;
	}

	public void setHeadStrList(List<String> headStrList) {
		this.headStrList = headStrList;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Table() {
		orderByIndex = new HashMap<String, Integer>();
	}

	public List<String> getOutField() {
		return outField;
	}

	public void setOutField(List<String> outField) {
		this.outField = outField;
	}

	/**
	 * order by 字段在 关键字段keyFields中的索引
	 * 
	 * @return
	 */
	public boolean setOrderByIndex() {
		if (keyFields == null)
			return false;

		if (orderByList == null)
			return false;

		List<String> common = Util.overlaps(Arrays.asList(keyFields), Arrays.asList(orderByList));

		if (common == null)
			return false;
		for (int i = 0; i < common.size(); i++) {
			orderByIndex.put(common.get(i), i);
		}
		return true;
	}

	public Map<String, Integer> getOrderByIndex() {
		return orderByIndex;
	}

	public void setOrderByIndex(Map<String, Integer> orderByIndex) {
		this.orderByIndex = orderByIndex;
	}

	public List<TR> getTrList() {
		return trList;
	}

	public void setTrList(List<TR> trList) {
		this.trList = trList;
	}

	public String[] getOneLineFields() {
		return oneLineFields;
	}

	public void setOneLineFields(String[] oneLineFields) {
		this.oneLineFields = oneLineFields;
	}

	public String[] getSecondLineFields() {
		return secondLineFields;
	}

	public void setSecondLineFields(String[] secondLineFields) {
		this.secondLineFields = secondLineFields;
	}

	/**
	 * 表主键
	 * 
	 * @return
	 */
	public String[] getKeyFields() {
		return keyFields;
	}

	public void setKeyFields(String[] keyFields) {
		this.keyFields = keyFields;
	}

	public void getResultSet2(WSResolver resolver) {

		for (TR tr : this.trList) {
			tr.setDataType(this.dataType);

			tr.searchResult(resolver, Arrays.asList(orderByList), tr);
			ResultSet re = new ResultSet();
			tr.setResultSet(re);
			tr.getResult().setGroupKey(Arrays.asList(orderByList));
			// cn.uway.webservice.dt.DtTest.write(tr.getResult().toString(), new
			// File("D:/tr_result.csv"));
		}
	}

	public String[] getOrderByList() {
		return orderByList;
	}

	public void setOrderByList(String[] orderByList) {
		this.orderByList = orderByList;
	}

	public Map<String, Integer> getKeyFieldsIndexMap() {
		return keyFieldsIndexMap;
	}

	public void setKeyFieldsIndexMap(Map<String, Integer> keyFieldsIndexMap) {
		this.keyFieldsIndexMap = keyFieldsIndexMap;
	}

}
