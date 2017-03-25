package cn.uway.webservice.fileService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.ui.ServiceContentParser;

/**
 * 文件服务接口，对外提供web service接口
 */
public class FileServicesService

{

	private static final Logger LOG = LoggerFactory.getLogger(FileServicesService.class);

	/**
	 * 对外提供的服务接口,供总部调用
	 * 
	 * @param in
	 *            xml字符串
	 * @return 输出字符串
	 */

	public String getFile(String in) {
		ServiceContentParser parser = new ServiceContentParser(in);

		String result = null;
		try {
			LOG.debug("输入字符串" + in);
			result = parser.parser();

			LOG.debug("输出字符串" + result);

		} catch (Exception e) {
			LOG.error("集团向省端请求获取文件(方法名getFile)出现异常", e);
		}
		return result;
	}
}
