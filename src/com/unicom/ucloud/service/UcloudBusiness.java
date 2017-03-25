package com.unicom.ucloud.service;

import java.math.BigDecimal;

/**
 * Ulcloud业务处理父类
 * 
 * @author liuwx
 */
public class UcloudBusiness {

	protected BigDecimal pageSize = new BigDecimal(1000);

	protected BigDecimal currPage = new BigDecimal(1);

	protected BigDecimal total_record = new BigDecimal(0);

	protected BigDecimal totalPage = new BigDecimal(0);

}
