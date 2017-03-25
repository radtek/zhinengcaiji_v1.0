package cn.uway.nbi.ui;

/**
 * 总部下发的objectlist和采集任务中对应objectlist对应关系对象
 ***/
public class ObjectListMatch {

	// 集团下发OMC数据格式
	public String omcInfo;

	// 集团下发BSC数据格式
	public String bscInfo;

	// 厂家数据格式
	public String vendor;

	/* OMC100数据格式 */
	public String omcid;

	// BSC100数据格式
	public String bsc_id;

	// 厂家+OMC+BSC
	public String object;

	// 厂家英文简称
	public String shortEning;

}
