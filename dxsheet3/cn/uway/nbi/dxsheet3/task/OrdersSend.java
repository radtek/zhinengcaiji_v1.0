package cn.uway.nbi.dxsheet3.task;

import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareDao;
import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;
import cn.uway.nbi.dxsheet3.extfaces.NetOptimizeSoapBindingStub;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;
import cn.uway.nbi.dxsheet3.util.SerializeDiskFile;

public abstract class OrdersSend extends Thread {

	private static Logger log = LoggerFactory.getLogger(OrdersSend.class);

	protected NetOptimizeSoapBindingStub netOptimizeService;

	protected SendOrdersConfig orderConfig; // 工单申报配置类

	protected Map<String, Map<String, String>> scannerQueue = null; // 存储待发送工单

	protected Map<String, Boolean> keyVec; // 存储正在调用webservice的key,Orderid

	protected SheetDeclareDao sheetDeclareDao; // 数据库操作

	protected boolean webactive = false; // web标识

	protected boolean dbactive = false; // 数据标识

	protected boolean upstatue = false;

	protected boolean notifystatu = false;

	protected String threadname; // 线程名

	private int eoms_database_scac = 0;

	protected int dbputsize; // 最大存储有效工单数

	protected AccessWeb accessWeb;

	protected AccessScannerDb accessScannerDb;

	protected UpdateStateThread updateState;

	protected NotifyMsgThread notifyMsgThread;

	/**
	 * 初始化Web接口
	 */
	protected void initService() {
		try {
			String wsurl = System.getProperty("eoms_netOptimizeService");
			URL endpoint = new URL(wsurl);
			netOptimizeService = new NetOptimizeSoapBindingStub(endpoint, null);
		} catch (Exception e) {
			log.debug("获取webservice接口异常.", e);
		}

	}

	public void run() {
		eoms_database_scac = new Integer(System.getProperty("eoms_database_scac", "6"));

		orderConfig = SendOrdersConfig.getInstance();
		initService();
		initOrders();

		sheetDeclareDao = new SheetDeclareDao();

		// 调用Web线程
		webStart();

		// 扫描数据库线程
		dbactive = true;
		accessScannerDb = new AccessScannerDb();
		accessScannerDb.start();

		// 状态更新线程
		upstatue = true;
		updateState = new UpdateStateThread();
		updateState.start();

		// 通知心跳线程
		notifystatu = true;
		notifyMsgThread = new NotifyMsgThread();
		notifyMsgThread.start();

		// 添加线程通知心跳
		SendOrdersConfig.threadCountMap.put(threadname, 0);
		SendOrdersConfig.threadMap.put(threadname, this);
	}

	/**
	 * 访问web接口
	 * 
	 * @author Administrator
	 */
	protected class AccessWeb extends Thread {

		public AccessWeb() {

		}

		public void run() {
			boolean scac = false;
			int before = eoms_database_scac - 1;
			before = before < 0 ? 23 : before;
			while (webactive) {
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
				}

				Calendar cal = Calendar.getInstance();
				// 每天6点叫醒线程
				if (cal.get(Calendar.HOUR_OF_DAY) == eoms_database_scac && scac) {
					notifyScannerDb();
					scac = false;
					log.debug("{}每天早上6点钟叫醒数据扫描进程，成功!", threadname);
				}

				// 提前十分钟通知
				if (cal.get(Calendar.HOUR_OF_DAY) == before && cal.get(Calendar.MINUTE) >= 50 && !scac) {
					scac = true;
				}

				// 如果没有数据结束本次循环
				if (scannerQueue.size() == 0) {
					continue;
				}

				List<String> listkey = new ArrayList<String>(scannerQueue.keySet());
				java.util.Collections.sort(listkey);

				int size = listkey.size();
				for (int i = 0; i < size; i++) {
					boolean accOk = true;
					String key = listkey.get(i);
					keyVec.put(key, false); // 将要使用

					Map<String, String> order = scannerQueue.remove(key);

					String xmlStr = orderConfig.getPerfFaultSend(order);
					log.debug(xmlStr);
					String retXml = null;
					try {
						retXml = accessWebface(xmlStr, key, order);
					} catch (Exception e) {
						accOk = false;
						String[] ttt = {threadname, key};
						log.error("{}异常，工单编号{}", ttt, e);
						scannerQueue.put(key, order);
						// 写异常日志表，该单据不再发生
						saveEomsErrorlog(key);
						initService();

					}

					// 正常访问webservice接口，则写日志
					if (accOk && retXml != null) {
						opWebResult(retXml, key, order);
					}
					keyVec.put(key, true); // 使用完成
				}

				listkey.clear();
			}
		}
	}

	/**
	 * 扫描符合条件的数据
	 * 
	 * @author Administrator
	 */
	protected class AccessScannerDb extends Thread {

		public synchronized void run() {
			while (dbactive) {
				int retCount = 0;
				int needsize = dbputsize - scannerQueue.size();
				if (needsize > 0) {
					retCount = findSheetData(needsize);
				}
				// log.debug("{}执行数据库采集，第{}次!",threadname,times ++);

				// 清除已经调用WebService发生完成了的数据
				int count = 0;
				for (Entry<String, Boolean> iterable : keyVec.entrySet()) {
					if (iterable.getValue()) {
						count++;
						keyVec.remove(iterable.getKey());
					}
				}
				if (count > 0) {
					log.debug("清除{}已经调用WebService发生完成了的数据 = {} 条...", threadname, count);
				}

				waitScannerDb(retCount, this);
			}
		}

		public synchronized void notifyScannerDb() {
			notifyScannerMyDb(this);
		}
	}

	/**
	 * 更新故障工单
	 */
	protected class UpdateStateThread extends Thread {

		public void run() {
			long watitime = Integer.parseInt(System.getProperty("eoms_notify_wait_time", "5")) * 60 * 1000;

			while (upstatue) {
				try {
					Thread.sleep(watitime);
				} catch (InterruptedException e) {
				}

				// 处理更新失败的工单
				Map<String, SheetDeclareParameter> orderStateMap = SendOrdersConfig.orderFileStateMap;
				if (orderStateMap.size() == 0) {
					continue;
				}

				Iterator<String> keysets = orderStateMap.keySet().iterator();
				while (keysets.hasNext()) {
					String key = keysets.next();

					SheetDeclareParameter pa = orderStateMap.remove(key);

					sheetDeclareDao.accessWebComplaintStatu(pa);

					// 序列化磁盘
					SerializeDiskFile.getInstance().saveSerialize(orderStateMap, "eoms_orderFileStateMap");
				}
			}
		}
	}

	/**
	 * 通知心跳线程，到了100或者，超过5分钟通知
	 */
	protected class NotifyMsgThread extends Thread {

		public void run() {
			// 达到两百启动通知线程
			int notifycount = Integer.parseInt(System.getProperty("eoms_notify_wait_count", "200"));
			// 等待5分钟启动通知线程
			long watitime = Integer.parseInt(System.getProperty("eoms_notify_wait_time", "5")) * 60 * 1000;

			long nowtime = System.currentTimeMillis();
			while (notifystatu) {
				try {
					Thread.sleep(1 * 1000);
				} catch (InterruptedException e) {
				}

				nowtime = notifyProcess(notifycount, watitime, nowtime);
			}
		}
	}

	/**
	 * 停止
	 */
	public void stoped() {
		webactive = false;
		accessWeb.interrupt();
		accessWeb = null;

		dbactive = false;
		accessScannerDb.interrupt();
		accessScannerDb = null;

		upstatue = false;
		notifyMsgThread.interrupt();
		notifyMsgThread = null;

		notifystatu = false;
		updateState.interrupt();
		updateState = null;
	}

	public void notifyScannerDb() {
		this.accessScannerDb.notifyScannerDb();
	}

	/**
	 * 启动工单发送线程
	 */
	public void webStart() {
		if (!webactive) {
			webactive = true;
			accessWeb = new AccessWeb();
			accessWeb.start();

			if (dbactive) {
				SendOrdersConfig.threadCountMap.put(threadname, 0);
				SendOrdersConfig.threadMap.get(threadname).notifyScannerDb();
			}
		}
	}

	/**
	 * 通知处理
	 * 
	 * @param notifycount
	 * @param watitime
	 * @param nowtime
	 * @return
	 */
	protected long notifyProcess(int notifycount, long watitime, long nowtime) {
		long thistime = System.currentTimeMillis();

		Integer value = SendOrdersConfig.threadCountMap.get(threadname);

		// 当通知次数达到100，或者到了等待时间
		if (value >= notifycount || thistime - nowtime >= watitime) {
			// 当到了等待时间，但是没有通知
			if (value > 0) {
				SendOrdersConfig.threadCountMap.put(threadname, 0);
				SendOrdersConfig.threadMap.get(threadname).notifyScannerDb();
			}
			nowtime = thistime;
		}
		return nowtime;
	}

	public abstract void notifyScannerMyDb(AccessScannerDb accessScannerDb2);

	public abstract void waitScannerDb(int retCount, AccessScannerDb accessScannerDb2);

	public abstract int findSheetData(int needsize);

	// 初始化参数
	public abstract void initOrders();

	// 处理返回结果
	public abstract void opWebResult(String retXml, String key, Map<String, String> order);

	// 获得模板
	public abstract Map<String, String> getMyorder();

	// 调用webservice接口
	public abstract String accessWebface(String xmlPara, String orderkey, Map<String, String> order) throws Exception;

	/**
	 * 发送之前写日志
	 * 
	 * @param orderid
	 */
	protected void saveEomslog(String orderid) {
		SheetDeclareParameter parameter = new SheetDeclareParameter();
		parameter.dCreateTime = SendOrdersConfig.getDf().format(System.currentTimeMillis());
		parameter.endState = "待交互";
		parameter.faultCode = "";
		parameter.orderid = orderid;
		parameter.resultDesc = threadname + "准备与电子运维交互";
		sheetDeclareDao.saveAccessLog(parameter);
	}

	/**
	 * 凯通异常，工单不再派发
	 * 
	 * @param orderid
	 */
	protected void saveEomsErrorlog(String orderid) {
		SheetDeclareParameter parameter = new SheetDeclareParameter();
		parameter.dCreateTime = SendOrdersConfig.getDf().format(System.currentTimeMillis());
		parameter.endState = "凯通异常";
		parameter.faultCode = "";
		parameter.orderid = orderid;
		parameter.resultDesc = threadname + "调用凯通接口发生了异常，导致交互失败，不再派发";
		sheetDeclareDao.saveAccessLog(parameter);
	}

}
