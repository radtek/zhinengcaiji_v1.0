package cn.uway.nbi.db.dbpool;

import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import oracle.sql.CLOB;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.ui.ConnectionMgr;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * 数据库操作公共类/静态方法
 * 
 * @author YangJian
 * @version 1.0
 * @since 1.0
 */
public final class DBUtil {

	private static final Logger logger = LoggerFactory.getLogger(DBUtil.class);

	/**
	 * 向数据库批量添加新数据
	 * 
	 * @param g_sql
	 *            g_sql
	 * @return 返回批量提交受影响的行数
	 * @throws Exception
	 *             Exception
	 */
	public static int[] executeBatch(List<String> sqlList) throws Exception {
		int[] result = null;
		Connection con = null;
		Statement stm = null;
		try {
			con = getConnection();
			// add by yanb 2013-12-10 修改findbug，增加为空的判断
			if (null != con) {
				con.setAutoCommit(false);
				if (sqlList != null && !sqlList.isEmpty()) {
					stm = con.createStatement();
					for (String sql : sqlList)
						stm.addBatch(sql);
					result = stm.executeBatch();
					con.commit();
				}

			}
		} finally {
			close(null, stm, con);
		}
		return result;
	}

	/**
	 * 关闭所有连接
	 */
	public static void close(ResultSet rs, Statement stm, Connection conn) {
		if (rs != null) {
			Statement tmpStm = null;
			try {
				tmpStm = rs.getStatement();

				rs.close();
				rs = null;
			} catch (Exception e) {
				logger.error("关闭数据库连接对象失败，对象未能被关闭。exception：" + e.getMessage(), e);
			} finally {
				try {
					if (tmpStm != null)
						tmpStm.close();
				} catch (Exception e1) {
					logger.error("关闭数据库连接对象失败，对象未能被关闭。exception：" + e1.getMessage(), e1);
				}
			}
		}

		try {
			if (stm != null) {
				stm.close();
				stm = null;
			}

		} catch (Exception e) {
			logger.error("关闭数据库连接对象失败，对象未能被关闭。exception：" + e.getMessage(), e);
		}

		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}

		} catch (Exception e) {
			logger.error("关闭数据库连接对象失败，对象未能被关闭。exception：" + e.getMessage(), e);
		}
	}

	/**
	 * 更新数据库
	 * 
	 * @param sql
	 * @return 受影响的条数
	 */
	public static int executeUpdate(String sql) throws Exception {
		Connection conn = getConnection();
		if (conn == null)
			return -1;
		return executeUpdate(conn, sql);
	}

	/**
	 * 更新数据库
	 * 
	 * @param conn
	 *            数据库连接
	 * @param sql
	 *            要执行的语句
	 * @return 受影响的条数
	 */
	public static int executeUpdate(Connection conn, String sql) throws Exception {
		int count = -1;
		// add by yanb 2013-12-10 修改findbug，增加为空的判断
		if (null == conn) {
			return count;
		}

		PreparedStatement ps = null;
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			count = ps.executeUpdate();
			if (conn != null)
				conn.commit();
		} catch (Exception e) {
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception ex) {
			}
			throw e;
		} finally {
			close(null, ps, conn);
		}

		return count;
	}

	/**
	 * 更新数据库,不用关闭连接
	 * 
	 * @param conn
	 *            数据库连接
	 * @param sql
	 *            要执行的语句
	 * @return 受影响的条数
	 */
	public static int executeUpdateO(Connection conn, String sql) throws Exception {
		int count = -1;
		// add by yanb 2013-12-10 修改findbug，增加为空的判断
		if (null == conn) {
			return count;
		}
		PreparedStatement ps = null;
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			count = ps.executeUpdate();
			if (conn != null)
				conn.commit();
		} catch (Exception e) {
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception ex) {
			}
			throw e;
		} finally {
			DBUtil.close(null, ps, conn);
		}

		return count;
	}

	public static Connection getConnection() throws Exception {
		return DefaultDBPoolMgr.getConnection();
	}

	/**
	 * 获取数据库连接
	 * 
	 * @param driver
	 *            驱动类
	 * @param url
	 *            数据库路径
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return 数据库连接
	 */
	public static Connection getConnection(String driver, String url, String username, String password) throws Exception {
		Connection conn = null;
		Class.forName(driver);
		conn = DriverManager.getConnection(url, username, password);
		return conn;
	}

	/**
	 * 更新任务
	 * 
	 * @param id
	 *            id
	 * @param actionIds
	 *            动作处理类ID
	 * @param cause
	 *            原因
	 * @param counter
	 *            counter
	 * @return boolean boolean
	 * @throws Exception
	 *             Exception
	 */
	public static boolean updateRTask(long id, String actionIds, String cause, int counter) throws Exception {
		boolean flag = false;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		int state = 0;
		// 如果actionIds为空就表示已经超时，(因为获取时，如果超时就用空表示)所以state就为-1，表示失败
		if ("".equals(actionIds))
			state = -1;
		
		// 当补采超过指定次数还是失败时，将补采状态修改为-1（失败）
		if(counter >= SysCfg.getInstance().getMaxCounter())
		{
			state = -1;
		}
		
		String updateSql = "update nbi_cfg_rtask r set r.counter=" + counter + ",r.state=" + state + ",r.actionid='" + actionIds + "' where r.id="
				+ id;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			st = conn.createStatement();
			st.executeUpdate(updateSql);
			//if (st.execute(updateSql))
				flag = updateClob(conn, st, rs, id, cause);
		} catch (Exception e) {
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
				}
			throw e;
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return flag;
	}

	/** 将补报结构表中的数据插入到补报表中 */
	public static boolean insertRTask(long taskId, String actionIds, String cause, String currDataTime) throws Exception {
		boolean flag = false;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			st = conn.createStatement();
			String insertSql = "insert into nbi_cfg_rtask (id,taskid,curr_data_time,counter,state,cause,actionid) values(SEQ_NBI_CFG_RTASK.Nextval,"
					+ taskId + ",to_date('" + currDataTime + "','YYYY-MM-DD HH24:MI:SS'),0,0,empty_clob(),'" + actionIds + "')";
			st.executeUpdate(insertSql); 
			rs = st.executeQuery("select SEQ_NBI_CFG_RTASK.currval from dual");
			if (rs.next()) {
				int id = rs.getInt(1);
				flag = updateClob(conn, st, rs, id, cause);
			}	
			 
		} catch (Exception e) {
			logger.error("错误信息"+ e.toString());
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
				}
			throw e;
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return flag;
	}
	
	/**
	 * WS生成补采任务
	 * @param taskId
	 * @param cause
	 * @param currDataTime
	 * @return
	 * @throws Exception
	 */
	public static boolean insertRTask(long taskId, String cause, String currDataTime) throws Exception {
		boolean flag = false;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			st = conn.createStatement();
			String insertSql = "insert into nbi_cfg_rtask (id,taskid,curr_data_time,counter,state,cause) values(SEQ_NBI_CFG_RTASK.Nextval,"
					+ taskId + ",to_date('" + currDataTime + "','YYYY-MM-DD HH24:MI:SS'),0,0,empty_clob())";
			st.executeUpdate(insertSql); 
			rs = st.executeQuery("select SEQ_NBI_CFG_RTASK.CURRVAL from dual");
			if (rs.next()) {
				int id = rs.getInt(1);
				flag = updateClob(conn, st, rs, id, cause);
			}	
			 
		} catch (Exception e) {
			logger.error("错误信息"+ e.toString());
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException e1) {
				}
			throw e;
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return flag;
	}

	/**
	 * 更新数据库
	 * 
	 * @param sql
	 * @return 受影响的条数
	 */
	public static int executeUpdate(String sql, String domainType) throws Exception {
		Connection conn = ConnectionMgr.getConnection(domainType);
		if (conn == null)
			return -1;
		return executeUpdate(conn, sql);
	}

	private static boolean updateClob(Connection conn, Statement st, ResultSet rs, long id, String cause) throws Exception {
		String selectsql = "select r.cause from nbi_cfg_rtask r where r.id=" + id + " for update";
		rs = st.executeQuery(selectsql);
		if (rs.next()) {
			CLOB clob = (CLOB) rs.getClob("CAUSE");
			Writer out = clob.getCharacterOutputStream();
			String oldCause = ConstDef.ClobParse(clob);
			cause = oldCause + cause;
			out.write(cause);
			out.flush();
			out.close();
			if (conn != null)
				conn.commit();
		}
		return true;
	}

	public static void main(String[] args) throws Exception {

		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		if (conn != null) {
			System.out.println("OK");
			// 关闭连接,当前连接被连接池收回
			try {
				stmt = conn.createStatement();

				rs = stmt.executeQuery("SELECT * FROM clt_conf_task");
				while (rs.next()) {
					System.out.println(rs.getString(1));
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}