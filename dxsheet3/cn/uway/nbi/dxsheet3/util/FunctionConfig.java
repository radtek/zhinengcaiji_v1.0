package cn.uway.nbi.dxsheet3.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Properties;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Explain 系统功能配置
 * @Date 2012-5-28 上午10:27:40
 * @author tianjing
 * @ClassName FunctionConfig.java
 * @PackageName cn.uway.nbi.workOrders.systemParameter
 */
public class FunctionConfig {

	private static Logger logger = LoggerFactory.getLogger(FunctionConfig.class);

	public FunctionConfig() {
		initializeParameter();
	}

	/**
	 * @Explain 加载系统功能配置模块
	 * @Date 2012-5-28 上午10:27:01
	 * @author tianjing
	 * @method initializeParameter
	 * @param 输入参数
	 * @return void
	 * @Exception 抛出的异常
	 */
	public int initializeParameter() {
		try {
			InputStream input = new FileInputStream(SendOrdersConfig.GLOBAL_CONF_PATH + "functionConfig.properties");
			InputStreamReader inputStr = new InputStreamReader(input, "GB2312");
			Properties pro = new Properties();
			pro.load(inputStr);

			input.close();
			inputStr.close();

			// 读取参数存入System中
			Iterator<Entry<Object, Object>> itr = pro.entrySet().iterator();
			while (itr.hasNext()) {
				Entry<Object, Object> entry = itr.next();
				String key = entry.getKey().toString();
				String value = entry.getValue().toString();
				System.setProperty(key, value);
			}
		} catch (Exception e) {
			logger.error("功能配置模块加载失败，工单接口系统将无法启动。exception：" + e.getMessage());
			return -1;
		}
		return 0;
	}
}
