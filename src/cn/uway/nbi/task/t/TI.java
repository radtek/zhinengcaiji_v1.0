package cn.uway.nbi.task.t;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.framework.util.StringUtil;
import cn.uway.nbi.db.dao.BSADao;
import cn.uway.nbi.db.dao.CycFileStatusDAO;
import cn.uway.nbi.db.dao.NBILogDao;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.db.pojo.CycFileStatus;
import cn.uway.nbi.db.pojo.NBILog;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.resolver.FileInfo;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.DateTimeUtils;
import cn.uway.nbi.util.FileUtil;
import cn.uway.nbi.util.SysCfg;

/**
 * 传输接口
 * 
 * @author YangJian
 * @since 1.0
 */
public class TI {

	private final int id; // 传输接口编号

	private boolean transFlag = true;

	private boolean localInterface = false; // 本地接口标识，默认值为远端接口

	private String ftpIp;

	private int ftpPort;

	private String userName;

	private String userPwd;

	private String encode = "utf-8";

	private final String path; // 路径，如果配置中只有此属性的情况下为本地接口，如果有ftp相关信息则为远端接口

	private boolean bPasv;// 主被动模式

	private static Logger LOG = LoggerFactory.getLogger(TI.class);

	private final NBILogDao nbiLogDao = new NBILogDao();
	
	private List<NBILog> nbiLogList = new ArrayList<NBILog>();

	public TI(int id, String ftpIp, int ftpPort, String userName, String userPwd, String path, String encode, boolean bPasv, boolean transFlag) {
		this(id, path, transFlag);
		this.localInterface = false;
		this.ftpIp = ftpIp;
		this.ftpPort = ftpPort;
		this.userName = userName;
		this.userPwd = userPwd;
		if (StringUtil.isNotEmpty(encode))
			this.encode = encode;
		this.bPasv = bPasv;
		this.transFlag = transFlag;
	}

	public TI(int id, String path, boolean transFlag) {
		super();
		this.id = id;
		this.path = path;
		this.transFlag = transFlag;
		this.localInterface = true;
	}

	public boolean isbPasv() {
		return bPasv;
	}

	public void setbPasv(boolean bPasv) {
		this.bPasv = bPasv;
	}

	/**
	 * 传输文件.
	 * 
	 * @throws Exception
	 */
	public boolean transport(List<FileInfo> toFileResult, long taskId, long actionId, Task task) throws Exception {
		int sucFlag = 0;
		if (toFileResult.isEmpty()) {
			LOG.debug("上传文件集合为空,id={},  description: " + task.getDescription() + ", actionId={},请检验!", taskId, actionId);
			return false;
		}

		// 如果不上传，这直接返回
		if (!transFlag) {
			LOG.warn("文件不上传(FTP)或者不转移目录(local)", taskId, actionId);

			return true;
		}

		// 需要对文件进行上传或转移到指定到的目录

		if (isLocalInterface()) {
			File pFile = new File(path);
			
			if (transFlag) {
				// 三个字段在数据库中不能为空
				this.ftpIp = "localhost";
				this.ftpPort = 21;
				this.userName = "localhost";
				File cFile = new File(SysCfg.getInstance().getCurrentpath());
				boolean isSuc = true;
				File file = null;
				if (!pFile.equals(cFile)){
					String[] filePath = new  String[1];
					for (int i = 0; i < toFileResult.size(); i++) {
						FileInfo fi = toFileResult.get(i);
						filePath[0] = fi.getFileName();
						try{
							task.getLog().setFileName(fi.getFileName());
							task.getLog().setTransStartTime(new Date());
							FileUtil.copyFileToDir(path, filePath);
							
						}catch(Exception e){
							isSuc = false;
						}
						file = new File(fi.getFileName());
						checkListLogging(task,file.getName(),file.length());
						insertNBILog(fi, task, taskId, actionId,file.getName(),isSuc,file.length());
						isSuc = true;
					}
					
				}
				else
				{
					for (int i = 0; i < toFileResult.size(); i++) {
						FileInfo fi = toFileResult.get(i);
						file = new File(fi.getFileName());
						insertNBILog(fi, task, taskId, actionId,file.getName(),isSuc,file.length() );
					}
				}
			}
			deleteFtpDir(path);
			return true;
		} else {
			
			//判断是否是非周期性文件上报
//			List<String> ncycDAOList = null;
//			
//			if (task.getPeriod().equals(ConstDef.N_CYC_FILE_TYPE)){
//				 String sql = "select t.* from nbi_cyc_file_status t where t.STATUS =1  " +
//				 		"and t.task_id  =" + taskId ;
//				 
//				 ncycDAOList = new CycFileStatusDAO().findFileNames(sql);
//				 
//			 }
			
			for (FileInfo fileInfo : toFileResult) {
				FtpUtils ftp = null;
				boolean isSuc = true;

				String localfile = fileInfo.getFileName();
				
				if(task.getPeriod().equals(ConstDef.N_CYC_FILE_TYPE)){
					if(".ok".equals(localfile.substring(localfile.lastIndexOf("."))))
						continue;
					File fileDir = new File(fileInfo.getDirName());
					File fileOK = new File(fileDir,localfile+".ok");
					//ncycDAOList.contains(localfile)
					if(fileOK.exists()){
						//非周期性的文件数据库有记录，表示已经上传，不需要管
						sucFlag++;
					}else{
						
						fileInfo.setFileName(fileInfo.getDirName()+localfile);
						isSuc = ftpUpload(fileInfo, task, taskId, actionId);
						String fName = new File(localfile).getName();
						
						File ff = new File(localfile);
						long length = ff.length();
						
						if (isSuc) {
							sucFlag++;
							
							//写入非周期文件表
							
							CycFileStatus ncycFile = new CycFileStatus();
							ncycFile.setTaskId(taskId);
							ncycFile.setDataTime(task.getCurrDataTime());
							ncycFile.setFileName(localfile);
							ncycFile.setStatus(1);
						
							new CycFileStatusDAO().insertCycFileStatus(ncycFile);	
							fileOK.createNewFile();
						}
						
						insertNBILog(fileInfo, task, taskId, actionId,fName,isSuc,length );
					}
				}else{
					
					File ff = new File(localfile);
					long length = ff.length();
					String fName = new File(localfile).getName();
					String fname = path + fName;
	
					try {
						task.getLog().setFileName(fName);
						task.getLog().setTransStartTime(new Date());
						
						// 上传前
						isSuc = ftpUpload(fileInfo, task, taskId, actionId);
	
						int state = 0;
						if (isSuc) {
							sucFlag++;
							state = 1;
							checkListLogging(task,fName,length);
						}
	
						insertNBILog(fileInfo, task, taskId, actionId,fName,isSuc, length );
						
						// 文件只要上传失败，则生成补采任务重采
						if(!isSuc && SysCfg.getInstance().isCheckListLog()){
							task.getLog().setExceptionTime(new Date());
							task.getLog().setFileSize(length);
							task.getLog().setErrorCode(101);
							if(StringUtil.isEmpty(task.getLog().getErrorReason()))
							{
								task.getLog().setInterConnStatus(301);
								task.getLog().setErrorReason("上次文件到FTP失败!");
							}
							return false;
						}
	
						if (task instanceof BSATask)
							BSADao.insertLog(fName, path, length, task.getCurrDataTime(), state, fileInfo.getCount());
					} catch (Exception e) {
						LOG.error("id=({}),actionId=({}),文件(" + localfile + "),上传到FTP服务器失败(FTP://" + ftpIp + fname + ")  原因: " + e.getMessage(), taskId,
								actionId);
					} finally {
						if (ftp != null)
							ftp.closeConnect();
					}
				}
			}
			deleteFtpDir(path);
			// add for bsa begin
			if (sucFlag == toFileResult.size()) {
				return true;
			}
			// end the bsa
		}
		return false;
	}
	
	private void checkListLogging(Task task,String fName,long length)
	{
		if(!SysCfg.getInstance().isCheckListLog())
			return;
		if(task.getLogs().size() > 0)
		{
			List<CheckListLog> logs = task.getLogs();
			boolean flag = false;
			for(int i=0;i<logs.size();i++)
			{
				if(fName.equals(logs.get(i).getFileName()))
				{
					logs.get(i).setTransStartTime(task.getLog().getTransStartTime());
					logs.get(i).setTransEndTime(new Date());
					logs.get(i).setFileSize(length);
					logs.get(i).setStatus(1);
					flag = true;
				}
			}
			if(!flag){
				CheckListLog log = new CheckListLog();
				log.setFileName(fName);
				log.setTransStartTime(task.getLog().getTransStartTime());
				log.setTransEndTime(new Date());
				log.setFileSize(length);
				log.setStatus(1);
				task.getLogs().add(log);
			}
		}
		else
		{
			CheckListLog log = new CheckListLog();
			log.setFileName(fName);
			log.setTransStartTime(task.getLog().getTransStartTime());
			log.setTransEndTime(new Date());
			log.setFileSize(length);
			log.setStatus(1);
			task.getLogs().add(log);
		}
	}
	
	public void deleteFtpDir(String ftpPath)
	{
		// 配置的过期天数不为0时，进行对过期文件夹进行删除
		int day = SysCfg.getInstance().getSaveTime();
		if(day == 0)
		{
			return;
		}
		if(isLocalInterface())
		{
			deleteLocalFile(day);
		}
		else
		{
			FtpUtils ftp = null;
			try{
				ftp = new FtpUtils(ftpIp, ftpPort, userName, userPwd, encode, bPasv);
				ftp.deleteDirectory(ftpPath);
			}
			catch(Exception e)
			{
				LOG.error("连接或删除过期文件夹时发生异常，原因:"+e);
			}
			finally {
				if (ftp != null)
					ftp.closeConnect();
			}
		}
		
	}
	
	private void deleteLocalFile(int day)
	{
		try{
			String localPath = path;
			if(localPath.endsWith("/")&&localPath.length() > 1)
			{
				localPath = localPath.substring(0, localPath.length()-1);
			}
			int index = localPath.lastIndexOf("/");
			if(index > 0)
			{
				localPath = localPath.substring(0, index+1);
			}
			File localFile = new File(localPath);
			String fileDay = null;
			if(localFile.exists())
			{
				File[] files = localFile.listFiles();
				for(int i=0;i<files.length;i++)
				{
					if(files[i].isDirectory())
					{
						try{
							if(files[i].getName().matches("\\d+"))
							{
								if(files[i].getName().length()>8)
								{
									fileDay = files[i].getName().substring(0, 8);
								}
								else
								{
									fileDay = files[i].getName();
								}
								if(DateTimeUtils.getDays(fileDay) >= day)
								{
									boolean bFlg = deleteFile(localPath+"/"+files[i].getName());
									LOG.warn("删除本地过期文件夹"+files[i].getName()+",文件夹删除状态:  " + bFlg);
								}
							}
						}
						catch(Exception e)
						{
							LOG.error("删除过期文件夹时出现异常，原因："+e);
						}
					}
				}
			}
		}
		catch(Exception e)
		{
			LOG.error("连接或删除过期文件夹时发生异常，原因:"+e);
		}
	}
	public boolean deleteFile(String deleteDir) throws Exception
	{
		File localFile = new File(deleteDir);
		if(localFile.exists())
		{
			File[] files = localFile.listFiles();
			for(int i=0;i<files.length;i++)
			{
				if(files[i].isDirectory())
				{
					deleteFile(deleteDir+"/"+files[i].getName());
				}
				else
				{
					File f = new File(deleteDir+"/"+files[i].getName());
					if(f.exists())
					{
						f.delete();
					}
				}
			}
		}
		else
		{
			return false;
		}
		
		return localFile.delete();
	}

	public boolean ftpUpload(FileInfo fileInfo,Task task,long taskId,long actionId){

		FtpUtils ftp = null;
		boolean isSuc = true;

		String localfile = fileInfo.getFileName();
		
		String fName = new File(localfile).getName();
		String fname = path + fName;

		try {

			ftp = new FtpUtils(ftpIp, ftpPort, userName, userPwd, encode, bPasv);

			try {
				isSuc = ftp.uploadFile(localfile, fname);//
				if (isSuc) {
					LOG.debug("id=({}),actionId=({}), 文件(" + localfile + "),上传到FTP服务器成功(FTP://" + ftpIp + fname + ")", taskId, actionId);

				} else {
					LOG.debug("id=({}),actionId=({}),文件(" + localfile + "),上传到FTP服务器失败(FTP://" + ftpIp + fname + ")", taskId, actionId);
				}
			} catch (Exception e) {
				isSuc = false;
				LOG.error("id=({}),actionId=({}),文件(" + localfile + "),上传失败(FTP://" + ftpIp + fname + ")原因：" + e, taskId, actionId);
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
						LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile, taskId, actionId);
						isSuc = ftp.uploadFile(localfile, fname);//
						if (isSuc) {
							LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "成功.已上传到FTP服务器(FTP://" + ftpIp
									+ fname + ")", taskId, actionId);
							break;
						} else
							LOG.debug("id=({}),actionId=({}),第({" + (i + 1) + "})次重试上传文件" + localfile + "失败.", taskId, actionId);

					} catch (Exception e) {
						isSuc = false;
						LOG.error("id=({}),actionId=({}),第" + (i + 1) + "次上报失败，文件(" + localfile + "),上传失败(FTP://" + ftpIp + fname + ")原因："
								+ e, taskId, actionId);
						if(i == 2)
						{
							task.getLog().setInterConnStatus(301);
							task.getLog().setErrorReason("重试3次后上传文件失败，请检查FTP连接或是否有权限!");
						}
					} finally {
						ftp.closeConnect();
					}
				}
			}

			Thread.sleep(500);

		} catch (Exception e) {
			isSuc = false;
			LOG.error("id=({}),actionId=({}),文件(" + localfile + "),上传到FTP服务器失败(FTP://" + ftpIp + fname + ")  原因: " + e.getMessage(), taskId,
					actionId);
		} finally {
			if (ftp != null)
				ftp.closeConnect();
		}
		
		return isSuc;
		
	}
	
	public void insertNBILog(FileInfo fileInfo,Task task,long taskId,long actionId,String fName,boolean isSuc,long length){


			if (SysCfg.getInstance().isTableLog()) {
				NBILog nbiLog = new NBILog();
				nbiLog.setDataType(fileInfo.getDataType());
				LOG.debug("记录的数据类型为：" + fileInfo.getDataType());
				nbiLog.setNetType("1");
				nbiLog.setNetGran("0");
				if (null != task) {
					nbiLog.setTimeGran(ConstDef.getPeriodValue(task.getPeriod()));
					nbiLog.setDataTime(DateUtil.getDateString(task.getCurrDataTime()));
				} else {
					nbiLog.setDataTime(DateUtil.getDateString(new Date()));
				}
				nbiLog.setFileName(fName);
				nbiLog.setFileFtpDir(path);
				nbiLog.setFileSizeBytes(length);
				nbiLog.setRecordCount(fileInfo.getCount());
				nbiLog.setFtpIp(ftpIp);
				nbiLog.setFtpPort(ftpPort);
				nbiLog.setFtpUser(userName);
				nbiLog.setUploadResult(isSuc ? 0 : 1);
				nbiLog.setFailReason(isSuc ? "" : "上传到FTP服务器失败");
				nbiLog.setInsertTime(DateUtil.getDateString(new Date()));

				nbiLog.setTaskId(taskId);
				nbiLog.setActionId(actionId);
				nbiLogList.add(nbiLog);
				nbiLogDao.insertNBILog(nbiLog);
			}
		
	}
	public boolean isLocalInterface() {
		return localInterface;
	}

	public int getId() {
		return id;
	}

	public String getFtpIp() {
		return ftpIp;
	}

	public int getFtpPort() {
		return ftpPort;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public String getPath() {
		return path;
	}

	public String getEncode() {
		return encode;
	}

	public List<NBILog> getNbiLogList() {
		return nbiLogList;
	}
}
