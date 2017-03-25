package cn.uway.nbi.task.t;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.concurrent.CountDownLatch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dao.CheckListLogDAO;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.NBILog;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.sms.SmcServiceMgr;
import cn.uway.nbi.task.TaskMgr;
import cn.uway.nbi.task.resolver.FileInfo;
import cn.uway.nbi.task.triggerbean.TriggerBean;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.DateTimeUtils;
import cn.uway.nbi.util.SysCfg;

/**
 * 传输基类
 * 
 * @author YangJian
 * @since 1.0
 */
public class TAction implements Runnable {

	private int id; // action编号

	private TO to; // 对应的传输对象

	// private TI ti; // 对应的传输接口

	private TreeMap<Integer, TI> tiMap;

	private Strategy strategy;

	//
	private Task task;// 要执行的任务

	private CountDownLatch latch;

	/**
	 * 默认在文件上传成功后，立刻删除
	 */
	private boolean isDelete = false;

	private static Logger LOG = LoggerFactory.getLogger(TAction.class);

	public TAction(int id, TO to, TreeMap<Integer, TI> tiMap, Strategy strategy, boolean isDelete) {
		super();
		this.id = id;
		this.to = to;
		this.tiMap = tiMap;
		this.strategy = strategy;
		this.isDelete = isDelete;
	}

	public void init(Task task, CountDownLatch latch) {
		setTask(task);
		this.to.setActionId(this.id);
		this.latch = latch;
	}

	@Override
	public void run() {
		boolean eFlag = false;// 是否发生异常
		String cause = null;// 发生异常的原因
		try {
			task.getLog().setAccessStartTime(new Date());
			to.resolve();
			task.getLog().setAccessEndTime(new Date());
			// 获取需要上传的文件
			// List<FileInfo> upLoadfiles = to.getUploadFiles();

			List<FileInfo> upLoadfiles = to.getUploadFilesList();
			try{
				Iterator<Entry<Integer, TI>> it = tiMap.entrySet().iterator();
				while (it.hasNext()) {
					Entry<Integer, TI> en = it.next();
					// int key = en.getKey();
					TI ti = en.getValue();
					boolean bFlag = ti.transport(upLoadfiles, task.getId(), id, task);
					if (bFlag) {
						if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
							processStrategy(getFileNames(upLoadfiles));
						} else {
							processStrategy(ti);
							if (isDelete) {
								for (FileInfo fInfo : upLoadfiles)
									deleteFile(fInfo.getFileName());
							}
						}
					}
					// 上传失败时生成补采任务
					if(!bFlag){
						eFlag = true;
						cause = "任务ID:"+task.getId()+" action id:"+this.id + " 上传文件到FTP服务器失败";
						break;
					}
				}

				// 发送短信
				sendSms();

				// 删除生成的临时文件
				boolean delFlag = SysCfg.getInstance().isDelLocalFile();
				delTempFile(delFlag);
			}
			catch(Exception e){
				// 此处只是一个处理策略
				eFlag = true;
				cause = e.getMessage();
				// 接入或打包错误
				task.getLog().setExceptionTime(new Date());
				if(StringUtil.isNull(task.getLog().getErrorReason())){
					task.getLog().setErrorReason("上传文件到指定目录失败!");
				}
				if(task.getLogs().size()>0){
					task.getLog().setFileCreateTime(task.getLogs().get(task.getLogs().size()-1).getFileCreateTime());
					task.getLog().setFileName(task.getLogs().get(task.getLogs().size()-1).getFileName());
				}
				LOG.error("任务ID:"+task.getId()+" action id:"+this.id  + "传输失败 ,请检验!原因:", e);
			}
			
		} catch (Exception e) {
			// 此处只是一个处理策略
			eFlag = true;
			cause = e.getMessage();
			// 接入或打包错误
			task.getLog().setExceptionTime(new Date());
			task.getLog().setErrorCode(100);
			if(StringUtil.isNull(task.getLog().getErrorReason())){
				task.getLog().setErrorReason(cause);
			}
			if(task.getLogs().size()>0){
				task.getLog().setFileCreateTime(task.getLogs().get(task.getLogs().size()-1).getFileCreateTime());
				task.getLog().setFileName(task.getLogs().get(task.getLogs().size()-1).getFileName());
			}
			LOG.error("任务ID:"+task.getId()+" action id:"+this.id  + "下载或打包文件失败 ,请检验!原因:", e);
		} finally {
			if (eFlag && SysCfg.getInstance().autoRTask())
				TaskMgr.getInstance().newReportTask(task, id, cause);
			
			insertCheckListLog();			
			latch.countDown();
		}
	}
	
	private void insertCheckListLog()
	{
		if(SysCfg.getInstance().isCheckListLog())
		{
			boolean isSendSms = true;
			// 插入日志前检查是否需要发送告警
			if(task.getLog().getExceptionTime() != null)
			{
				isSendSms = new CheckListLogDAO().isSendSms(task.getLog());
				new CheckListLogDAO().saveLog(task.getLog());
			}
			else
			{
				isSendSms = false;
				// 插入异常日志
				new CheckListLogDAO().saveLogs(task.getLogs(),task.getLog());
			}
			if(isSendSms)
			{
				
				if(SysCfg.getInstance().getSendWay() == 2)
				{
					StringBuffer buf = new StringBuffer();
					buf.append("NBI采集告警详细信息：").append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;任务ID：").append(task.getLog().getTaskId()).append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;任务运行时间：").append(DateTimeUtils.getFormat(task.getCurrDataTime()).replace(" ", "&nbsp;")).append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;文件来源方：").append(task.getLog().getFileSource()).append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;专业：").append(task.getLog().getSpeciality()).append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;异常时间：").append(DateTimeUtils.getFormat(task.getLog().getExceptionTime()).replace(" ", "&nbsp;")).append("<br/>")
						.append("&nbsp;&nbsp;&nbsp;异常原因：").append(task.getLog().getErrorReason()).append("<br/>");
					SmcServiceMgr.getInitialize().sendEmail3(buf.toString());
				}
				else
				{
					StringBuffer buf = new StringBuffer();
					buf.append("NBI采集告警详细信息：")
						.append("任务ID：").append(task.getLog().getTaskId())
						.append(",任务运行时间：").append(DateTimeUtils.format(task.getCurrDataTime(),"yyyyMMddHHmmss"))
						.append(",文件来源方：").append(task.getLog().getFileSource())
						.append(",专业：").append(task.getLog().getSpeciality())
						.append(",异常时间：").append(DateTimeUtils.format(task.getLog().getExceptionTime(),"yyyyMMddHHmmss"))
						.append(",异常原因：").append(task.getLog().getErrorReason());
					SmcServiceMgr.getInitialize().sendSms(buf.toString());;
				}
				LOG.debug("发送告警消息---------------------");
			}
		}
	}

	private List<String> getFileNames(List<FileInfo> upLoadfiles) {
		List<String> lists = new ArrayList<String>();
		for (FileInfo fileInfo : upLoadfiles) {
			lists.add(fileInfo.getFileName());
		}
		return lists;
	}

	private void sendSms() {
		try {
			if (task.isSms() && task instanceof BSATask) {
				BSATask tmp = (BSATask) task;
				if (tmp.getStrategy() != null) {
					LOG.debug("能够查到到对应的策略.");
					if (tmp.getStrategy().getSendtype() == ConstDef.EMAILSEND)
						SmcServiceMgr.getInitialize().sendEmail2(tmp.getStrategy().getEmailcontent(), null, tmp.getStrategy().getEmailsubject());
					else if (tmp.getStrategy().getSendtype() == ConstDef.SMSSEND) {
						SmcServiceMgr.getInitialize().sendSms(SysCfg.getInstance().getSmsUsername(), SysCfg.getInstance().getSmsPassword(),
								tmp.getStrategy().getBusinessid(), 2, tmp.getStrategy().getSendtype(), tmp.getStrategy().getEmailcontent());
					}
				}
			}
		} catch (Exception e) {
			LOG.error("发送短信失败", e);
		}
	}

	private void processStrategy(List<String> fileNames) throws Exception {
		if (strategy != null)
			for (TriggerBean tri : strategy.getTriggerList()) {
				tri.setFileNames(fileNames);
				tri.trigger(task);
			}
	}

	private void processStrategy(TI ti) throws Exception {
		if (strategy == null|| task == null)
			return;
		List<NBILog> nbiLogList = ti.getNbiLogList();
		for (TriggerBean tri : strategy.getTriggerList()) {
			if (null == tri ) {
				continue;
			}
			tri.setNbiLogList(nbiLogList);
			tri.trigger(task);
		}
	}

	/**
	 * 删除本地临时文件
	 */
	private void delTempFile(boolean delFlag) {

		if (!delFlag)
			return;
		List<String> allFile = to.getAllFiles();
		// 删除本地目录需要上传的临时文件
		for (String filePath : allFile)
			deleteFile(filePath);

		// 删除需要打包之前的临时文件(未打包文件)
		if (to.getUnPackerFileName().size() > 0)
			for (String filePath : to.getUnPackerFileName().values())
				deleteFile(filePath);

	}

	private void deleteFile(String filePath) {
		if (StringUtil.isNull(filePath))
			return;

		File f = new File(filePath);
		if (f.exists()) {
			boolean flag = f.delete();
			String str = flag ? "成功" : "失败";
			LOG.info("任务ID:"+task.getId()+" action id:"+this.id + "文件(" + filePath + ")删除" + str);
		} else {
			LOG.error("任务ID:"+task.getId()+" action id:"+this.id + "文件(" + filePath + ")不存在或已经被删除！");
		}
	}

	public void setTask(Task task) {
		this.task = task;
		this.to.setTask(task);
	}

	public int getId() {
		return id;
	}
}
