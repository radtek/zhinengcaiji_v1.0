package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.CycFileStatus;

/**
 * @author ct
 * @version 1.0
 */
public class CycFileStatusDAO  {

	private static final Logger LOG = LoggerFactory.getLogger(CycFileStatusDAO.class);

	public List<CycFileStatus> find(String sql) throws Exception {

		LOG.debug("查找周期文件sql语句: " + sql);
		List<CycFileStatus> list = new ArrayList<CycFileStatus>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();

			rs = st.executeQuery(sql);

			while (rs.next()) {
				CycFileStatus task = new CycFileStatus();
				task.setTaskId(rs.getLong("TASK_ID"));
				task.setDataTime(rs.getTimestamp("DATA_TIME"));
				task.setInsertTime(rs.getTimestamp("INSERT_TIME"));
				task.setFileName(rs.getString("FILE_NAME"));
				task.setStatus(rs.getInt("STATUS"));
				
				list.add(task);
			}
		} catch (Exception e) {
			LOG.error("查找周期文件{}", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	
	}
	
	public List<String> findFileNames(String sql) throws Exception {

		LOG.debug("查找周期文件sql语句: " + sql);
		List<String> list = new ArrayList<String>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();

			rs = st.executeQuery(sql);

			while (rs.next()) {
				
				list.add(rs.getString("FILE_NAME"));
			}
		} catch (Exception e) {
			LOG.error("查找周期文件{}", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	
	}

	/**
	 * @param cycFileStatus
	 *            CycFileStatus实体类
	 * @return true: 插入成功 false:失败
	 */
	public boolean insertCycFileStatus(CycFileStatus cycFileStatus) throws Exception {
		
		String sql = "insert into nbi_cyc_file_status(task_id, data_time, file_name,status)" 
					+  " values (?, ?, ?, ?)";

		PreparedStatement ps = null;

		Connection conn = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();

			ps = conn.prepareStatement(sql);
			
			ps.setLong(1, cycFileStatus.getTaskId());
			
			Date dataTime = cycFileStatus.getDataTime();
			ps.setTimestamp(2, new Timestamp(dataTime.getTime()));
			
			ps.setString(3, cycFileStatus.getFileName());
			
			ps.setInt(4, cycFileStatus.getStatus());
			
			
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

}