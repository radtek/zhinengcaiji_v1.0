package cn.uway.nbi.ws;

import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface IssuedWebservice {
	/**
	 * 补采任务生成接口
	 * 
	 * @param jsonStr
	 *            
	 * @return
	 */
	String createRTask(@WebParam(name = "jsonStr") String jsonStr);
}
