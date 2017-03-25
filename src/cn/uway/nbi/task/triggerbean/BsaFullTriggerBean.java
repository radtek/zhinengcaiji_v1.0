package cn.uway.nbi.task.triggerbean;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import au.com.bytecode.opencsv.CSVReader;
import cn.uway.nbi.framework.IDMember;

@IDMember(id = 3)
public class BsaFullTriggerBean extends AbstractBsaTriggerBean {

	private final static String SQL = "INSERT INTO NE_BSA_PDE (PROVINCE_ID,PROVINCE_NAME,CITY_ID,CITY_NAME,PILOT_SECTOR_NAME,SID,NID,EXTEND_BID,T_PN,ANTENNA_LATI,ANTENNA_LONGI,ANTENNA_ALTI,ANTENNA_LOC_ACCU,SECTOR_CENTER_LATI,SECTOR_CENTER_LONGI,SECTOR_CENTER_ALTI,ANTENNA_ORIENTATION,ANTENNA_OPENING,MAX_ANTENNA_RANGE,TERRAIN_AVERAGE_HEIGHT,TERRAIN_HEIGHT_STANDARD_DEVI,POTENTIAL_REPEATER,PN_INCREMENT,FWD_CALIB,FWD_CALIB_ACCU,RTD_CALIB,RTD_CALIB_ACCU,FORMAT_TYPE,SWITCH_NUM) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

	private static final Logger LOG = LoggerFactory.getLogger(BatchUpdateBean.class);

	public BsaFullTriggerBean() {
		initCityMap();
	}

	@Override
	protected String getSql(String[] title, String[] nextLine) {
		// 插入全部数据 nextLine[1] + " and nid=" + nextLine[3]
		CityInfo cityInfo = cityMap.get(getCityMapKey(nextLine[1], nextLine[2], nextLine[3]));
		// CityInfo cityInfo=null;
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

				if (nextLine[3].contains("0x")) {
					nextLine[3] = String.valueOf(Long.parseLong(nextLine[3].substring(2, nextLine[3].length()), 16));
				}
				// sqls.add(getSql(title, nextLine));
				titleIndex++;
				sqlNum++;
				// 批量插入和更新
				// if (sqlNum == 1000) {
				insertDB(SQL, getSql(title, nextLine), true);
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

	public static void main(String[] ar) {
		// BsaFullTriggerBean bsafulltriggerbean = null;
		// bsafulltriggerbean = new BsaFullTriggerBean();
		// String nextLine =
		// "lyg-Xhuaguoshandajiudian4-pn150-fr283,14185,11,13216583,150,34.656790,119.231470,40,300,34.656790,119.231470,23,0,360,300,23,1,0,1,13.60,150,1.00,1,1,-1";

		// try {
		// bsafulltriggerbean.insertDB(SQL,
		// bsafulltriggerbean.getSql(null, nextLine.split(",")));
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		//
		System.out.println(SQL.contains("?"));
		BsaFullTriggerBean   bean =new BsaFullTriggerBean();
		
		
		try {
			try {
				bean.afterProcess("E:\\test\\CQ_FIVEPARA.csv");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			CSVReader reader = new CSVReader(new FileReader("E:\\test\\CQ_FIVEPARA.csv"));
			String[] nextLine;
//			while ((nextLine = reader.readNext()) != null) {
//				System.out.println(nextLine);
//
//			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
