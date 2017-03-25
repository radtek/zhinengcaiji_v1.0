package cn.uway.webservice.bsa.impl;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.task.TaskMgr;
import cn.uway.nbi.task.TaskTrigger;

/**
 * TaskQueueMgr
 * 
 * @author liuwx
 */
public class TaskQueueMgr {

	private static final Logger LOG = LoggerFactory.getLogger(TaskQueueMgr.class);

	private MsgQueue<BSATask> queue;

	private ExecutorService taskExecutor; // 任务线程池

	private static int POOL_SIZE = 30000;// SysCfg.getInstance().getOutQueueSize();;

	private static class BSATaskMgrContainer {

		private static TaskQueueMgr instance = new TaskQueueMgr();
	}

	public static TaskQueueMgr getInstance() {
		return BSATaskMgrContainer.instance;
	}

	private boolean runFlag = true;

	private TaskQueueMgr() {

		queue = new MsgQueue<BSATask>(POOL_SIZE);
		taskExecutor = Executors.newCachedThreadPool();
		start();
	}

	public void start() {

		Thread t = new Thread(new BSATaskThread(), " BSATask Thread Name ");
		t.start();
	}

	class BSATaskThread implements Runnable {

		public BSATaskThread() {
		}

		@Override
		public void run() {
			while (runFlag) {
				try {
					BSATask task = queue.get();
					if (task == null) {
						Thread.sleep(5 * 1000);
						continue;
					}
					TaskTrigger taskTrigger = new TaskTrigger(task, TaskMgr.getInstance());
					taskExecutor.execute(new Thread(taskTrigger, "BSATaskTrigger-" + task.getId()));
					Thread.sleep(100);
				} catch (Exception e) {
					LOG.error("------------------------------   出现异常，原因： ", e);
				}
			}
		}
	}

	public void put(BSATask task) throws InterruptedException {
		queue.put(task);
	}

	public int getSize() {
		return queue.getSize();
	}

	public boolean getRunFlag() {
		return runFlag;

	}

	public void stop() {
		runFlag = false;
	}

	public static void main(String[] args) throws InterruptedException {
		TaskQueueMgr.getInstance().start();
		try {
			BSATask f = new BSATask();
			TaskQueueMgr.getInstance().put(f);
		} catch (Exception e) {
			LOG.error(" 添加到 消息队列中失败。  ", e);
		}
	}
}