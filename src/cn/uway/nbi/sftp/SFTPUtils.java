package cn.uway.nbi.sftp;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.sftp.SFTPClient.SFTPFileEntry;
import cn.uway.nbi.util.FileUtil;

public class SFTPUtils {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SFTPUtils.class);
	
	private String username;
	
	private String password;
	
	private int port;
	
	private String host;
	
	private String encode;
	
	private int maxPoolSize;
	
	private int id;
	
	public SFTPUtils(int id,String username,String password,int port,String host,String encode,int maxPoolSize)
	{
		this.id = id;
		this.username = username;
		this.password = password;
		this.port = port;
		this.host = host;
		this.encode = encode;
		this.maxPoolSize = maxPoolSize;
	}
	
	public List<SFTPFileEntry> listFilesRecursive(String sftpPath) throws Exception
	{
		SFTPClient sftpClient = null;
		SFTPClientPool sftpClientPool = null;
		try {
			sftpClientPool = SFTPClientPool.getSFTPClientPool(id, maxPoolSize);
			LOGGER.debug("[SFTP]等待获取SFTP连接......KEY={}", new Object[]{id});
			sftpClient = sftpClientPool.getSftpClient(host, port, username, password, encode);
			if(sftpClient == null) {
				LOGGER.debug("[SFTP]获取SFTP连接失败，KEY={}",	new Object[]{id});
				return null;
			}
				
			LOGGER.debug("[SFTP]获取SFTP连接成功，KEY={}",	new Object[]{id});
			List<SFTPFileEntry> fileEntryList = sftpClient.listSFTPFile(sftpPath);
			
			return fileEntryList;
		} catch (Exception e) {
			throw e;
		} finally {
			if (sftpClient != null) {
				sftpClientPool.returnSftpChannel(sftpClient);
			}
		}
	}
	
	public List<String> downLoadFile(List<SFTPFileEntry> fileList,String localPath) {
		SFTPClientPool sftpClientPool = SFTPClientPool.getSFTPClientPool(id, maxPoolSize);
		List<String> ftpFiles = new ArrayList<String>();
		for(SFTPFileEntry entry:fileList)
		{
			if(!entry.isDirectory)
			{
				String fileName = FilenameUtils.getName(entry.fileName);
				String parentPath = FilenameUtils.getFullPath(entry.fileName);
				parentPath = parentPath.replace("\\", "/");
				
				String tempPath = localPath + parentPath;
				File tempDir = new File(tempPath);
				
				tempPath += "/" + fileName;
				final int maxTryCount = 4;
				int nTryCount = 0;
				while (nTryCount < maxTryCount) {
					SFTPClient sftpClient = null;
					try {
						if (!(tempDir.exists() && tempDir.isDirectory())) {
							if (!tempDir.mkdirs()) {
								throw new Exception("创建临时文件夹失败. path=" + tempPath);
							}
						}
						if(nTryCount != 0)
						{
							int sleepTime = 2000 * (nTryCount + 1);
							LOGGER.debug("重试下载:" + entry.fileName + ",次数:" + nTryCount);
							Thread.sleep(sleepTime);
						}
						++nTryCount;
						sftpClient = sftpClientPool.getSftpClient(host, port, username, password, encode);
						sftpClient.downRemoteFile(entry.fileName, tempPath);
						break;
					} catch (Exception e) {
						LOGGER.error("下载SFTP文件:" + entry.fileName + "出错, 稍后将继续第" + (nTryCount) + "次重试下载.", e);
					}
					finally {
						if (sftpClient != null) {
							sftpClientPool.returnSftpChannel(sftpClient);
						}
					}
				}
				if (nTryCount < maxTryCount) {
					LOGGER.error("下载SFTP文件:" + entry.fileName + "成功。");
					ftpFiles.add(tempPath);
				}
			}
		}
		return ftpFiles;
	}
}
