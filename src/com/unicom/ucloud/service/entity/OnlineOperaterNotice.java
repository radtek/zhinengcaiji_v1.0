package com.unicom.ucloud.service.entity;

import java.util.List;

/**
 * 在线操作通知实体类
 * 
 * @author liuwx
 */
public class OnlineOperaterNotice {

	public String work_order_no;

	public String oper_type;

	public String plan_start_time;

	public String plan_end_time;

	public String onlineoper_scheme;

	public String affect_nms;

	public String affect_service;

	public String affect_system;

	public String affect_resource;

	public String res_id_list;

	public List<ResIdItem> resIdList;

}
