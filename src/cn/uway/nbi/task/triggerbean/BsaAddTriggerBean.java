package cn.uway.nbi.task.triggerbean;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import cn.uway.nbi.framework.IDMember;

@IDMember(id = 3)
public class BsaAddTriggerBean extends AbstractBsaTriggerBean {

	private final static String SQL = "insert  into ne_bsa_pde (PROVINCE_ID,PROVINCE_NAME,CITY_ID,CITY_NAME,PILOT_SECTOR_NAME,SID,NID,EXTEND_BID,T_PN,ANTENNA_LATI,ANTENNA_LONGI,ANTENNA_ALTI,ANTENNA_LOC_ACCU,SECTOR_CENTER_LATI,SECTOR_CENTER_LONGI,SECTOR_CENTER_ALTI,ANTENNA_ORIENTATION,ANTENNA_OPENING,MAX_ANTENNA_RANGE,TERRAIN_AVERAGE_HEIGHT,TERRAIN_HEIGHT_STANDARD_DEVI,POTENTIAL_REPEATER,PN_INCREMENT,FWD_CALIB,FWD_CALIB_ACCU,RTD_CALIB,RTD_CALIB_ACCU,FORMAT_TYPE,SWITCH_NUM) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	public BsaAddTriggerBean() {
		initCityMap();
	}

	@Override
	protected String getSql(String[] title, String[] nextLine) {
		// 插入全部数据 nextLine[1] + " and nid=" + nextLine[3]
		CityInfo cityInfo = cityMap.get(getCityMapKey(nextLine[1], nextLine[2], nextLine[3]));
		String values;
		if (null == cityInfo) {
			values = 0 + ",'null'," + 0 + ",' ',";
		} else {
			values = cityInfo.getProvinceNo() + "," + cityInfo.getProvinceName() + "," + cityInfo.getCityId() + "," + cityInfo.getCityName() + ",";
		}

		int length = nextLine.length;
		for (int i = 0; i < length; i++) {
			if (0 == i) {
				values = values + nextLine[i] + ",";
				continue;
			}
			if (i == length - 1) {
				values = values + nextLine[i];
				continue;
			}
			values = values + nextLine[i] + ",";
		}
		return values;
	}

	protected void afterProcess(String fileName) throws Exception {

		CSVReader reader = new CSVReader(new FileReader(fileName));
		try {
			String[] nextLine;
			String[] title = null;
			int titleIndex = 0;
			int sqlNum = 0;
			List<String> sqls = new ArrayList<String>();
			while ((nextLine = reader.readNext()) != null) {
				// 和bsa上报文件相关，bsa上报文件前一行为不需要解析的数据
				if (titleIndex < 1) {
					titleIndex++;
					continue;
				}
				// 第二行为标题数据
				if (1 == titleIndex) {
					title = nextLine;
					titleIndex++;
					continue;
				}
				// 过滤那些非正规的数据
				if (nextLine.length < 5) {
					continue;
				}
				sqls.add(getSql(title, nextLine));
				titleIndex++;
				sqlNum++;
				// 批量插入和更新
				// if (sqlNum == 1000) {
				insertDB(SQL, getSql(title, nextLine),true);
				sqls.clear();
				sqlNum = 0;
				// }
			}
			// insertDB(sqls,null);
		} finally {
			if (null != reader) {
				reader.close();
			}
		}
	}

}
