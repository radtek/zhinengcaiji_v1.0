package cn.uway.nbi.task.templet;

import cn.uway.nbi.task.triggerbean.TriggerBean;

/**
 * 打包描述
 * 
 * @author litp 2011-4-18
 */
public class PackageTag {

	private TriggerBean triggerTag;// 触发器

	private String filename;// 文件名(可以包含匹配路径)

	public TriggerBean getTriggerTag() {
		return triggerTag;
	}

	public void setTriggerTag(TriggerBean triggerTag) {
		this.triggerTag = triggerTag;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
