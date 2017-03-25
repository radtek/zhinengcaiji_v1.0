package com.unicom.ucloud.service;

import java.util.List;
import java.util.Map;

/**
 * 相关业务模型模板，可动态配置，已于扩展
 * 
 * @author liuwx
 */
public class Templet {

	/**
	 * 服务编号
	 */
	private String serviceId;

	/**
	 * 实体名
	 */
	private String entity_name;

	/**
	 * 映射后的服务编号
	 */
	private String mappingServiceId;

	/**
	 * 结果集合
	 */
	private List<ResultSetEntity> resultSetList;

	/**
	 * 需要忽略的列
	 */
	private Map<String, List<Column>> ignoreColumnMap;

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public List<ResultSetEntity> getResultSetList() {
		return resultSetList;
	}

	public void setResultSetList(List<ResultSetEntity> resultSetList) {
		this.resultSetList = resultSetList;
	}

	public String getMappingServiceId() {
		return mappingServiceId;
	}

	public void setMappingServiceId(String mappingServiceId) {
		this.mappingServiceId = mappingServiceId;
	}

	public Map<String, List<Column>> getIgnoreColumnMap() {
		return ignoreColumnMap;
	}

	public void setIgnoreColumnMap(Map<String, List<Column>> ignoreColumnMap) {
		this.ignoreColumnMap = ignoreColumnMap;
	}

	public String getEntity_name() {
		return entity_name;
	}

	public void setEntity_name(String entity_name) {
		this.entity_name = entity_name;
	}

}
