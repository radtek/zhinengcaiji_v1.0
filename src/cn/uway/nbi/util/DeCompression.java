package cn.uway.nbi.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 解压文件工具类
 * 
 * @author liuwx May 18, 2011
 */
public class DeCompression {

	private static final Logger log = LoggerFactory.getLogger(DeCompression.class);

	public static ArrayList<String> decompress(String strFile, String currentPath) throws Exception {
		if (Util.isWindows()) {
			return decompressWin(strFile, currentPath);
		} else {
			return decompressUnix(strFile, currentPath);
		}
	}

	/**
	 * @param strFile
	 *            需要解压的文件
	 * @param currentPath
	 *            解压存放的文件夹
	 * @return 解压之后的文件集合
	 * @throws Exception
	 */
	private static ArrayList<String> decompressWin(String strFile, String currentPath) throws Exception {
		ArrayList<String> filelist = new ArrayList<String>();

		BufferedWriter bw;

		log.debug("Decompress start:" + new java.util.Date());
		bw = new BufferedWriter(new FileWriter(currentPath + File.separatorChar + "temp.bat", false));

		bw.write("md " + currentPath + "\r\n");
		File dir = new File(currentPath);

		// winrar的路径
		String strWinrarPath = SysCfg.getInstance().getWinrarPath();
		int nIndex = strWinrarPath.indexOf(":");
		if (nIndex >= 0)
			bw.write(strWinrarPath.substring(0, nIndex) + ":\r\n");
		bw.write("cd " + strWinrarPath + "\r\n");
		// 后台运行
		bw.write("winrar e " + strFile + " " + currentPath + " -y -ibck");
		bw.close();
		// 运行temp.bat
		int nSucceed = 0;
		Process ldr = null;
		try {
			ldr = Runtime.getRuntime().exec(currentPath + File.separatorChar + "temp.bat");
			/* nSucceed = */
			ldr.waitFor();
		} catch (InterruptedException e) {
			throw e;
		}
		// 0表示返回无错误。成功的标记
		nSucceed = ldr.exitValue();
		if (nSucceed == 0) {
			// 遍历文件夹
			File[] files = dir.listFiles();
			for (int i = 0; i < files.length; i++) {
				String FilePath = files[i].getAbsolutePath();
				filelist.add(FilePath);
			}
			// 删除压缩文件
			File fTar = new File(strFile);
			fTar.delete();

			// 删除批处理文件
			File fBat = new File(currentPath + File.separatorChar + "temp.bat");
			fBat.delete();
		} else {
			throw new Exception("decompress file error. file:" + strFile);
		}

		log.debug("Decompress end:" + new java.util.Date());

		return filelist;
	}

	/**
	 * 使用gzip解压缩文件
	 * 
	 * @param strFile
	 *            需要解压的文件
	 * @param currentPath
	 *            解压存放的文件夹
	 * @return 解压之后的文件集合
	 * @throws Exception
	 */
	private static ArrayList<String> decompressUnix(String strFile, String currentPath) throws Exception {
		ArrayList<String> fileList = null;

		String strLogFile = strFile.substring(0, strFile.lastIndexOf('.'));

		File fFolder = new File(currentPath);
		if (!fFolder.exists()) {
			if (!fFolder.mkdir()) {
				throw new Exception("mkdir error");
			}
		}

		String cmd = (strFile.endsWith(".zip") ? "unzip -o " : "gzip -d -f ") + strFile
				+ (strFile.endsWith(".zip") ? (" -d " + fFolder.getAbsolutePath()) : "");
		log.debug("cmd - " + cmd);
		int retCode = Util.execExternalCmd(cmd);

		if (retCode != 0) {
			log.error(cmd + " retCode=" + retCode);
			return new ArrayList<String>();
		}

		log.debug(cmd + " retCode=" + retCode);

		cmd = "mv " + strLogFile + " " + currentPath;
		if (strFile.endsWith(".zip"))
			retCode = 0;
		else
			retCode = Util.execExternalCmd(cmd);

		if (retCode == 0) {
			fileList = new ArrayList<String>();

			// 遍历文件夹
			File dir = new File(fFolder.getAbsolutePath());
			log.debug("dir - " + dir.getAbsolutePath());
			File[] files = dir.listFiles();

			for (int i = 0; i < files.length; i++) {
				String FilePath = files[i].getAbsolutePath();
				fileList.add(FilePath);
			}

			// 删除压缩文件
			File fTar = new File(strFile);
			fTar.delete();
		}
		if (retCode != 0)
			log.debug(cmd + " retCode=" + retCode);

		return fileList;
	}

	public static void main(String s[]) {
		try {
			decompressWin("c:\\Archive.rar", "c:\\");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
