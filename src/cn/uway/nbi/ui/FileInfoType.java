package cn.uway.nbi.ui;

/**
 * 文件信息类型。 用户封装需要上报的文件信息。
 * 
 * @author liuwx
 */
public class FileInfoType {

	protected String serCaller;

	protected String fileName;

	protected String fileNameCompare;

	protected int fileSize;

	protected String fileAddr;

	protected String fileGeneration;

	protected String fileFormat;

	protected int validate;

	protected long task_id;

	protected long id;

	protected long recordSize; // 生成csv文件记录行数

	protected int sql_id;

	protected String domaintype;

	protected String filetype;

	protected String vendor;

	protected String vendorShortening;

	protected String paraFile;

	protected String fileMappingDir;// 文件映射目录

	public String getFileMappingDir() {
		return fileMappingDir;
	}

	public void setFileMappingDir(String fileMappingDir) {
		this.fileMappingDir = fileMappingDir;
	}

	public String getFileNameCompare() {
		return fileNameCompare;
	}

	public void setFileNameCompare(String fileNameCompare) {
		this.fileNameCompare = fileNameCompare;
	}

	public String getParaFile() {
		return paraFile;
	}

	public void setParaFile(String paraFile) {
		this.paraFile = paraFile;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getVendorShortening() {
		return vendorShortening;
	}

	public void setVendorShortening(String vendorShortening) {
		this.vendorShortening = vendorShortening;
	}

	public String getSerCaller() {
		return serCaller;
	}

	public void setSerCaller(String serCaller) {
		this.serCaller = serCaller;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileAddr() {
		return fileAddr;
	}

	public void setFileAddr(String fileAddr) {
		this.fileAddr = fileAddr;
	}

	public String getFileGeneration() {
		return fileGeneration;
	}

	public void setFileGeneration(String fileGeneration) {
		this.fileGeneration = fileGeneration;
	}

	public String getFileFormat() {
		return fileFormat;
	}

	public void setFileFormat(String fileFormat) {
		this.fileFormat = fileFormat;
	}

	public int getValidate() {
		return validate;
	}

	public void setValidate(int validate) {
		this.validate = validate;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getTask_id() {
		return task_id;
	}

	public void setTask_id(long task_id) {
		this.task_id = task_id;
	}

	public long getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(long recordSize) {
		this.recordSize = recordSize;
	}

	public int getSql_id() {
		return sql_id;
	}

	public void setSql_id(int sql_id) {
		this.sql_id = sql_id;
	}

	public String getDomaintype() {
		return domaintype;
	}

	public void setDomaintype(String domaintype) {
		this.domaintype = domaintype;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

}
