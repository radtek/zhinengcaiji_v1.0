package cn.uway.nbi.db.dao.nos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.ui.ConnectionMgr;

public class NosLog {

	private static final Logger LOG = LoggerFactory.getLogger(NosLog.class);

	public static void insertLog(String domainType, LogNossReportInsert logNoss) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into  log_noss_report_insert (service_id , version ,service_name,service_desc ,type,result,insert_time)");
		sql.append("values");
		sql.append("(?,?,?,?,?,?,?)");
		sql.append("");
		PreparedStatement ps = null;

		Connection conn = null;
		try {
			conn = ConnectionMgr.getConnection(domainType);

			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, logNoss.service_id);
			ps.setString(2, logNoss.version);

			ps.setString(3, logNoss.service_name);
			ps.setString(4, logNoss.service_desc);

			ps.setString(5, logNoss.type);
			ps.setString(6, logNoss.result);

			ps.setTimestamp(7, logNoss.insert_time == null ? null : new Timestamp(logNoss.insert_time.getTime()));
			ps.executeUpdate();
		} catch (Exception e) {
			LOG.error("记录数据库日志表log_noss_report_insert异常 ,sql:" + sql, e);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public static void main(String[] args) {
		LogNossReportInsert logNoss = new LogNossReportInsert();

		logNoss.insert_time = new Date();
		logNoss.service_desc = "1";
		logNoss.result = "1";
		logNoss.service_name = "1";
		logNoss.type = "1";
		logNoss.version = "1";
		logNoss.service_id = "1";
		insertLog("", logNoss);
	}
}
