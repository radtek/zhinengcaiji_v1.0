package com.unicom.ucloud.service.dao;

public class ESB_SFWNOS_SFWNOS_00002_DAO extends ESB_SFWNOS_SFWNOS_90001_DAO {

	private String sql = "select NE_SYS_ID  CELL_ID , CHINA_NAME ALIAS , CARRIER_NUM CARRIER_FREQ_QUANTITY, LAC LOCATION_AREA_CODE , CI  CELL_CI from NE_CELL_G  ";

	private final static String tableName = "T_SFWNOS_RM_CELL";

}
