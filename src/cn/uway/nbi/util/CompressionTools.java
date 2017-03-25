package cn.uway.nbi.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;

/**
 * 压缩工具类
 * 
 * @author liuwx May 16, 2011
 */
public class CompressionTools {

	protected static Logger log = LoggerFactory.getLogger(CompressionTools.class);

	/**
	 * @param zipFile
	 *            最终压缩文件名
	 * @param allFileName
	 *            某目录下的全部文件或者部分文件
	 * @param dir
	 *            某个目录
	 * @return
	 * @throws Exception
	 */
	public static String compressWin(String zipFile, List<String> allFileName) throws Exception {
		File[] files = null;
		try {
			String tempfile = zipFile.substring(0, zipFile.lastIndexOf(".")) + ".bat";

			File compressFile = new File(zipFile);
			String name = new String(compressFile.getName());

			// 需要压缩的文件名，不包括后缀
			name = name + "_" + DateUtil.getDateString_yyyyMMddHHmmssSSS(new Date());

			String dir = compressFile.getParent();

			String newDir = dir + File.separator + name;

			File newDirFile = new File(newDir);
			if (!newDirFile.exists())
				newDirFile.mkdirs();
			// 将文件拷贝到指定的文件目录后，进行打包
			for (String file : allFileName) {
				FileUtil.copyFileToDir(newDir, new File(file), null);
			}

			log.debug("compress start:" + new java.util.Date());
			BufferedWriter bw = new BufferedWriter(new FileWriter(tempfile, false));

			int nIndex = dir.indexOf(":");
			if (nIndex >= 0)
				bw.write(dir.substring(0, nIndex) + ":\r\n");
			bw.write("cd \"" + newDir + "\"\r\n");
			StringBuilder sb = new StringBuilder(" ");

			files = newDirFile.listFiles();

			if (files != null) {
				for (File name1 : files) {
					if (!name1.exists())
						continue;
					sb.append("\"").append(name1.getName()).append("\"").append(" ");

				}
			}

			String rarToolPath = SysCfg.getInstance().getWinrarPath();

			bw.write("\"" + rarToolPath + "\"  a  " + zipFile + " " + sb.toString());
			bw.close();

			boolean flag = false;
			if (StringUtil.isNotNull(tempfile)) {
				flag = new ExternalCmd().execute(tempfile) == 0 ? true : false;
			}
			if (flag) {
				// 删除批处理文件
				File fBat = new File(tempfile);
				fBat.delete();
			} else {
				throw new Exception("compress file error. file:" + zipFile);
			}

			log.debug("compress end:" + new java.util.Date());
		} finally {
			if (files != null) {
				for (File name1 : files) {
					name1.deleteOnExit();
				}
			}
		}

		return zipFile;
	}

	/** 使用gzip压缩文件 */
	public static String compressUnix(String rarFile, List<String> allFileName) throws Exception {
		String filedir = rarFile.substring(0, rarFile.lastIndexOf('.'));

		File fFolder = new File(filedir);
		if (!fFolder.exists()) {
			if (!fFolder.mkdir()) {
				throw new Exception("mkdir error");
			}
		}
		StringBuilder sb = new StringBuilder(" ");
		for (String name : allFileName) {
			if (StringUtil.isNull(name))
				continue;
			sb.append(name).append(" ");

		}
		String temp = null;
		if (rarFile.endsWith(".tar.gz")) {
			temp = rarFile.substring(0, rarFile.lastIndexOf(".gz"));
		}
		String cmd = (rarFile.endsWith(".zip") ? "zip  " + rarFile : "tar -cvf " + temp)

		+ (rarFile.endsWith(".zip") ? ("  " + sb.toString()) : "  " + sb.toString());
		log.debug("cmd - " + cmd);
		int retCode = Util.execExternalCmd(cmd);

		if (retCode != 0) {
			log.error(cmd + " retCode=" + retCode);
			return rarFile;
		}

		log.debug(cmd + " retCode=" + retCode);

		if (rarFile.endsWith(".zip"))
			retCode = 0;
		else {
			cmd = "gzip  " + temp;
			retCode = Util.execExternalCmd(cmd);
		}

		if (retCode == 0) {

			// 遍历文件夹
			for (String name : allFileName) {
				if (StringUtil.isNull(name))
					continue;
				File f = new File(name);
				if (f.exists())
					f.delete();
			}
		}
		if (retCode != 0)
			log.debug(cmd + " retCode=" + retCode);
		return rarFile;
	}

	public static void main(String s[]) {
		List<String> a = new ArrayList<String>();
		a.add("C:\\a.txt");
		a.add("C:\\b.txt");
		try {
			CompressionTools.compressWin("C:\\bb33.rar", a);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
