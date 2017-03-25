package cn.uway.nbi.ui;

import java.util.List;

/**
 * 10.2.4　DRS104文件上报完成通知
 * 
 * @author liuwx
 */
public class DSR104service_content extends Service_common {

	public String notifyid;

	public String sercaller;

	public String domaintype;

	public String filetype;

	public String uploadedfilenum;

	public String unuploadedfilenum;

	public List<Unuploadedfileinfo> failList;

	public List<Uploadedfileinfo> sucList;

	public String requestid;
}
