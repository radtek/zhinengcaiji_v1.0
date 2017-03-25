package cn.uway.webservice.managecontrol.impl;

import java.sql.Connection;

import cn.uway.nbi.db.dbpool.DBPool;
import cn.uway.nbi.db.dbpool.DBPoolMgr;
import cn.uway.nbi.util.SysCfg;

public class DBPoolMgrDcs extends DBPoolMgr {

	protected static DBPoolMgr instance = new DBPoolMgrDcs();

	protected static SysCfg sysCfg = new SysCfg("./conf/dbpool_dcs.xml");

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
