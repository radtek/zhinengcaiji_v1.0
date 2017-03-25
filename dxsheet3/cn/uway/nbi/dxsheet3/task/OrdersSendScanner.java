/**
 * 网优平台性能故障，任务扫描主线程
 */
package cn.uway.nbi.dxsheet3.task;

import java.sql.Connection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBPoolMgrCdma;
import cn.uway.nbi.db.dbpool.DBUtil;

public class OrdersSendScanner extends Thread {

	private static Logger log = LoggerFactory.getLogger(OrdersSendScanner.class);

	private OrdersComplaint complaint = null;

	private OrdersConfirmNotice notice = null;

	public OrdersSendScanner() {
	}

	public void stopThread() {
		if (complaint != null) {
			complaint.interrupt();
			complaint.stoped();
		}
		if (notice != null) {
			notice.interrupt();
			notice.stoped();
		}

		log.debug("EOMS任务扫描停止...");
	}

	public void run() {
		log.debug("EOMS任务扫描启动...");

		testcon();

		complaint = new OrdersComplaint();
		notice = new OrdersConfirmNotice();

		complaint.start();
		notice.start();

	}

	private void testcon() {
		Connection cn = null;
		try {
			cn = DBPoolMgrCdma.getConnection();
			log.debug("连接池创建成功.", cn);
		} catch (Exception e) {
		} finally {
			DBUtil.close(null, null, cn);
		}

	}
}
