package cn.uway.nbi.db.pojo;

import java.sql.Timestamp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.util.BSAConfigProperties;

public class BsaDTO {

	private static final Logger LOG = LoggerFactory.getLogger(BsaDTO.class);

	private String pilotSectorName;

	private long sid;

	private long nid;

	private long extendBid;

	private Long tPn;

	private Double antennaLati;

	private Double antennaLongi;

	private Double antennaAlti;

	private Double antennaLocAccu;

	private Double sectorCenterLati;

	private Double sectorCenterLongi;

	private Double sectorCenterAlti;

	private Double antennaOrientation;

	private Double antennaOpening;

	private Double maxAntennaRange;

	private Double terrainAverageHeight;

	private Double terrainHeightStandardDevi;

	private Double potentialRepeater;

	private int pnIncrement;

	private Double fwdCalib;

	private Double fwdCalibAccu;

	private Double rtdCalib;

	private Double rtdCalibAccu;

	private Long formatType;

	private Long switchNum;

	private String updater = "NBI";

	private Timestamp update_time;

	private String column_name;

	private String erro_type;

	private String step_name;

	
	private String stamptime;
	

	public String getPilotSectorName() {
		return pilotSectorName;
	}

	public void setPilotSectorName(String pilotSectorName) {
		this.pilotSectorName = pilotSectorName;
	}

	public long getSid() {
		return sid;
	}

	public void setSid(long sid) {
		this.sid = sid;
	}

	public long getNid() {
		return nid;
	}

	public void setNid(long nid) {
		this.nid = nid;
	}

	public long getExtendBid() {
		return extendBid;
	}

	public void setExtendBid(long extendBid) {
		this.extendBid = extendBid;
	}

	public Long gettPn() {
		return tPn;
	}

	public void settPn(Long tPn) {
		this.tPn = tPn;
	}

	public Double getAntennaLati() {
		return antennaLati;
	}

	public void setAntennaLati(Double antennaLati) {
		this.antennaLati = antennaLati;
	}

	public Double getAntennaLongi() {
		return antennaLongi;
	}

	public void setAntennaLongi(Double antennaLongi) {
		this.antennaLongi = antennaLongi;
	}

	public Double getAntennaAlti() {
		return antennaAlti;
	}

	public void setAntennaAlti(Double antennaAlti) {
		this.antennaAlti = antennaAlti;
	}

	public Double getAntennaLocAccu() {
		return antennaLocAccu;
	}

	public void setAntennaLocAccu(Double antennaLocAccu) {
		this.antennaLocAccu = antennaLocAccu;
	}

	public Double getSectorCenterLati() {
		return sectorCenterLati;
	}

	public void setSectorCenterLati(Double sectorCenterLati) {
		this.sectorCenterLati = sectorCenterLati;
	}

	public Double getSectorCenterLongi() {
		return sectorCenterLongi;
	}

	public void setSectorCenterLongi(Double sectorCenterLongi) {
		this.sectorCenterLongi = sectorCenterLongi;
	}

	public Double getSectorCenterAlti() {
		return sectorCenterAlti;
	}

	public void setSectorCenterAlti(Double sectorCenterAlti) {
		this.sectorCenterAlti = sectorCenterAlti;
	}

	public Double getAntennaOrientation() {
		return antennaOrientation;
	}

	public void setAntennaOrientation(Double antennaOrientation) {
		this.antennaOrientation = antennaOrientation;
	}

	public Double getAntennaOpening() {
		return antennaOpening;
	}

	public void setAntennaOpening(Double antennaOpening) {
		this.antennaOpening = antennaOpening;
	}

	public Double getMaxAntennaRange() {
		return maxAntennaRange;
	}

	public void setMaxAntennaRange(Double maxAntennaRange) {
		this.maxAntennaRange = maxAntennaRange;
	}

	public Double getTerrainAverageHeight() {
		return terrainAverageHeight;
	}

	public void setTerrainAverageHeight(Double terrainAverageHeight) {
		this.terrainAverageHeight = terrainAverageHeight;
	}

	public Double getTerrainHeightStandardDevi() {
		return terrainHeightStandardDevi;
	}

	public void setTerrainHeightStandardDevi(Double terrainHeightStandardDevi) {
		this.terrainHeightStandardDevi = terrainHeightStandardDevi;
	}

	public Double getPotentialRepeater() {
		return potentialRepeater;
	}

	public void setPotentialRepeater(Double potentialRepeater) {
		this.potentialRepeater = potentialRepeater;
	}

	public int getPnIncrement() {
		return pnIncrement;
	}

	public void setPnIncrement(int pnIncrement) {
		this.pnIncrement = pnIncrement;
	}

	public Double getFwdCalib() {
		return fwdCalib;
	}

	public void setFwdCalib(Double fwdCalib) {
		this.fwdCalib = fwdCalib;
	}

	public Double getFwdCalibAccu() {
		return fwdCalibAccu;
	}

	public void setFwdCalibAccu(Double fwdCalibAccu) {
		this.fwdCalibAccu = fwdCalibAccu;
	}

	public Double getRtdCalib() {
		return rtdCalib;
	}

	public void setRtdCalib(Double rtdCalib) {
		this.rtdCalib = rtdCalib;
	}

	public Double getRtdCalibAccu() {
		return rtdCalibAccu;
	}

	public void setRtdCalibAccu(Double rtdCalibAccu) {
		this.rtdCalibAccu = rtdCalibAccu;
	}

	public Long getFormatType() {
		return formatType;
	}

	public void setFormatType(Long formatType) {
		this.formatType = formatType;
	}

	public Long getSwitchNum() {
		return switchNum;
	}

	public void setSwitchNum(Long switchNum) {
		this.switchNum = switchNum;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getErro_type() {
		return erro_type;
	}

	public void setErro_type(String erro_type) {
		this.erro_type = erro_type;
	}

	public String getStep_name() {
		return step_name;
	}

	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}

	public String getStamptime() {
		return stamptime;
	}

	public void setStamptime(String stamptime) {
		this.stamptime = stamptime;
	}

	public static String getValue(Object src) {
		if (src == null)
			return "";
		return src.toString();
	}

	public String toCommaSplitString() {
		String temp = extendIDtoHex(String.valueOf(extendBid));
		return new StringBuffer(pilotSectorName).append(",").append(sid).append(",").append(nid).append(",").append(temp).append(",").append(tPn)
				.append(",").append(getValue(antennaLati)).append(",").append(getValue(antennaLongi)).append(",").append(getValue(antennaAlti))
				.append(",").append(getValue(antennaLocAccu)).append(",").append(sectorCenterLati).append(",").append(sectorCenterLongi).append(",")
				.append(sectorCenterAlti).append(",").append(antennaOrientation).append(",").append(getValue(antennaOpening)).append(",")
				.append(maxAntennaRange).append(",").append(terrainAverageHeight).append(",").append(terrainHeightStandardDevi).append(",")
				.append(potentialRepeater).append(",").append(pnIncrement).append(",").append(fwdCalib).append(",").append(fwdCalibAccu).append(",")
				.append(rtdCalib).append(",").append(rtdCalibAccu).append(",").append(formatType).append(",").append(switchNum).toString();
	}

	private String extendIDtoHex(String values) {
		// bsa 诺西扩展基站ID特殊处理
		if (BSAConfigProperties.getInstance().isExtendBIDToHex()) {
			String exID = values;
			if (null != exID && !exID.equalsIgnoreCase("")) {
				String temp = Long.toHexString(Long.valueOf(exID));
				switch (temp.length()) {
					case 0 :
						return "0x00000000";
					case 1 :
						return "0x0000000" + temp;
					case 2 :
						return "0x000000" + temp;
					case 3 :
						return "0x00000" + temp;
					case 4 :
						return "0x0000" + temp;
					case 5 :
						return "0x000" + temp;
					case 6 :
						return "0x00" + temp;
					case 7 :
						return "0x0" + temp;
					case 8 :
						return "0x" + temp;
					default :
						return values;
				}
			}
		}
		return values;
	}

	public static void main(String[] args) {
		String d = "1";
		System.out.println(getValue(d));
	}

}
