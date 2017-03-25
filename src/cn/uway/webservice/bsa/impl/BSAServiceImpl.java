package cn.uway.webservice.bsa.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.BSADeduce;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.framework.ClassMgr;
import cn.uway.nbi.util.BSAMapping;
import cn.uway.webservice.bsa.BSAService;

/**
 * BSA webservice接口实现类，用于接收前端请求，并构建任务产生需要上报的数据文件，并上报到ftp服务器上
 * 
 * @author liuwx
 */
public class BSAServiceImpl implements BSAService {

	private static final Logger LOG = LoggerFactory.getLogger(BSAServiceImpl.class);

	private static int id = 100000;

	@Override
	public int bsaCommandInterface(String city_id, String type) {
		
		LOG.debug("客户端请求方法：bsaCommandInterface");
		
		ClassMgr.getInstance().start();// 启动类实体管理器
		if (StringUtil.isNull(type)) {
			LOG.debug("同步方式为空，请检查参数" + type);
			return -1;
		}
		LOG.info("参数： " + city_id + "  " + type);
		Map<String, String> map = BSAMapping.getInstance().getBsaTempletMapping();
		if (!map.keySet().contains(type.toLowerCase())) {
			LOG.debug("无效的同步方式" + type);

			return -1;
		}
		String filename = map.get(type.toLowerCase());

		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("city_id", city_id);

		BSATask task = createTask(filename, type);
		task.setParaMap(paraMap);
		try {
			TaskQueueMgr.getInstance().put(task);
		} catch (InterruptedException e) {
			LOG.error("出现异常", e);
			return -1;
		}
		LOG.debug("BSA webservice接口调用成功.");
		return 0;
	}

	private BSATask createTask(String filename, String synmodel) {
		id++;
		BSATask task = new BSATask();
		task.setTask(true);
		task.setId(id);
		task.setPeriod(String.valueOf(1));
		Date currDate = new Date();
		task.setCurrDataTime(currDate);
		// task.setDescription(rs.getString("DESCRIPTION"));

		// int mresult = getSynMode(model);

		task.setSyncmode(synmodel);//

		task.setTempletPath(filename);
		// task.setTempletPath(rs.getString("CONFIGNAME"));
		task.setEndDataTime(null);
		task.setUsed(true);
		// task.setPcName(rs.getString("PCNAME"));
		// task.setReportOffset(rs.getInt("REPORTOFFSET"));
		task.setReportTime(new Date());

		// task.setFrequency(rs.getInt("FREQUENCY"));
		//
		// task.setSynctype(rs.getString("SYNCTYPE"));
		//
		// task.setSynfile(rs.getString("SYNCFILE"));

		task.setPlanno("" + id);

		return task;
	}

	public static void main(String[] args) {
		BSAServiceImpl impl = new BSAServiceImpl();
		// int r = impl.bsaCommandInterface("20,750", "INS");
		// String sss="14176_12_18587778,14176_12_13213826,14176_12_18587779";
		String sss = "14084_974_13197736,14084_974_13197737";
		int r = impl.fullDeductIndicator(null);
		System.out.println(r);
	}

	/*
	 * sid_nid_extid,
	 */
	@Override
	public int deductIndicator(String sid_nid_extidList) {
		if (StringUtil.isNull(sid_nid_extidList))
			return -1;
		LOG.debug("客户端请求方法：bsaCommandInterface");
		BSADeduce bsa = new BSADeduce();
		try {
			bsa.setSid_nid_extid(sid_nid_extidList);
			bsa.execute(null);
		} catch (Exception e) {
			LOG.error("BSA 五项推导出现异常，原因:", e);
			return -1;
		}
		return 0;
	}

	public int fullDeductIndicator(String id) {
		LOG.debug("客户端请求方法：fullDeductIndicator");
		BSADeduce bsa = new BSADeduce();
		if (!StringUtil.isNull(id))
			bsa.setSid_nid_extid(id);
		try {
			bsa.execute(null);
		} catch (Exception e) {
			LOG.error("BSA 五项推导出现异常，原因:", e);
			return -1;
		}
		return 0;
	}

}
