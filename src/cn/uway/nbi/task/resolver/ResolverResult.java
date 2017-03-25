package cn.uway.nbi.task.resolver;

import java.util.Map;

/**
 * 文件解析结果信息
 */
public class ResolverResult {

	private Map<String, FileInfo> uploadFileInfoMap;
	
	/**
	 * FTP下载在本地的文件
	 */
	private Map<String,String> localFileInfoMap;

	/**
	 * 如果上报文件没有文件，是否忽视
	 */
	private boolean isIgnore = false;

	public Map<String, FileInfo> getUploadFileInfoMap() {
		return uploadFileInfoMap;
	}

	public void setUploadFileInfoMap(Map<String, FileInfo> uploadFileInfoMap) {
		this.uploadFileInfoMap = uploadFileInfoMap;
	}

	public boolean isIgnore() {
		return isIgnore;
	}

	public void setIgnore(boolean isIgnore) {
		this.isIgnore = isIgnore;
	}

	public Map<String, String> getLocalFileInfoMap() {
		return localFileInfoMap;
	}

	public void setLocalFileInfoMap(Map<String, String> localFileInfoMap) {
		this.localFileInfoMap = localFileInfoMap;
	}
	
}
