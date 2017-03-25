package cn.uway.webservice.bsa.impl;

import java.util.Deque;
import java.util.LinkedList;

/**
 * 消息队列类
 * 
 * @author liuwx
 */
public class MsgQueue<T> {

	private Deque<T> queue;

	// 队列中存放消息的最大条数,默认为5000
	private int MAX_COUNT = 5000;

	public MsgQueue() {
		queue = new LinkedList<T>();
	}

	public MsgQueue(int size) {

		this();
		MAX_COUNT = size;

	}

	/**
	 * 从队列中取出头部元素
	 * 
	 * @return
	 * @throws InterruptedException
	 */
	public synchronized T get() throws InterruptedException {
		// 如果队列中已无消息，则等待
		while (queue.peek() == null)
			wait();

		notifyAll();
		return queue.poll();
	}

	/**
	 * 把消息加入到队列尾部
	 * 
	 * @param msg
	 * @throws InterruptedException
	 */
	public synchronized void put(T msg) throws InterruptedException {
		if (msg == null)
			return;

		while (queue.size() == MAX_COUNT)
			wait();

		boolean bReturn = queue.offer(msg);
		// 通知 消息发送线程 发送消息
		if (bReturn)
			notifyAll();
	}

	/**
	 * 把消息加入到队列首部
	 * 
	 * @param msg
	 * @throws InterruptedException
	 */
	public synchronized void putFirst(T msg) throws InterruptedException {
		if (msg == null)
			return;

		while (queue.size() == MAX_COUNT)
			wait();

		boolean bReturn = queue.offerFirst(msg);
		// 通知 消息发送线程 发送消息
		if (bReturn)
			notifyAll();
	}

	public Deque<T> getQueue() {
		return queue;
	}

	public int getSize() {
		return queue.size();
	}

	public boolean isEmpty() {
		return queue.isEmpty();
	}

	public void setQueue(Deque<T> queue) {
		this.queue = queue;
	}

	public synchronized void clear() {
		queue.clear();
	}

}
