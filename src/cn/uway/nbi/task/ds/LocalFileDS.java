package cn.uway.nbi.task.ds;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.uway.nbi.framework.IDMember;

/**
 * 本地文件数据源
 * 
 * @author litp 2011-4-20
 */
@IDMember(id = 200)
public class LocalFileDS extends AbstractDS {

	private List<String> absPaths;// 文件绝对路径名(可以包含路径名)

	public LocalFileDS() {
		super();
	}

	public LocalFileDS(int id, int type) {
		super(id, type);
	}

	public List<String> getAbsPaths() {
		return absPaths;
	}

	public void setAbsPaths(List<String> absPaths) {
		this.absPaths = absPaths;
	}

	@Override
	public void setFileds(Map<String, String> elementMap) {
		setAbsPaths(new ArrayList<String>(elementMap.values()));
	}

}
