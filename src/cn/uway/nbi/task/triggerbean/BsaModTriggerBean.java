package cn.uway.nbi.task.triggerbean;

import cn.uway.nbi.framework.IDMember;

@IDMember(id = 3)
public class BsaModTriggerBean extends AbstractBsaTriggerBean {

	private static final String SQL = "update ne_bsa_pde set ";

	@Override
	protected String getSql(String[] title, String[] nextLine) {
		// 修改全部数据 sid+nid+extend_bid为主键
		String sql = SQL + "PILOT_SECTOR_NAME='" + nextLine[0] + "',SID=" + nextLine[1] + ",NID=" + nextLine[2] + ",EXTEND_BID=" + nextLine[3]
				+ ",T_PN=" + nextLine[4] + ",ANTENNA_LATI=" + nextLine[5] + ",ANTENNA_LONGI=" + nextLine[6] + ",ANTENNA_ALTI=" + nextLine[7]
				+ ",ANTENNA_LOC_ACCU=" + nextLine[8] + ",SECTOR_CENTER_LATI=" + nextLine[9] + ",SECTOR_CENTER_LONGI=" + nextLine[10]
				+ ",SECTOR_CENTER_ALTI=" + nextLine[11] + ",ANTENNA_ORIENTATION=" + nextLine[12] + ",ANTENNA_OPENING=" + nextLine[13]
				+ ",MAX_ANTENNA_RANGE=" + nextLine[14] + ",TERRAIN_AVERAGE_HEIGHT=" + nextLine[15] + ",TERRAIN_HEIGHT_STANDARD_DEVI=" + nextLine[16]
				+ ",POTENTIAL_REPEATER=" + nextLine[17] + ",PN_INCREMENT=" + nextLine[18] + ",FWD_CALIB=" + nextLine[19] + ",FWD_CALIB_ACCU="
				+ nextLine[20] + ",RTD_CALIB=" + nextLine[21] + ",RTD_CALIB_ACCU=" + nextLine[22] + ",FORMAT_TYPE=" + nextLine[23] + ",SWITCH_NUM="
				+ nextLine[24] + " where sid=" + nextLine[1] + " and nid=" + nextLine[2] + " and extend_bid= " + nextLine[3];
		return sql;
	}
}
