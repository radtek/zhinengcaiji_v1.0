package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBPoolMgrCdma;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.SmsStrategy;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.util.BSAMapping;

@IDMember(id = 2)
public class BSADao extends AbstractDAO<BSATask> {

	private static final Logger LOG = LoggerFactory.getLogger(BSADao.class);

	@Override
	public List<BSATask> find(String hql) throws Exception {
		return null;
	}

	@Override
	public void delete(BSATask entity) throws Exception {
	}

	@Override
	public void add(BSATask entity) throws Exception {
	}

	@Override
	public boolean update(BSATask task) throws Exception {
		StringBuilder sb = new StringBuilder("update CFG_BSA_AUTOPLAN t set t.curr_data_time=to_date('");

		if ("plan".equals(task.getSyncmode().toLowerCase())) {
			sb.append(DateUtil.getDateString(task.getCurrDataTime()));
			sb.append("','YYYY-MM-DD HH24:MI:SS')");

			sb.append(" ,  t.end_data_time=to_date('");
			sb.append(DateUtil.getDateString(new Date(task.getCurrDataTime().getTime() - task.getPeroidTime())));
			sb.append("','YYYY-MM-DD HH24:MI:SS')");
		} else {
			sb.append(DateUtil.getDateString(task.getNextDataTime()));
			sb.append("','YYYY-MM-DD HH24:MI:SS')");
		}

		if (task.getReportTime() != null) {
			sb.append(", t.reporttime=to_date('");
			sb.append(DateUtil.getDateString(task.getNextReportTime()));
			sb.append("','YYYY-MM-DD HH24:MI:SS')");
		}

		sb.append(" where t.planid=");
		sb.append(task.getId());
		String updateSql = sb.toString();
		String tableName = "CFG_BSA_AUTOPLAN";
		LOG.debug("updateSql  :" + updateSql);
		boolean flag = DBUtil.executeUpdate(updateSql) == 1 ? true : false;
		long taskId = task.getId();
		LOG.debug("taskId:" + taskId + "  成功更新" + tableName + "表");

		return flag;
	}

	public static void insertLog(String file_name, String file_path, long file_length, Date data_time, int state, long fileNum) {

		String sql = "insert into LOG_BSA_UPLOAD_FILE  (file_name ,file_path,file_length,data_time,upload_time,state,record_count) values ('"
				+ file_name + "','" + file_path + file_name + "'," + file_length + ",to_date('" + DateUtil.getDateString(data_time)
				+ "','yyyy-MM-dd HH24:mi:ss'),sysdate," + state + "," + fileNum + ")";

		try {
			DBUtil.executeUpdate(sql);
		} catch (Exception e) {
			LOG.error("更新语句执行失败: sql=" + sql, e);
		}
	}

	@Override
	public List<BSATask> loadTasks() throws Exception {
		String sql = "select t.*  from CFG_BSA_AutoPlan t  where   t.iseffect=1   and syncmode in('Auto','Plan')    ";
		LOG.debug("加载任务sql语句: " + sql);
		List<BSATask> list = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Map<Long, BSATask> map = new HashMap<Long, BSATask>();
		try {
			conn = DBPoolMgrCdma.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			list = new ArrayList<BSATask>();
			StringBuilder sb = new StringBuilder();

			while (rs.next()) {
				BSATask task = new BSATask();
				task.setTask(true);
				task.setId(rs.getLong("planid"));

				task.setFrequency(rs.getInt("FREQUENCY"));
				task.setPeriod(task.getFrequency() + "D");

				Date plan_time = rs.getTimestamp("plan_time");
				Date currDate = rs.getTimestamp("curr_data_time");

				if (currDate == null) {
					currDate = plan_time;
					if (currDate == null) {
						Log.debug(task.getId() + "需要配置任务时间");
						continue;
					}
				}
				task.setCurrDataTime(currDate);
				String model = rs.getString("SYNCMODE");

				String tmpmodel = BSAMapping.getInstance().getBsaTempletMapping().get(model.toLowerCase());

				if (StringUtil.isNull(tmpmodel))
					continue;

				task.setSyncmode(model);//
				task.setTempletPath(tmpmodel);
				task.setEndDataTime(rs.getTimestamp("END_DATA_TIME"));
				task.setUsed(rs.getInt("iseffect") == 1 ? true : false);
				task.setReportTime(rs.getTimestamp("REPORTTIME"));
				task.setSynctype(rs.getString("SYNCTYPE"));
				task.setSynfile(rs.getString("SYNCFILE"));
				task.setPlanno(rs.getString("PLANNO"));
				long stratId = rs.getLong("strategy_id");

				if (stratId != 0) {
					task.setSms(true);
					sb.append(stratId).append(",");
					task.setStrategyId(stratId);
				}
				list.add(task);
				map.put(task.getId(), task);
			}
			if (sb.length() > 0) {
				sb.deleteCharAt(sb.length() - 1);
			}
			Map<Long, SmsStrategy> m1 = new HashMap<Long, SmsStrategy>();
			if (sb.length() > 0) {
				sql = "select  * from mod_sms_strategy  t   where t.id in(" + sb.toString() + ")";
				DBUtil.close(rs, st, null);
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				while (rs.next()) {
					SmsStrategy strate = new SmsStrategy();
					strate.setId(rs.getLong("id"));
					strate.setSendtype(rs.getInt("sendtype"));
					strate.setSmscontent(rs.getString("SMSCONTENT"));
					strate.setEmailsubject(rs.getString("emailsubject"));
					strate.setEmailcontent(rs.getString("emailcontent"));
					m1.put(strate.getId(), strate);
				}
			}

			Set<Entry<Long, BSATask>> set = map.entrySet();
			for (Entry<Long, BSATask> entry : set) {
				long l = entry.getValue().getStrategyId();
				if (l != 0) {
					entry.getValue().setStrategy(m1.get(l));
				}
			}
		} catch (Exception e) {
			LOG.debug("加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return new ArrayList<BSATask>(map.values());
	}
}
