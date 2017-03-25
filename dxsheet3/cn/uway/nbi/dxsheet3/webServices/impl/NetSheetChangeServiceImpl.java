package cn.uway.nbi.dxsheet3.webServices.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.axis.MessageContext;
import org.apache.axis.transport.http.HTTPConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareDao;
import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;
import cn.uway.nbi.dxsheet3.util.Util;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

public class NetSheetChangeServiceImpl implements NetSheetChangeService {

	private static Logger log = LoggerFactory.getLogger(NetSheetChangeServiceImpl.class);

	/**
	 * 状态变更
	 */
	public String statusChange(String statusPara) {

		log.debug("状态" + statusPara);

		SheetDeclareDao declareDao = new SheetDeclareDao();
		SendOrdersConfig orderConfig = SendOrdersConfig.getInstance();
		StringBuffer sb = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><Service>");
		boolean isSuccess = true;

		// 读取状态变更的信息
		Map<String, String> returnparaMap = new HashMap<String, String>(orderConfig.getReturnparaMap()); // 配置文件中
		Map<String, String> eomsMap = new HashMap<String, String>(); // 配置文件中eoms_开头
		Map<String, String> eomsRetMap = new HashMap<String, String>(); // 返回字段
		try {
			PropertiesXML xml = new PropertiesXML(statusPara, 0);
			for (Entry<String, String> element : returnparaMap.entrySet()) {
				// eoms_标志是返回给EOMS调用的信息
				if (element.getKey().startsWith("eoms_")) {
					eomsMap.put(element.getKey(), element.getValue());
					eomsRetMap.put(element.getValue(), null);
				}

				returnparaMap.put(element.getKey(), xml.getProperty(element.getValue()));
			}

			// 母工单编号
			String faultCode = returnparaMap.get("ret_data_faultCode");
			String ret_data_type = returnparaMap.get("ret_data_type");
			eomsRetMap.put(eomsMap.get("eoms_faultCode"), faultCode);
			eomsRetMap.put(eomsMap.get("eoms_dCreateTime"), SendOrdersConfig.getDf().format(Calendar.getInstance().getTime()));

			// 判断验证消息
			String eomsAuthKey = orderConfig.getEomsAuthKey(getClientIp());
			String md5eomsAuthKey = Util.getMd5Encrypt(eomsAuthKey);
			if (!md5eomsAuthKey.equalsIgnoreCase(returnparaMap.get("ret_auth_authKey"))) {
				String resultDesc = "认证信息验证失败，认证信息为{NetOp}，EOMS计算key值为{EOMS}，NOAP计算key值为{NOAP}";

				resultDesc = resultDesc.replace("{EOMS}", md5eomsAuthKey);
				resultDesc = resultDesc.replace("{NOAP}", returnparaMap.get("ret_auth_authKey"));
				resultDesc = resultDesc.replace("{NetOp}", eomsAuthKey);
				eomsRetMap.put(eomsMap.get("eoms_resultDesc"), resultDesc);
				isSuccess = false;
			} else {
				// 判断母工单编号是否存在
				String orderid = declareDao.checkFaultCodeExists(faultCode);
				String resultDesc = null;
				if (orderid != null && orderid.trim().length() >= 1) {
					returnparaMap.put("faultCode", faultCode);

					// 状态
					SheetDeclareParameter parameter = new SheetDeclareParameter();
					parameter.endState = orderConfig.getOrderStateMap().get(ret_data_type);
					parameter.orderid = orderid;
					parameter.mark = ret_data_type;
					parameter.shelfLife = "0";

					parameter.faultCode = returnparaMap.get("faultCode");
					parameter.dCreateTime = returnparaMap.get("dCreateTime") == null ? SendOrdersConfig.getDf().format(
							Calendar.getInstance().getTime()) : returnparaMap.get("dCreateTime");

					int retVal = declareDao.accessWebComplaintStatu(parameter);
					isSuccess = retVal > 0;

					resultDesc = "故障单状态同步成功";
					returnparaMap.put("resultDesc", resultDesc);
					parameter.resultDesc = resultDesc;

					// 写日志
					declareDao.saveAccessLog(parameter);

					String[] obj = {"statusChange", orderid, parameter.faultCode, parameter.endState, parameter.resultDesc, parameter.dCreateTime};
					log.debug("{}接口处理完成,我们工单编号{},母工单号={},状态={},结果描述={},交互时间={}.", obj);

				} else {
					resultDesc = "查无此母工单编号 = " + faultCode;
					isSuccess = false;
				}

				eomsRetMap.put(eomsMap.get("eoms_resultDesc"), resultDesc);
			}

			eomsRetMap.put(eomsMap.get("eoms_isSuccess"), isSuccess ? "1" : "0");
		} catch (CfgException e) {
		}

		// 组装返回标签
		String ret = "<key>value</key>";
		for (Entry<String, String> element : eomsRetMap.entrySet()) {
			sb.append(ret.replace("key", element.getKey()).replace("value", element.getValue()));
		}
		sb.append("</Service>");

		log.debug("关键状态变更返回结果{}", sb);

		return sb.toString();
	}

	private String getClientIp() {
		HttpServletRequest request = null;
		try {

			MessageContext mc = null;

			mc = MessageContext.getCurrentContext();
			if (mc == null) {
				return null;
			}

			request = (HttpServletRequest) mc.getProperty(HTTPConstants.MC_HTTP_SERVLETREQUEST);
		} catch (Exception e) {
		}
		if (null == request) {
			return null;
		}
		return request.getRemoteAddr();
	}
}
