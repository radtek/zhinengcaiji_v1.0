package cn.uway.nbi.db.dao.dt;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.DecimalFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dao.AbstractDAO;
import cn.uway.nbi.dt.BTS;
import cn.uway.nbi.dt.BTSInfo;

/**
 * DTDAO
 * 
 * @author liuwx
 */
public abstract class DTDAO extends AbstractDAO<BTSInfo> {

	protected static final Logger LOG = LoggerFactory.getLogger(DTDAO.class);

	protected static DecimalFormat df5 = new DecimalFormat("#.#####");

	protected final static String xmlhead = "<?xml version=\"1.0\" encoding=\"utf-8\"?> \n";

	protected final static String _N = "\n";

	protected Connection conn = null;

	public String queryBts() {
		return "";
	}

	protected abstract Connection getConnection() throws Exception;

	@Override
	public boolean update(BTSInfo entity) throws Exception {
		return false;
	}

	public abstract String queryBtsInfo(String btsid);

	public abstract String queryBtsCoordinateXML();

	/**
	 * @param 系统id
	 *            ,主键
	 * @return
	 */
	public abstract String queryBtsDetailInfoXML(String cellID);

	protected String btsToString(BTS bts, StringBuilder sb) {
		sb.append("<bts>").append(_N);
		sb.append("<id>").append(bts.id).append("</id>").append(_N);
		sb.append("<btsCode>").append(bts.btsCode).append("</btsCode>").append(_N);
		sb.append("<btsName>").append(bts.btsName).append("</btsName>").append(_N);
		sb.append("<longitude>").append(bts.longitude).append("</longitude>").append(_N);
		sb.append("<latitude>").append(bts.latitude).append("</latitude>").append(_N);
		sb.append("<cellNum>").append(bts.cellNum).append("</cellNum>").append(_N);
		sb.append("</bts>\n");
		return sb.toString();
	}

	/**
	 * 四舍五入一个数值，保留几位小数点
	 * 
	 * @param number
	 * @param scale
	 *            保留几位小数
	 * @return
	 */
	protected String roundNumber(double number, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("scale 数值必须是正整数或0");
		}
		BigDecimal big = new BigDecimal(number);
		BigDecimal one = new BigDecimal("1");
		return big.divide(one, scale, BigDecimal.ROUND_HALF_UP).toString();
	}

	protected String btsInfoToString(BTSInfo bts, StringBuilder sb) {

		// <id>主键id</id> NE_SYS_ID 0088071630009000
		//
		// <btsCode>基站编号</btsCode> bts_id
		// <btsName>基站名称</btsName>
		// <address>基站地址</address> site_add
		// <longitude>经度</longitude>
		// <latitude>纬度</latitude>
		// <territory>行政区</territory>
		// <deptName>包机部门</deptName>
		// <coverRadium>覆盖半径（米）</coverRadium>
		// <projectName>工程信息</projectName>
		// <vendor>设备厂家</vendor>
		// <cellList>
		sb.append("<btsInfo>");
		sb.append("<id>").append(bts.id).append("</id>").append(_N);
		sb.append("<btsCode>").append(bts.btsCode).append("</btsCode>").append(_N);
		sb.append("<btsName>").append(bts.btsName).append("</btsName>").append(_N);

		sb.append("<address>").append(bts.address).append("</address>").append(_N);

		sb.append("<longitude>").append(bts.longitude).append("</longitude>").append(_N);
		sb.append("<latitude>").append(bts.latitude).append("</latitude>").append(_N);

		sb.append("<territory>").append(bts.territory).append("</territory>").append(_N);
		sb.append("<deptName>").append(bts.deptName).append("</deptName>").append(_N);
		sb.append("<coverRadium>").append(bts.coverRadium).append("</coverRadium>").append(_N);
		sb.append("<projectName>").append(bts.projectName).append("</projectName>").append(_N);

		sb.append("<vendor>").append(bts.vendor).append("</vendor>").append(_N);
		sb.append("<cellList>");
		sb.append(bts.cellsXml).append(_N);
		sb.append("</cellList>\n");
		sb.append("</btsInfo>");

		return sb.toString();
	}
	// <btsList>
	// <bts>
	// <id>主键id，用于查询基站详细</id> NE_SYS_ID 0088071630009000
	// <btsCode>基站编号</btsCode> bts_id
	// <btsName>基站名称</ btsName>
	// <longitude>经度</longitude>
	// <latitude>纬度</latitude>
	// <cellNum>扇区数量</cellNum>
	// </bts>
	// ";

}
