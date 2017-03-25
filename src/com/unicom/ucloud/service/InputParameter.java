package com.unicom.ucloud.service;

/**
 * 输入参数
 * 
 * @author liuwx
 */
public class InputParameter {

	/**
	 * 输入对象
	 */
	private Object InputCollection;

	/**
	 * 消息头
	 */
	private Object header;

	public Object getInputCollection() {
		return InputCollection;
	}

	public void setInputCollection(Object inputCollection) {
		InputCollection = inputCollection;
	}

	public Object getHeader() {
		return header;
	}

	public void setHeader(Object header) {
		this.header = header;
	}

}
