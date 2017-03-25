package cn.uway.webservice.managecontrol.dao;

import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.webservice.managecontrol.impl.DBPoolMgrDcs;
import cn.uway.webservice.managecontrol.impl.AddComplaintImpl;



/**
 * 网优申告数据接口
 * 见文档：湖北电信网优申告数据接口20141017.docx、个性化湖北_网优申告接口说明.docx
 * 
 * @author jiangl @ 2014年10月23日
 */
public  class AddComplaintDAOImpl   implements AddComplaintDAO {
	private static final Logger LOG = LoggerFactory.getLogger(AddComplaintDAOImpl.class);
	/**
	 * 获取到链接
	 * 
	 * @return Connection Connection
	 * @throws Exception
	 *             Exception
	 */
	protected Connection getConnection() throws Exception {
		return DBPoolMgrDcs.getConnection();
	}
	
	/**
	 * 导入数据
	 * @param xmlMap
	 * @return
	 * @throws Exception
	 */
	public	void insertData(HashMap<String,String> xmlMap) {
		int i=1;
		Connection conn = null;  
		  PreparedStatement stm =null;
		  BufferedReader reader = null;
		  
		  try{
			  
		  conn=getConnection();
		   conn.setAutoCommit(false);

		  String sql = "insert into  MOD_COMPLAINT("+
						"GENERATION_TYPE,SVC_ID,SVC_CITY_NAME,SVC_COUNTY_NAME,SVC_MOBILE,SVC_CUSTOMER"+
						",SVC_CONTACTER,SVC_CONTACT_PHONE,SVC_BUG_ADDRESS,SVC_CUSTOMER_TYPE,SVC_MEMBER_ATT"+
						",SVC_COMPLAINT_STATE,SVC_CRM_SYSNAME,SVC_COMPLAINT_CATEGORY,SVC_CONTROL_TYPE,SVC_PHENOMENA_TYPE"+
						",SVC_PHENOMENA_SUBTYPE,SVC_DETAILED_DESCRIPTION,SVC_PRO_INFORMATION,SVC_EMERGENCY_LEVEL,SVC_ACCEPT_TIME"+
						",SVC_EXPECT_CLOSED_TIME,SVC_IS_REVISIT,SVC_REVISIT_TIME,SVC_CUSTOMER_FEEDBACK,SVC_CUSTOMER_SATISFACTION,SVC_CLOSED_TIME,SVC_CLOSER"+
						",SVC_CLOSED_DESCRIPTION,COMPLAINT_SOURCE,insert_time) values(?,?,?,?,?,?" +
						",?,?,?,?,?" +
						",?,?,?,?,?" +
						",?,?,?,?,to_date(?,'yyyy-mm-dd  hh24:mi:ss')" +
						",to_date(?,'yyyy-mm-dd  hh24:mi:ss'),?,to_date(?,'yyyy-mm-dd  hh24:mi:ss'),?,?,to_date(?,'yyyy-mm-dd  hh24:mi:ss'),?,?,'综调',sysdate) ";
	  
		 conn.setAutoCommit(false);
		   stm = conn.prepareStatement(sql);
		   
		   stm.setInt(i++, Integer.parseInt(xmlMap.get("GENERATION_TYPE").toString()));
		   stm.setString(i++, xmlMap.get("SVC_ID").toString());
		   stm.setString(i++, xmlMap.get("SVC_CITY_NAME").toString());
		   stm.setString(i++, xmlMap.get("SVC_COUNTY_NAME").toString());
		   stm.setString(i++, xmlMap.get("SVC_MOBILE").toString());
		   stm.setString(i++, xmlMap.get("SVC_CUSTOMER").toString());
		   stm.setString(i++, xmlMap.get("SVC_CONTACTER").toString());
		   stm.setString(i++, xmlMap.get("SVC_CONTACT_PHONE").toString());
		   stm.setString(i++, xmlMap.get("SVC_BUG_ADDRESS").toString());
		   stm.setString(i++, xmlMap.get("SVC_CUSTOMER_TYPE").toString());
		   stm.setString(i++, xmlMap.get("SVC_MEMBER_ATT").toString());
		   stm.setString(i++, xmlMap.get("SVC_COMPLAINT_STATE").toString());
		   stm.setString(i++, xmlMap.get("SVC_CRM_SYSNAME").toString());
		   stm.setString(i++, xmlMap.get("SVC_COMPLAINT_CATEGORY").toString());
		   stm.setString(i++, xmlMap.get("SVC_CONTROL_TYPE").toString());
		   stm.setString(i++, xmlMap.get("SVC_PHENOMENA_TYPE").toString());
		   stm.setString(i++, xmlMap.get("SVC_PHENOMENA_SUBTYPE").toString());
		   stm.setString(i++, xmlMap.get("SVC_DETAILED_DESCRIPTION").toString());
		   stm.setString(i++, xmlMap.get("SVC_PRO_INFORMATION").toString());
		   stm.setString(i++, xmlMap.get("SVC_EMERGENCY_LEVEL").toString());
		   stm.setString(i++, xmlMap.get("SVC_ACCEPT_TIME").toString());
		   stm.setString(i++, xmlMap.get("SVC_EXPECT_CLOSED_TIME").toString());
		   stm.setString(i++, xmlMap.get("SVC_IS_REVISIT").toString());
		   stm.setString(i++, xmlMap.get("SVC_REVISIT_TIME").toString());
		   stm.setString(i++, xmlMap.get("SVC_CUSTOMER_FEEDBACK").toString());
		   stm.setString(i++, xmlMap.get("SVC_CUSTOMER_SATISFACTION").toString());
		   
		   stm.setString(i++, xmlMap.get("SVC_CLOSED_TIME").toString());
		   
		   stm.setString(i++, xmlMap.get("SVC_CLOSER").toString());
		   stm.setString(i++, xmlMap.get("SVC_CLOSED_DESCRIPTION").toString());


			stm.executeUpdate();
			conn.commit();
			xmlMap.remove("return_status");
		     xmlMap.remove("info");
		     xmlMap.put("return_status", "1");
		     xmlMap.put("info", "成功");
			
		  }catch(Exception e){
			  LOG.error("网优申告数据接口  数据插入 异常："+e);
			  xmlMap.remove("return_status");
			     xmlMap.remove("info");
			     xmlMap.put("return_status", "2");
			     xmlMap.put("info", "数据有问题");
		  }finally{
			  DBUtil.close(null, stm, conn); 
		  }
			  
		     
		
	}
	

	 

	 
}
