package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.NBILog;

/**
 * 数据核查补报，重报服务
 * 
 * @author Admin
 * 
 */
public class RTaskServer {

	private static final Logger LOG = LoggerFactory.getLogger(RTaskServer.class);

	private static String vReportSql = " select  distinct   substr(askreportfile,1, instr(askreportfile,'.',1)-1) regfile,  askreportfile, actualreportfile  , report_date,  report_type from mod_verification_report  t   where  ( nbi_ststus  = null or nbi_ststus =0 )  ";

	private static String logReportSql = " select  max(file_name) file_name ,taskid , actionid,max(insert_time) from  nbi_log_report  t  where insert_time > sysdate -5   group by    taskid , actionid  order by max(insert_time)  ";

	public List<ModReport> loadReport() throws Exception {

		LOG.debug("加载任务sql语句: " + vReportSql);
		List<ModReport> list = new ArrayList<ModReport>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();
			st.setFetchSize(1000);
			rs = st.executeQuery(vReportSql);

			while (rs.next()) {
				ModReport task = new ModReport();
				task.regfile = rs.getString("regfile");
				task.askreportfile = (rs.getString("askreportfile"));
				task.actualreportfile = (rs.getString("actualreportfile"));
				task.report_date = (rs.getString("report_date"));
				task.report_type = (rs.getInt("report_type"));

				list.add(task);
			}
		} catch (Exception e) {
			LOG.error("加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	}

	public Map<String, NBILog> loadReportLog() throws Exception {

		LOG.debug("加载任务sql语句: " + vReportSql);
		Map<String, NBILog> list = new HashMap<String, NBILog>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();
			st.setFetchSize(1000);
			rs = st.executeQuery(logReportSql);

			while (rs.next()) {
				NBILog task = new NBILog();
				task.setFileName(rs.getString("file_name"));
				task.setTaskId(rs.getInt("taskid"));
				task.setActionId(rs.getLong("actionid"));
				list.put(task.getFileName(), task);
			}
		} catch (Exception e) {
			LOG.error("加载任务{}失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return list;
	}

	public boolean createRtask() throws Exception {
		List<ModReport> reportList = loadReport();
		Map<String, NBILog> logMap = loadReportLog();

		Iterator<Entry<String, NBILog>> it = logMap.entrySet().iterator();

		for (ModReport report : reportList) {
			String fileName = report.askreportfile;
			while (it.hasNext()) {
				Entry<String, NBILog> log = it.next();
				String fileNameRegex = log.getKey();

				NBILog value = log.getValue();

			}
		}

		return true;
	}

	public boolean addRTask(NBILog task) throws Exception {

		boolean flag = DBUtil.insertRTask(task.getTaskId(), "" + task.getActionId(), "数据核查", task.getDataTime());
		return flag;
	}

	class ModReport {

		public String dataTime;

		public String regfile;

		public String askreportfile;

		public String actualreportfile;

		public String report_date;

		public int report_type;
	}

	class DataChectRTaskThread extends Thread {

	}

	public static void main(String[] args) throws Exception {
		RTaskServer server = new RTaskServer();
		// try {
		// server.loadReport();
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// server.loadReportLog();

		server.createRtask();
	}

}
