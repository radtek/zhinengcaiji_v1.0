package cn.uway.nbi.db;

import java.sql.Connection;

import cn.uway.nbi.db.dbpool.DBPool;
import cn.uway.nbi.db.dbpool.DBPoolMgr;
import cn.uway.nbi.util.SysCfg;

public class DefaultDBPoolMgr extends DBPoolMgr {

	protected static DBPoolMgr instance = new DefaultDBPoolMgr();

	protected static SysCfg sysCfg = SysCfg.getInstance();

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
