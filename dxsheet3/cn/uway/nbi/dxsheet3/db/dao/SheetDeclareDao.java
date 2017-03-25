package cn.uway.nbi.dxsheet3.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBPoolMgrCdma;
import cn.uway.nbi.dxsheet3.db.pool.DbUtil;
import cn.uway.nbi.dxsheet3.util.SendOrdersConfig;

/**
 * 工单申报数据库操作
 * 
 * @author Administrator
 */
public class SheetDeclareDao {

	private static Logger logger = LoggerFactory.getLogger(SheetDeclareDao.class);

	/**
	 * 查找符合条件的工单申报数据
	 * 
	 * @param order
	 * @param scannerQueue
	 * @param needsize
	 * @param keyVec
	 * @param orderStateMap
	 * @return
	 */
	public int findComplaintData(Map<String, String> order, Map<String, Map<String, String>> scannerQueue, Map<String, Boolean> keyVec, int needsize) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "select * from (select m.city_id cityid,m.order_id outsystemno,m.send_model_id sysprobcauseid,m.ne_level netype,"
					+ "m.ne_rank nelevel,m.period_level periodlevel,m.bsc_id bscno,m.bts_id btsno,m.cell_id cellno,m.sector_id sectorno,"
					+ "m.carr_id carrno,m.ne_name stationname,m.ne_name stationaddr,substr(m.fault_time,0,10) || ' 00:00:00' faultstarttime,"
					+ "m.fault_rank alarmlevel,(case when m.process_time_limit is null then 192 else m.process_time_limit end) * 60 processtimelimit,"
					+ "m.ne_name alarmpos,m.fault_depict alarmcontent,trunc(start_time) starttime,"
					+ "m.fault_category faultcategory, FAULT_ALL_TYPE ||'-'|| FAULT_TYPE ||'-'|| FAULT_MODEL_NAME faulttype,1 isAuto,row_number() "
					+ "over(order by m.order_id) as row_number from mod_perftaskmanage_v m"
					+ " where not exists (select '' from mod_perftaskmanage_log l where m.order_id = trim(l.order_id)) and is_send = 1 and order_state = '待派') "
					+ "where row_number <= ?";
			conn = DBPoolMgrCdma.getConnection();
			stm = conn.prepareStatement(sql);
			stm.setInt(1, needsize);
			rs = stm.executeQuery();
			while (rs.next()) {
				count = opOrderResult(order, scannerQueue, keyVec, rs, count);
			}

			logger.debug("查询工单申报数据结果 = {} 条...", count);
		} catch (Exception e) {
			logger.error("查询工单申报数据发生异常...", e);
		} finally {
			DbUtil.close(rs, stm, conn);
		}

		return count;
	}

	/**
	 * 查找符合条件的手动工单申报数据
	 * 
	 * @param order
	 * @param scannerQueue
	 * @param needsize
	 * @param orderid
	 * @param keyList
	 */
	public int findComplaintManualData(Map<String, String> order, Map<String, Map<String, String>> scannerQueue, Map<String, Boolean> keyVec,
			String orderid, int needsize) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "select * from (select m.city_id cityid,m.order_id outsystemno,m.send_model_id sysprobcauseid,m.ne_level netype,"
					+ "m.ne_rank nelevel,m.period_level periodlevel,m.bsc_id bscno,m.bts_id btsno,m.cell_id cellno,m.sector_id sectorno,"
					+ "m.carr_id carrno,m.ne_name stationname,m.ne_name stationaddr,substr(m.fault_time,0,10) || ' 00:00:00' faultstarttime,"
					+ "m.fault_rank alarmlevel,(case when m.process_time_limit is null then 192 else m.process_time_limit end) * 60 "
					+ "processtimelimit,m.ne_name alarmpos,m.fault_depict alarmcontent,"
					+ "m.fault_category faultcategory, FAULT_ALL_TYPE ||'-'|| FAULT_TYPE ||'-'|| FAULT_MODEL_NAME faulttype,1 isAuto,row_number() "
					+ "over(order by m.order_id) as row_number from mod_perftaskmanage_v m where is_send = 2 and order_state = '待派' and order_id = ?) "
					+ "where row_number <= ?";

			conn = DBPoolMgrCdma.getConnection();
			stm = conn.prepareStatement(sql);
			stm.setString(1, orderid);
			stm.setInt(2, needsize);
			rs = stm.executeQuery();

			while (rs.next()) {
				count = opOrderResult(order, scannerQueue, keyVec, rs, count);
			}

			logger.debug("查询工单申报数据结果 = {} 条...", count);
		} catch (Exception e) {
			logger.error("查询工单申报数据发生异常...", e);
		} finally {
			DbUtil.close(rs, stm, conn);
		}

		return count;
	}

	/**
	 * 处理输出单据
	 * 
	 * @param order
	 * @param scannerQueue
	 * @param keyVec
	 * @param rs
	 * @param count
	 * @param orderStateMap
	 * @return
	 * @throws SQLException
	 */
	private int opOrderResult(Map<String, String> order, Map<String, Map<String, String>> scannerQueue, Map<String, Boolean> keyVec, ResultSet rs,
			int count) throws SQLException {
		// 主键
		String pk = System.getProperty("eoms_pk_perftaskmanage", "outsystemno");
		String key = rs.getString(pk);

		// 工单编号更新失败，直接退出
		if (SendOrdersConfig.orderFileStateMap.containsKey(key)) {
			return count;
		}

		// 当前记录不是已经需要申报的Map中
		if (!(scannerQueue.containsKey(key) || keyVec.containsKey(key))) {
			count++;
			Map<String, String> orderTemp = new HashMap<String, String>(order);

			// 迭代申报工单，重配置文件中获得相关的映射关系
			for (Entry<String, String> element : orderTemp.entrySet()) {
				String colKey = element.getValue();

				if (colKey.startsWith(SendOrdersConfig.getInstance().getEomsConfig())
						|| colKey.startsWith(SendOrdersConfig.getInstance().getEomsFix())) {
					continue;
				}
				String colValue = rs.getString(colKey);
				colValue = colValue == null ? "" : colValue;
				orderTemp.put(element.getKey(), colValue);
			}

			// 地市
			String cityid = SendOrdersConfig.getInstance().getEomscityid();
			String cityvale = rs.getString(cityid);
			orderTemp.put(cityid, cityvale == null || cityvale.length() == 0 ? "0" : cityvale);
			try {
				String starttime = rs.getString("starttime");
				orderTemp.put("starttime", starttime);
			} catch (Exception e) {
			}
			scannerQueue.put(key, orderTemp);
		}
		return count;
	}

	/**
	 * 工单申报成功，修改调用状态
	 * 
	 * @param orderStateMap
	 * @param returnparaMap
	 * @param orderid
	 * @param startState
	 * @param endState
	 * @param mark
	 * @param shelfLife
	 */
	public int accessWebComplaintStatu(SheetDeclareParameter parameter) {
		int retVal = 0;
		Connection conn = null;
		PreparedStatement stm = null;
		try {
			String sql = "update mod_perftaskmanage t set t.order_state = ?, t.update_time = to_date(?,'yyyy-mm-dd hh24:mi:ss'),"
					+ "t.eoms_fault_code = ?,t.shelf_life = {shelf_life},t.mark=? where t.order_id = ?";
			sql = sql.replace("{shelf_life}", parameter.shelfLife);
			conn = DBPoolMgrCdma.getConnection();
			conn.setAutoCommit(false);
			stm = conn.prepareStatement(sql);
			stm.setString(1, parameter.endState);
			stm.setString(2, parameter.dCreateTime);
			stm.setString(3, parameter.faultCode);
			stm.setString(4, parameter.mark);
			stm.setString(5, parameter.orderid);
			retVal = stm.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			logger.error("工单申报成功，修改调用状态发生异常...", e);
		} finally {
			DbUtil.close(null, stm, conn);
		}

		if (retVal == 0) {
			if (SendOrdersConfig.orderFileStateMap != null) {
				SendOrdersConfig.orderFileStateMap.put(parameter.orderid, parameter);
			}

			logger.error("更新失败,工单ID{},状态{},母工单编号", new Object[]{parameter.orderid, parameter.endState, parameter.faultCode});
		}

		return retVal;
	}

	/**
	 * 保存访问日志
	 */
	public void saveAccessLog(SheetDeclareParameter parameter) {
		Connection conn = null;
		PreparedStatement stm = null;
		try {
			String sql = "insert into mod_perftaskmanage_log(eoms_fault_code,update_time,order_state,content,order_id) values "
					+ "(?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?,?,?)";
			conn = DBPoolMgrCdma.getConnection();
			conn.setAutoCommit(false);
			stm = conn.prepareStatement(sql);
			stm.setString(1, parameter.faultCode);
			stm.setString(2, parameter.dCreateTime);
			stm.setString(3, parameter.endState);
			stm.setString(4, parameter.resultDesc);
			stm.setString(5, parameter.orderid);
			stm.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			logger.error("工单申报成功，修改调用状态发生异常...", e);
		} finally {
			DbUtil.close(null, stm, conn);
		}
	}

	/**
	 * 工单通知
	 * 
	 * @param order
	 * @param scannerQueue
	 * @param needsize
	 * @param keyVec
	 */
	public int findConfirmNoticeData(Map<String, String> order, Map<String, Map<String, String>> scannerQueue, Map<String, Boolean> keyVec,
			int needsize) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sql = "select * from (select order_id outsystemno,eoms_fault_code faultCode,shelf_life iIsRecovery,row_number() "
					+ "over(order by eoms_fault_code) as row_number from mod_perftaskmanage where order_state = '评估' and shelf_life < 0) "
					+ "where row_number <= ?";
			conn = DBPoolMgrCdma.getConnection();
			stm = conn.prepareStatement(sql);
			stm.setInt(1, needsize);
			rs = stm.executeQuery();
			while (rs.next()) {
				// 主键
				String pk = System.getProperty("eoms_pk_perftaskmanage", "outsystemno");
				String key = rs.getString(pk);

				// 当前记录不是已经需要申报的Map中
				if (!(scannerQueue.containsKey(key) || keyVec.containsKey(key))) {
					count++;
					Map<String, String> orderTemp = new HashMap<String, String>(order);

					// 迭代申报工单，重配置文件中获得相关的映射关系
					for (Entry<String, String> element : orderTemp.entrySet()) {
						String colKey = element.getValue();
						String colValue = null;

						if (colKey.startsWith(SendOrdersConfig.getInstance().getEomsConfig())
								|| colKey.startsWith(SendOrdersConfig.getInstance().getEomsFix())) {
							continue;
						}

						if (colKey.equalsIgnoreCase("dConfirmTime")) {
							colValue = SendOrdersConfig.getDf().format(Calendar.getInstance().getTime());
						} else if (colKey.equalsIgnoreCase("iIsRecovery")) {
							colValue = rs.getString(colKey);
							colValue = colValue == null || !colValue.equals("-1") ? "2" : "1";
						} else if (colKey.equalsIgnoreCase("sRecovery")) {
							colValue = rs.getString("iIsRecovery");
							colValue = colValue == null || !colValue.equals("-1") ? "故障未恢复" : "故障恢复";
						} else {
							colValue = rs.getString(colKey);
							colValue = colValue == null ? "" : colValue;
						}
						orderTemp.put(element.getKey(), colValue);
					}

					scannerQueue.put(key, orderTemp);
				}
			}

			logger.debug("查询工单恢复数据结果 = {} 条...", count);
		} catch (Exception e) {
			logger.error("查询工单恢复数据发生发生异常...", e);
		} finally {
			DbUtil.close(rs, stm, conn);
		}

		return count;
	}

	/**
	 * 验证母工单号是否存在
	 * 
	 * @param faultCode
	 * @return
	 */
	public String checkFaultCodeExists(String faultCode) {
		String orderid = null;
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			String sql = "select order_id outsystemno from mod_perftaskmanage where eoms_fault_code = ?";
			conn = DBPoolMgrCdma.getConnection();
			stm = conn.prepareStatement(sql);
			stm.setString(1, faultCode);
			rs = stm.executeQuery();
			while (rs.next()) {
				orderid = rs.getString("outsystemno");
				break;
			}
		} catch (Exception e) {
			logger.error("验证母工单号是否存在发生发生异常...", e);
		} finally {
			DbUtil.close(rs, stm, conn);
		}
		return orderid;
	}

}
