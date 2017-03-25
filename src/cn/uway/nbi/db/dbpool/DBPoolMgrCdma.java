package cn.uway.nbi.db.dbpool;

import java.sql.Connection;

import cn.uway.nbi.util.SysCfg;

public class DBPoolMgrCdma extends DBPoolMgr {

	protected static DBPoolMgr instance = new DBPoolMgrCdma();

	protected static SysCfg sysCfg = new SysCfg("./conf/dbpool_cnet.xml");

	protected static int poolType = sysCfg.getDbPoolType();

	protected static DBPool mydbpool = instance.createDBPool(poolType, sysCfg);

	public static DBPoolMgr getInstance() {
		return instance;
	}

	public static Connection getConnection() throws Exception {
		return mydbpool.getConnection();
	}

	public DBPool createDBPool() {
		return instance.createDBPool(poolType, sysCfg);
	}

}
