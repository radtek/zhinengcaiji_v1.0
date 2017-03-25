package cn.uway.nbi.db.dbpool;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mchange.v2.c3p0.DataSources;

import cn.uway.nbi.util.SysCfg;

public class CheckLogDBPool implements DBPool {

	private static final Logger logger = LoggerFactory.getLogger(DBCP.class);

	private DataSource dataSource = null;
	
	private static CheckLogDBPool dbPool = null;
	
	private CheckLogDBPool()
	{
		
	}
	
	public static synchronized CheckLogDBPool instance()
	{
		if(dbPool == null)
		{
			dbPool = new CheckLogDBPool();
			dbPool.createDataSource();
		}
		return dbPool;
	}

	public void destroy() {
		try {
			// 关闭数据连接池
			if (dataSource != null)
				DataSources.destroy(dataSource);
		} catch (SQLException e) {
			logger.error("数据库连接释放失败.", e);
		}
	}

	/**
	 * 关闭现有的数据库连接池
	 * 
	 * @param dataSource
	 *            要关闭的数据库连接池
	 */
	public void close() {
		try {
			Class<?> classz = dataSource.getClass();
			Class<?>[] types = new Class[0];
			Method method = classz.getDeclaredMethod("close", types);
			if (method != null) {
				method.setAccessible(true);
				Object[] args = new Object[0];
				method.invoke(dataSource, args);
			}
		} catch (Exception e) {
			logger.error("DbPool: 尝试关闭原有的数据库连接池 [" + dataSource.getClass().getName() + "]时失败.", e);
		}
	}

	public Connection getConn() {
		Connection conn = null;
		try {
			if (dataSource == null) {
				createDataSource();
			}
			conn = dataSource.getConnection();
			// BasicDataSource bds = ((BasicDataSource) dataSource);
			// log.debug("数据库连接池信息：当前活动连接数=" + bds.getNumActive() + ",
			// 设定的最大活动连接数="
			// + bds.getMaxActive() + ", 当前获取连接的线程="
			// + Thread.currentThread());
		} catch (Exception e) {
			logger.error("DbPool: error when got a connection from DB pool.", e);
		}

		return conn;
	}

	/**
	 * 创建一个新的数据库连接池
	 * 
	 * @param name
	 *            JNDI的搜索名
	 * @param record
	 *            数据库连接池的基本信息
	 * @param constants
	 *            系统内置的环境管理类
	 * @return 新的数据库连接池，null表示创建失败
	 */
	private DataSource createDataSource() {
		String name = "";
		try {
			SysCfg cfg = SysCfg.getInstance();
			Properties p = cfg.getProperties();

			name = p.getProperty("name");
			dataSource = BasicDataSourceFactory.createDataSource(p);
			logger.debug("DbPool: 创建数据库连接池：" + name);
		} catch (Exception e) {
			logger.error("DbPool: 创建数据源 " + name + " 失败：", e);
		}

		return dataSource;
	}

	@Override
	public void init() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void createDBPool() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public  Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			if (dataSource == null) {
				createDataSource();
			}
			conn = dataSource.getConnection();
			// BasicDataSource bds = ((BasicDataSource) dataSource);
			// log.debug("数据库连接池信息：当前活动连接数=" + bds.getNumActive() + ",
			// 设定的最大活动连接数="
			// + bds.getMaxActive() + ", 当前获取连接的线程="
			// + Thread.currentThread());
		} catch (Exception e) {
			logger.error("DbPool: error when got a connection from DB pool.", e);
		}

		return conn;
	}

	@Override
	public void destory() throws Exception {
		// TODO Auto-generated method stub

	}
}
