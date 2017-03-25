package cn.uway.nbi.db.dbpool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.util.SysCfg;

/**
 * 数据库连接池管理器,支持数据库连接池类型 1:oracle 自带的数据库连接池 2: C3P0数据库连接池 3:DBCP数据库连接池
 * 
 * @author liuwx
 * @since 1.0
 */
public abstract class DBPoolMgr {

	private static final Logger logger = LoggerFactory.getLogger(DBPoolMgr.class);

	protected DBPool dbpool = null;

	// protected static DBPoolMgr instance;
	protected static SysCfg sysCfg;

	protected static int poolType;

	public DBPoolMgr() {
	}

	public abstract DBPool createDBPool();

	public DBPool createDBPool(int poolType, SysCfg sysCfg) {
		if (dbpool != null)
			return dbpool;
		switch (poolType) {
			case 1 :
				dbpool = new OracleDBPool(sysCfg);
				break;
			case 2 :
				dbpool = new C3P0(sysCfg);
				break;
			case 3 :
				dbpool = new DBCP(sysCfg);
				break;

			default :
				logger.info("不支持的数据库连接池类型");
		}

		try {
			if (dbpool != null)
				dbpool.createDBPool();
		} catch (Exception e) {
			logger.info("数据库连接池创建失败,原因：", e);
		}
		return dbpool;
	}

	public void close() {
		try {
			dbpool.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void destory() {
		try {
			dbpool.destory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}