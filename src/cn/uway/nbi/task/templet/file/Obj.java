package cn.uway.nbi.task.templet.file;

import java.util.List;
import java.util.Map;

/**
 * 模板中的所有配置对象
 * 
 * @author litp 2011-5-6
 */
public class Obj {

	private Map<String, Map<String, Integer>> indexs;// 表头数据的索引

	private Map<String, List<String[]>> datas;// 所有从数据库中获取的数据

	public Map<String, Map<String, Integer>> getIndexs() {
		return indexs;
	}

	public void setIndexs(Map<String, Map<String, Integer>> indexs) {
		this.indexs = indexs;
	}

	public Map<String, List<String[]>> getDatas() {
		return datas;
	}

	public void setDatas(Map<String, List<String[]>> datas) {
		this.datas = datas;
	}
}
