package cn.uway.nbi.dxsheet3.db.pool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DbUtil {

	private static final Logger logger = LoggerFactory.getLogger(DbUtil.class);

	/**
	 * @Explain 关闭数据库连接操作对象
	 * @Date 2012-5-29 下午2:23:54
	 * @author tianjing
	 * @method close
	 * @param 输入参数
	 * @return void
	 * @Exception 抛出的异常
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

}
