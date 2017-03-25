package com.unicom.ucloud.service.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.dbpool.DBUtil;

import com.unicom.ucloud.esb_sfwnos_sfwnos_inquiryresinfosrv.OutputFieldItem;
import com.unicom.ucloud.service.InputParameter;

/**
 * DAO 接口类，Ucloud相关数据库的操作都在此类和子类中实现
 * 
 * @author liuwx
 */
public abstract class DAO {

	private static final Logger LOG = LoggerFactory.getLogger(DAO.class);

	protected SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * 输入参数
	 */
	protected InputParameter inputParameter;

	public InputParameter getInputParameter() {
		return inputParameter;
	}

	public void setInputParameter(InputParameter inputParameter) {
		this.inputParameter = inputParameter;
	}

	/**
	 * 获取总记录数
	 * 
	 * @param sql
	 *            sql语句
	 * @return 记录条数
	 */
	public long getTotalRecords(String sql) {
		String s = new String(sql);

		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(s.toString());
			while (rs.next()) {
				return rs.getInt("totalcount");
			}
		} catch (Exception e) {
			LOG.error("查询{}失败,原因{}", sql.toString(), e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return 0;

	}

	/**
	 * 集合对象转化为字符串
	 * 
	 * @param outputFieldItem
	 *            集合对象
	 * @return 字符串
	 */
	public String objectToString(List<OutputFieldItem> outputFieldItem) {
		StringBuilder sb = new StringBuilder();
		for (OutputFieldItem out : outputFieldItem) {
			sb.append(out.getOutputFieldName()).append(",");
		}
		if (sb.length() > 0)
			sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}

}
