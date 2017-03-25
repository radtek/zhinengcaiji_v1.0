package com.unicom.ucloud.service.changnotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.PropertiesXML;

import com.unicom.ucloud.service.entity.DaCeNotice;
import com.unicom.ucloud.service.entity.ResIdItem;

/**
 * 导入资源变更通知信息服务，相关消息类型<br>
 * 
 * <pre>
 * 枚举值：1： 重保消息通知 
 *        2： 预案消息通知 
 *        3： 预案路由消息通知 
 *        4： 割接单信息 
 *        5： 打/撤销割接标签
 * </pre>
 * 
 * @author liuwx
 */
public class MessageParser {

	private static final Logger LOG = LoggerFactory.getLogger(MessageParser.class);

	/**
	 * 通过枚举类型，调用不同的类进行解析
	 * 
	 * @param prikey
	 *            唯一关键字
	 * @param type
	 *            类型 枚举值： 1： 重保消息通知 2： 预案消息通知 3： 预案路由消息通知 4： 割接单信息 5： 打/撤销割接标签
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void parser(String prikey, String type, String noticeXml) throws Exception {
		int noticetype = Integer.valueOf(type);
		switch (noticetype) {
			case 1 :
				zhongbao(prikey, type, noticeXml);
				break;
			case 2 :
				yu_an(prikey, type, noticeXml);
				break;
			case 3 :
				yu_an_route(prikey, type, noticeXml);
				break;
			case 4 :
				ge_jie(prikey, type, noticeXml);
				break;
			case 5 :
				da_cexiao(prikey, type, noticeXml);
				break;
			case 6 :
				online(prikey, type, noticeXml);
				break;
			default :
				LOG.error("无效的通知类型");
				break;
		}
	}

	/**
	 * <pre>
	 * 枚举值：1： 重保消息通知 
	 *        2： 预案消息通知 
	 *        3： 预案路由消息通知 
	 *        4： 割接单信息 
	 *        5： 打/撤销割接标签
	 * </pre>
	 * 
	 * @param prikey
	 *            重保消息通知
	 * @param type
	 *            类型
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void zhongbao(String prikey, String type, String noticeXml) throws Exception {
		String sql = " insert into ucloud_notice_zhongbao (prikey_key,notice_type,WORK_ORDER_NO ,OPER_TYPE  ,PLAN_START_TIME  ,PLAN_END_TIME ,ONLINEOPER_SCHEME,AFFECT_NMS ,AFFECT_SERVICE,AFFECT_SYSTEM ,AFFECT_RESOURCE  ,  RES_ID ,  RES_CLASS_ID ,  NMS_ID ,  FLAG  ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PropertiesXML pxml = new PropertiesXML(noticeXml, 1);
		String PROTECTION_TASK_ID = pxml.getProperty("NOTICE_XML.PROTECTION_TASK_ID ");
		String ROTECTION_START_TIME = pxml.getProperty("NOTICE_XML.ROTECTION_START_TIME ");
		String PRO_CUSTOMER_NAME = pxml.getProperty("NOTICE_XML.PRO_CUSTOMER_NAME");
		String PRO_TITLE = pxml.getProperty("NOTICE_XML.PRO_TITLE");
		String ROTECTION_END_TIME = pxml.getProperty("NOTICE_XML.ROTECTION_END_TIME ");
		String ROTECTION_START_FLAG = pxml.getProperty("NOTICE_XML.ROTECTION_START_FLAG ");

		List<Element> list = pxml.getElementsByXpath("NOTICE_XML.RES_ID_LIST.RES_ID_ITEM");
		List<ResIdItem> idList = new ArrayList<ResIdItem>();
		Connection con = DBUtil.getConnection();

		Statement st = null;
		PreparedStatement ps = null;

		for (Element e : list) {
			ResIdItem item = new ResIdItem();

			List<Element> el = e.elements();
			for (Element ee : el) {
				String name = ee.getName();
				String value = ee.getText();

				if ("RES_CLASS_ID".equalsIgnoreCase(name)) {
					item.res_class_id = value;

				} else if ("PROTECTION_RES_ID".equalsIgnoreCase(name)) {
					item.protection_res_id = value;

				}
			}
			idList.add(item);
		}

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			int index = 1;

			for (ResIdItem it : idList) {
				ps.setString(index++, prikey);
				ps.setString(index++, type);

				ps.setString(index++, PROTECTION_TASK_ID);
				ps.setString(index++, ROTECTION_START_TIME);
				ps.setString(index++, PRO_CUSTOMER_NAME);
				ps.setString(index++, PRO_TITLE);

				ps.setString(index++, ROTECTION_END_TIME);
				ps.setString(index++, ROTECTION_START_FLAG);

				ps.setString(index++, it.res_class_id);
				ps.setString(index++, it.protection_res_id);
				ps.execute();
			}
			con.commit();
		} catch (Exception e) {
			LOG.error("插入数据失败：" + sql, e);
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception ex) {
			}
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}

	}

	/**
	 * 预案消息通知
	 * 
	 * <pre>
	 * 枚举值：1： 重保消息通知 
	 *        2： 预案消息通知 
	 *        3： 预案路由消息通知 
	 *        4： 割接单信息 
	 *        5： 打/撤销割接标签
	 * </pre>
	 * 
	 * @param prikey
	 *            预案消息通知
	 * @param type
	 *            类型
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void yu_an_route(String prikey, String type, String noticeXml) throws Exception {
		PropertiesXML pxml = new PropertiesXML(noticeXml, 1);
		String PLAN_ID = pxml.getProperty("NOTICE_XML.PLAN_ID");
		String ROUTE_NUM = pxml.getProperty("NOTICE_XML.ROUTE_NUM");

		String DEVICE_ID = pxml.getProperty("NOTICE_XML.DEVICE_ID");
		String DEVICE_NMS_ID = pxml.getProperty("NOTICE_XML.DEVICE_NMS_ID");
		String PORT_ID = pxml.getProperty("NOTICE_XML.PORT_ID");
		String PORT_NMS_ID = pxml.getProperty("NOTICE_XML.PORT_NMS_ID");
		String TIME_SLOT_ID = pxml.getProperty("NOTICE_XML.TIME_SLOT_ID");
		String TIME_SLOT_NMS_ID = pxml.getProperty("NOTICE_XML.TIME_SLOT_NMS_ID");

		Connection con = DBUtil.getConnection();

		Statement st = null;
		PreparedStatement ps = null;

		String sql = "insert into ucloud_notice_yuan_route (prikey_key,notice_type,PLAN_ID ,ROUTE_NUM ,DEVICE_ID ,DEVICE_NMS_ID ,PORT_ID ,PORT_NMS_ID ,TIME_SLOT_ID,TIME_SLOT_NMS_ID    ) values (?,?,?,?,?,?,?,?,?,?) ";

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			int index = 1;
			ps.setString(index++, prikey);
			ps.setString(index++, type);

			ps.setString(index++, PLAN_ID);
			ps.setString(index++, ROUTE_NUM);
			ps.setString(index++, DEVICE_ID);
			ps.setString(index++, DEVICE_NMS_ID);
			ps.setString(index++, PORT_ID);

			ps.setString(index++, PORT_NMS_ID);
			ps.setString(index++, TIME_SLOT_ID);
			ps.setString(index++, TIME_SLOT_NMS_ID);
			ps.execute();
			con.commit();
		} catch (Exception e) {
			LOG.error("插入数据失败：" + sql, e);
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception ex) {
			}
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}

	}

	/**
	 * 预案路由消息通知
	 * 
	 * <pre>
	 * 枚举值：1： 重保消息通知 
	 *        2： 预案消息通知 
	 *        3： 预案路由消息通知 
	 *        4： 割接单信息 
	 *        5： 打/撤销割接标签
	 * </pre>
	 * 
	 * @param prikey
	 *            预案路由消息通知
	 * @param type
	 *            类型
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void yu_an(String prikey, String type, String noticeXml) throws Exception {
		PropertiesXML pxml = new PropertiesXML(noticeXml, 1);
		String PLAN_ID = pxml.getProperty("NOTICE_XML.PLAN_ID");
		String RES_ID = pxml.getProperty("NOTICE_XML.RES_ID");

		String NMS_ID = pxml.getProperty("NOTICE_XML.NMS_ID");

		Connection con = DBUtil.getConnection();

		Statement st = null;
		PreparedStatement ps = null;

		String sql = "insert into ucloud_notice_yuan (prikey_key,notice_type,PLAN_ID ,ROUTE_NUM ,DEVICE_ID  ) values (?,?,?,?,?) ";

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			int index = 1;
			ps.setString(index++, prikey);
			ps.setString(index++, type);

			ps.setString(index++, PLAN_ID);
			ps.setString(index++, RES_ID);
			ps.setString(index++, NMS_ID);
			ps.execute();
			con.commit();
		} catch (Exception e) {
			LOG.error("插入数据失败：" + sql, e);
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception ex) {
			}
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}

	}

	/**
	 * 割接单信息消息通知
	 * 
	 * <pre>
	 * 枚举值：1： 重保消息通知 
	 *        2： 预案消息通知 
	 *        3： 预案路由消息通知 
	 *        4： 割接单信息 
	 *        5： 打/撤销割接标签
	 * </pre>
	 * 
	 * @param prikey
	 *            预案路由消息通知
	 * @param type
	 *            类型
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void ge_jie(String prikey, String type, String noticeXml) throws CfgException {
		// TODO 由于格式未知，暂时不做

	}

	/**
	 * 在线
	 * 
	 * <pre>
	 * 枚举值：1： 重保消息通知 
	 *        2： 预案消息通知 
	 *        3： 预案路由消息通知 
	 *        4： 割接单信息 
	 *        5： 打/撤销割接标签
	 * </pre>
	 * 
	 * @param prikey
	 *            在线
	 * @param type
	 *            类型
	 * @param noticeXml
	 *            需要解析的xml
	 * @throws Exception
	 *             异常
	 */
	public void online(String prikey, String type, String noticeXml) throws Exception {
		String sql = " insert into ucloud_notice_online (prikey_key,notice_type,WORK_ORDER_NO ,OPER_TYPE  ,PLAN_START_TIME  ,PLAN_END_TIME ,ONLINEOPER_SCHEME,AFFECT_NMS ,AFFECT_SERVICE,AFFECT_SYSTEM ,AFFECT_RESOURCE  ,  RES_ID ,  RES_CLASS_ID ,  NMS_ID ,  FLAG  ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PropertiesXML pxml = new PropertiesXML(noticeXml, 1);
		String WORK_ORDER_NO = pxml.getProperty("NOTICE_XML.WORK_ORDER_NO");
		String OPER_TYPE = pxml.getProperty("NOTICE_XML.OPER_TYPE");
		String PLAN_START_TIME = pxml.getProperty("NOTICE_XML.PLAN_START_TIME");
		String PLAN_END_TIME = pxml.getProperty("NOTICE_XML.PLAN_END_TIME");
		String ONLINEOPER_SCHEME = pxml.getProperty("NOTICE_XML.ONLINEOPER_SCHEME");
		String AFFECT_NMS = pxml.getProperty("NOTICE_XML.AFFECT_NMS");
		String AFFECT_SERVICE = pxml.getProperty("NOTICE_XML.AFFECT_SERVICE");
		String AFFECT_SYSTEM = pxml.getProperty("NOTICE_XML.AFFECT_SYSTEM");
		String AFFECT_RESOURCE = pxml.getProperty("NOTICE_XML.AFFECT_RESOURCE");

		List<Element> list = pxml.getElementsByXpath("NOTICE_XML.RES_ID_LIST.RES_ID_ITEM");
		List<ResIdItem> idList = new ArrayList<ResIdItem>();
		Connection con = DBUtil.getConnection();

		Statement st = null;
		PreparedStatement ps = null;

		for (Element e : list) {
			ResIdItem item = new ResIdItem();

			List<Element> el = e.elements();
			for (Element ee : el) {
				String name = ee.getName();
				String value = ee.getText();

				if ("RES_CLASS_ID".equalsIgnoreCase(name)) {
					item.res_class_id = value;

				} else if ("PROTECTION_RES_ID".equalsIgnoreCase(name)) {
					item.protection_res_id = value;

				} else if ("NMS_ID".equalsIgnoreCase(name)) {
					item.nms_id = value;
				}

				else if ("FLAG".equalsIgnoreCase(name)) {
					item.flag = value;
				}
			}
			idList.add(item);
		}

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			int index = 1;

			for (ResIdItem it : idList) {
				ps.setString(index++, prikey);
				ps.setString(index++, type);

				ps.setString(index++, WORK_ORDER_NO);
				ps.setString(index++, OPER_TYPE);
				ps.setString(index++, PLAN_START_TIME);
				ps.setString(index++, PLAN_END_TIME);

				ps.setString(index++, ONLINEOPER_SCHEME);
				ps.setString(index++, AFFECT_NMS);
				ps.setString(index++, AFFECT_SERVICE);
				ps.setString(index++, AFFECT_SYSTEM);
				ps.setString(index++, AFFECT_RESOURCE);

				ps.setString(index++, it.res_class_id);
				ps.setString(index++, it.protection_res_id);
				ps.setString(index++, it.nms_id);
				ps.setString(index++, it.flag);
				index = 1;
				ps.execute();
			}
			con.commit();
		} catch (Exception e) {
			LOG.error("插入数据失败：" + sql, e);
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception ex) {
			}
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}

	}

	/**
	 * @param prikey
	 * @param type
	 * @param noticeXml
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void da_cexiao(String prikey, String type, String noticeXml) throws Exception {
		PropertiesXML pxml = new PropertiesXML(noticeXml, 1);
		String WORK_ORDER_NO = pxml.getProperty("NOTICE_XML.WORK_ORDER_NO");
		String CUT_FLAG = pxml.getProperty("NOTICE_XML.CUT_FLAG");
		List<Element> list = pxml.getElementsByXpath("NOTICE_XML.RES_ID_LIST.RES_ID_ITEM");
		DaCeNotice notice = new DaCeNotice();
		notice.workOrderNo = WORK_ORDER_NO;
		notice.cutFlag = CUT_FLAG;
		List<ResIdItem> idList = new ArrayList<ResIdItem>();
		Connection con = DBUtil.getConnection();

		Statement st = null;
		PreparedStatement ps = null;

		for (Element e : list) {
			ResIdItem item = new ResIdItem();

			List<Element> el = e.elements();
			for (Element ee : el) {
				String name = ee.getName();
				String value = ee.getText();

				if ("RES_CLASS_ID".equalsIgnoreCase(name)) {
					item.res_class_id = value;

				} else if ("PROTECTION_RES_ID".equalsIgnoreCase(name)) {
					item.protection_res_id = value;

				} else if ("NMS_ID".equalsIgnoreCase(name)) {
					item.nms_id = value;
				}
			}
			idList.add(item);

		}
		String sql = " insert into ucloud_notice_dacegejie (prikey_key,notice_type,work_order_no,cut_flag,res_class_id,PROTECTION_RES_ID,"
				+ "NMS_ID) values (?,?,?,?,?,?,?) ";

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			int index = 1;

			for (ResIdItem it : idList) {
				ps.setString(index++, prikey);
				ps.setString(index++, type);

				ps.setString(index++, WORK_ORDER_NO);
				ps.setString(index++, CUT_FLAG);
				ps.setString(index++, it.res_class_id);
				ps.setString(index++, it.protection_res_id);
				ps.setString(index++, it.nms_id);
				ps.execute();
			}
			con.commit();
		} catch (Exception e) {
			LOG.error("插入数据失败：" + sql, e);
			try {
				if (con != null) {
					con.rollback();
				}
			} catch (Exception ex) {
			}
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
	}
}