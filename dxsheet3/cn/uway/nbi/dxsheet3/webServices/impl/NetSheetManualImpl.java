package cn.uway.nbi.dxsheet3.webServices.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.axis.MessageContext;
import org.apache.axis.transport.http.HTTPConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareDao;
import cn.uway.nbi.dxsheet3.task.OrdersComplaint;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;

public class NetSheetManualImpl {

	private static Logger log = LoggerFactory.getLogger(NetSheetManualImpl.class);

	/**
	 * 手工派单
	 * 
	 * @param orderid
	 * @return
	 */
	public String manualControlOrder(String orderid) {
		log.debug("手工派单_" + getClientIp() + "_" + orderid);

		String ret = null;

		if (orderid != null && orderid.trim().length() >= 1) {

			String temp[] = orderid.split("_");
			if (temp[0].equalsIgnoreCase(System.getProperty("eoms_uway_op"))) {
				orderid = temp[1];

				Map<String, Map<String, String>> manualMap = OrdersComplaint.myscannerQueue;
				if (manualMap != null && manualMap.containsKey(orderid)) {
					ret = "该单据{orderid}已经在自动派单的队列中,不能通过手工派单!";
				} else {
					SheetDeclareDao declareDao = new SheetDeclareDao();
					int count = declareDao.findComplaintManualData(SendOrdersConfig.getInstance().getOrdersTemplate(), manualMap,
							OrdersComplaint.mykeyVec, orderid, 1);
					if (count == 0) {
						ret = "该单据{orderid}在数据库不存在，或者已经派出去了，请检查一下!";
					} else {
						ret = "该单据{orderid}已经添加到派单队列中!";
					}
				}
			} else {
				ret = "格式不正确!";
			}
		} else {
			orderid = "";
			ret = "您传过来的单据编号为null!";
		}

		ret = ret.replace("{orderid}", orderid);

		log.debug(ret);

		return ret;
	}

	/**
	 * 通知工作,申报和恢复用不同的参数区分
	 * 
	 * @param autoKey
	 * @return
	 */
	public String noticOrder(String autoKey) {
		log.debug("通知工作_" + getClientIp() + "_" + autoKey);
		String ret = "失败";
		if (autoKey == null) {
			return ret;
		}

		String temp[] = autoKey.split("_");
		if (temp[0].equalsIgnoreCase(System.getProperty("eoms_uway_op"))) {
			autoKey = temp[1];

			Integer or = SendOrdersConfig.threadCountMap.get(autoKey);
			if (or == null) {
				return ret;
			}

			SendOrdersConfig.threadCountMap.put(autoKey, or + 1);
			return "成功";
		}

		return ret;
	}

	/**
	 * 接口验证
	 * 
	 * @param autokey
	 * @return
	 */
	public String checkOrder(String autokey) {
		log.debug("接口验证_" + getClientIp() + "_" + autokey);
		if (autokey == null) {
			return null;
		}

		String temp[] = autokey.split("_");
		if (temp[0].equalsIgnoreCase(System.getProperty("eoms_uway_op")))
			return "OK";

		return null;
	}

	/**
	 * 获取客户端IP
	 * 
	 * @return
	 */
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
