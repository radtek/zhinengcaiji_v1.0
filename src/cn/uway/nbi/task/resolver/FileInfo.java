package cn.uway.nbi.task.resolver;

public class FileInfo {

	// 文件名
	private String fileName;

	// 记录文件内有多少条记录
	private int count;

	// 默认为0
	private int dataType = 0;
	
	// 文件夹名称
	private String dirName;

	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDirName() {
		return dirName;
	}

	public void setDirName(String dirName) {
		this.dirName = dirName;
	}

}
