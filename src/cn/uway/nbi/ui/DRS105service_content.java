package cn.uway.nbi.ui;

/**
 * 10.2.5　DRS105文件异常通知<br>
 * 文件异常通知,指定获取的数据文件准备异常或上报异常发生后通知， 上报异常说明和异常原因
 * 
 * <pre>
 *   <serCaller>陕西</serCaller>
 *   <domainType>GSM无线接入网</domainType>
 * 	 <abnormalRemark>由于文件准备过程中,出现XXX错误</abnormalRemark>
 * 	 <abnormalReason>详细说明错误的原因......</abnormalReason>
 * </pre>
 * 
 * @author liuwx
 */
public class DRS105service_content extends Service_common {

	public String serCaller;

	public String domainType;

	public String abnormalRemark;

	public String abnormalReason;

	public String requestid;
}
