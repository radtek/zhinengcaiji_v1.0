package cn.uway.nbi.db.dao;

import static cn.uway.nbi.util.ConstDef.TEMPLET_PATH_FOR_TASK;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.util.Util;

/**
 * @author liuwx
 * @version 1.0
 */
@IDMember(id = 1)
public class TaskDAO extends AbstractDAO<Task> {

	private static final Logger LOG = LoggerFactory.getLogger(TaskDAO.class);

	@Override
	public List<Task> find(String hql) throws Exception {
		return null;
	}

	@Override
	public void delete(Task entity) throws Exception {
	}

	@Override
	public void add(Task entity) throws Exception {
	}

	@Override
	public boolean update(Task task) throws Exception {
		StringBuilder sb = new StringBuilder("update nbi_cfg_task t set t.curr_data_time=to_date('");
		sb.append(DateUtil.getDateString(task.getNextDataTime()));
		sb.append("','YYYY-MM-DD HH24:MI:SS')");
		if (task.getReportTime() != null) {
			sb.append(", t.reporttime=to_date('");
			sb.append(DateUtil.getDateString(task.getNextReportTime()));
			sb.append("','YYYY-MM-DD HH24:MI:SS')");
		}
		sb.append(" where t.id=");
		sb.append(task.getId());
		String updateSql = sb.toString();
		String tableName = "NBI_CFG_TASK";

		boolean flag = DBUtil.executeUpdate(updateSql) == 1 ? true : false;
		long taskId = task.getId();
		LOG.debug("taskId:" + taskId + "  成功更新" + tableName + "表");
		return flag;
	}

	@Override
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
				// add 2014-6-27 jinagl 模板的地址，要根据 网络类型与 版本号 来变化
				try {
					task.setNet_type(rs.getString("NET_TYPE"));
					task.setVersion(rs.getString("VERSION"));
					if (null != task.getNet_type() && !"".equals(task.getNet_type()) && null != task.getVersion() && !"".equals(task.getVersion())) {
						task.setNet_type(task.getNet_type().trim().toUpperCase());
						task.setVersion(task.getVersion().trim().toUpperCase());

						task.setTempletPath(TEMPLET_PATH_FOR_TASK + task.getNet_type() + File.separator + task.getVersion() + File.separator
								+ task.getTempletPath());
					}
				} catch (Exception e) {
					task.setNet_type("");
					task.setVersion("");
				}
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