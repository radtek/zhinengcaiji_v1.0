package com.unicom.ucloud.service.dao;

public class DAOFactory {

	public static DAOFactory instance;

	private DAOFactory() {

	}

	public static DAOFactory getInstance() {
		if (instance == null)
			return new DAOFactory();
		return null;
	}

	public ESB_SFWNOS_SFWNOS_90001_DAO createDAO(String target_mod_id) {
		ESB_SFWNOS_SFWNOS_90001_DAO dao = null;
		if ("ESB_SFWNOS_SFWNOS_00001".equalsIgnoreCase(target_mod_id))
			dao = new ESB_SFWNOS_SFWNOS_00001_DAO();
		else if ("ESB_SFWNOS_SFWNOS_00002".equalsIgnoreCase(target_mod_id))
			dao = new ESB_SFWNOS_SFWNOS_00002_DAO();
		else if ("ESB_SFWNOS_SFWNOS_00003".equalsIgnoreCase(target_mod_id))
			dao = new ESB_SFWNOS_SFWNOS_00003_DAO();
		return dao;
	}

}
