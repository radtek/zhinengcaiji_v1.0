package cn.uway.nbi.bsa;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.sql.CLOB;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBUtil;

/**
 * bsa的工具
 * 
 * @author yanb @ 2013年8月30日
 */
public class BsaUtil {

	private static final Logger LOG = LoggerFactory.getLogger(BsaUtil.class);

	/**
	 * 如果是bsa，从数据库装载sql语句，这些先写这里面，以后重构
	 * 
	 * @param sql
	 *            sql
	 * @return List<String> sql语句
	 */
	public static List<String> getBsaSql(String sql, int sql_type) {

		List<String> list = new ArrayList<String>();
		ResultSet rs = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				CLOB clob = (CLOB) rs.getClob("sync_sql");
				BufferedReader sqlBuffer = new BufferedReader(new InputStreamReader(clob.getAsciiStream(), "GBK"));
				String psql = "";
				String temp = null;
				while ((temp = sqlBuffer.readLine()) != null) {
					psql = psql + temp + "\n";
				}
				if (null != psql && !"".equalsIgnoreCase(psql) && !list.contains(psql)) {
					if (sql_type == 1) {
					    String statSql = "select count(*) cnum from ( " + psql + " )";
						if(psql.contains(";")){
							
							statSql = "select count(*) cnum from ( " + psql.replace(";", " union ") + " )";
						}
						list.add(statSql);
					}
					list.add(psql);
				}
			}
		} catch (Exception e) {
			LOG.error("装载bsa sql语句失败", e);
		} finally {
			DBUtil.close(rs, preparedStatement, connection);
		}
		return list;

	}
}
