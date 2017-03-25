package cn.uway.nbi.dxsheet3.task;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

/**
 * 工单恢复
 * 
 * @author Administrator
 */
public class OrdersConfirmNotice extends OrdersSend {

	private static Logger log = LoggerFactory.getLogger(OrdersConfirmNotice.class);

	private int maxSize = Integer.parseInt(System.getProperty("eoms_confirmNotice", "5000"));

	protected Integer SPOOL_THREAD_DB_INTERVAL = 60 * 1000;

	protected Integer countTime = 1;

	public void initOrders() {
		dbputsize = new Double(maxSize * 0.5).intValue();// 预留一般为数据库查询所用
		threadname = "confirmNotice";

		scannerQueue = new ConcurrentHashMap<String, Map<String, String>>(maxSize);
		keyVec = new ConcurrentHashMap<String, Boolean>();
	}

	/**
	 * 处理WEB调用返回信息
	 */
	public void opWebResult(String retXml, String orderid, Map<String, String> order) {
		log.debug(retXml);
		try {
			PropertiesXML xml = new PropertiesXML(retXml, 0);
			Map<String, String> returnparaMap = new HashMap<String, String>(orderConfig.getReturnparaMap());

			for (Entry<String, String> el : returnparaMap.entrySet()) {
				returnparaMap.put(el.getKey(), xml.getProperty(el.getValue()));
			}

			SheetDeclareParameter parameter = new SheetDeclareParameter();
			parameter.orderid = orderid;

			String isSuccess = returnparaMap.get("isSuccess");
			if (isSuccess != null && isSuccess.trim().equals("1")) {
				if (order.get("iIsRecovery").equals("1")) {
					parameter.endState = "结单";
					parameter.mark = "7";
					parameter.shelfLife = "0";
				} else {
					parameter.endState = "处理中";
					parameter.mark = "5";
					parameter.shelfLife = "0";
				}

				parameter.faultCode = returnparaMap.get("faultCode");
				parameter.dCreateTime = returnparaMap.get("dCreateTime") == null
						? SendOrdersConfig.getDf().format(Calendar.getInstance().getTime())
						: returnparaMap.get("dCreateTime");
				parameter.resultDesc = returnparaMap.get("resultDesc");

				String[] obj = {threadname, orderid, parameter.faultCode, parameter.endState, parameter.resultDesc, parameter.dCreateTime};

				log.debug("{}接口调用完成,我们工单编号={},母工单号={},状态={},结果描述={},交互时间={}.", obj);
				sheetDeclareDao.accessWebComplaintStatu(parameter);

				sheetDeclareDao.saveAccessLog(parameter);
			} else {
				parameter.endState = "通知失败";
				parameter.mark = "4";
				parameter.resultDesc = returnparaMap.get("resultDesc");
				// parameter.shelfLife = "shelf_life + 1";

				log.debug("{}接口调用失败,原因{}...", threadname, returnparaMap.get("resultDesc"));
				sheetDeclareDao.saveAccessLog(parameter);
			}

			returnparaMap.clear();
		} catch (CfgException e) {
			log.debug("{}返回结果处理异常...", threadname, e);
		}
	}

	public Map<String, String> getMyorder() {
		return SendOrdersConfig.getInstance().getConfirmNoticeMap();
	}

	public int findSheetData(int needsize) {
		return sheetDeclareDao.findConfirmNoticeData(getMyorder(), scannerQueue, keyVec, needsize);
	}

	/**
	 * 发送工单
	 */
	public String accessWebface(String confirmPara, String orderkey, Map<String, String> order) throws Exception {
		String retXml = null;
		try {
			saveEomslog(orderkey);
			retXml = netOptimizeService.confirmNotice(confirmPara);;
		} catch (Exception e) {
			// keyVec.remove(orderkey); //
			throw e;
		}
		return retXml;
	}

	/**
	 * 等待
	 */
	public void waitScannerDb(int retCount, AccessScannerDb accessScannerDb2) {

		try {
			accessScannerDb2.wait(SPOOL_THREAD_DB_INTERVAL);
		} catch (InterruptedException e) {
		}

		// 当查询出来的条数为0，且待发工单数为0，且已经发送成功工单数为0
		if (retCount == 0 && scannerQueue.size() == 0 && keyVec.size() == 0) {
			countTime = countTime * 2;
			SPOOL_THREAD_DB_INTERVAL = 60 * 1000 * countTime;
		} else {
			SPOOL_THREAD_DB_INTERVAL = 60 * 1000;
			countTime = 1;
		}
	}

	@Override
	public void notifyScannerMyDb(AccessScannerDb accessScannerDb2) {
		// log.debug(threadname + "活动状态{},等待时间{}分钟!", isActive, countTime);
		SPOOL_THREAD_DB_INTERVAL = 60 * 1000;
		countTime = 1;
		accessScannerDb2.notify();
		log.debug("成功叫醒了" + threadname);
	}

}
