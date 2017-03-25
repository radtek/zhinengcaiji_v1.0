package cn.uway.nbi.db.dao.dt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBPoolMgrGsm;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.dt.BTSInfo;

/**
 * G_DTDAO
 * 
 * @author liuwx
 */
public class G_DTDAO extends DTDAO {

	protected String sql = " select t.ne_sys_id,t2.bts,t.china_name,t.longitude,t.latitude,t2.cellNum from ne_bts_g t, (select related_bts,bts, count(*) as cellNum from ne_cell_g group by related_bts,bts) t2 where t.ne_sys_id = t2.related_bts ";

	// 去除 基站小区数不大于3 的条件 “ having count(*) <=3 ”
	protected String sql2 = " select  * from ne_bts_g   g  ,cfg_county  county ,(select  related_bts   , WMSYS.WM_CONCAT('<cell><cellId>'||ne_sys_id|| '</cellId>'|| '<cellName>'||china_name|| '</cellName> </cell>')  as celllist  from ne_cell_g   t  group by related_bts  ) b where g.ne_sys_id=b.related_bts  and g.ne_sys_id= ${ne_sys_id}  and  county.city_id =g.city_id  and county.county_id=g.adm_area  order by g.ne_sys_id ";

	protected String searchBts = "select g.ne_sys_id, g.bts, ig.bts_name, ig.cell_name, ig.longitude, ig.latitude, ig.cell_name, ig.ci, ig.cellname from ne_cell_g g,ne_cell_inroom_g ig where g.lac = ig.lac and g.ci = ig.ci ";

	protected String searchInfo = "select cell.ne_sys_id,cell.bts, im.bts_name, im.cell_name, bts.site_add, im.longitude, im.latitude, im.adm_area, im.scene, im.cover_info, im.ci, im.cellname, im.source_type, decode(im.vendor,'ZY0808','华为','ZY0804','中兴', im.vendor) as vendor, im.booster_num, im.lac from  ne_cell_g cell, ne_cell_inroom_g im, ne_bts_g bts where im.lac = cell.lac and im.ci = cell.ci and cell.related_bts = bts.ne_sys_id and cell.ne_sys_id = ? ";

	@Override
	public boolean update(BTSInfo entity) throws Exception {
		return false;
	}

	/**
	 * return json
	 */
	public String queryBts() {
		StringBuilder sb = new StringBuilder();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			sb.append("{data:[");
			while (rs.next()) {
				String id = rs.getString("NE_SYS_ID");
				String btsCode = rs.getString("bts");
				if (StringUtil.isNotNull(btsCode)) {
					btsCode = rs.getString("bts");
				} else {
					btsCode = "";
				}
				String btsName = rs.getString("CHINA_NAME");
				String longitude = rs.getString("longitude");
				if (StringUtil.isNotNull(longitude)) {
					longitude = df5.format(Double.parseDouble(longitude));
				} else {
					longitude = "";
				}
				String latitude = rs.getString("latitude");
				if (StringUtil.isNotNull(latitude)) {
					latitude = df5.format(Double.parseDouble(latitude));
				} else {
					latitude = "";
				}
				String cellNum = rs.getString("cellNum");

				if (!rs.isFirst()) {
					sb.append(",");
					sb.append("\r\n");
				}
				sb.append("{id:\"" + id + "\",btsCode:\"" + btsCode + "\",btsName:\"" + btsName + "\",longitude:\"" + longitude + "\",latitude:\""
						+ latitude + "\",cellNum:\"" + cellNum + "\"}");
			}
			sb.append("]}");
		} catch (Exception e) {
			LOG.debug("查询基站信息失败,info:", e);
			sb = new StringBuilder("");
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return sb.toString();
	}

	protected Connection getConnection() throws Exception {
		conn = DBPoolMgrGsm.getConnection();
		return conn;
	}

	public String queryBtsInfo(String btsid) {
		if (StringUtil.isNull(btsid))
			return "";
		StringBuilder sb = new StringBuilder();
		sb.append(xmlhead);
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		int count = 0;
		try {
			String sqltmp = new String(sql2);
			conn = getConnection();
			st = conn.createStatement();

			sqltmp = sqltmp.replace("${ne_sys_id} ", btsid);
			rs = st.executeQuery(sqltmp);
			while (rs.next()) {
				BTSInfo bts = new BTSInfo();

				bts.id = rs.getString("NE_SYS_ID");
				bts.btsCode = rs.getString("bts_id");
				bts.btsName = rs.getString("CHINA_NAME");
				bts.longitude = df5.format(Double.parseDouble(rs.getString("longitude")));
				bts.latitude = df5.format(Double.parseDouble(rs.getString("latitude")));

				bts.address = rs.getString("site_add");
				// bts. territory;
				// bts. deptName;
				// bts. coverRadium;
				// bts. projectName;

				// bts. deptName;
				bts.deptName = rs.getString("county_name");
				bts.projectName = rs.getString("MAINTAINVENDOR");

				bts.vendor = rs.getString("vendor");

				// bts.cellsXml=ConstDef.ClobParse(rs.getClob("celllist"));

				bts.cellsXml = rs.getString("celllist");

				btsInfoToString(bts, sb);
				count++;
			}
		} catch (Exception e) {
			LOG.debug("查询基站信息失败", e);
		} finally {
			DBUtil.close(rs, st, conn);
		}
		if (count > 0)
			return sb.toString();
		else
			return "";
	}

	@Override
	public String queryBtsCoordinateXML() {
		StringBuilder sb = new StringBuilder();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(searchBts);
			rs = ps.executeQuery();
			sb.append("<btsList>").append(_N);
			while (rs.next()) {
				String id = rs.getString("ne_sys_id");
				String btsCode = rs.getString("bts");
				String btsName = rs.getString("bts_name");
				String inroomName = rs.getString("cell_name");

				double longi = rs.getDouble("longitude");
				String longitude = roundNumber(longi, 5);
				double lati = rs.getDouble("latitude");
				String latitude = roundNumber(lati, 5);

				String cellNum = rs.getString("ci");
				String cellname = rs.getString("cellname");
				sb.append("<bts>").append(_N);
				sb.append("<id>" + id + "</id>" + _N);
				sb.append("<btsCode>" + btsCode + "</btsCode>" + _N);
				sb.append("<btsName>" + btsName + "</btsName>" + _N);
				sb.append("<longitude>" + longitude + "</longitude>" + _N);
				sb.append("<latitude>" + latitude + "</latitude>" + _N);
				sb.append("<inroomName>" + inroomName + "</inroomName>" + _N);
				sb.append("<cellNum>" + cellNum + "</cellNum>" + _N);
				sb.append("<cellname>" + cellname + "</cellname>" + _N);
				sb.append("</bts>").append(_N);
			}
			sb.append("</btsList>").append(_N);
		} catch (Exception e) {
			LOG.debug("查询基站信息失败", e);
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		return sb.toString();
	}

	@Override
	public String queryBtsDetailInfoXML(String cellID) {
		StringBuffer sb = new StringBuffer();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(searchInfo);
			ps.setString(1, cellID);
			rs = ps.executeQuery();
			if (rs.next()) {
				String id = rs.getString("ne_sys_id");
				String btsCode = rs.getString("bts");
				String btsName = rs.getString("bts_name");
				String siteAddress = rs.getString("site_add");
				double longi = rs.getDouble("longitude");
				String longitude = roundNumber(longi, 5);
				double lati = rs.getDouble("latitude");
				String latitude = roundNumber(lati, 5);
				String admArea = rs.getString("adm_area");
				String scene = rs.getString("scene");
				String coverInfo = rs.getString("cover_info");
				String inroomName = rs.getString("cell_name");
				String cellNum = rs.getString("ci");
				String cellName = rs.getString("cellname");
				String sourceType = rs.getString("source_type");
				String vendor = rs.getString("vendor");
				String boosterNum = rs.getString("booster_num");
				String lac = rs.getString("lac");

				sb.append("<btsInfo>").append(_N);
				sb.append("<id>" + id + "</id>" + _N);
				sb.append("<btsCode>" + btsCode + "</btsCode>" + _N);
				sb.append("<btsName>" + btsName + "</btsName>" + _N);
				sb.append("<address>" + siteAddress + "</address>" + _N);
				sb.append("<longitude>" + longitude + "</longitude>" + _N);
				sb.append("<latitude>" + latitude + "</latitude>" + _N);
				sb.append("<territory>" + admArea + "</territory>" + _N);
				sb.append("<SceneType>" + scene + "</SceneType>" + _N);
				sb.append("<coverageArea>" + coverInfo + "</coverageArea>" + _N);
				sb.append("<inroomName>" + inroomName + "</inroomName>" + _N);
				sb.append("<cellID>" + cellNum + "</cellID>" + _N);
				sb.append("<cellName>" + cellName + "</cellName>" + _N);
				sb.append("<mstype>" + sourceType + "</mstype>" + _N);
				sb.append("<Vender>" + vendor + "</Vender>" + _N);
				sb.append("<dryNumber>" + boosterNum + "</dryNumber>" + _N);
				sb.append("<lac>" + lac + "</lac>" + _N);
				sb.append("</btsInfo>").append(_N);
			}
		} catch (Exception e) {
			LOG.debug("查询基站信息失败", e);
		} finally {
			DBUtil.close(rs, ps, conn);
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		DTDAO dao = new G_DTDAO();
		// String xml = dao.queryBtsCoordinateXML();
		// System.out.println(xml);
		System.out.println(dao.queryBtsDetailInfoXML("0080800200056840"));
		// System.out.println(dao.queryBtsInfo(""));

	}
}
