package com.unicom.ucloud.service.changnotice;

import java.math.BigDecimal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvRequest;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.ESBSFWNOSSFWNOSInquiryResInfoSrvResponse;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.MsgHeader;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.OutputFieldCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.QueryConditionCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.SortFieldCollection;
import com.unicom.ucloud.service.InputParameter;
import com.unicom.ucloud.service.ServiceMgr;
import com.unicom.ucloud.service.UcloudBusiness;
import com.unicom.ucloud.util.Arith;

public class ESBSFWNOSSFWNOSInquiryResInfoSrvImplBusiness extends UcloudBusiness {

	private static final Logger LOG = LoggerFactory.getLogger(ESBSFWNOSSFWNOSInquiryResInfoSrvImplBusiness.class);

	/**
	 * 资源查询业务处理方法
	 * 
	 * @param request对象
	 *            ,携带客户端的相关参数
	 * @return ESBSFWNOSSFWNOSInquiryResInfoSrvResponse 对象，进行业务处理后，组装成相关对象并进行返回
	 * @throws Exception
	 *             出现错误抛出异常
	 */
	public ESBSFWNOSSFWNOSInquiryResInfoSrvResponse process(ESBSFWNOSSFWNOSInquiryResInfoSrvRequest request) throws Exception {
		ESBSFWNOSSFWNOSInquiryResInfoSrvResponse response = new ESBSFWNOSSFWNOSInquiryResInfoSrvResponse();

		MsgHeader header = request.getMsgHeader();
		Long startIndex = 1l;
		BigDecimal pageSizeReq = pageSize;

		if (header != null) {
			if (header.getPAGESIZE() != null && !"".equals(header.getPAGESIZE().toString())) {
				pageSizeReq = header.getPAGESIZE();
				pageSize = pageSizeReq;
			}

			if (header.getCURRENTPAGE() != null && !"".equals(header.getCURRENTPAGE().toString())) {
				currPage = header.getCURRENTPAGE();
			}

			startIndex = Long.valueOf(currPage.toString());

			response.setCURRENTPAGE(this.currPage);

			total_record = header.getTOTALRECORD();

			if (total_record != null && pageSizeReq != null) {
				double d = Arith.div(Double.parseDouble(total_record.toString()), Double.parseDouble(pageSizeReq.toString()));
				totalPage = new BigDecimal(d);
			}
		}

		QueryConditionCollection query_Condition_Collection = request.getQueryConditionCollection();

		SortFieldCollection sort_Field_Collection = request.getSortFieldCollection();
		OutputFieldCollection outputfieldcollection = request.getOutputFieldCollection();

		InputParameter inputParameter = new InputParameter();
		inputParameter.setHeader(header);
		inputParameter.setInputCollection(request);

		ServiceMgr serviceMgr = ServiceMgr.getInstance();

		String entityName = request.getEntityName();

		List<ESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection> resultList = serviceMgr.process(response, entityName, query_Condition_Collection,
				sort_Field_Collection, outputfieldcollection, startIndex, Long.valueOf(pageSizeReq.toString()));

		request.setOutputFieldCollection(outputfieldcollection);
		request.setQueryConditionCollection(query_Condition_Collection);
		request.setSortFieldCollection(sort_Field_Collection);

		response.getESBSFWNOSSFWNOSInquiryResInfoSrvOutputCollection().addAll(resultList);
		response.setPAGESIZE(pageSizeReq);

		LOG.info(response.getSERVICEMESSAGE());

		return response;

	}

}
