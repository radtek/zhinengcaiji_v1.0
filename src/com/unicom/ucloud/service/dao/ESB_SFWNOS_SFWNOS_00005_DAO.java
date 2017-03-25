package com.unicom.ucloud.service.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.xml.datatype.XMLGregorianCalendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;

import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ErrorCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ErrorItem;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.MsgHeader;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ResponseCollection;
import com.unicom.ucloud.esb_sfwnos_sfwnos_importreschangenoticeinfosrv.ResponseItem;
import com.unicom.ucloud.service.changnotice.MessageParser;
import com.unicom.ucloud.util.CalendarConverUtil;
import com.unicom.ucloud.util.SeqGen;

/**
 * 导入资源变更通知信息服务DAO实现类
 * 
 * @author liuwx
 */
public class ESB_SFWNOS_SFWNOS_00005_DAO extends DAO {

	private ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection inputCollection;

	private MsgHeader header;

	private static final Logger LOG = LoggerFactory.getLogger(ESB_SFWNOS_SFWNOS_00005_DAO.class);

	/**
	 * 导入资源变更通知信息服务 解析处理类
	 * 
	 * @param reqest
	 *            导入资源变更通知信息服务 请求
	 * @return 导入资源变更通知信息服务 响应
	 */
	@SuppressWarnings("unused")
	public ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse parser(ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvRequest reqest) {
		ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse response = new ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvResponse();
		ErrorCollection errorList = new ErrorCollection();
		String flag = "TRUE";
		String serviceMessage = "外部应用调用 ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv 成功";
		List<ResponseCollection> responseCollection = new ArrayList<ResponseCollection>();
		try {
			header = (MsgHeader) this.inputParameter.getHeader();

			inputCollection = (ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputCollection) inputParameter.getInputCollection();

			if (header != null) {
				String source_app_id = header.getSOURCEAPPID();
				String source_app_name = header.getSOURCEAPPNAME();
				String source_mod_id = header.getSOURCEMODID();
				String source_mod_name = header.getSOURCEMODNAME();
				String target_mod_name = header.getTARGETMODNAME();
				String token = header.getTOKEN();
				String userid = (header.getUSERID() == null ? "" : header.getUSERID().toString());
				String username = header.getUSERNAME();
				XMLGregorianCalendar calendar = header.getSUBMITDATE();

				String submitdate = (calendar == null ? "" : DateUtil.getDateString(CalendarConverUtil.convertToDate(calendar)));
				BigDecimal page_size = header.getPAGESIZE();
				BigDecimal current_page = header.getCURRENTPAGE();
				BigDecimal total_record = header.getTOTALRECORD();
				String province_code = header.getPROVINCECODE();
				String environment_name = header.getENVIRONMENTNAME();
			}

			// 解析notice xml ，并进行入库.涉及到插入，更新操作。
			MessageParser parser = new MessageParser();
			List<ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem> itemList = inputCollection
					.getESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem();
			for (ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrvInputItem item : itemList) {
				String type = null;
				String prikey = null;
				String noticeXml = null;
				try {
					type = item.getNOTICETYPE();
					prikey = item.getPRIKEY();

					noticeXml = item.getNOTICEXML();

					parser.parser(prikey, type, noticeXml);

					ResponseCollection res = new ResponseCollection();
					ResponseItem ritem = new ResponseItem();
					ritem.setPRIKEY(prikey);
					ritem.setREQUESTID(SeqGen.getInstance().getSeq());

					res.getResponseItem().add(ritem);
					responseCollection.add(res);

				} catch (Exception e) {
					flag = "FALSE";
					ErrorItem errorItem = new ErrorItem();
					errorItem.setENTITYNAME("AlarmOrdStaInfo");
					errorItem.setPRIKEY(prikey);
					errorItem.setERRORMESSAGE("解析NOTICE XML 信息失败");
					errorList.getErrorItem().add(errorItem);

					LOG.error("ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv 出现异常" + noticeXml, e);

				}
			}
		} catch (Exception e) {
			flag = "FALSE";
			LOG.error("ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv 出现异常", e);
			serviceMessage = "ESBSFWNOSSFWNOSImportResChangeNoticeInfoSrv 出现异常,原因:" + e;
		} finally {

			response.setSERVICEMESSAGE(serviceMessage);
			response.setInstanceId(new BigDecimal(1));
			response.getErrorCollection().add(errorList);
			response.getResponseCollection().addAll(responseCollection);
			response.setSERVICEFLAG(flag);
		}
		return response;

	}

}
