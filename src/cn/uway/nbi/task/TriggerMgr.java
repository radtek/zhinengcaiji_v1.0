package cn.uway.nbi.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.Module;
import cn.uway.nbi.task.trigger.AbstractTrigger;

/**
 * 触发器管理器
 * 
 * @author litp 2011-8-5
 */
public class TriggerMgr implements Module {

	private static final Logger LOG = LoggerFactory.getLogger(TriggerMgr.class);

	private Task task;

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	@Override
	public String getName() {
		return "TriggerMgr";
	}

	@Override
	public void initialize() {

	}

	@Override
	public void start() {

	}

	/**
	 * 执行指定类的方法
	 */
	public void execute(String className, Object param) throws Exception {
		if (null == className || "".equals(className))
			throw new Exception("执行方法的类型为空！");

		LOG.debug("开始执行方法!");
		AbstractTrigger t = (AbstractTrigger) getClass(className).newInstance();
		// if (type.equals("before"))
		// {
		// t = new TriggerBefore();
		// }
		// else if (type.equals("after"))
		// {
		// t = new TriggerAfter();
		// }
		// else if (type.equals("exception"))
		// {
		// t = new TriggerException();
		// }

		t.setClazz(getClass(className));
		t.setTask(task);
		t.setParam(param);
		t.onTrigger();
	}

	@Override
	public void stop() {

	}

	@Override
	public void dispose() {

	}

	@SuppressWarnings("rawtypes")
	public Class getClass(String classnme) throws ClassNotFoundException {
		return Class.forName(classnme);
	}

	public static void main(String[] args) {
		String c = "cn.uway.nbi.task.triggerbean.BatchUpdateBean";
		TriggerMgr t = new TriggerMgr();
		try {
			t.execute(c, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}