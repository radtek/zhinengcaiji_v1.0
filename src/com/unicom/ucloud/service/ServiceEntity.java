package com.unicom.ucloud.service;

/**
 * 服务实体类，分为消费服务，提供服务
 * 
 * @author liuwx
 */
public class ServiceEntity {

	// 1 : provide 2: consume
	private int type;

	// 服务编号
	private String service_id;

	// 服务英文名
	private String service_name_en;

	// 服务地址
	private String service_url;

	// 服务中文名
	private String service_name_cn;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getService_id() {
		return service_id;
	}

	public void setService_id(String serviceId) {
		service_id = serviceId;
	}

	public String getService_name_en() {
		return service_name_en;
	}

	public void setService_name_en(String serviceNameEn) {
		service_name_en = serviceNameEn;
	}

	public String getService_url() {
		return service_url;
	}

	public void setService_url(String serviceUrl) {
		service_url = serviceUrl;
	}

	public String getService_name_cn() {
		return service_name_cn;
	}

	public void setService_name_cn(String serviceNameCn) {
		service_name_cn = serviceNameCn;
	}

}
