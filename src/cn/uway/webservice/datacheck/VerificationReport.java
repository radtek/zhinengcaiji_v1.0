package cn.uway.webservice.datacheck;

public class VerificationReport {

	private String proName;

	private String askReportFile;

	private String actualReportFile;

	private String reportPerson;

	private String reportDate;

	private int reportType;

	private int nbiStstus;

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getAskReportFile() {
		return askReportFile;
	}

	public void setAskReportFile(String askReportFile) {
		this.askReportFile = askReportFile;
	}

	public String getActualReportFile() {
		return actualReportFile;
	}

	public void setActualReportFile(String actualReportFile) {
		this.actualReportFile = actualReportFile;
	}

	public String getReportPerson() {
		return reportPerson;
	}

	public void setReportPerson(String reportPerson) {
		this.reportPerson = reportPerson;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public int getNbiStstus() {
		return nbiStstus;
	}

	public void setNbiStstus(int nbiStstus) {
		this.nbiStstus = nbiStstus;
	}

}
