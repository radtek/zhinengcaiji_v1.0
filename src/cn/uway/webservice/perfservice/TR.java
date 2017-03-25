package cn.uway.webservice.perfservice;

import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.task.resolver.WSResolver;
import cn.uway.nbi.util.SysCfg;

public class TR {

	private static final Logger LOG = LoggerFactory.getLogger(TR.class);

	/**
	 * 编号
	 */
	private int id;

	/**
	 * 主键列表
	 */
	private List<String> primaryKeyList;

	/**
	 * TD 列表
	 */
	private List<TD> tdList;

	/**
	 * 将多个TD结果集进行合并
	 */
	private ResultSet result;

	private Task task;

	private String dataType;

	/**
	 * Map<输出字段,在outfield中的索引编号>
	 */
	private Map<String, Integer> outFileDefaultValueMap;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 主键列表
	 * 
	 * @return
	 */
	public List<String> getPrimaryKeyList() {
		return primaryKeyList;
	}

	public void setPrimaryKeyList(List<String> primaryKeyList) {
		this.primaryKeyList = primaryKeyList;
	}

	public List<TD> getTdList() {
		return tdList;
	}

	/**
	 * 会排序。把leftjoin为true的放第一。
	 * 
	 * @param tdList
	 */
	public void setTdList(List<TD> tdList) {
		// 排序
		sortList(tdList);
		this.tdList = tdList;
	}

	public void setResultSet(ResultSet re) {
		this.result = re;
	}

	public ResultSet getResult() {
		return this.result;
	}

	public Map<String, Integer> getOutFileDefaultValueMap() {
		return outFileDefaultValueMap;
	}

	public void setOutFileDefaultValueMap(Map<String, Integer> outFileDefaultValueMap) {
		this.outFileDefaultValueMap = outFileDefaultValueMap;
	}

	/**
	 * TD查询DB,合并TD里面的数据,
	 * 
	 * @param resolver
	 * @param orderByList
	 *            主TD排序字段集合
	 */
	public void searchResult(WSResolver resolver, List<String> orderByList, TR tr) {
		ExecutorService dsExecutor; // 任务线程池
		int size = tdList.size();
		dsExecutor = Executors.newFixedThreadPool(size);
		CountDownLatch latch = new CountDownLatch(size);

		try {
			for (TD td : tdList) {
				List<String> groupKey = null;
				if (!td.isLeftJoin()) {
					groupKey = primaryKeyList;

				} else {
					groupKey = orderByList;
				}

				td.init(groupKey, tr.getPrimaryKeyList(), latch, resolver, this.getId(), this.dataType);
				// 开始执行任务操作
				dsExecutor.execute(new Thread(td, " TD -" + td.getId()));
			}
			dsExecutor.shutdown();
			int reportTime = SysCfg.getInstance().getMaxReportTime();
			if (reportTime <= 0)
				latch.await();
			else
				latch.await(reportTime, TimeUnit.MINUTES);
		} catch (InterruptedException e) {
			LOG.warn("执行sql脚本意外结束,原因:线程被外部意外中断!({})", e);
		} catch (Exception e) {
			LOG.error("执行sql时发生错误!({})", e);
		} finally {
			if (!dsExecutor.isShutdown())
				dsExecutor.shutdown();
		}
	}

	/**
	 * 把leftjoin为true的放在第一。
	 * 
	 * @return
	 */
	private void sortList(List<TD> tdList) {
		if (tdList != null && tdList.size() > 0 && !tdList.get(0).isLeftJoin()) {
			for (int i = 0; i < tdList.size(); i++) {
				TD temp = tdList.get(i);
				if (temp.isLeftJoin() && i > 0) {
					tdList.remove(i);
					tdList.add(0, temp);
					break;
				}
			}
		}
	}

	public static void main(String[] args) {

	}

}
