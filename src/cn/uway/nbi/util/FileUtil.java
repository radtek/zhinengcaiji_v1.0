package cn.uway.nbi.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;

/**
 * 文件处理工具类
 * 
 * @author liuwx May 14, 2011
 */
public class FileUtil {

	protected static Logger LOG = LoggerFactory.getLogger(FileUtil.class);

	protected static Map<String, String> map = new HashMap<String, String>();
	
	private static String fcompile = SysCfg.getInstance().getFCompile();
	
	// HEN_ZZ_MOBILE_OMC2_HUAWEI_PM_RNC001_60_%%Y%%M%%D%%H%%m%%s_%%UE_%%RC_%%PARTION.tar.gz
	private static Pattern parttern  = Pattern.compile(fcompile);

	/**
	 * 将文件移动到另一个目录下. 只适合在本地硬盘下进行移动文件.不支持网络上的移动
	 * 
	 * @param sourfile
	 *            源文件名
	 * @param newPath
	 *            新文件名
	 * @return
	 */
	public static boolean filerename(String sourfile, String newPath) {
		try {
			// 文件原地址
			File oldFile = new File(sourfile);
			// new一个新文件夹
			File fnewpath = new File(newPath);
			// 判断文件夹是否存在
			if (!fnewpath.exists())
				fnewpath.mkdirs();
			// 将文件移到新文件里
			File fnew = new File(newPath + File.separator + oldFile.getName());
			oldFile.renameTo(fnew);
		} catch (Exception e) {
			LOG.error("重命名文件出现异常,原因:", e);
			return false;
		}
		return true;
	}

	/**
	 * 复制目录下的文件（不包括该目录）到指定目录，会连同子目录一起复制过去。
	 * 
	 * @param targetFile
	 *            目录
	 * @param path
	 *            文件路径
	 * @throws IOException
	 */
	public static void copyFileFromDir(String targetDir, String path) throws IOException {
		File file = new File(path);
		createFile(targetDir, false);
		if (file.isDirectory()) {
			copyFileToDir(targetDir, listFile(file));
		}
	}

	/**
	 * 复制目录下的文件（不包含该目录和子目录，只复制目录下的文件）到指定目录。
	 * 
	 * @param targetDir
	 * @param path
	 * @throws IOException
	 */
	public static void copyFileOnly(String targetDir, String path) throws IOException {
		File file = new File(path);
		File targetFile = new File(targetDir);
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (File subFile : files) {
				if (subFile.isFile()) {
					copyFile(targetFile, subFile);
				}
			}
		}
	}

	/**
	 * 复制目录到指定目录。targetDir是目标目录，path是源目录。 该方法会将path以及path下的文件和子目录全部复制到目标目录
	 * 
	 * @param targetDir
	 * @param path
	 * @throws IOException
	 */
	public static void copyDir(String targetDir, String path) throws IOException {
		File targetFile = new File(targetDir);
		createFile(targetFile, false);
		File file = new File(path);
		if (targetFile.isDirectory() && file.isDirectory()) {
			copyFileToDir(targetFile.getAbsolutePath() + "/" + file.getName(), listFile(file));
		}
	}

	/**
	 * 复制一组文件到指定目录。targetDir是目标目录，filePath是需要复制的文件路径
	 * 
	 * @param targetDir
	 * @param filePath
	 * @throws IOException 
	 */
	public static void copyFileToDir(String targetDir, String[] filePath) throws IOException {
		if (StringUtil.isNull(targetDir))
			return;
		File targetFile = new File(targetDir);
		if (!targetFile.exists()) {
			targetFile.mkdir();
		} else {
			if (!targetFile.isDirectory())
				return;
		}
		for (String path : filePath) {
			File file = new File(path);
			if (file.isDirectory()) {
				copyFileToDir(targetDir + "/" + file.getName(), listFile(file));
			} else {
					copyFileToDir(targetDir, file, "");		
			}
		}
	}

	/**
	 * 复制文件到指定目录。targetDir是目标目录，file是源文件名，newName是重命名的名字。
	 * 
	 * @param targetFile
	 * @param file
	 * @param newName
	 * @throws IOException
	 */
	public static void copyFileToDir(String targetDir, File file, String newName) throws IOException {
		String newFile = "";
		if (newName != null && !"".equals(newName)) {
			newFile = targetDir + "/" + newName;
		} else {
			newFile = targetDir + "/" + file.getName();
		}
		File tFile = new File(newFile);
		copyFile(tFile, file);
	}

	/**
	 * 复制文件。targetFile为目标文件，file为源文件
	 * 
	 * @param targetFile
	 * @param file
	 * @throws IOException
	 */
	public static void copyFile(File targetFile, File file) throws IOException {

		if (targetFile.exists()) {
			targetFile.delete();
		}
		
		String name = targetFile.getAbsolutePath();
		deleteRCFile(name);
		File tmpFile = new File(name + ".tmp");

		createFile(tmpFile, true);

		InputStream is = null;
		FileOutputStream fos = null;
		try {
			is = new FileInputStream(file);
			fos = new FileOutputStream(tmpFile);

			IOUtils.copy(is, fos);
		} finally {
			try {

				if (fos != null) {
					fos.flush();
					fos.close();
				}
				if (is != null)
					is.close();

				tmpFile.renameTo(targetFile);
			} catch (IOException e) {
				throw e;
			}
		}
	}
	
	private static void deleteRCFile(String name)
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
				    	File f = new File(name);
				    	if(f.exists())
				    	{
				    		f.delete();
				    	}
				    }
				}
				catch(Exception e)
				{
				}
			}
		}		
	}

	public static String[] listFile(File dir) {
		String absolutPath = dir.getAbsolutePath();
		String[] paths = dir.list();
		String[] files = new String[paths.length];
		for (int i = 0; i < paths.length; i++) {
			files[i] = absolutPath + "/" + paths[i];
		}
		return files;
	}

	public static void createFile(String path, boolean isFile) throws IOException {
		createFile(new File(path), isFile);
	}

	public static void createFile(File file, boolean isFile) throws IOException {
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				createFile(file.getParentFile(), false);
				if (isFile) {
					file.createNewFile();
				} else {
					file.mkdir();
				}
			} else {
				if (isFile) {
					file.createNewFile();
				} else {
					file.mkdir();
				}
			}
		}
	}

	/**
	 * 递归文件夹，获取文件名
	 * 
	 * @param file
	 * @param path
	 * @return
	 * @throws IOException
	 */
	public static Map<String, String> recursiveFile(File file, String path) throws IOException {

		File f[] = file.listFiles();
		if (f == null)
			return null;
		for (int i = 0; i < f.length; i++) {
			File f2 = f[i];

			if (f2.isFile()) {
				map.put(f2.getPath().substring(path.length()), f2.getPath().substring(path.length()));
			} else {
				recursiveFile(f2, path);
			}
		}

		return map;
	}

	/**
	 * 写文件
	 * 
	 * @param file
	 * @param path
	 * @return
	 * @throws IOException
	 */
	public static boolean writeFile(List<String> list, File file) throws IOException {
		BufferedWriter writer = null;
		try {
			writer = new BufferedWriter(new FileWriter(file));
			writer.write(list.get(0));
			for (int i = 1; i < list.size(); i++) {
				writer.newLine();
				writer.write(list.get(i));
			}
			writer.flush();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
				}
			}
		}
		return true;
	}

	public static void main(String[] args) throws Exception {
		String path = "D:/ftp/test/aa.txt";
		File f = new File(path);
		createFile(f,true);

	}

}
