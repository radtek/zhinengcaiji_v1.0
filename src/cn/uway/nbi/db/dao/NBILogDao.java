package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.pojo.NBILog;
import cn.uway.nbi.db.pojo.Task;

public class NBILogDao {

	private static final Logger LOG = LoggerFactory.getLogger(NBILogDao.class);

	private java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * @param nbiLog
	 *            NBIlog实体类
	 * @return true: 插入成功 false:失败
	 */
	public boolean insertNBILog(NBILog nbiLog) {
		String sql = "insert into nbi_log_report(data_type, net_type, net_gran," + " time_gran, data_time,"
				+ " file_name, file_ftp_dir, file_size_bytes, record_count, ftp_ip, ftp_port, ftp_user,"
				+ " upload_result, fail_reason,insert_time,taskid,actionid) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";

		PreparedStatement ps = null;

		Connection conn = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();

			ps = conn.prepareStatement(sql);
			ps.setInt(1, nbiLog.getDataType());
			ps.setString(2, nbiLog.getNetType());

			ps.setString(3, nbiLog.getNetGran());
			ps.setInt(4, nbiLog.getTimeGran());

			String dataTime = nbiLog.getDataTime();

			ps.setTimestamp(5, StringUtil.isNull(dataTime) ? null : new Timestamp(format.parse(dataTime.toString()).getTime()));
			ps.setString(6, nbiLog.getFileName());

			ps.setString(7, nbiLog.getFileFtpDir());
			ps.setLong(8, nbiLog.getFileSizeBytes());

			ps.setLong(9, nbiLog.getRecordCount());
			ps.setString(10, nbiLog.getFtpIp());

			ps.setInt(11, nbiLog.getFtpPort());
			ps.setString(12, nbiLog.getFtpUser());

			ps.setInt(13, nbiLog.getUploadResult());
			ps.setString(14, nbiLog.getFailReason());

			String insertTime = nbiLog.getInsertTime();

			ps.setTimestamp(15, StringUtil.isNull(insertTime) ? null : new Timestamp(format.parse(insertTime.toString()).getTime()));

			ps.setLong(16, nbiLog.getTaskId());

			ps.setLong(17, nbiLog.getActionId());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			LOG.error(" 记录NBI日志出现异常 ,sql:" + sql, e);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return false;
	}

	/**
	 * 从日志文件中获取记录
	 * 
	 * @param nbiLog
	 * @return
	 */
	public List<String> getLogInfo(String sql, Task task, List<NBILog> nbiLogList) {
		String selSql = "SELECT " + sql + " FROM NBI_LOG_REPORT WHERE TASKID=? and DATA_TIME=? and INSERT_TIME IN(";
		StringBuilder sb = new StringBuilder();
		for (NBILog nLog : nbiLogList) {
			sb.append("TO_DATE('").append(nLog.getInsertTime()).append("', 'yyyy-mm-dd hh24:mi:ss'),");
		}
		selSql += sb.substring(0, sb.length()-1)+")";
		PreparedStatement ps = null;
		Connection conn = null;
		List<String> list = new ArrayList<String>();
		try {
			conn = DefaultDBPoolMgr.getConnection();
			ps = conn.prepareStatement(selSql);
			ps.setLong(1, task.getId());
			ps.setTimestamp(2, new Timestamp(task.getCurrDataTime().getTime()));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			LOG.error(" 记录NBI日志出现异常 ,sql:" + selSql, e);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public static void main(String[] args) {
		StringBuilder sb  = new StringBuilder("abd,");
		String selSql="abc ";
		selSql += sb.substring(0, sb.length()-1)+")";
		System.out.println(selSql);
	}
}
