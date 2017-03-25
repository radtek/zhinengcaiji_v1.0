package cn.uway.nbi.db.dao.dt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

/**
 * DTFactory
 * 
 * @author liuwx
 */
public class DTFactory {

	private static final Logger LOG = LoggerFactory.getLogger(DTFactory.class);

	private static final String g_flag = "g";

	private static final String w_flag = "w";

	private static final String USERNAME = "dt_username";

	private static final String PASSWORD = "dt_password";

	private DTFactory() {
	}

	private static class DTFactoryContainer {

		private static DTFactory instance = new DTFactory();
	}

	public static DTFactory getInstance() {
		return DTFactoryContainer.instance;
	}

	/**
	 * 验证用户名密码是否正确
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	private boolean isUserError(String userName, String password) {
		if (StringUtil.isNull(userName) || StringUtil.isNull(password) || !USERNAME.equals(userName) || !PASSWORD.equals(password)) {
			LOG.debug("用户名或密码错误！userName:" + userName + ",password:" + password);
			return true;
		}
		return false;
	}

	/**
	 * 生产对象方法
	 * 
	 * @param type
	 *            网络类型
	 * @return
	 */
	public static DTDAO productionObject(String type) {
		if (StringUtil.isNull(type) || (!g_flag.equalsIgnoreCase(type) && !w_flag.equalsIgnoreCase(type))) {
			LOG.debug("type 网络类型为空，请检查参数. type: " + type);
			return null;
		}
		DTDAO dao = null;
		if (g_flag.equalsIgnoreCase(type)) {
			dao = new G_DTDAO();

		} else if (w_flag.equalsIgnoreCase(type)) {
			dao = new W_DTDAO();
		}
		return dao;
	}

	public String getBtsString(String type, String userName, String password) {
		if (isUserError(userName, password)) {
			return "";
		}
		DTDAO dao = productionObject(type);
		if (dao == null) {
			return "";
		}
		return dao.queryBts();
	}

	public String getBtsInfoString(String type, String btsid, String userName, String password) {
		if (isUserError(userName, password)) {
			return "";
		}
		DTDAO dao = productionObject(type);
		if (dao == null) {
			return "";
		}
		return dao.queryBtsInfo(btsid);
	}

	public String getBtsCoordinateXML(String type, String userName, String password) {
		if (isUserError(userName, password)) {
			return "";
		}
		DTDAO dao = productionObject(type);
		if (dao == null) {
			return "";
		}
		return dao.queryBtsCoordinateXML();
	}

	public String getBtsDetailInfoXML(String type, String id, String userName, String password) {
		if (isUserError(userName, password)) {
			return "";
		}
		DTDAO dao = productionObject(type);
		if (dao == null) {
			return "";
		}
		return dao.queryBtsDetailInfoXML(id);
	}
}
