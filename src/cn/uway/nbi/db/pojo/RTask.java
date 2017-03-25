package cn.uway.nbi.db.pojo;

import static cn.uway.nbi.util.ConstDef.F_SEP;
import static cn.uway.nbi.util.ConstDef.TEMPLET_PATH_FOR_TASK;

import java.util.List;

/**
 * 补报任务
 * 
 * @author liuwx
 * @since 1.0
 */
public class RTask extends Task {

	private static final long serialVersionUID = 1L;

	//
	protected long taskId;// 重新执行的任务号，对应task中的id号

	protected int counter;// 补报任务计数器

	protected int state;// 补报任务状态：-1:失败 0:需要补报 1：补报成功

	protected List<String> actionList;// 每次补报时模板中action节点对应的id号，多个用(,)分隔，如果为空就表示此模板所有action的都要补报

	protected String cause;// 每次失败的原因，按照固定格式

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public List<String> getActionList() {
		return actionList;
	}

	public void setActionList(List<String> actionList) {
		this.actionList = actionList;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public void setTempletPath(String templetName) {
		if (templetName == null || "".equals(templetName))
			templetName = TEMPLET_PATH_FOR_TASK + "nbi_" + taskId + ".xml";
		else if (!templetName.contains(F_SEP))
			templetName = TEMPLET_PATH_FOR_TASK + templetName;
		this.templetPath = templetName;
	}
}
