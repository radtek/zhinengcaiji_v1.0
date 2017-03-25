package com.unicom.ucloud.util;

import java.util.Date;

import cn.uway.commons.type.DateUtil;

/**
 * 序列产生
 */
public class SeqGen {

	private static class SeqMgrContainer {

		public static SeqGen instance = new SeqGen();

	}

	public static SeqGen getInstance() {
		return SeqMgrContainer.instance;
	}

	public synchronized String getSeq() {
		String tmp = DateUtil.getDateString_yyyyMMddHHmmss(new Date());
		int ran = (int) (Math.random() * 100000);
		return tmp + ran;

	}
}
