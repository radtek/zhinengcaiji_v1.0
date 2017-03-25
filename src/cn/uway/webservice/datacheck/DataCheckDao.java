package cn.uway.webservice.datacheck;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.util.Util;

public class DataCheckDao {

	private static final Logger LOG = LoggerFactory.getLogger(DataCheckDao.class);

	public List<Task> loadTasks() throws Exception {
		// and id =4
		String sql = "select t.* from nbi_cfg_task t where t.isused=1  and t.pcname='" + Util.getHostName() + "'";
		LOG.debug("加载任务sql语句: " + sql);
		List<Task> list = new ArrayList<Task>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();

			rs = st.executeQuery(sql);

			while (rs.next()) {
				Task task = new Task();
				task.setTask(true);
				task.setId(rs.getLong("ID"));
				task.setPeriod(rs.getString("PERIOD"));
				task.setCurrDataTime(rs.getTimestamp("CURR_DATA_TIME"));
				task.setDescription(rs.getString("DESCRIPTION"));
				task.setTempletPath(rs.getString("CONFIGNAME"));
				task.setEndDataTime(rs.getTimestamp("END_DATA_TIME"));
				task.setUsed(rs.getInt("ISUSED") == 1 ? true : false);
				task.setPcName(rs.getString("PCNAME"));
				task.setReportOffset(rs.getInt("REPORTOFFSET"));
				task.setReportTime(rs.getTimestamp("REPORTTIME"));

				list.add(task);
			}
		} catch (Exception e) {
			LOG.error("加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	}

}
