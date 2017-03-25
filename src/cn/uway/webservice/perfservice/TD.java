package cn.uway.webservice.perfservice;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.task.resolver.WSResolver;

public class TD implements Runnable {

	private static final Logger LOG = LoggerFactory.getLogger(TD.class);

	/**
	 * 编号
	 */
	private int id;

	/**
	 * 是否以左边的数据行为准
	 */
	private boolean leftJoin = false;

	/**
	 * sql语句
	 */
	private String sql;

	private ResultSet resultSet;

	//
	private CountDownLatch latch;

	private List<String> groupKey;

	private WSResolver resolver;

	private String fileName;

	private int trId;

	private String dataType;

	private List<String> lineKeyList;

	public void init(List<String> groupKey, List<String> lineKeyList, CountDownLatch latch, WSResolver resolver, int trId, String dataType) {
		this.latch = latch;
		this.groupKey = groupKey;
		this.resolver = resolver;
		this.trId = trId;
		this.dataType = dataType;
		this.lineKeyList = lineKeyList;
	}

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 是否左连接
	 * 
	 * @return
	 */
	public boolean isLeftJoin() {
		return leftJoin;
	}

	public void setLeftJoin(boolean leftJoin) {
		this.leftJoin = leftJoin;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		if (null != sql) {
			this.sql = sql.replaceAll("&gt;", ">").replaceAll("&lt;", "<");
		}
	}

	public ResultSet getResultSet() {
		return resultSet;
	}

	public void setResultSet(ResultSet resultSet) {
		this.resultSet = resultSet;
	}

	@Override
	public void run() {
		try {
			resolver.processGetResult(getSql(), this, groupKey, lineKeyList, this.getTrId(), dataType);
		} catch (Exception e) {
			LOG.error("执行查询脚本发生错误!{}, ({})", getSql(), e);
		} finally {
			latch.countDown();
		}
	}

}
