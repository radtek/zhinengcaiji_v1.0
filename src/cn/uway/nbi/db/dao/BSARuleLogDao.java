package cn.uway.nbi.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.DefaultDBPoolMgr;
import cn.uway.nbi.db.pojo.BsaDTO;
import cn.uway.nbi.util.Util;

public class BSARuleLogDao {

	private static final Logger LOG = LoggerFactory.getLogger(BSARuleLogDao.class);

	private java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private final static String SQL = "INSERT INTO NE_BSA_CARR_IMPORT_ERROR (PILOT_SECTOR_NAME,SID,NID,EXTEND_BID,T_PN,ANTENNA_LATI,ANTENNA_LONGI,ANTENNA_ALTI,ANTENNA_LOC_ACCU,SECTOR_CENTER_LATI,SECTOR_CENTER_LONGI,SECTOR_CENTER_ALTI,ANTENNA_ORIENTATION,ANTENNA_OPENING,MAX_ANTENNA_RANGE,TERRAIN_AVERAGE_HEIGHT,TERRAIN_HEIGHT_STANDARD_DEVI,POTENTIAL_REPEATER,PN_INCREMENT,FWD_CALIB,FWD_CALIB_ACCU,RTD_CALIB,RTD_CALIB_ACCU,FORMAT_TYPE,SWITCH_NUM,updater, update_time, column_name, erro_type,step_name,STAMPTIME ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate) ";

	public   void  setValue (int index, PreparedStatement ps, String   input ) throws SQLException{
		if (null == input || "".equals(input.trim()) || "null".equals(input.trim())) {
			ps.setNull(index, Types.DOUBLE);
		} else {
			ps.setDouble(index, Double.parseDouble(input));
		}
	}
	
	public boolean insertNBILog(BsaDTO dto) {
		if(dto==null)
			return  false;
		PreparedStatement ps = null;

		Connection conn = null;
		try {
			conn = DefaultDBPoolMgr.getConnection();
			ps = conn.prepareStatement(SQL);
			ps.setString(1, dto.getPilotSectorName());
			ps.setLong(2, dto.getSid());

			ps.setLong(3, dto.getNid());

			ps.setLong(4, dto.getExtendBid());
			
			ps.setDouble(5, dto.gettPn());
			
			setValue(6, ps, ""+dto.getAntennaLati());

			setValue(7, ps, ""+dto.getAntennaLongi());

			setValue(8, ps, ""+dto.getAntennaAlti());
			setValue(9, ps, ""+dto.getAntennaLocAccu());

			setValue(10,ps, ""+ dto.getSectorCenterAlti());
			setValue(11, ps, ""+dto.getSectorCenterLongi());

			setValue(12, ps, ""+dto.getSectorCenterLati());

			setValue(13, ps, ""+dto.getAntennaOrientation());

			setValue(14, ps, ""+dto.getAntennaOpening());

			setValue(15, ps, ""+dto.getMaxAntennaRange());

			setValue(16, ps, ""+dto.getTerrainAverageHeight());

			setValue(17, ps, ""+dto.getTerrainHeightStandardDevi());


			setValue(18, ps, ""+dto.getPotentialRepeater());

			setValue(19, ps, ""+dto.getPnIncrement());

			setValue(20, ps, ""+dto.getFwdCalib());
			setValue(21,ps, ""+ dto.getFwdCalibAccu());
			setValue(22, ps, ""+dto.getRtdCalib());

			setValue(23, ps, ""+dto.getRtdCalibAccu());
			setValue(24, ps, ""+dto.getFormatType());

			setValue(25, ps, ""+dto.getSwitchNum());
			ps.setString(26, dto.getUpdater());

			Date  d =new Date();
			ps.setTimestamp(27,new Timestamp(d.getTime()));

			ps.setString(28, dto.getColumn_name());
			ps.setString(29, dto.getErro_type());
			ps.setString(30, dto.getStep_name());

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			LOG.error(" 记录NBI日志出现异常 ,sql:" + SQL, e);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return false;
	}

	public BsaDTO conver(String[] input, String columnName, String erro_type, String Step_name) {
		
		if(input.length<25)
			return null;
			
				
		BsaDTO dto = new BsaDTO();
		
		try {
			dto.setPilotSectorName(input[0]);
			
			dto.setSid(Long.valueOf(input[1]));

			dto.setNid(Long.valueOf(input[2]));

			dto.setExtendBid(Long.valueOf(input[3]));
			
			dto.settPn(Util.isNullOrEmplet(input[4])?null:Long.valueOf(input[4]));
			
			dto.setAntennaLati(Util.isNullOrEmplet(input[5])?null:Double.valueOf(input[5]));

			dto.setAntennaLongi(Util.isNullOrEmplet(input[6])?null: Double.valueOf(input[6]));

			dto.setAntennaAlti(Util.isNullOrEmplet(input[7])?null: Double.valueOf(input[7]));
			dto.setAntennaLocAccu(Util.isNullOrEmplet(input[8])?null: Double.valueOf(input[8]));

			dto.setSectorCenterAlti(Util.isNullOrEmplet(input[9])?null: Double.valueOf(input[9]));
			dto.setSectorCenterLongi(Util.isNullOrEmplet(input[10])?null: Double.valueOf(input[10]));

			dto.setSectorCenterLati(Util.isNullOrEmplet(input[11])?null: Double.valueOf(input[11]));

			dto.setAntennaOrientation(Util.isNullOrEmplet(input[12])?null: Double.valueOf(input[12]));

			dto.setAntennaOpening(Util.isNullOrEmplet(input[13])?null: Double.valueOf(input[13]));

			dto.setMaxAntennaRange(Util.isNullOrEmplet(input[14])?null: Double.valueOf(input[14]));

			dto.setTerrainAverageHeight(Util.isNullOrEmplet(input[15])?null:Double.valueOf(input[15]));

			dto.setTerrainHeightStandardDevi(Util.isNullOrEmplet(input[16])?null:Double.valueOf(input[16]));


			dto.setPotentialRepeater(Util.isNullOrEmplet(input[17])?null:Double.valueOf(input[17]));
			dto.setPnIncrement(Util.isNullOrEmplet(input[18])?null:Integer.valueOf(input[18]));

			dto.setFwdCalib(Util.isNullOrEmplet(input[19])?null:Double.valueOf(input[19]));
			dto.setFwdCalibAccu(Util.isNullOrEmplet(input[20])?null:Double.valueOf(input[20]));
			dto.setRtdCalib(Util.isNullOrEmplet(input[21])?null:Double.valueOf(input[21]));

			dto.setRtdCalibAccu(Util.isNullOrEmplet(input[22])?null:Double.valueOf(input[22]));
			dto.setFormatType(Util.isNullOrEmplet(input[23])?null:Long.valueOf(input[23]));

			dto.setSwitchNum(Util.isNullOrEmplet(input[24])?null:Long.valueOf(input[24]));

			dto.setUpdater("NBI");

			Date date = new Date();

			dto.setUpdate_time(new Timestamp(date.getTime()));

			dto.setColumn_name(columnName);
			dto.setErro_type(erro_type);
			dto.setStep_name(Step_name);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			LOG.error("",e);
		}

		return dto;
	}

	public static void main(String[] args) {
		BSARuleLogDao dao = new BSARuleLogDao();
		BsaDTO dto = new BsaDTO();

//		dto.setPilotSectorName("");
//		dto.setSid(1);
//
//		dto.setNid(1);
//
//		dto.setExtendBid(1);
//		dto.setAntennaLati(1);
//
//		dto.setAntennaLongi(1);
//
//		dto.setAntennaAlti(1);
//		dto.setAntennaLocAccu(1);
//
//		dto.setSectorCenterAlti(1);
//		dto.setSectorCenterLongi(1);
//
//		dto.setSectorCenterLati(1);
//
//		dto.setAntennaOrientation(1);
//
//		dto.setAntennaOpening(1);
//
//		dto.setMaxAntennaRange(1);
//
//		dto.setTerrainAverageHeight(1);
//
//		dto.setTerrainHeightStandardDevi(1);
//
//		dto.setTerrainHeightStandardDevi(1);
//
//		dto.setPotentialRepeater(1);
//
//		dto.setPnIncrement(1);
//
//		dto.setFwdCalib(1);
//		dto.setFwdCalibAccu(1);
//		dto.setRtdCalib(1);
//
//		dto.setRtdCalibAccu(1);
//		dto.setFormatType(1);
//
//		dto.setSwitchNum(1);
//		dto.setUpdater("nbi");
//
//		Date date = new Date();
//
//		dto.setUpdate_time(new Timestamp(date.getTime()));
//
//		dto.setColumn_name("");
//		dto.setErro_type("");
//		dto.setStep_name("");
//
//		dao.insertNBILog(dto);
		
//		BsaDTO dto = new BsaDTO();
		

	}
}
