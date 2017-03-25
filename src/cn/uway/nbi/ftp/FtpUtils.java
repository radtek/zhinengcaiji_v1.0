package cn.uway.nbi.ftp;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.channels.ClosedByInterruptException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.util.DateTimeUtils;
import cn.uway.nbi.util.SysCfg;

/**
 * FTP文件上传下载
 * 
 * @author liuwx May 30, 2011
 */
public class FtpUtils {

	protected int timeout = 10; // 默认为10分钟

	protected String ip;

	protected int port;

	protected String user;

	protected String pwd;

	protected FTPClient ftp;

	protected FTPClientConfig ftpCfg;

	protected static final String ISOCHARSET = "iso-8859-1";

	protected String encode;

	protected String keyId;

	protected boolean bPasv = true;

	private static final Logger log = LoggerFactory.getLogger(FtpUtils.class);

	private static FTPFileComparator ftpFileComparator = new FTPFileComparator();
	
	private static String fcompile = SysCfg.getInstance().getFCompile();
	
	// HEN_ZZ_MOBILE_OMC2_HUAWEI_PM_RNC001_60_%%Y%%M%%D%%H%%m%%s_%%UE_%%RC_%%PARTION.tar.gz
	private static Pattern parttern  = Pattern.compile(fcompile);
	
	private List<String> downFtpFileList = null;

	public FtpUtils(String ip, int port, String user, String pwd, String encode, boolean bPasv) {
		keyId = "";
		this.ip = ip;
		this.port = port;
		this.user = user;
		this.pwd = pwd;
		this.encode = encode;// 默认，需改为配置
		this.bPasv = bPasv;
	}

	/**
	 * 连接FTP服务器
	 */
	public void connectServer() {
		if (ftp == null) {
			login();
		}
	}

	public FTPClient getFTPClient() {

		return this.ftp;
	}

	/**
	 * 登录到FTP服务器（去掉 ftp.configure 属性）
	 * 
	 * @return 是否成功
	 */
	public boolean login2() {
		closeConnect();
		ftp = new FTPClient();// new UwayFTPClient();
		// ftp.setRemoteVerificationEnabled(false);
		ftp.setDataTimeout(timeout * 60 * 1000);
		ftp.setDefaultTimeout(timeout * 60 * 1000);
		// ftp.setControlEncoding(encode);
		boolean b = false;
		try {
			log.debug(keyId + "正在连接到 - " + ip + ":" + port);
			ftp.connect(ip, port);
			log.debug(keyId + "ftp connected");
			log.debug(keyId + "正在进行安全验证 - " + user + " " + pwd);
			b = ftp.login(user, pwd);
			log.debug("200到300为登陆成功,本次登陆返回值：" + ftp.getReplyCode());
			log.debug(keyId + "ftp logged in");
		} catch (Exception e) {
			log.error(keyId + "登录FTP服务器时异常", e);
		}
		if (b) {
			// ftp.enterLocalPassiveMode();
			// LOG.debug(keyId + "ftp entering passive mode");
			/* 主被动模式切换。 */
			if (this.bPasv) {
				this.ftp.enterLocalPassiveMode();
				log.debug("使用FTP被动模式。");
			} else {
				this.ftp.enterLocalActiveMode();
				log.debug("使用FTP主动模式。");
			}
			// modify on 2013 开启注释
			/*
			 * if (this.ftpCfg == null) { this.ftpCfg = setFTPClientConfig(); } else { ftp.configure(this.ftpCfg); }
			 */
			// end modify
			try {
				ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			} catch (IOException e) {
				// e.printStackTrace();
				log.error("setFileType异常", e);
			}
		}
		return b;
	}

	/**
	 * 登录到FTP服务器
	 * 
	 * @return 是否成功
	 */
	public boolean login() {
		closeConnect();
		ftp = new FTPClient();// new UwayFTPClient();
		// ftp.setRemoteVerificationEnabled(false);
		ftp.setDataTimeout(timeout * 60 * 1000);
		ftp.setDefaultTimeout(timeout * 60 * 1000);
		// ftp.setControlEncoding(encode);
		boolean b = false;
		try {
			log.debug(keyId + "正在连接到 - " + ip + ":" + port);
			ftp.connect(ip, port);
			log.debug(keyId + "ftp connected");
			log.debug(keyId + "正在进行安全验证 - " + user + " " + pwd);
			b = ftp.login(user, pwd);
			log.debug("登陆返回值，200到300为登陆成功：" + ftp.getReplyCode());
			log.debug(keyId + "ftp logged in");
		} catch (Exception e) {
			log.error(keyId + "登录FTP服务器时异常", e);
		}
		if (b) {
			// ftp.enterLocalPassiveMode();
			// LOG.debug(keyId + "ftp entering passive mode");
			/* 主被动模式切换。 */
			if (this.bPasv) {
				this.ftp.enterLocalPassiveMode();
				log.debug("使用FTP被动模式。");
			} else {
				this.ftp.enterLocalActiveMode();
				log.debug("使用FTP主动模式。");
			}
			// modify on 2013 开启注释

			if (this.ftpCfg == null) {
				this.ftpCfg = setFTPClientConfig();
			} else {
				ftp.configure(this.ftpCfg);
			}

			// end modify
			try {
				ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			} catch (IOException e) {
				// e.printStackTrace();
				log.error("setFileType异常", e);
			}
		}
		return b;
	}

	/**
	 * 自动设置FTP服务器类型
	 */
	private FTPClientConfig setFTPClientConfig() {
		FTPClientConfig cfg = null;
		try {
			ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_UNIX));
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_NT));
			} else {
				log.debug(keyId + "ftp type:UNIX");
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_AS400));
			} else {
				log.debug(keyId + "ftp type:NT");
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_L8));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_MVS));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_NETWARE));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_OS2));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_OS400));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_VMS));
			} else {
				return cfg;
			}
			if (!isFilesNotNull(ftp.listFiles("/*"))) {
				ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_UNIX));
			}
		} catch (Exception e) {
			log.error("配置FTP客户端时异常", e);
			ftp.configure(cfg = new FTPClientConfig(FTPClientConfig.SYST_UNIX));
		}
		return cfg;
	}

	/**
	 * 下载指定的文件
	 * 
	 * @param ftpPath
	 *            需要下载的文件绝对路径
	 * @param localPath
	 *            放置下载后文件的本地文件夹
	 * @return 下载到的所有文件的本地路径，如果返回null，则表示下载失败
	 */
	public DownStructer downFile(String ftpPath, String localPath) {
		connectServer();
		String aFtpPath = ftpPath;

		/* 主被动模式切换。 */
		if (this.bPasv) {
			this.ftp.enterLocalPassiveMode();
			log.debug("使用FTP被动模式。");
		} else {
			this.ftp.enterLocalActiveMode();
			log.debug("使用FTP主动模式。");
		}

		FTPFile[] ftpFiles = null;
		DownStructer downStruct = new DownStructer();
		try {

			boolean isEx = false;
			try {
				aFtpPath = aFtpPath.replace("\\\\", "/").replace("\\", "/");
				String encodeFileName = encodeFTPPath(aFtpPath);
				ftpFiles = ftp.listFiles(encodeFileName);
				log.debug(keyId + "listFiles ：" + encodeFileName);

			} catch (Exception e) {
				log.error(keyId + "listFiles失败 :" + aFtpPath, e);
				isEx = true;
			}

			if (!isFilesNotNull(ftpFiles)) {
				for (int i = 0; i < 3; i++) {
					int sleepTime = 2000 * (i + 1);
					if (isEx) {
						log.debug(keyId + " listFiles异常，断开重连");

						login();
					}
					// 当连接失败后， 不再连接 login()方法，改连 login2()方法
					login2();
					log.debug(keyId + "重新尝试listFiles: " + aFtpPath + ",次数:" + (i + 1));
					Thread.sleep(sleepTime);
					try {
						ftpFiles = ftp.listFiles(encodeFTPPath(aFtpPath));
					} catch (Exception e) {
						log.error("listFiles失败：" + aFtpPath, e);
					}
					if (isFilesNotNull(ftpFiles)) {
						log.debug(keyId + "重试listFiles成功：" + aFtpPath);
						break;
					}
				}
				if (!isFilesNotNull(ftpFiles)) {
					log.warn(keyId + "重试3次listFiles失败，不再尝试：" + aFtpPath);
					return downStruct;
				}
			}
			int len = 0;
			if (ftpFiles != null)
				len = ftpFiles.length;
			log.debug(keyId + "listFiles成功,文件个数:" + len + " (" + encodeFTPPath(aFtpPath) + ")");
			for (FTPFile f : ftpFiles) {
				if (f.isFile()) {
					String name = decodeFTPPath(f.getName());
					name = name.substring(name.lastIndexOf("/") + 1, name.length());
					String singlePath = aFtpPath.substring(0, aFtpPath.lastIndexOf("/") + 1) + name;
					String fpath = localPath + File.separator + name.replace(":", "");
					login();
					boolean b = downSingleFile(singlePath, localPath, name.replace(":", ""), downStruct);
					if (!b) {
						log.error(keyId + " 下载单个文件时失败:" + singlePath + ",开始重试");
						for (int i = 0; i < 3; i++) {
							int sleepTime = 2000 * (i + 1);
							log.debug(keyId + "重试下载:" + singlePath + ",次数:" + (i + 1));
							Thread.sleep(sleepTime);
							login();
							if (downSingleFile(singlePath, localPath, name.replace(":", ""), downStruct)) {
								b = true;
								log.debug(keyId + "重试下载成功:" + singlePath);
								break;
							}
						}
						if (!b) {
							log.debug(keyId + "重试3次失败:" + singlePath);
							return downStruct;
						} else {
							if (!downStruct.getLocalFail().contains(fpath))
								downStruct.getSuc().add(fpath);
						}
					} else {
						if (!downStruct.getLocalFail().contains(fpath))
							downStruct.getSuc().add(fpath);
					}
				}
			}
		} catch (Exception e) {
			log.error(keyId + "下载文件时异常", e);
		}

		return downStruct;
	}

	public DownStructer downLoadFile(List<FTPFile> ftpFiles, String localPath) {

		DownStructer downStruct = new DownStructer();
		downFtpFileList = new ArrayList<String>();
		try {
			for (FTPFile f : ftpFiles) {
				if (f.isFile()) {
					File fileInfo = new File(f.getName());
					String fileParent = fileInfo.getParent();
					fileParent = fileParent.replace("\\", "/");
					String fileName = decodeFTPPath(f.getName());
					String nameLast = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());

					String singlePath = null;// aFtpPath.substring(0, aFtpPath.lastIndexOf("/") + 1) + name;

					fileParent = decodeFTPPath(fileParent);

					singlePath = decodeFTPPath(f.getName());
					String localDataDir = localPath + fileParent;
					String fpath = localPath + fileName;
					downFtpFileList.add(singlePath);
					login();
					boolean b = downSingleFile(fileName, localDataDir, nameLast, downStruct);
					if (!b) {
						log.error(keyId + " 下载单个文件时失败:" + singlePath + ",开始重试");
						for (int i = 0; i < 3; i++) {
							int sleepTime = 2000 * (i + 1);
							log.debug(keyId + "重试下载:" + singlePath + ",次数:" + (i + 1));
							Thread.sleep(sleepTime);
							login();
							if (downSingleFile(singlePath, localDataDir, fileName.replace(":", ""), downStruct)) {
								b = true;
								log.debug(keyId + "重试下载成功:" + singlePath);
								break;
							}
						}
						if (!b) {
							log.debug(keyId + "重试3次失败:" + singlePath);
							return downStruct;
						} else {
							if (!downStruct.getLocalFail().contains(fpath))
								downStruct.getSuc().add(fpath);
						}
					} else {
						if (!downStruct.getLocalFail().contains(fpath))
							downStruct.getSuc().add(fpath);
					}
				}
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return downStruct;
	}

	/** 下载一个文件 */
	public boolean downloadOneFile(String fileName, String localPath, String path) {
		FileOutputStream fos = null;
		boolean result = false;
		/*
		 * MonitorThread monitor = null;
		 */
		try {
			fos = new FileOutputStream(localPath + File.separator + fileName);

			log.debug(": 开始下载文件:" + path + fileName);

			// 监视下载过程，防止任务死掉，1小时超时，自动关闭
			// monitor = new MonitorThread(3600, FTP, this.getTaskid(),
			// Thread.currentThread());
			// monitor.start();
			// 下载文件
			ftp.setDataTimeout(20 * 60 * 1000);
			result = ftp.retrieveFile(new String((path + fileName).getBytes("GBK"), "iso-8859-1"), fos);
			// FTP.retrieveFileStream(remote);
			// FTP.setRestartOffset();
			if (result)
				log.debug(" Download success: " + fileName);
			else
				log.debug(" Download failure: " + fileName);
		} catch (ClosedByInterruptException e) {
			log.error("任务 " + " ftp时由于超时被MonitorThread中断.");
			result = false;
		} catch (Exception e) {
			log.error(": downloadOneFile: down file error :" + fileName + " loacl file :" + localPath, e);
			result = false;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					fos = null;
				}
			}
		}

		return result;
	}

	/**
	 * 解码一条FTP路径
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @return 解码后的路径
	 */
	private String decodeFTPPath(String ftpPath) {
		try {
			String str = StringUtil.isNotNull(encode) ? new String(ftpPath.getBytes("iso_8859_1"), encode) : ftpPath;
			return str;
		} catch (UnsupportedEncodingException e) {
			log.error(keyId + "设置的编码不正确:" + encode, e);
		}
		return ftpPath;
	}

	/**
	 * 下载单个文件
	 * 
	 * @param path
	 *            单个文件的FTP绝对路径
	 * @param localPath
	 *            本地文件夹
	 * @param fileName
	 *            文件名
	 * @return 是否下载成功
	 */
	private boolean downSingleFile(String path, String localPath, String fileName, DownStructer downStruct) {
		boolean result = false;
		boolean ex = false;
		log.debug(keyId + "开始下载:" + path);
		double downStartTime = System.currentTimeMillis();
		boolean end = true;
		String singlePath = encodeFTPPath(path);
		File tdFile = null;
		InputStream in = null;
		OutputStream out = null;
		long length = getFileSize(path);
		if (length < 0)
			log.warn("lenght =" + length);
		double downTime = 0.0;
		long tdLength = 0;
		try {
			File dir = new File(localPath);
			if (!dir.exists()) {
				if (!dir.mkdirs()) {
					throw new Exception(keyId + "创建文件夹时异常:" + dir.getAbsolutePath());
				}
			}
			tdFile = new File(dir, fileName + ".td");
			if (!tdFile.exists()) {
				if (!tdFile.createNewFile()) {
					throw new Exception(keyId + "创建临时文件失败:" + tdFile.getAbsolutePath());
				}
			}
			tdLength = tdFile.length();
			if (tdLength >= length) {
				end = true;
			}
			in = ftp.retrieveFileStream(singlePath);
			if (in != null) {
				if (tdLength > -1) {
					in.skip(tdLength);
				}
				out = new FileOutputStream(tdFile, true);
				int bufleng = 1024 * 8;
				byte[] bytes = new byte[bufleng];
				int c;
				while ((c = in.read(bytes)) != -1) {
					out.write(bytes, 0, c);
				}
				if (tdFile.length() < length) {
					end = false;
					log.warn(keyId + tdFile.getAbsoluteFile() + ":文件下载不完整，理论长度:" + length + "，实际下载长度:" + tdFile.length());
				}
				double downEndTime = System.currentTimeMillis();
				downTime = (downEndTime - downStartTime) / 1000;
			}
		} catch (Exception e) {
			ex = true;
			log.error(keyId + "下载单个文件时异常:" + path, e);
			result = false;
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
			try {
				ftp.completePendingCommand();
			} catch (IOException e1) {
			}
			if (out != null) {
				try {
					out.flush();
					out.close();
				} catch (IOException e) {
				}
			}
			if (!ex && (end || tdLength < 0)) {
				if (in != null) {
					File f = new File(localPath, fileName);
					if (f.exists()) {
						f.delete();
					}
					boolean bRename = tdFile.renameTo(f);
					if (!bRename) {
						log.error(keyId + "将" + tdFile.getAbsolutePath() + "重命名为" + f.getAbsolutePath() + "时失败，" + f.getAbsolutePath() + "被占用");
					} else {
						tdFile.delete();
						log.debug(keyId + "下载成功(耗时" + downTime + "秒):" + path + "  本地路径:" + f.getAbsolutePath() + " 文件大小:" + f.length());
						result = true;

					}
				} else {
					result = false;
				}
			}

		}
		return result;
	}

	/**
	 * 编码一条FTP路径
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @return 编码后的路径
	 */
	private String encodeFTPPath(String ftpPath) {
		try {
			String str = StringUtil.isNotNull(encode) ? new String(ftpPath.getBytes(encode), ISOCHARSET) : ftpPath;// iso_8859_1
			return str;
		} catch (UnsupportedEncodingException e) {
			log.error(keyId + "设置的编码不正确:" + encode, e);
		}
		return ftpPath;
	}

	/**
	 * 获取FTP上的一个文件的长度
	 * 
	 * @param path
	 *            FTP文件路径
	 * @return 文件长度，如果为-1，表示未找到
	 */
	private long getFileSize(String path) {
		try {
			FTPFile[] fs = ftp.listFiles(encodeFTPPath(path));
			if (!isFilesNotNull(fs)) {
				return -1;
			}
			for (FTPFile f : fs) {
				String name = f.getName();
				name = name.replace("\\", "/");
				name = name.substring(name.lastIndexOf("/") + 1, name.length());
				if (!name.equals(".") && !name.equals("..")) {
					return f.getSize();
				}
			}
		} catch (Exception e) {
			log.error("获取文件{} 大小出现异常{}", path, e);
		}
		return -1;
	}

	/**
	 * 判断listFiles出来的FTP文件，是否不是空的
	 * 
	 * @param fs
	 *            listFiles出来的FTP文件
	 * @return listFiles出来的FTP文件，是否不是空的
	 */
	private boolean isFilesNotNull(FTPFile[] fs) {
		return isFileNotNull(fs);
	}

	public static boolean isFileNotNull(FTPFile[] fs) {
		if (fs == null) {
			return false;
		}
		if (fs.length == 0) {
			return false;
		}
		boolean b = false;
		for (FTPFile f : fs) {
			if (f != null && StringUtil.isNotNull(f.getName()) && !f.getName().contains("\t") && !f.getName().contains(" ")) {
				return true;
			}

		}
		return b;
	}

	public void deleteDirectory(String ftpPath) throws UnsupportedEncodingException, IOException {
		int day = SysCfg.getInstance().getSaveTime();
		if (day == 0) {
			return;
		}
		if (!ftpPath.startsWith("/")) {
			ftpPath = "/" + ftpPath;
		}
		if (ftpPath.endsWith("/") && ftpPath.length() > 1) {
			ftpPath = ftpPath.substring(0, ftpPath.length() - 1);
		}
		int index = ftpPath.lastIndexOf("/");
		if (index > 0) {
			ftpPath = ftpPath.substring(0, index + 1);
		}
		connectServer();
		String directory = new String(ftpPath.getBytes(encode), ISOCHARSET);
		FTPFile[] ftpFiles = ftp.listFiles(directory);
		if (!isFilesNotNull(ftpFiles)) {
			for (int k = 0; k < 3; k++) {
				int sleepTime = 2000 * (k + 1);
				// 当连接失败后， 不再连接 login()方法，改连 login2()方法
				login2();
				log.debug(keyId + "重新尝试listDirectories: " + directory + ",次数:" + (k + 1));
				try {
					Thread.sleep(sleepTime);
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					ftpFiles = this.ftp.listDirectories(directory);
				} catch (Exception e) {
					log.error("listDirectories失败：" + directory, e);
				}
				if (isFilesNotNull(ftpFiles)) {
					log.debug(keyId + "重试listDirectories成功：" + directory);
					break;
				}
			}
			if (!isFilesNotNull(ftpFiles)) {
				log.warn(keyId + "重试3次listDirectories失败，不再尝试：" + directory);
			}
		}
		String fileDay = null;
		for (int i = 0; i < ftpFiles.length; i++) {
			if (ftpFiles[i].isDirectory()) {
				try {
					if (ftpFiles[i].getName().matches("\\d+")) {
						if(ftpFiles[i].getName().length()>8)
						{
							fileDay = ftpFiles[i].getName().substring(0, 8);
						}
						else
						{
							fileDay = ftpFiles[i].getName();
						}
						if (DateTimeUtils.getDays(fileDay) >= day) {
							boolean bFlg = deleteFile(directory + "/" + ftpFiles[i].getName());
							log.warn("FTP://" + ip + "/" + " ,删除过期文件夹" + ftpFiles[i].getName() + ",文件夹删除状态:  " + bFlg);
						}
					}
				} catch (Exception e) {
					log.error("删除过期文件夹时出现异常，原因：" + e);
				}
			}
		}
	}

	/**
	 * 循环删除FTP上的文件夹及文件
	 * 
	 * @param deleteDir
	 * @throws IOException
	 */
	public boolean deleteFile(String deleteDir) throws IOException {
		FTPFile[] ftpFiles = ftp.listFiles(deleteDir);
		for (int i = 0; i < ftpFiles.length; i++) {
			if (ftpFiles[i].isDirectory()) {
				deleteFile(deleteDir + "/" + ftpFiles[i].getName());
			} else {
				ftp.deleteFile(deleteDir + "/" + ftpFiles[i].getName());
			}
		}
		return ftp.removeDirectory(deleteDir);
	}

	/**
	 * 上传文件
	 * 
	 * @param localFilePath
	 *            本地文件
	 * @param newFileName
	 *            FTP文件
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public boolean uploadFile(String localFilePath, String newFileName) throws UnsupportedEncodingException, IOException {
		connectServer();
		// 上传文件
		BufferedInputStream buffIn = null;
		OutputStream out = null;
		String ext = ".tmp";// 上传到ftp上的临时文件
		newFileName = newFileName.replace("\\", "/");

		String remoteFile = "";
		String remotedir = "";

		if (newFileName.contains("/")) {
			remoteFile = newFileName.substring(newFileName.lastIndexOf("/") + 1);

			remotedir = newFileName.substring(0, newFileName.lastIndexOf("/"));

			boolean bf = createDirecroty(newFileName, ftp);
			if (!bf) {
				log.error("远程 创建目录失败." + "FTP://" + ip + "/" + newFileName);
				return false;
			}
			ftp.changeWorkingDirectory(new String(remotedir.getBytes(encode), "iso-8859-1"));

			remoteFile = newFileName;
		} else {
			newFileName = "/" + newFileName;

		}
		log.debug(ftp.printWorkingDirectory());

		remoteFile = newFileName;

		String ftmp = new String(remoteFile.getBytes(encode), ISOCHARSET);

		if (ftp.listFiles(ftmp).length > 0) {

			boolean bFlg = ftp.deleteFile(ftmp);
			log.warn("FTP://" + ip + "/" + newFileName + " , 文件已经存在,文件删除状态:  " + bFlg);
		}
		deleteRCFile(ftmp);
		if (ftp.listFiles(remoteFile + ext).length > 0) {

			boolean bFlg = ftp.deleteFile(remoteFile + ext);
			log.warn("FTP://" + ip + "/" + remoteFile + ext + " , 文件已经存在,文件删除状态:  " + bFlg);
		}

		File localFile = new File(localFilePath);
		String logInfo = " localfile : " + localFile + ", length : " + localFile.length();

		buffIn = new BufferedInputStream(new FileInputStream(localFile));
		log.debug(logInfo + "操作状态为:" + ftp.getReplyCode() + ",状态原因:" + ftp.getReplyString());
		out = ftp.storeFileStream(new String((remoteFile + ext).getBytes(encode), ISOCHARSET));
		if (out == null) {
			log.debug(remoteFile + ext + ": 第一次 ReplyCode: " + ftp.getReplyCode());

			out = ftp.storeFileStream(new String((remoteFile + ext).getBytes(encode), ISOCHARSET));
			if (out == null) {
				log.debug(remoteFile + ext + ": 第二次 ReplyCode: " + ftp.getReplyCode());
			}

		}

		boolean succ = false;
		// 是否上传文件完成。
		boolean is_uploadFile_end = false;
		try {

			log.debug("上传文件" + remoteFile + ext + "至FTP服务器" + ":  ReplyCode: " + ftp.getReplyCode());
			if (out != null) {
				log.debug("上传文件" + remoteFile + ext + "至FTP服务器,开始向ftp写数据");
				int bytesRead = 0;
				int len = 32 * 1024;
				byte[] buffer = new byte[len];
				while ((bytesRead = buffIn.read(buffer, 0, len)) != -1) {
					out.write(buffer, 0, bytesRead);

					out.flush();
				}
				log.debug("上传文件" + remoteFile + ext + "至FTP服务器,向ftp写数据结束");
				is_uploadFile_end = true;
			}
		} catch (Exception e) {
			log.error("上传出现异常.", e);
		} finally {
			try {
				IOUtils.closeQuietly(buffIn);

				IOUtils.closeQuietly(out);
			} catch (Exception e) {
				log.error("关闭ftp出现异常.", e);
			}

			// 一定要加，否则上传至FTP服务器的文件可能长度为0

			try {
				succ = ftp.completePendingCommand();
			} catch (IOException e1) {
				succ = false;
				log.error("completePendingCommand出现异常.", e1);
			}

			// 如果 上传文件已经完成，但是 succ 的值为 false ，说明 与FTP的连接断开了， 则重新与FTP建立连接。
			if (!succ && is_uploadFile_end) {
				log.debug("上传文件" + remoteFile + ext + " 上传文件已经完成，但与FTP的连接断开了， 第二次与FTP建立连接");
				login();
				succ = true;
			}

		}
		//
		if (succ) {
			boolean b = false;
			// 加入重试机制
			for (int i = 0; i < 3; i++) {
				// 举例:将文件a.txt.tmp命名为a.txt,目的是为了防止上传到ftp上的文件不完整
				b = ftp.rename(new String((remoteFile + ext).getBytes(encode), ISOCHARSET), new String(remoteFile.getBytes(encode), ISOCHARSET));

				log.debug("第" + (i + 1) + "次重命名， FTP://" + ip + "/" + newFileName + " ,重命名状态:" + b + " " + logInfo);
				if (b)
					break;
			}
			return b;
		} else {
			log.debug("FTP://" + ip + "/" + newFileName + " ,失败" + " " + logInfo);
		}
		return false;
	}
	
	private void deleteRCFile(String name)
	{
		// 河南OSS2.0 文件名称中带%%RC，补采任务判断文件是否存在做特殊处理
		if(!SysCfg.getInstance().isSameFileName()
				&& StringUtils.isNotEmpty(fcompile))
		{
			Matcher m =parttern.matcher(name);
			if(m.find())
			{
				try
				{
					String str = m.group(0);
					String[] strs = str.split("\\_");
					// %%RC 0:正常采集任务 非0：补采任务
				    int rc = Integer.parseInt(strs[4]);
				    if(rc != 0)
				    {
				    	name = name.replaceFirst(fcompile, "%%RC");
				    	StringBuffer buffer = new StringBuffer();
				    	strs[4] = rc-1+"";
				    	for(int i=1;i<strs.length;i++)
				    	{
				    		buffer.append("_").append(strs[i]);
				    	}
				    	name = name.replace("%%RC", buffer.toString());
				    	boolean bFlg = ftp.deleteFile(name);
				    	log.warn("FTP://" + ip + "/" + name + " , 文件已经存在,文件删除状态:  " + bFlg);
				    }
				}
				catch(Exception e)
				{
				}
			}
		}		
	}

	/**
	 * 递归创建远程服务器目录
	 * 
	 * @param remote
	 *            远程服务器文件绝对路径
	 * @param ftpClient
	 *            FTPClient对象
	 * @return 目录创建是否成功
	 * @throws IOException
	 */
	public boolean createDirecroty(String remote, FTPClient ftpClient) throws IOException {
		boolean uploadFlag = true;
		String directory = remote.substring(0, remote.lastIndexOf("/") + 1);
		log.debug(ftpClient.printWorkingDirectory());
		if (!directory.equalsIgnoreCase("/") && !ftpClient.changeWorkingDirectory(new String(directory.getBytes(encode), "iso-8859-1"))) {
			// 如果远程目录不存在，则递归创建远程服务器目录
			int start = 0;
			int end = 0;
			if (directory.startsWith("/")) {
				start = 1;
			} else {
				start = 0;
			}
			end = directory.indexOf("/", start);
			while (true) {
				String subDirectory = new String(remote.substring(start, end).getBytes(encode), "iso-8859-1");
				if (!ftpClient.changeWorkingDirectory(subDirectory)) {
					if (ftpClient.makeDirectory(subDirectory)) {
						ftpClient.changeWorkingDirectory(subDirectory);
					} else {
						log.error("创建目录失败" + subDirectory);
						return uploadFlag;
					}
				}

				start = end + 1;
				end = directory.indexOf("/", start);

				// 检查所有目录是否创建完毕
				if (end <= start) {
					break;
				}
			}
		}
		return uploadFlag;
	}

	/**
	 * 断开FTP连接
	 */
	public void closeConnect() {
		try {
			if (ftp != null) {
				if (ftp.isConnected()) {
					ftp.logout();
					ftp.disconnect();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ftp = null;
	}

	// add --------------------

	/**
	 * FTP执行LIST命令，获取文件列表。如果失败，将返回<code>null</code>.
	 * 
	 * @param ftp
	 *            FTP连接。
	 * @param path
	 *            路径。
	 * @return 文件列表。
	 */
	public static List<FTPFile> listDirectories(FTPClient ftp, String path) {
		if (ftp == null) {
			log.warn("ftp为null.");
			return null;
		}
		if (path == null) {
			log.warn("path为null.");
			return null;
		}

		FTPFile[] ftpFiles = null;

		try {
			ftpFiles = ftp.listDirectories(path);
		} catch (IOException e) {
			// 异常时，返回null，告知调用者listFiles失败，有可能是网络原因，可重试。
			log.warn("FTP listDirectories时发生异常。", e);
			return null;
		}

		// listFiles返回null或长度为0时，可认为确实无文件，即使重试，也是一样。
		// 所以此处正常返回，即返回一个长度为0的List.
		if (ftpFiles == null || ftpFiles.length == 0)
			return Collections.emptyList();

		// 正常化文件列表， 做四个处理：
		// 1、为null的FTPFile对象消除；
		// 2、文件名为null的FTP对象清除；
		// 3、文件名改名绝对路径；
		// 4、如果不是文件，跳过。
		List<FTPFile> list = new ArrayList<FTPFile>();
		for (FTPFile ff : ftpFiles) {
			if (ff == null || ff.getName() == null || ff.getName().trim().isEmpty() || !ff.isDirectory())
				continue;
			String filename = FilenameUtils.getName(ff.getName());
			String dir = FilenameUtils.getFullPath(path);
			ff.setName(dir + filename);
			list.add(ff);
		}

		Collections.sort(list, getFTPFileComparator());
		return list;
	}

	/**
	 * 根据采集路径，在FTP服务器上遍历出所有文件路径
	 * 
	 * @param gatherPath
	 * @param ftp
	 * @return 返回本地编码的文件路径列表，下载的时候需要encode成ftp编码
	 */
	public static List<String> extractDirPath(String gatherPath, String charset, FTPClient ftp) {
		gatherPath = gatherPath.replaceAll("[\\\\]", "/");
		if (!gatherPath.startsWith("/")) {
			gatherPath = "/" + gatherPath;
		}
		if (!gatherPath.endsWith("/")) {
			gatherPath = gatherPath.substring(0, gatherPath.lastIndexOf('/') + 1);
		}

		List<String> dirList = new ArrayList<String>();
		if (!gatherPath.contains("*")) {
			try {
				String encodePath = encodeFTPPath(gatherPath, charset);
				if (ftp.changeWorkingDirectory(encodePath)) {
					log.debug(">>扫描到符合通匹符规则的子文件夹：{}", gatherPath);
					dirList.add(gatherPath);
				}
			} catch (IOException e) {
			}

			return dirList;
		}

		String[] splitPath = gatherPath.split("/");
		String path = "";

		// 循环从第2个开始，因为第一个是/,
		for (int i = 1; i < splitPath.length; ++i) {
			String subDir = splitPath[i];
			if (subDir == null || subDir.trim().isEmpty()) {
				continue;
			}

			if (subDir.contains("*")) {
				boolean bNeedMatch = false;
				String encodeDir = path + "/";
				String matchPath = null;
				if (!subDir.equals("*")) {
					// encodeDir = path + "/" + subDir;
					matchPath = path + "/" + subDir;
					bNeedMatch = true;
				}

				// log.debug("开始在FTP路径：\"{}\" 下查找子件夹...", encodeDir);
				encodeDir = encodeFTPPath(encodeDir, charset);
				List<FTPFile> ftpDirList = listDirectories(ftp, encodeDir);
				if (ftpDirList != null) {
					for (FTPFile ftpDir : ftpDirList) {
						String dirName = decodeFTPPath(ftpDir.getName(), charset);
						String subPath = dirName;
						for (int j = i + 1; j < splitPath.length; ++j) {
							subPath += "/";
							subPath += splitPath[j];
						}
						subPath += "/";
						if (!bNeedMatch || wildCardMatch(matchPath, subPath, "*")) {
							dirList.addAll(extractDirPath(subPath, charset, ftp));
						}
					}
				}
				// 碰到有通匹符的，直接通过递归将扫描到的目录加入到tempDirList中，后面的目录就不需要再去管了，由递归去完成。
				return dirList;
			} else {
				path += "/" + subDir;
			}
		}

		// 实际应用中，理论上代码不会执行到此处
		if (path.length() < 1)
			path = "/";

		try {
			if (ftp.changeWorkingDirectory(path)) {
				log.debug(">>扫描到符合通匹符规则的子文件夹：{}", path);
				dirList.add(path);
			}
		} catch (IOException e) {
		}

		return dirList;
		// int maxLevel = getPathMaxLevel(gatherPath);
		// return extractDirPath(gatherPath, charset, ftp, maxLevel);
	}

	/**
	 * 编码一条FTP路径
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @return 编码后的路径
	 */
	public static String encodeFTPPath(String ftpPath, String encode) {
		try {
			String str = isNotEmpty(encode) ? new String(ftpPath.getBytes(encode), "ISO_8859_1") : ftpPath;
			return str;
		} catch (UnsupportedEncodingException e) {
			log.error("设置的编码不正确:" + encode, e);
		}
		return ftpPath;
	}

	/**
	 * 解码一条FTP路径
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @param charset
	 *            FTP服务端编码集，若设置为null或""默认为JVM本地默认编码
	 * @return 解码后的路径
	 * @author Niow 2014-6-11
	 */
	public static String decodeFTPPath(String ftpPath, String charset) {
		try {
			String str = ftpPath;
			if (isNotEmpty(charset)) {
				str = isNotEmpty(ftpPath) ? new String(ftpPath.getBytes("ISO_8859_1"), charset) : ftpPath;
			} else {
				str = isNotEmpty(ftpPath) ? new String(ftpPath.getBytes("ISO_8859_1")) : ftpPath;
			}

			return str;
		} catch (UnsupportedEncodingException e) {
			return ftpPath;
		}
	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @param string
	 * @return boolean 如果字符串为Null、""或者空白字符串 返回true.否则返回false
	 */
	public static boolean isEmpty(String string) {
		return string == null || string.trim().length() == 0;
	}

	public static boolean isNotEmpty(String string) {
		return string != null && string.trim().length() > 0;
	}

	/**
	 * 编码一条FTP路径，把JVM默认编码格式转换为FTP协议的ISO_8859_1格式
	 * 
	 * @param ftpPath
	 *            FTP路径
	 * @return 采集路径
	 * @author Niow 2014-6-11
	 */
	public static String codeFTPPath(String ftpPath) {
		try {
			String str = isNotEmpty(ftpPath) ? new String(ftpPath.getBytes(), "ISO_8859_1") : ftpPath;
			return str;
		} catch (UnsupportedEncodingException e) {
			return ftpPath;
		}
	}

	/**
	 * 计算路径的最大层级数
	 * 
	 * @param path
	 * @return
	 */
	public static int getPathMaxLevel(String gatherPath) {
		if (gatherPath.endsWith("/")) {
			gatherPath = gatherPath.substring(0, gatherPath.length() - 1);
		}
		if (!gatherPath.startsWith("/")) {
			gatherPath = "/" + gatherPath;
		}
		String[] split = gatherPath.split("/");
		return split.length - 1;
	}

	/**
	 * FTP执行LIST命令，递归的获取文件列表。如果失败，将返回<code>null</code>. 注意，之支持一级目录有星号的递归。
	 * 
	 * @param ftp
	 *            FTP连接。
	 * @param path
	 *            路径。
	 * @return 文件列表。
	 * @throws IOException
	 *             操作失败。
	 */
	public List<FTPFile> listFilesRecursive_(String path, String ftpCharset) throws IOException {
		// 目录无通配符的情况，直接返回。
		String parentPath = FilenameUtils.getFullPath(path);
		if (!parentPath.contains("*") && !parentPath.contains("?"))
			return listFiles(path, ftpCharset);

		String[] spPath = path.split("/");
		String namePart = FilenameUtils.getName(path);
		String wildDir = "";

		List<String> parsedDirs = new ArrayList<String>();
		String currFullDir = "/";
		for (int i = 0; i < spPath.length; i++) {
			String dir = spPath[i];
			if (dir == null || dir.trim().isEmpty() || dir.equals(namePart))
				continue;
			if (dir.contains("*") || dir.contains("?")) {
				wildDir = dir;
				FTPFile[] dirs = ftp.listDirectories(currFullDir + "/" + wildDir);
				if (!isFilesNotNull(dirs)) {
					for (int k = 0; k < 3; k++) {
						int sleepTime = 2000 * (k + 1);
						// 当连接失败后， 不再连接 login()方法，改连 login2()方法
						login2();
						log.debug(keyId + "重新尝试listDirectories: " + currFullDir + "/" + wildDir + ",次数:" + (k + 1));
						try {
							Thread.sleep(sleepTime);
						} catch (InterruptedException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						try {
							dirs = this.ftp.listDirectories(currFullDir + "/" + wildDir);
						} catch (Exception e) {
							log.error("listDirectories失败：" + currFullDir + "/" + wildDir, e);
						}
						if (isFilesNotNull(dirs)) {
							log.debug(keyId + "重试listDirectories成功：" + currFullDir + "/" + wildDir);
							break;
						}
					}
					if (!isFilesNotNull(dirs)) {
						log.warn(keyId + "重试3次listDirectories失败，不再尝试：" + currFullDir + "/" + wildDir);
					}
				}
				for (FTPFile ftpDir : dirs) {
					if (ftpDir == null || ftpDir.getName() == null)
						continue;
					if (FilenameUtils.wildcardMatch(ftpDir.getName(), dir))
						parsedDirs.add(ftpDir.getName());
				}
				break;
			} else {
				currFullDir += (dir + "/");
			}
		}

		List<FTPFile> files = new ArrayList<FTPFile>();

		for (int i = 0; i < parsedDirs.size(); i++) {
			if (parsedDirs.get(i) == null)
				continue;

			String oneDir = path.replace("/" + wildDir + "/", "/" + parsedDirs.get(i) + "/");
			List<FTPFile> tmp = listFilesRecursive(oneDir, ftpCharset);
			if (tmp != null)
				files.addAll(tmp);
		}

		Collections.sort(files, getFTPFileComparator());

		return files;
	}

	/**
	 * FTP执行LIST命令，递归的获取文件列表。如果失败，将返回<code>null</code>. 注意，之支持一级目录有星号的递归。
	 * 
	 * @param ftp
	 *            FTP连接。
	 * @param path
	 *            路径。
	 * @return 文件列表。
	 * @throws IOException
	 *             操作失败。
	 */
	public List<FTPFile> listFilesRecursive(String path, String ftpCharset) throws IOException {
		// 目录无通配符的情况，直接返回。
		String parentPath = FilenameUtils.getFullPath(path);
		if (!parentPath.contains("*") && !parentPath.contains("?"))
			return listFiles(path, ftpCharset);

		String fileExt = path.substring(parentPath.length());
		List<String> parsedDirs = extractDirPath(parentPath, ftpCharset, ftp);
		log.debug("本次一共搜索到{}个符合通匹符规则:\"{}\"的子文件夹，igp将开始逐一在这些子文件夹下，查找符合规则的所有文件。 fileExt=\"{}\"", new Object[]{parsedDirs.size(), parentPath, fileExt});

		List<FTPFile> files = new ArrayList<FTPFile>();
		for (int i = 0; i < parsedDirs.size(); i++) {
			String subPath = parsedDirs.get(i);
			if (!subPath.endsWith("/"))
				subPath += "/";
			subPath += fileExt;

			List<FTPFile> tmp = listFilesRecursive_(subPath, ftpCharset);
			if (tmp != null)
				files.addAll(tmp);
		}
		Collections.sort(files, getFTPFileComparator());
		return files;
	}

	/**
	 * @param ftp
	 * @param path
	 * @return
	 * @throws IOException
	 */
	public List<FTPFile> listFilesRecursive(String path) throws IOException {
		return listFilesRecursive_(path, this.encode);
	}

	/**
	 * FTP执行LIST命令，获取文件列表。如果失败，将返回<code>null</code>.
	 * 
	 * @param ftp
	 *            FTP连接。
	 * @param path
	 *            路径。
	 * @return 文件列表。
	 */
	public List<FTPFile> listFiles(String path, String ftpCharset) throws IOException {
		if (ftp == null) {
			log.warn("ftp为null.");
			return null;
		}
		if (path == null) {
			log.warn("path为null.");
			return null;
		}

		// 对于有包含双个通匹符的，采用本地匹配文件扩展名
		String fileMatcher = null;
		int nLastFileSperator = path.lastIndexOf("/");
		if (nLastFileSperator > 0 && (path.contains("**") || path.contains("??"))) {
			fileMatcher = path.substring(nLastFileSperator + 1);
			fileMatcher = fileMatcher.replace("**", "*");
			fileMatcher = fileMatcher.replace("??", "?");
			path = path.substring(0, nLastFileSperator + 1);

			log.debug("采用本地匹配文件的扩展名.");
		}

		FTPFile[] ftpFiles = null;
		String encodePath = encodeFTPPath(path);
		ftpFiles = this.ftp.listFiles(encodePath);
		
		// 增加原有解析兼容
		if(!isFilesNotNull(ftpFiles)){
			encodePath = path;
			ftpFiles = this.ftp.listFiles(encodePath);
		}
		if (!isFilesNotNull(ftpFiles)) {
			for (int i = 0; i < 3; i++) {
				int sleepTime = 2000 * (i + 1);
				// 当连接失败后， 不再连接 login()方法，改连 login2()方法
				login2();
				log.debug(keyId + "重新尝试listFiles: " + path + ",次数:" + (i + 1));
				try {
					Thread.sleep(sleepTime);
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					ftpFiles = this.ftp.listFiles(encodeFTPPath(path));
				} catch (Exception e) {
					log.error("listFiles失败：" + path, e);
				}
				if (isFilesNotNull(ftpFiles)) {
					log.debug(keyId + "重试listFiles成功：" + path);
					break;
				}
			}
			if (!isFilesNotNull(ftpFiles)) {
				log.warn(keyId + "重试3次listFiles失败，不再尝试：" + path);
			}
		}
		// listFiles返回null或长度为0时，可认为确实无文件，即使重试，也是一样。
		// 所以此处正常返回，即返回一个长度为0的List.
		if (ftpFiles == null || ftpFiles.length == 0)
			return Collections.emptyList();

		// 正常化文件列表， 做四个处理：
		// 1、为null的FTPFile对象消除；
		// 2、文件名为null的FTP对象清除；
		// 3、文件名改名绝对路径；
		// 4、如果不是文件，跳过。
		List<FTPFile> list = new ArrayList<FTPFile>();
		for (FTPFile ff : ftpFiles) {
			/**
			 * 有ftp服务器上的文件是连接，此时仍需要下载
			 */
			if (ff == null || ff.getName() == null || ff.getName().trim().isEmpty() || (!ff.isFile() && !ff.isSymbolicLink())) {
				// log.debug("ignore file:{} isfile:{} isSymbolicLink:{} type:{}", new Object[]{ff.getName(), ff.isFile(), ff.isSymbolicLink(),
				// ff.getType()});
				continue;
			}

			String dir = FilenameUtils.getFullPath(encodePath);
			if (dir.contains("*") || dir.contains("?")) {
				// 例如WCDMA爱立信性能，LIST使用的路径，目录部分是有*号的。
				// 直接用LIST结果里的文件名就行了，它带有目录。
				list.add(ff);
			} else {
				// 为了不影响后续业务处理，做最小改动，此处仅仅避免getName时因文件名中的“\”而错误截位。
				// log.debug("FilenameUtils.getName:ff.toString:"+ff.toString());
				//log.debug("FilenameUtils.getName:before:"+ff.getName());
				String filename = FilenameUtils.getName(decodeFTPPath(ff.getName(), ftpCharset));
				// log.debug("FilenameUtils.getName:after:"+filename);
				ff.setName(dir + encodeFTPPath(filename, ftpCharset));

				// 对文件扩展名通匹符进行匹配
				if (fileMatcher != null) {
					if (!FilenameUtils.wildcardMatch(ff.getName(), fileMatcher)) {
						 // log.debug("ignore file:{} fileMatcher:{}", new Object[]{ff.getName(),fileMatcher});
						continue;
					}
				}

				list.add(ff);
			}
		}

		Collections.sort(list, getFTPFileComparator());
		return list;
	}

	/**
	 * FTP 下载过程，包括重试。
	 */
	public static InputStream download(String ftpPath, FTPClient ftpClient) {
		InputStream in = retrNoEx(ftpPath, ftpClient);
		if (in != null) {
			return in;
		}
		log.warn("FTP下载失败，开始重试，文件：{}，reply={}", new Object[]{ftpPath, ftpClient.getReplyString() != null ? ftpClient.getReplyString().trim() : ""});
		for (int i = 0; i < 3; i++) {
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				log.warn("FTP 下载重试过程中线程被中断。", e);
				return null;
			}
			log.debug("第{}次重试下载。", i + 1);
			completePendingCommandNoEx(ftpClient);
			in = retrNoEx(ftpPath, ftpClient);
			if (in != null) {
				log.debug("第{}次重试下载成功。", i + 1);
				break;
			}
		}
		return in;

	}

	/**
	 * FTP接收，处理异常。
	 * 
	 * @param ftpPath
	 * @param ftpClient
	 * @return
	 */
	public static InputStream retrNoEx(String ftpPath, FTPClient ftpClient) {
		InputStream in = null;
		try {
			ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
			in = ftpClient.retrieveFileStream(ftpPath);
		} catch (IOException e) {
			log.error("FTP下载异常：" + ftpPath, e);
		}

		return in;
	}

	/**
	 * 从FTP读取了流之后，需要读取FTP响应消息，否则下次操作时将会失败
	 */
	public static boolean completePendingCommandNoEx(FTPClient ftpClient) {
		boolean b = true;
		try {
			/**
			 * 这里要判断服务器端口是否已经响应完成，如果是，不能再调用completePendingCommand，否则阻塞，直至超时。
			 * 
			 * @author yuy <br>
			 *         2014.11.14
			 */
			if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode()) && !FTPReply.isNegativePermanent(ftpClient.getReplyCode())) {
				b = ftpClient.completePendingCommand();
			} else {
				log.warn("FTP已经响应：{}", ftpClient.getReplyString());
			}
			if (!b)
				log.warn("FTP失败响应：{}", ftpClient.getReplyString());
		} catch (Exception e) {
			log.error("获取FTP响应异常。", e);
			return false;
		}

		return b;
	}

	/**
	 * FTP服务器linux默认FTP，windows默认GBK<br>
	 * 通过FEAT命令查看是否支持UTF8模式，如果支持则设置发送OPTS UTF8 ON命令，并返回这只UTF-8编码集<br>
	 * 如果不支持UTF8模式，则查看FTP服务器的系统类型<br>
	 * 如果是WINDOWS则默认返回GBK<br>
	 * 如果不是windows则默认返回UTF-8
	 * 
	 * @author Niow 2014-7-8
	 * 
	 * @param ftp
	 *            登陆后的FTPClient
	 * @return 服务端编码集
	 * @throws IOException
	 */
	public static String autoSetCharset(FTPClient ftp) throws IOException {
		ftp.feat();
		String replay = ftp.getReplyString();
		if (replay.toUpperCase().contains("UTF8")) {
			ftp.sendCommand("OPTS UTF8", "ON");
			return "UTF-8";
		}
		ftp.sendCommand("SYST");
		replay = ftp.getReplyString();
		if (replay.toUpperCase().contains("WINDOWS")) {
			return "GBK";
		}
		return "UTF-8";
	}

	private static class FTPFileComparator implements Comparator<FTPFile> {

		@Override
		public int compare(FTPFile o1, FTPFile o2) {
			if (o1 == null && o2 == null)
				return 0;
			if (o1 == null)
				return -1;
			if (o2 == null)
				return 1;
			String name1 = (o1.getName() != null ? o1.getName() : "");
			String name2 = (o2.getName() != null ? o2.getName() : "");
			return name1.compareTo(name2);
		}
	}

	/**
	 * 通配符匹配
	 * 
	 * @param src
	 *            带通配符的字符串
	 * @param dest
	 *            不带通配符的字符串
	 * @param wildCard
	 *            通配符
	 * @return
	 */
	private static boolean wildCardMatch(String src, String dest, String wildCard) {
		String[] fieldName = split(src, wildCard);
		int start = -1;
		boolean flag = true;
		for (int n = 0; n < fieldName.length; n++) {
			if ("".equals(fieldName[n]))
				continue;
			int index = dest.indexOf(fieldName[n]);
			if (index > start) {
				start = index;
				continue;
			} else {
				flag = false;
				break;
			}
		}
		return flag;
	}
	
	/**
	 * 删除已下载的ftp上的文件
	 * @param pathlist
	 */
	public  void deleteDownloadedFile(){
		if(null == downFtpFileList || downFtpFileList.size() <= 0 ){
			return ;
		}
		try {
			for(int i = 0;i < downFtpFileList.size() ; i++){
				ftp.deleteFile(downFtpFileList.get(i));
			}
		} catch (IOException e) {
			log.error("删除FTP上的文件时出错！",e);
		}
	}

	/**
	 * 字符串拆分
	 * 
	 * @param string
	 * @param perfix
	 * @param maxArrayLength
	 * @return 拆分后的数组
	 */
	public static final String[] split(String string, String perfix) {
		if (isEmpty(string))
			return null;
		if (perfix == null || perfix.length() == 0)
			return new String[]{string};
		int index = string.indexOf(perfix);
		if (index < 0)
			return new String[]{string};
		List<String> splitList = new ArrayList<String>();
		while ((index = string.indexOf(perfix)) != -1) {
			splitList.add(string.substring(0, index));
			string = string.substring(index + perfix.length());
		}
		splitList.add(string.substring(0));
		String[] array = new String[splitList.size()];
		return splitList.toArray(array);
	}

	public static FTPFileComparator getFTPFileComparator() {
		return ftpFileComparator;
	}

	public static void main(String[] args) throws Exception, IOException {
		// FtpUtils u = new FtpUtils("192.168.15.129", 21, "guest", "guest",
		// "utf-8", true);
		// u.downFile("/aa.sh", "/home/win/ftp");//
		// u.uploadFile("D:\\SoftWare\\上传.txt",
		// "/InterfaceFiles/AH201211220002/上传.txt");

		// String ftpPath=new String("调整说明".getBytes("gbk"));
		// String tt=u.encodeFTPPath(ftpPath);
		// System.out.println(tt);
		// String n=u.decodeFTPPath(tt);
		// System.out.println(n);
		FTPClient f = new FTPClient();
		f.connect("192.168.15.129");
		f.login("guest", "guest");

		FTPFile[] fs = f.listFiles("/home/guest/aa.sh");

		String dir = f.printWorkingDirectory();
		System.out.println(dir);
		System.out.println(fs[0].getName());
		// AR_AH201211220002_testOk_1
	}

}
