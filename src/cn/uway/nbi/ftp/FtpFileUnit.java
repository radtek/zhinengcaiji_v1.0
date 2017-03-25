package cn.uway.nbi.ftp;

import java.util.List;

import cn.uway.nbi.task.resolver.Resolver.WsInfo;

public class FtpFileUnit {

	private String key;

	private String name;// zipfilename

	private List<String> filenameList;// 文件列表

	private List<SingleFileEntry> filenameEntryList;// 文件列表

	private WsInfo wsInfo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getFilenameList() {
		return filenameList;
	}

	public void setFilenameList(List<String> filenameList) {
		this.filenameList = filenameList;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<SingleFileEntry> getFilenameEntryList() {
		return filenameEntryList;
	}

	public void setFilenameEntryList(List<SingleFileEntry> filenameEntryList) {
		this.filenameEntryList = filenameEntryList;
	}

	public WsInfo getWsInfo() {
		return wsInfo;
	}

	public void setWsInfo(WsInfo wsInfo) {
		this.wsInfo = wsInfo;
	}

	public class SingleFileEntry {

		public String fileName;

		public String singleFileExt;

	}

}
