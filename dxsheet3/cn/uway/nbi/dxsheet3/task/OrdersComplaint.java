package cn.uway.nbi.dxsheet3.task;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;
import cn.uway.nbi.dxsheet3.email.EmailPojo;
import cn.uway.nbi.dxsheet3.email.SmcServiceMgr;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;
import cn.uway.nbi.dxsheet3.util.SerializeDiskFile;
import cn.uway.nbi.util.PropertiesXML;

/**
 * 工单申报
 * 
 * @author Administrator
 */
public class OrdersComplaint extends OrdersSend {

	private static Logger log = LoggerFactory.getLogger(OrdersComplaint.class);

	private int maxSize = Integer.parseInt(System.getProperty("eoms_complaint", "10000"));

	public static Map<String, Map<String, String>> myscannerQueue;

	public static Map<String, Boolean> mykeyVec;

	protected Integer SPOOL_THREAD_DB_INTERVAL = 60 * 1000;

	protected Integer countTime = 1;

	private Integer maxsb = Integer.parseInt(System.getProperty("eoms_max_complaint", "100"));

	private Map<String, Integer> mapfaultstarttime;

	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	private final String eoms_mapfaultstarttime = "eoms_mapfault_starttime";

	public void initOrders() {
		threadname = "complaint";
		dbputsize = new Double(maxSize * 0.5).intValue();// 预留一般为数据库查询所用

		// 读取序列化文件，记录的每天发生送条数
		mapfaultstarttime = (Map<String, Integer>) SerializeDiskFile.getInstance().readSerialize(eoms_mapfaultstarttime);
		if (mapfaultstarttime == null) {
			mapfaultstarttime = new ConcurrentHashMap<String, Integer>(); // 某天发送工单数
		} else {
			// 获取60天之前的时间
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - 60);
			long befortime = cal.getTimeInMillis();
			// 去除超量的数据和60天之前的数据，假设已经处理好了
			for (Entry<String, Integer> element : mapfaultstarttime.entrySet()) {
				try {
					if (element.getValue() > maxsb || df.parse(element.getKey()).getTime() < befortime) {
						mapfaultstarttime.remove(element.getKey());
					}
				} catch (ParseException e) {
					log.error("时间转换异常.", e);
				}
			}
		}

		scannerQueue = new ConcurrentHashMap<String, Map<String, String>>(maxSize); // 待用数据Map
		myscannerQueue = scannerQueue;
		keyVec = new ConcurrentHashMap<String, Boolean>();
		mykeyVec = keyVec;
	}

	/**
	 * 处理WEB调用结果信息
	 */
	public void opWebResult(String retXml, String orderid, Map<String, String> order) {
		try {
			log.debug(retXml);
			PropertiesXML xml = new PropertiesXML(retXml, 0);
			Map<String, String> returnparaMap = new HashMap<String, String>(orderConfig.getReturnparaMap());

			for (Entry<String, String> el : returnparaMap.entrySet()) {
				returnparaMap.put(el.getKey(), xml.getProperty(el.getValue()));
			}

			SheetDeclareParameter parameter = new SheetDeclareParameter();
			parameter.orderid = orderid;
			parameter.faultCode = returnparaMap.get("faultCode");
			parameter.dCreateTime = returnparaMap.get("dCreateTime") == null
					? SendOrdersConfig.getDf().format(Calendar.getInstance().getTime())
					: returnparaMap.get("dCreateTime");
			parameter.resultDesc = returnparaMap.get("resultDesc");

			String isSuccess = returnparaMap.get("isSuccess");
			if (isSuccess != null && isSuccess.trim().equals("1")) {
				parameter.endState = "处理中";
				parameter.mark = "5";
				parameter.shelfLife = "0";

				sheetDeclareDao.accessWebComplaintStatu(parameter);

				sheetDeclareDao.saveAccessLog(parameter);
			} else {
				parameter.endState = "派单失败";
				parameter.mark = "6";
				parameter.shelfLife = "shelf_life + 1";

				log.debug("{}接口调用失败,原因{}...", threadname, returnparaMap.get("resultDesc"));

				sheetDeclareDao.accessWebComplaintStatu(parameter);

				sheetDeclareDao.saveAccessLog(parameter);
			}

			String[] obj = {threadname, orderid, parameter.faultCode, parameter.endState, parameter.resultDesc, parameter.dCreateTime};
			log.debug("{}接口处理完成,我们工单编号{},母工单号={},状态={},结果描述={},交互时间={}.", obj);

			returnparaMap.clear();
			// keyVec.put(orderid, true); // 使用完成
		} catch (Exception e) {
			log.debug("{}返回结果处理异常...", threadname, e);

		}
		// log.debug("{}处理成功...",threadname);
	}

	public Map<String, String> getMyorder() {
		return SendOrdersConfig.getInstance().getOrdersTemplate();
	}

	/**
	 * 查找工单数据
	 */
	public int findSheetData(int needsize) {
		return sheetDeclareDao.findComplaintData(getMyorder(), scannerQueue, keyVec, needsize);
	}

	/**
	 * 发送工单
	 */
	public String accessWebface(String xmlPara, String orderkey, Map<String, String> order) throws Exception {
		// orderid = 66201041080920010358200yyyyMMdd1，取出时间
		// String orderid = orderkey.trim();
		String faultstarttime = order.get("starttime");
		// 自动派单
		if (faultstarttime != null) {
			faultstarttime = faultstarttime.length() >= 10 ? faultstarttime.substring(0, 10) : faultstarttime;
			Integer nowcount = mapfaultstarttime.get(faultstarttime);
			if (nowcount != null) {
				nowcount++;
				mapfaultstarttime.put(faultstarttime, nowcount);
			} else {
				mapfaultstarttime.put(faultstarttime, 1);
			}

			// 序列化磁盘
			SerializeDiskFile.getInstance().saveSerialize(mapfaultstarttime, eoms_mapfaultstarttime);

			if (webactive && mapfaultstarttime.get(faultstarttime) <= maxsb) {

				String retXml = null;
				try {
					saveEomslog(orderkey);
					retXml = netOptimizeService.complaint(xmlPara);
				} catch (Exception e) {
					// keyVec.remove(orderkey); //
					nowcount = mapfaultstarttime.get(faultstarttime);
					mapfaultstarttime.put(faultstarttime, --nowcount); // 发送异常原来的基础上减一
					throw e;
				}
				return retXml;

			} else {
				sendmail(faultstarttime);

				System.exit(1);
				return null;
			}
		} else
		// 手动派单不走限制流程
		{
			return netOptimizeService.complaint(xmlPara);
		}
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

	/**
	 * 通知
	 */
	public void notifyScannerMyDb(AccessScannerDb accessScannerDb2) {
		accessScannerDb2.notify();
		SPOOL_THREAD_DB_INTERVAL = 60 * 1000;
		countTime = 1;
		log.debug("成功叫醒了" + threadname);
	}

	/**
	 * 发送邮件
	 * 
	 * @param count
	 * @param key
	 */
	private int sendmail(String key) {
		EmailPojo email = new EmailPojo();
		String smcTitle = "电信二期故障申告工单告警发生时间" + key + "已经超过上限" + maxsb + "，请处理！";
		email.setSmcTitle(smcTitle);

		StringBuffer content = new StringBuffer();
		content.append("大家好!");
		content.append("<br>&nbsp;&nbsp;");
		content.append("按照约定，电信二期每天发送故障申告工单数不能超过<span style=\"color:red\">" + maxsb + "</span>，");
		content.append("<br>&nbsp;&nbsp;");
		content.append("告警发生时间<span style=\"color:red\">" + key + "</span>，其故障数已经超出了上限，程序已经处理了最大上限数<span style=\"color:red\">" + maxsb
				+ "</span>，还有部分未处理。");
		content.append("<br>&nbsp;&nbsp;");
		content.append("NBI程序现已经停止，请及时处理，处理完后请手动启动程序。");
		content.append("<br>");
		content.append("谢谢！");

		String touser = System.getProperty("eoms_user_email");
		email.setTousers(touser);
		email.setSendWay(2);
		email.setContent(content.toString());

		int retVal = -1;
		try {
			retVal = SmcServiceMgr.getInitialize().sendEomsEmail(email);
			log.debug("电信二期异常通知，邮件发送成功！邮件内容：{}", email.getContent());
		} catch (Exception e) {
			log.debug("电信二期异常通知，邮件发送成功！邮件内容：{}", email.getContent(), e);
		}

		log.debug("电信二期邮件发送{}.", retVal == 0 ? "成功" : "失败" + retVal);

		email = null;
		return retVal;
	}
}
