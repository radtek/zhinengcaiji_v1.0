package cn.uway.nbi.task.templet.ds;

import java.util.List;

/**
 * 本地文件数据源模板
 * 
 * @author litp 2011-4-18
 */
public class LocalFileDSTag extends DSTag {

	private List<String> absPaths;// 文件绝对路径名(可以包含路径名)

	public LocalFileDSTag() {
		super();
	}

	public LocalFileDSTag(int id, int type) {
		super(id, type);
	}

	public List<String> getAbsPaths() {
		return absPaths;
	}

	public void setAbsPaths(List<String> absPaths) {
		this.absPaths = absPaths;
	}

}
