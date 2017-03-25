package cn.uway.nbi.db.pojo;

public class NossTask extends Task {

	private static final long serialVersionUID = 1L;

	private String service_id;

	private String version;

	private String service_name;

	private String service_desc;

	private String sercaller;

	private String requestid;

	private String domaintype;

	private String filetype;

	private String objectlevel;

	private String objectlist;

	public String getService_id() {
		return service_id;
	}

	public void setService_id(String service_id) {
		this.service_id = service_id;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

	public String getService_desc() {
		return service_desc;
	}

	public void setService_desc(String service_desc) {
		this.service_desc = service_desc;
	}

	public String getSercaller() {
		return sercaller;
	}

	public void setSercaller(String sercaller) {
		this.sercaller = sercaller;
	}

	public String getRequestid() {
		return requestid;
	}

	public void setRequestid(String requestid) {
		this.requestid = requestid;
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

	public String getObjectlevel() {
		return objectlevel;
	}

	public void setObjectlevel(String objectlevel) {
		this.objectlevel = objectlevel;
	}

	public String getObjectlist() {
		return objectlist;
	}

	public void setObjectlist(String objectlist) {
		this.objectlist = objectlist;
	}

}
