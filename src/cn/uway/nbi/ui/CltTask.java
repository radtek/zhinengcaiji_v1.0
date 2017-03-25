package cn.uway.nbi.ui;

/**
 * 采集对象实体类. <br>
 * 描述总部下发的不同级别的数据文件与采集表的对应关系。
 * 
 * @author liuwx
 */
public class CltTask {

	/**
	 * 任务编号
	 */
	public String task_id;

	/**
	 * 设备编号
	 */
	public String dev_id;

	/**
	 * 分组编号
	 */
	public String group_id;

	/**
	 * bsc列表
	 */
	public String bsclist;

	// public String omcid;
	/**
	 * 各级别数据结果
	 */
	public String objectListResult;

}
