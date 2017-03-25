package cn.uway.nbi.dt;

import java.util.List;

public class BTSInfo {

	// <id>主键id</id>
	public String id;

	// <btsCode>基站编号</btsCode>
	public String btsCode;

	// <btsName>基站名称</btsName>
	public String btsName;

	// <address>基站地址</address>
	public String address;

	// <longitude>经度</longitude>
	public String longitude;

	// <latitude>纬度</latitude>
	public String latitude;

	// <territory>行政区</territory>
	public String territory;

	// <deptName>包机部门</deptName>
	public String deptName;

	// <coverRadium>覆盖半径（米）</coverRadium>
	public String coverRadium;

	// <projectName>工程信息</projectName>
	public String projectName;

	// <vendor>设备厂家</vendor>
	public String vendor;

	public List<Cell> cellList;

	public String cellsXml;

}
