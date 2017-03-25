package com.unicom.ucloud.service.dao;

public class ESB_SFWNOS_SFWNOS_00003_DAO extends ESB_SFWNOS_SFWNOS_90001_DAO {

	private final static String tableName = "T_SFWNOS_RM_CELL_REL";

	private String sql = " select NE_SYS_ID  CELL_ID , null RELATED_CELL_ID  from  NE_CELL_G  ";

}
