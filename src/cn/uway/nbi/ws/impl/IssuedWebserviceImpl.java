package cn.uway.nbi.ws.impl;

import javax.jws.WebService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

import cn.uway.nbi.db.dao.CheckListLogDAO;
import cn.uway.nbi.db.dbpool.DBUtil;
import cn.uway.nbi.ws.IssuedWebservice;
import cn.uway.nbi.ws.entity.WSParam;
import cn.uway.nbi.ws.entity.WSResult;
import jodd.util.StringUtil;

@WebService(endpointInterface = "cn.uway.nbi.ws.IssuedWebservice", serviceName = "issuedWebservice")
public class IssuedWebserviceImpl implements IssuedWebservice{
	
	private static final Logger LOG = LoggerFactory.getLogger(IssuedWebserviceImpl.class);
	
	@Override
	public String createRTask(String jsonStr) {
		LOG.debug("The method of createRTask args is:"+jsonStr);
		WSResult result = new WSResult();
		WSParam param = null;
		try{
			param = JSON.parseObject(jsonStr, WSParam.class);
			if(param.getTaskId() == null)
			{
				result.setCode(1);
				result.setErrMsg("任务ID不能为空!");
				return JSON.toJSONString(result);
			}
			if(StringUtil.isEmpty(param.getDataTime()))
			{
				result.setCode(1);
				result.setErrMsg("任务的采集时间不能为空!");
				return JSON.toJSONString(result);
			}
			if(param.getMode()==1 && StringUtil.isEmpty(param.getExpTime()))
			{
				result.setCode(1);
				result.setErrMsg("补采模式时，异常时间不能为空!");
				return JSON.toJSONString(result);
			}
			
			// 补采时，更新日志
			if(param.getMode()==1)
			{
				if(!new CheckListLogDAO().updateLog(param.getTaskId(), param.getDataTime())){
					result.setCode(1);
					result.setErrMsg("更新补采核查日志失败!");
					return JSON.toJSONString(result);
				}
			}
			else{
				if(!new CheckListLogDAO().updateRetranLog(param.getTaskId(), param.getDataTime())){
					result.setCode(1);
					result.setErrMsg("更新重采核查日志失败!");
					return JSON.toJSONString(result);
				}
			}
			if(!DBUtil.insertRTask(param.getTaskId(), param.getErrorReason(), param.getDataTime())){
				result.setCode(1);
				result.setErrMsg("生成"+(param.getMode()==1?"补采":"重采")+"任务失败,请检查日志!");
				return JSON.toJSONString(result);
			}	
			
			result.setCode(0);
		}catch(Exception e){
			result.setCode(1);
			result.setErrMsg("生成"+(param.getMode()==1?"补采":"重采")+"任务失败,请检查日志!");
			LOG.error("NBI create rtask fail ,the reason is :"+e);
		}
		return JSON.toJSONString(result);
	}
	
}
