package cn.uway.nbi.task.triggerbean;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.NBILogDao;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.FileUtil;
import cn.uway.nbi.util.SysCfg;

/**
 * 上报日志文件触发实体
 * 
 * @author tylerlee @ 2015年7月23日
 */
public class LogFileTriggerBean extends TriggerBean {

	private final static Logger LOG = LoggerFactory.getLogger(LogFileTriggerBean.class);

	@SuppressWarnings("unchecked")
	@Override
	public void trigger(Task task) throws Exception {
		// 之前有记录日志，才会进行相关日志的查询
		if (!SysCfg.getInstance().isTableLog()) {
			return;
		}
		NBILogDao nbiLogDao = new NBILogDao();
		Map<String, String> map = (Map<String, String>) param;
		List<String> list = nbiLogDao.getLogInfo(map.get("sql"), task, nbiLogList);
		String currPath = SysCfg.getInstance().getCurrentpath();
		// replace special char to real file name
		String logFile = map.get("file_name");
		logFile = ProvinceNameMgr.replaceProvince(logFile, task.getTemplet().getInclude().getProviceMap());
		logFile = processParaMap(logFile, "${", "}", task, map);
		logFile = ConstDef.ParseFilePath(logFile, new Timestamp(task.getCurrDataTime().getTime()));
		// create log file
		File file = new File(currPath, logFile);
		boolean isSucc = FileUtil.writeFile(list, file);
		if (isSucc) {
			upload(map, file, task.getId());
		}
	}

	/**
	 * 上传日志文件
	 * 
	 * @param map
	 * @param localfile
	 *            本地文件路径
	 * @param fname
	 *            ftp的文件名，不包括路径
	 */
	public void upload(Map<String, String> map, File file, long taskId) {
		boolean isSuc = false;
		String fpass = map.get("conn_ftp_passive");
		if (StringUtil.isNull(fpass)) {
			isSuc = true;
		} else if ("1".equals(fpass)) {
			isSuc = true;
		}
		String localfile = file.getAbsolutePath();
		String fname = file.getName();
		String ftpIp = map.get("ftpip");
		FtpUtils ftp = new FtpUtils(ftpIp, Integer.parseInt(map.get("port")), map.get("username"), map.get("password"), map.get("encode"), isSuc);// true
		try {
			isSuc = ftp.uploadFile(localfile, map.get("path") + fname);//
			if (isSuc) {
				LOG.debug("id=({}),文件(" + localfile + "),上传到FTP服务器成功(FTP://" + ftpIp + fname + ")", taskId);
			} else {
				LOG.debug("id=({}),文件(" + localfile + "),上传到FTP服务器失败(FTP://" + ftpIp + fname + ")", taskId);
			}
		} catch (Exception e) {
			isSuc = false;
			LOG.error("id=({}),文件(" + localfile + "),上传失败(FTP://" + ftpIp + fname + ")原因：" + e, taskId);
		} finally {
			ftp.closeConnect();
		}
		// 重试三次
		if (!isSuc) {
			for (int i = 0; i < 3; i++) {
				try {
					long timeout = 1 * (i + 1);
					Thread.sleep(timeout * 5 * 1000);
					if (!isSuc) {
						ftp.login();
					}
					LOG.debug("id=({}),第({" + (i + 1) + "})次重试上传文件" + localfile, taskId);
					isSuc = ftp.uploadFile(localfile, fname);//
					if (isSuc) {
						LOG.debug("id=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "成功.已上传到FTP服务器(FTP://" + ftpIp + fname + ")", taskId);
						break;
					}
					LOG.debug("id=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "失败.", taskId);
				} catch (Exception e) {
					isSuc = false;
					LOG.error("id=({}),第" + (i + 1) + "次上报失败，文件(" + localfile + "),上传失败(FTP://" + ftpIp + fname + ")原因：" + e, taskId);
				} finally {
					ftp.closeConnect();
				}
			}
		}
		// 删除生成的临时文件
		boolean delFlag = SysCfg.getInstance().isDelLocalFile();
		if (delFlag) {
			deleteFile(localfile);
		}
	}

	private String processParaMap(String logFile, String leftFlag, String rightFlag, Task task, Map<String, String> map) {
		// add by tyler.lee:2015.8.14主要用于标识此文件是正常文件(正常任务nbi_cfg_task表中)还是重传文件(补传任务nbi_cfg_rtask表中)，
		// 此处实现是用%%TF匹配配置的值如：(0|1，0代表正常文件，1代表重传文件)
		String tf = map.get("%%TF");
		if (tf != null && !"".equals(tf)) {
			String[] vals = tf.split("\\|");
			String val = vals[0];
			if (vals.length >= 2 && (task instanceof RTask)) {
				val = vals[1];
			}
			logFile = logFile.replace("%%TF", val);
		}
		if (task.getParaMap() == null || task.getParaMap().isEmpty()) {
			return logFile;
		}
		Set<Entry<String, String>> set = task.getParaMap().entrySet();
		for (Entry<String, String> en : set) {
			if (StringUtil.isNotNull(logFile)) {
				logFile = logFile.replace(leftFlag + en.getKey() + rightFlag, en.getValue());
			}
		}
		return logFile;
	}

	private void deleteFile(String filePath) {
		if (StringUtil.isNull(filePath))
			return;
		File f = new File(filePath);
		if (f.exists()) {
			boolean flag = f.delete();
			String str = flag ? "成功" : "失败";
			LOG.info("文件(" + filePath + ")删除" + str);
		} else {
			LOG.error("文件(" + filePath + ")不存在或已经被删除！");
		}
	}
}
