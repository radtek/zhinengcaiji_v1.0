package com.unicom.ucloud.service;

import java.util.Map;

/**
 * 数据源节点对象
 * 
 * @author liuwx
 */
public class DS {

	/* 编号 */
	private String id;

	/* ip地址 */
	private String ip;

	/* 端口 */
	private String port;

	/* 数据库名 */
	private String dbname;

	/* 编码 */
	private String encode;

	private String url;

	/* 数据库用户名 */
	private String username;

	/* 数据库密码 */
	private String password;

	/* 数据库驱动 */
	private String driver;

	/* 属性集合 */
	private Map<String, String> propertyMap;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public Map<String, String> getPropertyMap() {
		return propertyMap;
	}

	public void setPropertyMap(Map<String, String> propertyMap) {
		this.propertyMap = propertyMap;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
	}

}
