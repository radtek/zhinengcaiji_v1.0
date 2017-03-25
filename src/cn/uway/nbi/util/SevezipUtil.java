package cn.uway.nbi.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SevezipUtil {

	public static String o7Z_path = SysCfg.getInstance().get7ZCompressPath();

	protected static Logger log = LoggerFactory.getLogger(SevezipUtil.class);

	/**
	 * 见文件夹打包成tar
	 * 
	 * @param outfile
	 * @param path
	 * @param deleteSrc
	 * @return
	 */
	public static int compressTarFolder(String inpath, String outfile, boolean deleteSrc) {
		// 创建压缩文件
		if (outfile == null || outfile.trim().length() == 0) {
			return -1;
		}
		if (inpath == null || inpath.trim().length() == 0) {
			return -1;
		}
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();
		// 7z源文件路径
		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd;
		if (operatsys.indexOf("window") >= 0) {

			cmd = "\"" + o7Z_path + "\" a -ttar " + outfile + " " + inpath + "\\* -r";
			log.debug(cmd);
		} else {
			cmd = "tar -fr " + outfile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}
		// 如果可以删除则删除源文件
		if (deleteSrc) {
			if (operatsys.indexOf("window") >= 0) {
				File f = new File(inpath);
				if (f.isDirectory()) {
					for (File file : f.listFiles()) {
						file.delete();
					}
					f.delete();
				}
			}
		}
		return ret;
	}

	/**
	 * tar文件打包
	 * 
	 * @param infile
	 *            输入文件
	 * @param outfile
	 *            输出文件
	 * @param deleteSrc
	 *            是否把打包前源文件删除掉
	 * @return
	 */
	public static int compressTar(String infile, String outfile, boolean deleteSrc) {
		// 创建压缩文件
		if (outfile == null || outfile.trim().length() == 0) {
			return -1;
		}
		if (infile == null || infile.trim().length() == 0) {
			return -1;
		}
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();
		// 7z源文件路径
		String o7Z_path = SysCfg.getInstance().get7ZCompressPath();
		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd;
		if (operatsys.indexOf("window") >= 0) {
			cmd = "\"" + o7Z_path + "\" a -ttar " + outfile + ".tar " + infile;
			log.debug(cmd);
		} else {
			cmd = "tar -fr " + infile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}
		// 如果可以删除则删除源文件
		if (deleteSrc) {
			if (operatsys.indexOf("window") >= 0) {
				File f = new File(infile);
				if (f.exists()) {
					f.delete();
				}

			}
		}
		return ret;
	}

	/**
	 * 压缩gz文件夹
	 * 
	 * @param outfile
	 * @param path
	 * @param deleteSrc
	 * @return
	 */
	public static int compressFiles(String outfile, String path, boolean deleteSrc) {
		// 创建压缩文件
		if (outfile == null || outfile.trim().length() == 0) {
			return -1;
		}
		if (path == null || path.trim().length() == 0) {
			return -1;
		}
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();

		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd;
		if (operatsys.indexOf("window") >= 0) {
			cmd = "\"" + o7Z_path + "\" a -t7z " + outfile + ".gz " + path + "\\* -r";
		} else {
			cmd = "gzip -fr " + outfile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}

		if (ret == 0 || ret == 2) {
			log.debug("文件压缩成功:" + outfile + ".gz");
		}
		// 如果可以删除则删除源文件
		if (deleteSrc) {
			// windows下压缩后删除源文件，linux gzip可以自动删除
			if (operatsys.indexOf("window") >= 0) {
				// File old = new File(outfile);
				deleteFile(path);
			}
		}
		return ret;
	}

	private static void deleteFile(String path) {
		File file = new File(path);
		if (file.exists())
			file.delete();

	}

	/**
	 * 解压缩gz文件到inFile文件夹
	 * 
	 * @param inFile
	 * @param deleteSrc
	 * @return
	 */
	public static String deCompressGZFile(String inFile, boolean deleteSrc) {
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();

		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd = null;
		File infile = new File(inFile);
		String name = infile.getName();
		String out = infile.getParent() + File.separator + name.substring(0, name.indexOf("."));
		if (operatsys.indexOf("window") >= 0) {
			cmd = "\"" + o7Z_path + "\" x " + inFile + " -o" + out;
			log.debug(cmd);
		} else {
			cmd = "tar -fr " + inFile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}
		if (deleteSrc) {
			if (operatsys.indexOf("window") >= 0) {
				File old = new File(inFile);
				if (old.exists()) {
					old.delete();
				}
			}
		}
		return out;
	}

	/**
	 * 解压缩gz文件到指定名称
	 * 
	 * @param inFile
	 * @param outPath
	 * @param deleteSrc
	 * @return
	 */
	public static int deCompressGZFile(String inFile, String outPath, boolean deleteSrc) {
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();

		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd = null;
		File out = new File(outPath);
		if (!out.exists()) {
			out.mkdirs();
		}
		if (operatsys.indexOf("window") >= 0) {
			cmd = "\"" + o7Z_path + "\" x " + inFile + " -o" + outPath;
			log.debug(cmd);
		} else {
			cmd = "tar -fr " + inFile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}
		if (deleteSrc) {
			if (operatsys.indexOf("window") >= 0) {
				File old = new File(inFile);
				if (old.exists()) {
					old.delete();
				}
			}
		}
		return ret;
	}

	/**
	 * 压缩gz文件到当前目录
	 * 
	 * @param outfile
	 * @param deleteSrc
	 * @return
	 */
	public static int compressGZFile(String infile, String outfile, boolean deleteSrc) {
		if (outfile == null || outfile.trim().length() == 0) {
			return -1;
		}
		if (infile == null || infile.trim().length() == 0) {
			return -1;
		}
		String operatsys = System.getProperties().getProperty("os.name").toLowerCase();

		if (operatsys == null && "".equals(operatsys))
			operatsys = "window";
		String cmd = null;
		if (operatsys.indexOf("window") >= 0) {
			cmd = "\"" + o7Z_path + "\" a -y " + outfile + ".gz " + infile;
			log.debug(cmd);
		} else {
			cmd = "tar -fr " + outfile;
		}
		int ret = executeCommand(cmd);
		if (ret != 0) {
			log.debug("execute cmd failure, retcode=" + ret + " :" + cmd);
		}
		if (deleteSrc) {
			if (operatsys.indexOf("window") >= 0) {
				File old = new File(infile);
				if (old.exists()) {
					old.delete();
				}
			}
		}
		return ret;
	}

	public static int executeCommand(String cmd) {

		int ret = 0;
		BufferedReader bufferedReader = null;
		try {
			String line;
			Process process = Runtime.getRuntime().exec(cmd);
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println(line);
				log.debug(line);
			}
			process.waitFor();
			ret = process.exitValue();
			log.debug("executeCommand .exitvalue=:" + ret);
		} catch (Exception e) {
			ret = -1;
			log.error("executeCommand .失败=:" + ret);

		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException e) {
				}
			}

		}
		return ret;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String inFileName = "/home/win/log/好人/文件.txt";
		String newName = "/home/win/log/好人/文件1.txt";
		String gz = "/home/win/log/好人/文件.zip";
		SevezipUtil.compressTar(inFileName, inFileName, false);

		// SevezipUtil.compressGZFile( inFileName + ".tar",inFileName + ".tar",
		// false);

		// SevezipUtil.compressTar( inFileName, false);
		// compressGZFile( newName, false);

		// File inFile = new File(newName);
		// File newFile = new File(gz);
		// inFile.renameTo(newFile);

		// SevezipUtil seven = new SevezipUtil();
		// String in = "D:\\BJ\\JS_PARA_14_Power_control_20090715_0400.csv";
		// File infile = new File(in);
		// String name = infile.getName();
		// String out = infile.getParent() + File.separator +
		// name.substring(0,name.indexOf("."));
		// seven.compressGZFile(in,false);
		// System.out.println(omcName);

		// new
		// SevezipUtil().compressFiles("D:\\work\\a.tar","D:\\work\\d",true);
		// compressGZFile("E:\\a\\mp\\a.tar",false);

	}

}
