package cn.uway.nbi.ui;

import java.sql.Connection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBPoolMgrGsm;
import cn.uway.nbi.db.dbpool.DBPoolMgrWcdma;
import cn.uway.nbi.ui.consume.ReportRequestService;

/**
 * 透视数据上报，包含G+W的库。 需要连接2个库，通过网络类型来 标示需要连接哪个库
 * 
 * @author liuwx
 */
public class ConnectionMgr {

	private static final Logger LOG = LoggerFactory.getLogger(ConnectionMgr.class);

	/**
	 * 获取连接
	 * 
	 * @param domainType
	 *            网络类型 G,W
	 * @return 连接
	 */
	public static Connection getConnection(String domainType) {
		try {
			if (domainType.equalsIgnoreCase(ReportRequestService.gflag)) {

				return DBPoolMgrGsm.getConnection();

			} else if (domainType.equalsIgnoreCase(ReportRequestService.wflag)) {
				return DBPoolMgrWcdma.getConnection();
			}
		} catch (Exception e) {
			LOG.error("获取连接失败", e);
		}
		return null;
	}

}
