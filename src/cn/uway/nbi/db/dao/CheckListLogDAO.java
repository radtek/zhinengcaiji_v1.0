package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.igp3.util.DbUtil;
import cn.uway.nbi.db.dbpool.CheckLogDBPool;
import cn.uway.nbi.db.pojo.CheckListLog;

public class CheckListLogDAO {
	
	private static final Logger LOG = LoggerFactory.getLogger(CheckListLogDAO.class);
	
	private static DecimalFormat d2f = new DecimalFormat("0.00");
	
	private static final String sql = "insert into NBI_CHECK_LIST_LOG"
			+ "(task_id ,data_time,Speciality,File_Name,File_Size,"
			+ "File_Path,Data_Type,File_Source,File_target,System_name,"
			+ "File_trans_rate,File_create_time,access_start_time,"
			+ "access_end_time,parse_start_time,Parse_end_time,"
			+ "Trans_start_time,Trans_end_time,status,"
			+ "Inter_conn_status,Exception_time,Error_code,"
			+ "Error_reason,Isreport,id) "
			+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,?)";
	
	private static final String querySql = "select distinct Isreport,IsProcessing "
			+ "from NBI_CHECK_LIST_LOG "
			+ "where task_id=? and status = 0 and error_code=? "
			+ " and data_time = ? and exception_time >=? and exception_time <?";
	
	private String nextVal = "select SEQ_NBI_CHECK_LIST_LOG.Nextval from dual ";
	
	/**
	 * 插入多条日志
	 * @param logs
	 */
	public void saveLogs(List<CheckListLog> logs,CheckListLog pubLog)
	{
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			conn = CheckLogDBPool.instance().getConnection();
			
			for(CheckListLog log: logs)
			{
				ps = setPubFields(conn,pubLog);
				ps.setString(4, log.getFileName());
				ps.setLong(5, log.getFileSize());
				if(log.getFileSize() != 0 
						&& log.getTransStartTime() != null
						&& log.getTransEndTime() != null){
					long seconds = (log.getTransEndTime().getTime() - log.getTransStartTime().getTime())/1000L;
					seconds = seconds==0?1:seconds;
					String transRate = d2f.format(log.getFileSize()/Double.valueOf(1024*seconds));
					ps.setDouble(11, Double.valueOf(transRate));
				}
				else{
					ps.setDouble(11, log.getFileTransRate());
				}
				ps.setTimestamp(12, log.getFileCreateTime()==null?null:new Timestamp(log.getFileCreateTime().getTime()));
				ps.setTimestamp(17, log.getTransStartTime()==null?null:new Timestamp(log.getTransStartTime().getTime()));
				ps.setTimestamp(18, log.getTransEndTime()==null?null:new Timestamp(log.getTransEndTime().getTime()));
				ps.setInt(19, log.getStatus());
				ps.setInt(20, log.getInterConnStatus());
				ps.execute();
				DbUtil.close(null, ps, null);
			}
		} catch (Exception e) {
			LOG.error(" 记录CheckList日志出现异常 ,sql:" + sql, e);
		} finally {
			DbUtil.close(null, ps, conn);
		}
	}
	
	/**
	 * 插入单条日志
	 * @param log
	 */
	public void saveLog(CheckListLog log)
	{
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			conn = CheckLogDBPool.instance().getConnection();
			ps = setPubFields(conn,log);
			ps.setString(4, log.getFileName());
			ps.setLong(5, log.getFileSize());
			ps.setDouble(11, log.getFileTransRate());
			ps.setTimestamp(12, log.getFileCreateTime()==null?null:new Timestamp(log.getFileCreateTime().getTime()));
			ps.setTimestamp(17, log.getTransStartTime()==null?null:new Timestamp(log.getTransStartTime().getTime()));
			ps.setTimestamp(18, log.getTransEndTime()==null?null:new Timestamp(log.getTransEndTime().getTime()));
			ps.setInt(19, log.getStatus());
			ps.setInt(20, log.getInterConnStatus());
			ps.execute();
		} catch (Exception e) {
			LOG.error(" 记录CheckList日志出现异常 ,sql:" + sql, e);
		} finally {
			DbUtil.close(null, ps, conn);
		}
	}
	
	private PreparedStatement setPubFields(Connection conn,CheckListLog log)
	{
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(nextVal);
			rs = ps.executeQuery();
			long id = -1;
			while (rs.next()) {
				id = rs.getLong(1);
				break;
			}
			if (id == -1) {
				LOG.error("从数据库获取SEQ_NBI_CHECK_LIST_LOG序列值失败");
			}
			DbUtil.close(rs, ps, null);
			ps = conn.prepareStatement(sql);
			ps.setLong(1, log.getTaskId());
			ps.setTimestamp(2, new Timestamp(log.getDataTime().getTime()));

			ps.setString(3, log.getSpeciality());
			ps.setString(6, log.getFilePath());

			ps.setString(7, log.getDataType());
			ps.setString(8, log.getFileSource());

			ps.setString(9, log.getFileTarget());
			ps.setString(10, log.getSystemName());
			
			ps.setTimestamp(13, log.getAccessStartTime()==null?null:new Timestamp(log.getAccessStartTime().getTime()));
			ps.setTimestamp(14, log.getAccessEndTime()==null?null:new Timestamp(log.getAccessEndTime().getTime()));

			ps.setTimestamp(15, log.getParseStartTime()==null?null:new Timestamp(log.getParseStartTime().getTime()));
			ps.setTimestamp(16, log.getParseEndTime()==null?null:new Timestamp(log.getParseEndTime().getTime()));

			ps.setTimestamp(21, log.getExceptionTime()==null?null:new Timestamp(log.getExceptionTime().getTime()));
			ps.setInt(22, log.getErrorCode());
			
			ps.setString(23, log.getErrorReason());
			ps.setLong(24, id);
		} catch (Exception e) {
			LOG.error(" 记录CheckList日志出现异常 ,sql:" + sql, e);
		} 
		return ps;
	}
	
	public boolean isSendSms(CheckListLog log)
	{
		PreparedStatement ps = null;

		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = CheckLogDBPool.instance().getConnection();
			ps = conn.prepareStatement(querySql);
		
			ps.setLong(1, log.getTaskId());
//			ps.setTimestamp(2, new Timestamp(log.getDataTime().getTime()));

			ps.setInt(2, log.getErrorCode());	
			ps.setTimestamp(3, new Timestamp(log.getDataTime().getTime()));
			Calendar c = Calendar.getInstance();
			c.setTime(log.getExceptionTime());
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);
			ps.setTimestamp(4, new Timestamp(c.getTimeInMillis()));
			c.add(Calendar.DAY_OF_MONTH, 1);
			ps.setTimestamp(5, new Timestamp(c.getTimeInMillis()));
			
			rs = ps.executeQuery();
			while(rs.next())
			{
				if(rs.getInt(1)==1 && rs.getInt(2) == 0)
				{
					return false;
				}
			}
		} catch (Exception e) {
			LOG.error(" 查询CheckList日志出现异常 ,sql:" + querySql, e);
		} finally {
			
			DbUtil.close(rs, ps, conn);
			
		}
		return true;
	}
	
	public boolean updateLog(long taskId,String dataTime)
	{
		String updateRetrylog = "update NBI_CHECK_LIST_LOG set IsRetryCollect = 1,"
				+ "IsProcessing = 1 where task_Id="+taskId+" and status = 0"
				+ " and data_time=to_date('"+dataTime+"','yyyy-MM-dd hh24:mi:ss')";
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			
			conn = CheckLogDBPool.instance().getConnection();
			ps = conn.prepareStatement(updateRetrylog);
//			Calendar c = Calendar.getInstance();
//			ps.setLong(1, taskId);
//			c.setTime(DateTimeUtils.parse(expTime));
//			c.set(Calendar.HOUR_OF_DAY, 0);
//			c.set(Calendar.MINUTE, 0);
//			c.set(Calendar.SECOND, 0);
//			ps.setTimestamp(2, new Timestamp(c.getTimeInMillis()));
//			c.add(Calendar.DAY_OF_MONTH, 1);
//			ps.setTimestamp(3, new Timestamp(c.getTimeInMillis()));
			int code = ps.executeUpdate();
			return code > 0;
		} catch (Exception e) {
			LOG.error("更新核查日志出现错误 ,sql:" + updateRetrylog, e);
		} finally {
			
			DbUtil.close(null, ps, conn);
			
		}
		return false;
	}
	
	public boolean updateRetranLog(long taskId,String dataTime)
	{
		String updateRetranLog = "update NBI_CHECK_LIST_LOG set IsReTrans = 1 where task_Id="
					+taskId+" and status = 1 and data_time =to_date("+dataTime+",'yyyy-mm-dd hh24:mi:ss')";
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			
			conn = CheckLogDBPool.instance().getConnection();
			ps = conn.prepareStatement(updateRetranLog);
			int code = ps.executeUpdate();
			return code > 0;
		} catch (Exception e) {
			LOG.error("更新核查日志出现错误 ,sql:" + updateRetranLog, e);
		} finally {
			
			DbUtil.close(null, ps, conn);
			
		}
		return false;
	}
	
}
