package cn.uway.nbi.ui;

import java.util.List;

/**
 * DRS103文件开始上报通知
 * 
 * @author liuwx
 */
public class DRS103service_content extends Service_common {

	public String notifyid;

	public String sercaller;

	public String domaintype;

	public String filetype;

	public String reportbeginTime;

	public String readyfilenum;

	public List<FileInfoType> fileinfolist;

	public String requestid;
}
