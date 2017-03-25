package com.unicom.ucloud.service.changnotice;

import java.math.BigDecimal;

import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.MsgHeader;
import com.unicom.ucloud.service.InputParameter;
import com.unicom.ucloud.service.UcloudBusiness;
import com.unicom.ucloud.service.dao.ESB_SFWNOS_SFWNOS_00005_DAO;
import com.unicom.ucloud.util.Arith;

/**
 * ESB_SFWNOS_SFWNOS_00005导入资源变更通知信息服务.doc<br>
 * 
 * <pre>
 * 	服务标识	ESB_SFWNOS_SFWNOS_00005
 * 	服务名称	导入资源变更通知信息服务(ESB_SFWNOS_SFWNOS_ImportResChangeNoticeInfoSrv)
 * 	服务描述	本服务被“导入资源变更通知信息路由服务”调用，提供将资源管理系统中资源变更通知消息同步到各网管系统的能力
 * 	服务类型	0  读出  1  写入  0 读出写入
 * 	
 * 	同步/异步方式	1  同步  0  异步
 * 	
 * 	实现方式	1  WebService  0 JMS  0 ODI
 * 	
 * 	业务场景说明	资源管理系统中资源变更时，资源使用本服务将变更通知信息传递到各网管系统
 * 	业务规则和逻辑	资源管理系统根据变更类型确定消息通知类型，传入不同的通知信息
 * 	出错和异常处理机制	无
 * 	数据量	约200KB，200次/天
 * 	响应时间要求	实时调用，调用时间<5秒
 * 	服务安全和权限要求	无
 * 	使用建议	无
 * 
 * </pre>
 * 
 * @author liuwx
 */
public class ESBSFTNMSSFTNMSImportResChangeNoticeInfoSrvBusiness extends UcloudBusiness {

	@SuppressWarnings("unchecked")
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse process(ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest reqest) throws Exception {
		MsgHeader header = reqest.getMsgHeader();
		Long startIndex = 0l;

		BigDecimal pageSizeReq = pageSize;
		if (header != null) {
			if (header.getPAGESIZE() != null && !"".equals(header.getPAGESIZE().toString())) {
				pageSizeReq = header.getPAGESIZE();
			}

			if (header.getCURRENTPAGE() != null) {
				currPage = header.getCURRENTPAGE();
			}

			startIndex = Long.valueOf(currPage.toString());

			total_record = header.getTOTALRECORD();

			if (total_record != null) {

				double d = Arith.div(Double.parseDouble(total_record.toString()), Double.parseDouble(pageSizeReq.toString()));

				totalPage = new BigDecimal(d);
			}
		}
		ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection inputCollection = reqest
				.getESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection();

		InputParameter inputParameter = new InputParameter();
		inputParameter.setHeader(header);
		inputParameter.setInputCollection(inputCollection);

		ESB_SFWNOS_SFWNOS_00005_DAO dao = new ESB_SFWNOS_SFWNOS_00005_DAO();
		dao.setInputParameter(inputParameter);

		ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse response = new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse();
		response = dao.parser(reqest);

		response.setInstanceId(new BigDecimal(1));

		System.out.println("end impl ");
		// // end do

		return response;

	}
}
