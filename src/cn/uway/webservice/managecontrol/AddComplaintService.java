package cn.uway.webservice.managecontrol;

/**
 * 网优申告数据接口
 * 见文档：湖北电信网优申告数据接口20141017.docx、个性化湖北_网优申告接口说明.docx
 * 
 * @author jiangl @ 2014年10月23日
 */
public interface AddComplaintService {

 
	/**
	 * 接收 网优申告数据
	 * @param xmlString  接收的参数为 XML格式的String
	 * @return  String  是否成功
	 */
	String getComplaint(String xmlString);

	}
