package cn.uway.nbi.db.dao;

import static cn.uway.nbi.util.ConstDef.TEMPLET_PATH_FOR_TASK;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.util.SysCfg;
import cn.uway.nbi.util.Util;

/**
 * 数据库中的补采任务
 * 
 * @author litp 2011-4-21
 */
public class RTaskDAO extends AbstractDAO<RTask> {

	// NBI_CFG_TASK 表是 是否有 NET_TYPE、 VERSION 这两个字段
	String is_hava_column_sql = "select  count(*) as num  from user_tab_columns  where  table_name = 'NBI_CFG_TASK' and  (COLUMN_NAME='NET_TYPE' or COLUMN_NAME='VERSION' )";

	private static final Logger LOG = LoggerFactory.getLogger(RTaskDAO.class);

	@Override
	public List<RTask> find(String hql) throws Exception {
		return null;
	}

	@Override
	public void delete(RTask entity) throws Exception {
	}

	@Override
	public void add(RTask entity) throws Exception {
	}

	@Override
	public boolean update(RTask task) throws Exception {
		String updateSql = "update nbi_cfg_rtask r set r.state=1,r.counter=r.counter+1 where r.id=" + task.getId();
		String tableName = "NBI_CFG_RTASK";
		boolean flag = DBUtil.executeUpdate(updateSql) == 1 ? true : false;
		long taskId = task.getId();
		LOG.debug("taskId:" + taskId + "  成功更新" + tableName + "表");
		return flag;
	}

	@Override
	public List<RTask> loadTasks() throws Exception {

		String sql = " from nbi_cfg_rtask r,nbi_cfg_task t where r.taskid=t.id and r.state=0 and t.isused=1 and t.pcname='" + Util.getHostName()
				+ "' order by t.curr_data_time " + SysCfg.getInstance().getRTasksort();

		List<RTask> list = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();
			// 判断 NBI_CFG_TASK 表是 是否有 NET_TYPE、 VERSION 这两个字段
			rs = st.executeQuery(is_hava_column_sql);
			rs.next();
			// 如果查询出来的值 小于 2， 说明这两个字段还没有配到表中
			if (rs.getInt("num") < 2) {
				sql = "select r.*,t.period,t.configname,t.isused " + sql;
			} else {
				sql = "select r.*,t.period,t.configname,t.isused,t.NET_TYPE,t.VERSION " + sql;
			}

			LOG.debug("补采任务SQL{}", sql);
			rs = null;

			rs = st.executeQuery(sql);
			list = new ArrayList<RTask>();
			while (rs.next()) {
				RTask r = new RTask();
				r.setId(rs.getLong("ID"));
				r.setTaskId(rs.getLong("TASKID"));
				r.setPeriod(rs.getString("PERIOD"));
				r.setCurrDataTime(rs.getTimestamp("CURR_DATA_TIME"));
				r.setTempletPath(rs.getString("CONFIGNAME"));
				r.setUsed(rs.getInt("ISUSED") == 1 ? true : false);
				r.setCounter(rs.getInt("COUNTER"));
				String actionId = rs.getString("ACTIONID");
				// add 2014-6-27 jinagl 模板的地址，要根据 网络类型与 版本号 来变化
				try {
					r.setNet_type(rs.getString("NET_TYPE"));
					r.setVersion(rs.getString("VERSION"));
					if (null != r.getNet_type() && !"".equals(r.getNet_type()) && null != r.getVersion() && !"".equals(r.getVersion())) {
						r.setNet_type(r.getNet_type().trim().toUpperCase());
						r.setVersion(r.getVersion().trim().toUpperCase());

						r.setTempletPath(TEMPLET_PATH_FOR_TASK + r.getNet_type() + File.separator + r.getVersion() + File.separator
								+ r.getTempletPath());
					}
				} catch (Exception e) {
					r.setNet_type("");
					r.setVersion("");
				}

				if (actionId != null)
					r.setActionList(new ArrayList<String>(Arrays.asList(actionId.split(","))));

				list.add(r);
			}
		} catch (Exception e) {
			LOG.debug("补采任务失败{}", e);
		} finally {
			DBUtil.close(rs, st, conn);
			sql = null;
		}
		return list;
	}

	public List<RTask> loadTasks2() throws Exception {

		String sql = " from nbi_cfg_rtask r,nbi_cfg_task t where r.taskid=t.id and r.state=0 and t.isused=1 and t.pcname='" + Util.getHostName()
				+ "' order by t.curr_data_time " + SysCfg.getInstance().getRTasksort();

		List<RTask> list = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();

			// jiangl add 2014-7-1 判断 NBI_CFG_TASK 表是 是否有 NET_TYPE、 VERSION 这两个字段
			rs = st.executeQuery(is_hava_column_sql);
			rs.next();
			// 如果查询出来的值 小于 2， 说明这两个字段还没有配到表中
			if (rs.getInt("num") < 2) {
				sql = "select r.*,t.period,t.configname,t.isused   " + sql;
			} else {
				sql = "select r.*,t.period,t.configname,t.isused ,t.NET_TYPE,t.VERSION " + sql;
			}

			LOG.debug("补采任务SQL{}", sql);

			rs = null;

			rs = st.executeQuery(sql);
			list = new ArrayList<RTask>();
			while (rs.next()) {
				RTask r = new RTask();
				r.setId(rs.getLong("ID"));
				r.setTaskId(rs.getLong("TASKID"));
				r.setPeriod(rs.getString("PERIOD"));
				r.setCurrDataTime(rs.getTimestamp("CURR_DATA_TIME"));
				r.setTempletPath(rs.getString("CONFIGNAME"));
				r.setUsed(rs.getInt("ISUSED") == 1 ? true : false);
				r.setCounter(rs.getInt("COUNTER"));
				String actionId = rs.getString("ACTIONID");

				// add 2014-6-27 jinagl 模板的地址，要根据 网络类型与 版本号 来变化
				try {
					r.setNet_type(rs.getString("NET_TYPE"));
					r.setVersion(rs.getString("VERSION"));
					if (null != r.getNet_type() && !"".equals(r.getNet_type()) && null != r.getVersion() && !"".equals(r.getVersion())) {

						r.setNet_type(r.getNet_type().trim().toUpperCase());
						r.setVersion(r.getVersion().trim().toUpperCase());

						r.setTempletPath(TEMPLET_PATH_FOR_TASK + r.getNet_type() + File.separator + r.getVersion() + File.separator
								+ rs.getString("CONFIGNAME"));
					}
				} catch (Exception e) {
					r.setNet_type("");
					r.setVersion("");
				}

				if (actionId != null)
					r.setActionList(new ArrayList<String>(Arrays.asList(actionId.split(","))));

				list.add(r);
			}
		} catch (Exception e) {
			LOG.debug("补采任务失败{}", e);
		} finally {
			DBUtil.close(rs, st, conn);
			sql = null;
		}
		return list;
	}

}
