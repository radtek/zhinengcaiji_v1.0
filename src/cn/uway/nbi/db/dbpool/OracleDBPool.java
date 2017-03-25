package cn.uway.nbi.db.dbpool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.pool.OracleConnectionCacheImpl;
import oracle.jdbc.pool.OracleConnectionPoolDataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.util.SysCfg;

/**
 * oracle数据库连接池
 * 
 * @author liuwx
 * @since 1
 */
public class OracleDBPool implements DBPool {

	private OracleConnectionPoolDataSource dsp;

	private OracleConnectionCacheImpl dspImp;

	private static final Logger logger = LoggerFactory.getLogger(OracleDBPool.class);

	private SysCfg cfg;

	public OracleDBPool(SysCfg sysCfg) {
		cfg = sysCfg;
		init();
	}

	@Override
	public void init() {
		try {
			Class.forName(cfg.getDbDriver());

			dsp = new OracleConnectionPoolDataSource();
			dsp.setPassword(cfg.getDbPassword());
			dsp.setUser(cfg.getDbUserName());
			dsp.setURL(cfg.getDbUrl());

			dspImp = new OracleConnectionCacheImpl(dsp);
			dspImp.setMaxLimit(cfg.getPoolMaxActive());
			dspImp.setMinLimit(10);
			dspImp.setCacheTimeToLiveTimeout(1000);
			dspImp.setCacheFixedWaitTimeout(50);
			dspImp.setCacheScheme(OracleConnectionCacheImpl.DYNAMIC_SCHEME);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void createDBPool() {

	}

	@Override
	public Connection getConnection() {
		try {
			return dspImp.getConnection();
		} catch (SQLException e) {
			logger.error("无法获取数据库连接,原因：", e);
		}
		return null;
	}

	@Override
	public void close() throws SQLException {
		dspImp.close();
	}

	@Override
	public void destory() throws SQLException {
		dspImp.close();
	}

	public void createOracleDS() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select 'Hello Thin driver data source tester '||" + "initcap(USER)||'!' result from dual");
			if (rset.next())
				System.out.println(rset.getString(1));
			rset.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void main(String s[]) {
		try {
			SysCfg cfg = new SysCfg();
			new OracleDBPool(cfg).createOracleDS();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
