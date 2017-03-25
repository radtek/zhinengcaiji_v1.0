package cn.uway.webservice.managecontrol.dao;

import java.util.HashMap;
import java.util.List;

/**
 * 网优申告数据接口
 * 见文档：湖北电信网优申告数据接口20141017.docx、个性化湖北_网优申告接口说明.docx
 * 
 * @author jiangl @ 2014年10月23日
 */
public interface AddComplaintDAO {

	/**
	 * 导入数据
	 * @param xmlMap
	 * @return
	 * @throws Exception
	 */
public	void insertData(HashMap<String,String> xmlMap) ;

	 
}
