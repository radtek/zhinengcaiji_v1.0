package cn.uway.nbi.db.dao.dt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBPoolMgrWcdma;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.dt.BTSInfo;
import cn.uway.nbi.util.ConstDef;

/**
 * W_DTDAO
 * 
 * @author liuwx
 */
public class W_DTDAO extends DTDAO {

	protected String sql = "select t.* ,cellNum from ne_bts_w t, (select ne_bts_id, count(*) as cellNum from ne_cell_w group by ne_bts_id) t2 where t.ne_bts_id = t2.ne_bts_id";

	// 去除 基站小区数不大于3 的条件 “ having count(*) <=3 ”
	protected String sql2 = " select * from ne_bts_w g,(select ne_bts_id, WMSYS.WM_CONCAT('<cell><cellId>' || ne_cell_id || '</cellId>' ||'<cellName>'|| cell_name ||'</cellName> </cell>') as celllist from ne_cell_w t   group by ne_bts_id ) b where g.ne_bts_id = b.ne_bts_id and g.ne_bts_id='${ne_bts_id}'  order by g.ne_bts_id";

	protected String searchBts = "select cell.ne_cell_id, im.bts_id,im.bts_name,im.longitude,im.latitude, im.inroom_name, im.cell_id,im.cell_name from ne_cell_inroom_w im, ne_cell_w cell where im.lac = cell.lac and im.ne_cell_id = cell.ne_cell_id ";

	protected String searchInfo = "select cell.ne_cell_id,im.bts_id, im.bts_name, bts.Site_add, im.longitude, im.latitude, im.adm_area, im.erection_type, decode(im.cover_info,'是','室内',im.cover_info) as cover_info, im.inroom_name, im.cell_id, im.cell_name, im.source_type, decode(im.vendor,'ZY0808','华为','ZY0804','中兴', im.vendor) as vendor, im.rru_num, im.lac from ne_cell_inroom_w im, ne_bts_w bts, ne_cell_w cell where im.lac = cell.lac and bts.ne_bts_id = cell.ne_bts_id and im.ne_cell_id = cell.ne_cell_id and cell.ne_cell_id = ?";

	@Override
	public boolean update(BTSInfo entity) throws Exception {
		return false;
	}

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
				String id = rs.getString("ne_bts_id");
				String btsCode = rs.getString("bts_id");
				if (StringUtil.isNull(btsCode)) {
					btsCode = "";
				}
				String btsName = rs.getString("bts_NAME");
				String longitude = rs.getString("longitude");
				if (StringUtil.isNotNull(longitude))
					longitude = df5.format(Double.parseDouble(longitude));
				else
					longitude = "";
				String latitude = rs.getString("latitude");
				if (StringUtil.isNotNull(latitude))
					latitude = df5.format(Double.parseDouble(latitude));
				else
					latitude = "";
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
		} finally {
			DBUtil.close(rs, st, conn);
		}
		return sb.toString();
	}

	protected Connection getConnection() throws Exception {
		conn = DBPoolMgrWcdma.getConnection();
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

			sqltmp = sqltmp.replace("${ne_bts_id}", btsid);
			rs = st.executeQuery(sqltmp);
			while (rs.next()) {
				BTSInfo bts = new BTSInfo();

				bts.id = rs.getString("ne_bts_id");
				bts.btsCode = rs.getString("bts_id");
				bts.btsName = rs.getString("bts_NAME");
				bts.longitude = df5.format(Double.parseDouble(rs.getString("longitude")));
				bts.latitude = df5.format(Double.parseDouble(rs.getString("latitude")));

				bts.address = rs.getString("site_add");
				// bts. territory;
				// bts. deptName;
				// bts. coverRadium;
				// bts. projectName;

				// bts. deptName;
				bts.deptName = rs.getString("adm_area");
				bts.projectName = rs.getString("MAINTAINVENDOR");

				bts.vendor = rs.getString("vendor");

				// List<Cell> cellList;

				// bts.cellsXml = rs.getString("celllist");

				bts.cellsXml = ConstDef.ClobParse(rs.getClob("celllist"));

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
				String id = rs.getString("ne_cell_id");
				String btsCode = rs.getString("bts_id");
				String btsName = rs.getString("bts_name");
				String inroomName = rs.getString("inroom_name");
				double longi = rs.getDouble("longitude");
				String longitude = roundNumber(longi, 5);
				double lati = rs.getDouble("latitude");
				String latitude = roundNumber(lati, 5);
				String cellNum = rs.getString("cell_id");
				String cellname = rs.getString("cell_name");

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
				String id = rs.getString("ne_cell_id");
				String btsCode = rs.getString("bts_id");
				String btsName = rs.getString("bts_name");
				String siteAddress = rs.getString("site_add");
				double longi = rs.getDouble("longitude");
				String longitude = roundNumber(longi, 5);
				double lati = rs.getDouble("latitude");
				String latitude = roundNumber(lati, 5);
				String admArea = rs.getString("adm_area");
				String scene = rs.getString("erection_type");
				String coverInfo = rs.getString("cover_info");
				String inroomName = rs.getString("inroom_name");
				String cellNum = rs.getString("cell_id");
				String cellName = rs.getString("cell_name");
				String sourceType = rs.getString("source_type");
				String vendor = rs.getString("vendor");
				String rruNumber = rs.getString("rru_num");
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
				sb.append("<rruNumber>" + rruNumber + "</rruNumber>" + _N);
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
		DTDAO dao = new W_DTDAO();
		// String xmls = dao.queryBtsCoordinateXML();
		// System.out.println(xmls);
		System.out.println(dao.queryBtsDetailInfoXML("2080200321054360"));
		// dao.queryBtsDetailInfoXML("");

		// System.out.println(dao.queryBts());
		// System.out.println(dao.queryBtsInfo(""));

	}
}
