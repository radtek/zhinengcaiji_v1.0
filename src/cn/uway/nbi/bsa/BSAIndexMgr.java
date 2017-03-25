package cn.uway.nbi.bsa;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

/**
 * bsa索引（此注释为后面代码核查添加，作者，日期相关信息与实际不符合）
 * 
 * @author yanb @ 2014年4月3日
 */
public class BSAIndexMgr {

	private final int maxIndex = 9999;

	private int index = 1;

	private ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

	private ReadLock r = lock.readLock();

	private WriteLock w = lock.writeLock();

	private static class BSAIndexMgrContain {

		public static BSAIndexMgr instance = new BSAIndexMgr();
	}

	/**
	 * 获取到索引
	 * 
	 * @return String 索引
	 */
	public synchronized String getIndex() {
		if (index <= maxIndex)
			index++;
		else
			index = 0;

		int len = String.valueOf(index).length();

		return getValue(index, len);
	}

	/**
	 * 获取到值
	 * 
	 * @param index
	 *            索引
	 * @param len
	 *            长度
	 * @return String 值
	 */
	public String getValue(int index, int len) {
		StringBuilder s = new StringBuilder();
		for (int i = 0; i < 4 - len; i++) {
			s.append("0");
		}
		s.append(index);
		return s.toString();

	}

	/**
	 * 获取到实例
	 * 
	 * @return BSAIndexMgr BSAIndexMgr
	 */
	public static BSAIndexMgr getInstance() {

		return BSAIndexMgrContain.instance;
	}

	private Map<String, BsaIndex> m = new HashMap<String, BsaIndex>();

	/**
	 * 获取到索引实例
	 * 
	 * @param key
	 *            key值
	 * @return BsaIndex BsaIndex
	 */
	public BsaIndex get(String key) {
		r.lock();
		try {
			return m.get(key);
		} finally {
			r.unlock();
		}
	}

	/**
	 * 添加实例
	 * 
	 * @param key
	 *            key
	 * @param value
	 *            value
	 * @return BsaIndex 实例
	 */
	public BsaIndex put(String key, BsaIndex value) {
		w.lock();
		try {
			return m.put(key, value);
		} finally {
			w.unlock();
		}
	}

	/**
	 * 清理方法
	 */
	public void clear() {
		w.lock();
		try {
			m.clear();
		} finally {
			w.unlock();
		}
	}

}
