package cn.uway.nbi.task.templet;

import java.util.List;

/**
 * 引用对象
 * 
 * @author litp 2011-5-16
 */
public class RefTag {

	private String name;// 导出名

	private String templet;// 导出模板

	private List<String> sqlList;// 导出语句

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTemplet() {
		return templet;
	}

	public void setTemplet(String templet) {
		this.templet = templet;
	}

	public List<String> getSqlList() {
		return sqlList;
	}

	public void setSqlList(List<String> sqlList) {
		this.sqlList = sqlList;
	}
}