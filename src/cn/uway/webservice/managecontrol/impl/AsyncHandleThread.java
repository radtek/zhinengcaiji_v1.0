package cn.uway.webservice.managecontrol.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.framework.validate.common.ThreadPool;
import cn.uway.webservice.bsa.impl.MsgQueue;

/**
 * 异步处理线程(把异步处理现场单独列出来，对外一个服务启动一个线程，而不是一个统一线程，处理所有服务的业务。好处：各服务间互相不影响。坏处：维护线程多。 以后再考虑重构)
 * 
 * @author yanb @ 2013年10月9日
 * @param <T>
 */
public abstract class AsyncHandleThread<T> implements Runnable {

	private static final Logger LOG = LoggerFactory.getLogger(AsyncHandleThread.class);

	private final MsgQueue<T> queue;

	private final ThreadPool threadPool;

	public AsyncHandleThread(MsgQueue<T> queue, ThreadPool threadPool) {
		this.queue = queue;
		this.threadPool = threadPool;
	}

	@Override
	public void run() {
		while (true) {
			try {
				if (null == queue || queue.isEmpty()) {
					Thread.sleep(1000);
				} else {
					// 扫描队列，如果有消息取出来进行处理，消息是保存在内存的，如果系统崩溃，消息会丢失。
					T obj = queue.get();
					threadPool.exceute(createAsyncHandle(obj));
				}
			} catch (Exception e) {
				LOG.error("广东系统异常查询现场异常", e);
			}

		}
	}

	/**
	 * 获取到异步处理类
	 * 
	 * @param obj
	 *            参数
	 * @return AsyncQueryHandle AsyncQueryHandle
	 * @throws Exception
	 *             Exception
	 */
	public abstract AsyncQueryHandle createAsyncHandle(T obj) throws Exception;
}
