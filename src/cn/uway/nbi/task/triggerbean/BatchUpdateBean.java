package cn.uway.nbi.task.triggerbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.util.ConstDef;

@IDMember(id = 1)
public class BatchUpdateBean extends TriggerBean {

	private static final Logger LOG = LoggerFactory.getLogger(BatchUpdateBean.class);

	protected Task task;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public void batchUpdate(List<String> list) {
		if (list == null || list.isEmpty())
			return;
		String sql = null;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			for (String sql1 : list) {
				if (StringUtil.isNull(sql1))
					continue;
				String[] bsaUpdateSql = sql1.split(";");
				for (String tmp : bsaUpdateSql) {
					if (StringUtil.isNull(tmp))
						continue;

					if (task != null) {
						sql = ConstDef.ParseFilePathForDB(tmp, new Timestamp(task.getCurrDataTime().getTime()));
					} else {
						sql = tmp;
					}

					long begin = System.currentTimeMillis();
					ps = con.prepareStatement(sql);
					int count = ps.executeUpdate();
					long end = System.currentTimeMillis();
					LOG.info(task + ":影响行数   count= " + count + "-----,耗时{}秒-----" + "   sql :   " + sql, (end - begin) / 1000);
				}
			}
			con.commit();
		} catch (Exception e) {

			LOG.error("执行更新失败，sql" + sql, e);
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
				}
			}
		} finally {
			DBUtil.close(null, ps, con);
		}
	}

	/**
	 * 向数据库批量添加新数据
	 * 
	 * @param sql
	 * @return 返回批量提交受影响的行数
	 * @throws Exception
	 */
	public int[] executeBatch(List<String> sqlList) throws Exception {
		int[] result = null;
		Connection con = null;
		Statement stm = null;
		try {
			if (sqlList != null && !sqlList.isEmpty()) {
				con = DBUtil.getConnection();
				if (con != null) {
					con.setAutoCommit(false);
					stm = con.createStatement();
					for (String sql : sqlList)
						stm.addBatch(sql);
					result = stm.executeBatch();
					con.commit();
				}

			}
		} finally {
			DBUtil.close(null, stm, con);
		}
		return result;
	}

	/**
	 * 向数据库批量添加新数据 用 PreparedStatement 的方式提交
	 * 
	 * @param sql
	 * @return 返回批量提交受影响的行数
	 * @throws Exception
	 */
	public int[] executeBatch(String sqlTable, String sqlPara, boolean flag) throws Exception {
		int[] result = null;
		Connection con = null;
		PreparedStatement stm = null;
		try {
			if (sqlTable != null && sqlPara != null) {
				con = DBUtil.getConnection();
				if (con != null) {
					con.setAutoCommit(false);
					stm = con.prepareStatement(sqlTable);

					// 主要是针对BsaFullTriggerBean NE_BSA_PDE insert SQL 进行判断
					if (flag) {
						int i = 1;
						String  [] values=sqlPara.split(",", -1);
						for (String sql : values) {
						
							if (i == 2 || i == 4 || i == 5) {
								stm.setString(i++, sql);
							} else {
								if (null == sql || "".equals(sql.trim()) || "null".equals(sql.trim())) {
									stm.setNull(i++, Types.DOUBLE);
								} else {
									stm.setDouble(i++, Double.parseDouble(sql));
								}
							}
						}
					}

					stm.executeUpdate();
					con.commit();
				}

			}
		} finally {
			DBUtil.close(null, stm, con);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void trigger(Task task) throws Exception {
		this.setTask(task);
		Map<String, String> map = task.getParaMap();
		if (map != null) {
			List<String> list = (List<String>) param;

			List<String> resultList = new ArrayList<String>();

			for (String sql : list) {
				Iterator<Entry<String, String>> it = map.entrySet().iterator();
				Entry<String, String> en = it.next();
				if (StringUtil.isNotNull(sql)) {
					sql = sql.replace("${" + en.getKey() + "}", en.getValue());
					sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));

					resultList.add(sql);
				}
			}
			if (resultList.size() > 0)
				batchUpdate(resultList);
		}
	}

}
