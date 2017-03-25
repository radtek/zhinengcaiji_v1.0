package cn.uway.webservice.dt.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dao.dt.DTFactory;
import cn.uway.webservice.dt.DTService;

/**
 * 重庆联通 路测管理系统与网优系统 接口
 * 
 * @author liuwx
 */
public class DTServiceImpl implements DTService {

	private static final Logger LOG = LoggerFactory.getLogger(DTServiceImpl.class);

	public String getBtsJSON(String type, String username, String password) {
		return DTFactory.getInstance().getBtsString(type, username, password);
	}

	public String getBtsInfoXml(String type, String btsid, String username, String password) {
		return DTFactory.getInstance().getBtsInfoString(type, btsid, username, password);
	}

	public String getBtsCoordinateXML(String type, String userName, String password) {
		return DTFactory.getInstance().getBtsCoordinateXML(type, userName, password);
	}

	public String getBtsDetailInfoXML(String type, String id, String userName, String password) {
		return DTFactory.getInstance().getBtsDetailInfoXML(type, id, userName, password);
	}

	public static void main(String[] args) {
		// DTServiceImpl impl = new DTServiceImpl();
		// String str = impl.getBtsXml("w");
		// System.out.println(str);
		/*
		 * String str = impl.getBtsXml("g"); System.out.println(str);
		 */

		// String info = impl.getBtsInfoXml("w", "2080200329020600");
		// System.out.println(info);
		//
		// // impl.getBtsXml("w");
		// String sss= impl.getBtsInfoXml("g","0011010030000001");
		// System.out.println(sss);
		// impl.getBtsInfoXml("w","0011010030000001");
	}
}
