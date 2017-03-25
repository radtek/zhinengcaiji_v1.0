package cn.uway.webservice.managecontrol.mode;

/**
 * ftp的信息
 * 
 * @author yanb @ 2013年10月9日
 */
public class FtpInfo {

	private String emosReportFtpIP;

	private int emosReportFtpPort;

	private String emosReportFtpUsername;

	private String emosReportFtpPwd;

	private String emosReportFtpEncode;

	private String emosReportFtpPath;

	private String emosReportFtpMode;

	public FtpInfo() {

	}

	public FtpInfo(String emosReportFtpIP, int emosReportFtpPort, String emosReportFtpUsername, String emosReportFtpPwd, String emosReportFtpEncode,
			String emosReportFtpPath, String emosReportFtpMode) {
		super();
		this.emosReportFtpIP = emosReportFtpIP;
		this.emosReportFtpPort = emosReportFtpPort;
		this.emosReportFtpUsername = emosReportFtpUsername;
		this.emosReportFtpPwd = emosReportFtpPwd;
		this.emosReportFtpEncode = emosReportFtpEncode;
		this.emosReportFtpPath = emosReportFtpPath;
		this.emosReportFtpMode = emosReportFtpMode;
	}

	public String getEmosReportFtpIP() {
		return this.emosReportFtpIP;
	}

	public void setEmosReportFtpIP(String emosReportFtpIP) {
		this.emosReportFtpIP = emosReportFtpIP;
	}

	public int getEmosReportFtpPort() {
		return this.emosReportFtpPort;
	}

	public void setEmosReportFtpPort(int emosReportFtpPort) {
		this.emosReportFtpPort = emosReportFtpPort;
	}

	public String getEmosReportFtpUsername() {
		return this.emosReportFtpUsername;
	}

	public void setEmosReportFtpUsername(String emosReportFtpUsername) {
		this.emosReportFtpUsername = emosReportFtpUsername;
	}

	public String getEmosReportFtpPwd() {
		return this.emosReportFtpPwd;
	}

	public void setEmosReportFtpPwd(String emosReportFtpPwd) {
		this.emosReportFtpPwd = emosReportFtpPwd;
	}

	public String getEmosReportFtpEncode() {
		return this.emosReportFtpEncode;
	}

	public void setEmosReportFtpEncode(String emosReportFtpEncode) {
		this.emosReportFtpEncode = emosReportFtpEncode;
	}

	public String getEmosReportFtpPath() {
		return this.emosReportFtpPath;
	}

	public void setEmosReportFtpPath(String emosReportFtpPath) {
		this.emosReportFtpPath = emosReportFtpPath;
	}

	public String getEmosReportFtpMode() {
		return this.emosReportFtpMode;
	}

	public void setEmosReportFtpMode(String emosReportFtpMode) {
		this.emosReportFtpMode = emosReportFtpMode;
	}

}
