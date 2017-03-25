package cn.uway.nbi.ui.out;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.task.ReportTaskTrigger;
import cn.uway.nbi.task.t.TI;
import cn.uway.nbi.ui.DRS103service_content;
import cn.uway.nbi.ui.DSR104service_content;
import cn.uway.nbi.ui.FileInfoType;
import cn.uway.nbi.ui.Service_common;
import cn.uway.nbi.ui.Unuploadedfileinfo;
import cn.uway.nbi.ui.Uploadedfileinfo;
import cn.uway.nbi.ui.consume.ReportRequestService;

/**
 * 上报请求对象 上报文件前，需要先调用总部接口，发开始上报请求通知
 * 
 * @author liuwx
 */
public class ReportRequest {

	private static final Logger LOG = LoggerFactory.getLogger(ReportRequest.class);

	public static final String success = "success";

	public static final String fail = "fail";

	public static final String xmlhead = "<?xml version=\"1.0\" encoding=\"gb2312\" ?> ";

	/**
	 * 总部调用省接口，省接口接收到请求之后，开始上报文件
	 * 
	 * @param bFlag
	 * @return
	 */
	public static String getDRS102out(Service_common common, boolean bFlag) {
		String returnStr = success;
		if (!bFlag)
			returnStr = fail;
		StringBuilder sb = new StringBuilder();
		sb.append(xmlhead);
		sb.append("<rnop_service_output_para>");
		sb.append("<service_instance>");
		sb.append("<service_id>DRS102</service_id>");
		sb.append("<version>R1</version>");
		sb.append("<service_name>文件获取请求</service_name>");
		sb.append("<service_desc>总部系统向省级系统要求上报数据文件,例如补报或文件查询等</service_desc>");
		sb.append("<service_content>");
		sb.append("<resultGetFileReq>" + returnStr + "</resultGetFileReq>");
		sb.append("</service_content>");
		sb.append("</service_instance>");
		sb.append("</rnop_service_output_para>");
		LOG.debug("返回DRS102状态报告" + sb.toString());
		return sb.toString();
	}

	/**
	 * 开始上报文件请求
	 */
	public static String beginReportRequest(DRS103service_content content) {
		StringBuilder sb = new StringBuilder();
		sb.append(xmlhead);
		sb.append("<rnop_service_input_para>");
		sb.append("<service_instance>");
		sb.append("<service_id>DRS103</service_id>");
		sb.append("<version>R1</version>");
		sb.append("<service_name>文件开始上报通知</service_name>");
		sb.append("<service_desc>指定获取的数据文件准备好开始上报通知</service_desc>");
		sb.append("<service_content>");
		sb.append("<DRS103service_content>");
		sb.append("<notifyid>" + content.notifyid + "</notifyid>");
		sb.append("<requestid>" + content.requestid + "</requestid>");

		sb.append("<sercaller>" + content.sercaller + "</sercaller>");
		sb.append("<domaintype>" + content.domaintype + "</domaintype>");
		sb.append("<filetype>" + content.filetype + "</filetype>");

		String fileGen = content.reportbeginTime;
		if (StringUtil.isNull(fileGen))
			fileGen = "";

		sb.append("<reportbeginTime>" + fileGen.replace("-", "/") + "</reportbeginTime>");
		sb.append("<readyfilenum>" + content.readyfilenum + "</readyfilenum>");
		sb.append("<fileinfolist>");

		TI ti = ReportTaskTrigger.getFtp();

		String ftp = "ftp://" + ti.getFtpIp() + ":" + ti.getFtpPort() + "/";

		for (FileInfoType info : content.fileinfolist) {
			sb.append("<fileinfo>");
			sb.append("<filename>" + info.getFileNameCompare() + "</filename>");
			sb.append("<filesize>" + info.getFileSize() + "</filesize>");
			sb.append("<fileextension>" + info.getFileFormat() + "</fileextension>");
			fileGen = info.getFileGeneration();
			if (StringUtil.isNull(fileGen))
				fileGen = "";

			sb.append("<filegeneratetime>" + fileGen.replace("-", "/") + "</filegeneratetime>");
			sb.append("<fileaddr>" + ftp + info.getFileMappingDir() + "/" + info.getFileNameCompare() + "</fileaddr>"); // ftp://202.11.34.21/相对目录名/

			sb.append("</fileinfo>");
		}
		sb.append("</fileinfolist>");
		sb.append("</DRS103service_content>");
		sb.append("</service_content>");
		sb.append("</service_instance>");
		sb.append("</rnop_service_input_para>");

		LOG.debug("上报请求DRS103," + sb.toString());

		ReportRequestService request = new ReportRequestService();
		String result = request.startReportData(content.domaintype, sb.toString());
		return result;
	}

	/**
	 * 开始上报文件请求
	 */
	public static String endReportRequest(DSR104service_content content) {
		StringBuilder sb = new StringBuilder();
		sb.append(xmlhead);
		sb.append("<rnop_service_input_para>");
		sb.append("<service_instance>");
		sb.append("<service_id>DRS104</service_id>");
		sb.append("<version>R1</version>");
		sb.append("<service_name>文件结束上报通知</service_name>");
		sb.append("<service_desc>指定获取的数据文件上报完成通知</service_desc>");
		sb.append("<service_content>");
		sb.append("<DRS104service_content>");

		sb.append("<notifyid>" + content.notifyid + "</notifyid>");

		sb.append("<requestid>" + content.requestid + "</requestid>");

		sb.append("<sercaller>" + content.sercaller + "</sercaller>");
		sb.append("<domaintype>" + content.domaintype + "</domaintype>");
		sb.append("<filetype>" + content.filetype + "</filetype>");
		sb.append("<uploadedfilenum>" + content.sucList.size() + "</uploadedfilenum>");
		sb.append("<unuploadedfilenum>" + content.failList.size() + "</unuploadedfilenum>");

		sb.append("<uploadedfileinfoList>");
		TI ti = ReportTaskTrigger.getFtp();

		String ftp = "ftp://" + ti.getFtpIp() + ":" + ti.getFtpPort() + "/";
		for (Uploadedfileinfo info : content.sucList) {
			sb.append("<fileinfo>");
			sb.append("<filename>" + info.filename + "</filename>");
			sb.append("<filesize>" + info.filesize + "</filesize>");
			sb.append("<fileextension>" + info.fileextension + "</fileextension>");

			String fileGen = info.filegeneratetime;
			if (StringUtil.isNull(fileGen))
				fileGen = "";

			sb.append("<filegeneratetime>" + fileGen.replace("-", "/") + "</filegeneratetime>");
			sb.append("<fileaddr>" + ftp + info.fileMappingDir + "/" + info.filename + "</fileaddr>"); // ftp://202.11.34.21/相对目录名/

			sb.append("</fileinfo>");
		}

		sb.append("</uploadedfileinfoList>");

		sb.append("<unuploadedfileinfoList>");

		for (Unuploadedfileinfo info : content.failList) {
			sb.append("<fileinfo>");
			sb.append("<filename>" + info.filename + "</filename>");
			sb.append("<filesize>" + info.filesize + "</filesize>");
			sb.append("<fileextension>" + info.fileextension + "</fileextension>");

			String fileGen = info.filegeneratetime;
			if (StringUtil.isNull(fileGen))
				fileGen = "";

			sb.append("<filegeneratetime>" + fileGen.replace("-", "/") + "</filegeneratetime>");
			sb.append("<fileaddr>" + ftp + info.fileMappingDir + "/" + info.filename + "</fileaddr>"); // ftp://202.11.34.21/相对目录名/

			sb.append("</fileinfo>");
		}

		sb.append("</unuploadedfileinfoList>");

		sb.append("</DRS104service_content>");
		sb.append("</service_content>");
		sb.append("</service_instance>");
		sb.append("</rnop_service_input_para>");
		LOG.debug("上报结束请求DRS104： " + sb.toString());

		ReportRequestService request = new ReportRequestService();
		String result = request.endReportData(content.domaintype, sb.toString());
		return result;
	}

	/**
	 * 出现异常时的异常消息通知
	 * 
	 * @return
	 */
	public static String getDRS105out() {

		StringBuilder sb = new StringBuilder();
		sb.append(xmlhead);
		sb.append("<rnop_service_output_para>");
		sb.append("<service_instance>");
		sb.append("<service_id>DRS105</service_id>");
		sb.append("<version>R1</version>");
		sb.append("<service_name>文异常通知</service_name>");
		sb.append("<service_desc>指定获取的数据文件准备异常或上报异常发生后通知，上报异常说明和异常原因</service_desc>");
		sb.append("<service_content>");
		sb.append("<resultnotify>success</resultnotify>");
		sb.append("</service_content>");
		sb.append("</service_instance>");
		sb.append("</rnop_service_output_para>");

		return sb.toString();
	}
}
