package cn.uway.nbi.task.templet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模板中include节点对应文件、配置及其解析出的结果
 * @author tylerlee
 * @ 2015年9月23日
 */
public class Include {

	//name为mapping节点的配置文件集合，如:./templet/mapping/mapping1.xml
	private List<String> mapingList;

	//name为loop节点的配置
	private boolean loop;

	//省名称代码集合// 存储省相关英文对应名// ，以及通配符
	//property name,value(510,{(${province_code},codenum),${province_cn},江苏),${province_en},JS)})
	private Map<String, String> proviceMap = new HashMap<String, String>();

	//省、地市名称代码集合// 存储城市的相关英文对应名,以及通配符
	//cityid,property name,value(510,{(${city_id},510),${city_cn},无锡),${city_en},WX)})
	private Map<String, Map<String, String>> cityMap = new HashMap<String, Map<String, String>>();

	public boolean isLoop() {
		return loop;
	}

	public void setLoop(boolean loop) {
		this.loop = loop;
	}

	public List<String> getMapingList() {
		return mapingList;
	}

	public void setMapingList(List<String> mapingList) {
		this.mapingList = mapingList;
	}

	public Map<String, String> getProviceMap() {
		return proviceMap;
	}

	public void setProviceMap(Map<String, String> proviceMap) {
		this.proviceMap = proviceMap;
	}

	public Map<String, Map<String, String>> getCityMap() {
		return cityMap;
	}

	public void setCityMap(Map<String, Map<String, String>> cityMap) {
		this.cityMap = cityMap;
	}

	public boolean isValidate() {
		if (proviceMap != null && proviceMap.size() > 0 && cityMap != null && cityMap.size() > 0)
			return true;
		return false;
	}

}
