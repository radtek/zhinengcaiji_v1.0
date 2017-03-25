package cn.uway.webservice.managecontrol.file;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 默认用来生成json的类
 * 
 * @author yanb @ 2013年10月9日
 */
public class DefaultGenerateJsonFile extends GenerateJsonFile {

	@Override
	protected String getJson(Object context) {
		return new BeanConverToJson().converBean(context);
	}

	/**
	 * 把bean转化为json格式
	 */
	public class BeanConverToJson {

		public String converList(List<Object> list) {
			return JSONArray.fromObject(list).toString();
		}

		public String converBean(Object obj) {
			return JSONObject.fromObject(obj).toString();
		}
	}

	public void close() throws Exception {
		return;
	}
}
