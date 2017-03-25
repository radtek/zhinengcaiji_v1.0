package cn.uway.nbi.task.templet;

import java.io.Serializable;
import java.util.Map;

import cn.uway.nbi.task.t.TAction;

/**
 * 模板类
 * 
 * @author litp 2011-4-18
 */
public class Templet implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Map<Integer, TAction> actions;

	private Include include;

	private Map<String, Integer> dataTypeMap;

	public Map<String, Integer> getDataTypeMap() {
		return dataTypeMap;
	}

	public void setDataTypeMap(Map<String, Integer> dataTypeMap) {
		this.dataTypeMap = dataTypeMap;
	}

	public Map<Integer, TAction> getActions() {
		return actions;
	}

	public void setActions(Map<Integer, TAction> actions) {
		this.actions = actions;
	}

	public boolean includeValidate() {
		return include == null ? false : include.isValidate();
	}

	public Include getInclude() {
		return include;
	}

	public void setInclude(Include include) {
		this.include = include;
	}

}
