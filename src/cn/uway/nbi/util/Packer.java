package cn.uway.nbi.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.GZIPOutputStream;

import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveOutputStream;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarOutputStream;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;

/**
 * 打包类 Packer
 * 
 * @author YangJian
 * @since 1.0
 */
public class Packer {

	protected static Logger LOG = LoggerFactory.getLogger(Packer.class);

	private static final int BUFFEREDSIZE = 1024;

	// private static String encode ="UTF-8";

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void pack(String[] fileNames, String packFileName) throws Exception {
		List<String> list = Arrays.asList(fileNames);
		pack(list, packFileName);
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void pack(String[] fileNames, String packFileName, String encode) throws Exception {
		List<String> list = Arrays.asList(fileNames);
		pack(list, packFileName);
	}
	
	/**
	 * 此方法区别于pack（String[] fileNames, String packFileName）
	 * 主要在于打包gz文件时，文件名只带gz后缀，不带其它：如xxx.txt，打包后为xxx.gz，而不是xxx.txt.gz
	 * @param fileNames
	 * @param packFileName
	 * @param isGZ
	 * @throws Exception
	 */
	public static void pack(String[] fileNames, String packFileName, boolean isGZ)throws Exception {
		List<String> list = Arrays.asList(fileNames);
		if(isGZ){
			packGZ(list,packFileName);
		}else{
			pack(list, packFileName);
		}
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void pack(List<String> fileNames, String packFileName, String encode) throws Exception {

		if (fileNames == null || fileNames.size() == 0) {
			LOG.info("文件名为空.");
			return;
		}
		if (StringUtil.isNull(packFileName)) {
			return;
		}

		if (packFileName.lastIndexOf(".") == -1)
			return;
		boolean targzFlag = false;
		if (packFileName.endsWith("tar.gz") || packFileName.endsWith("TAR.GZ"))
			targzFlag = true;
		String ext = packFileName.substring(packFileName.lastIndexOf(".") + 1);

		if ("zip".equalsIgnoreCase(ext)) {
			if (SysCfg.getInstance().isExist7ZCompressPath()) {
				CompressionTools.compressWin(packFileName, fileNames);

			} else {
				zipPack(fileNames, packFileName);
			}

		} else if ("rar".equalsIgnoreCase(ext)) {
			rarPack(fileNames, packFileName);
		} else if ("tar".equalsIgnoreCase(ext)) {

			if (SysCfg.getInstance().isExist7ZCompressPath()) {

				File compressFile = new File(packFileName);
				String name = new String(compressFile.getName());
				name = name.replace(".tar", "").replace(".TAR", "");

				// 需要压缩的文件名，不包括后缀
				String nameTmp = new String(name);
				name = name + "_" + DateUtil.getDateString_yyyyMMddHHmmssSSS(new Date());

				String dir = compressFile.getParent();

				String newDir = dir + File.separator + name;

				String tarDir = dir + File.separator + nameTmp + ".TAR";

				File tmpTardir = new File(tarDir);
				if (tmpTardir.exists())
					tmpTardir.delete();

				File tarTmp = new File(tarDir);
				if (tarTmp.exists())
					tarTmp.delete();

				File newDirFile = new File(newDir);
				if (!newDirFile.exists())
					newDirFile.mkdirs();
				// 将文件拷贝到指定的文件目录后，进行打包
				for (String file : fileNames) {
					FileUtil.copyFileToDir(newDir, new File(file), null);
				}
				// 进行打包为tar格式
				SevezipUtil.compressTarFolder(newDir, tarDir, true);

			} else {
				tarPack(fileNames, packFileName, encode);

				File tarTmp = new File(new String(packFileName.replace(".tar", "").replace(".TAR", "")));
				if (tarTmp.exists())
					tarTmp.delete();
			}

		} else if (targzFlag)// tar.gz
		{
			if (SysCfg.getInstance().isExist7ZCompressPath()) {

				File compressFile = new File(packFileName);
				String name = new String(compressFile.getName());
				name = name.replace(".tar.gz", "").replace(".TAR.GZ", "");

				// 需要压缩的文件名，不包括后缀
				String nameTmp = new String(name);
				name = name + "_" + DateUtil.getDateString_yyyyMMddHHmmssSSS(new Date());

				String dir = compressFile.getParent();

				String newDir = dir + File.separator + name;

				String tarDir = dir + File.separator + nameTmp + ".tar";

				File tmpTardir = new File(tarDir);
				if (tmpTardir.exists())
					tmpTardir.delete();

				File tmpTardirgz = new File(tarDir + ".gz");
				if (tmpTardirgz.exists())
					tmpTardirgz.delete();

				File newDirFile = new File(newDir);
				if (!newDirFile.exists())
					newDirFile.mkdirs();
				// 将文件拷贝到指定的文件目录后，进行打包
				for (String file : fileNames) {
					FileUtil.copyFileToDir(newDir, new File(file), null);
				}
				// 进行打包为tar格式
				SevezipUtil.compressTarFolder(newDir, tarDir, true);

				int isCompressSucess = SevezipUtil.compressGZFile(tarDir, tarDir, true);

				LOG.debug(packFileName + "文件压缩是否成功" + (isCompressSucess == 0));

				File tarTmp = new File(tarDir);
				if (tarTmp.exists())
					tarTmp.delete();

			} else {
				targzPack(fileNames, packFileName, encode);

				File tarTmp = new File(new String(packFileName.replace(".gz", "").replace(".GZ", "")));
				if (tarTmp.exists())
					tarTmp.delete();

			}
		} else if ("gz".equalsIgnoreCase(ext)) {

			if (SysCfg.getInstance().isExist7ZCompressPath()) {
				/* 只能对单个的文件打包成gz文件 */
				for (String f : fileNames) {
					SevezipUtil.compressGZFile(f, f + ".gz", true);
				}
			} else {
				/* 只能对单个的文件打包成gz文件 */
				for (String f : fileNames) {
					String gzFileName = f + ".gz";
					gzPack(f, gzFileName);

				}
			}
		}

	}
	
	public static void packGZ(List<String> fileNames, String packFileName) throws Exception {

		if (fileNames == null || fileNames.size() == 0) {
			LOG.info("文件名为空.");
			return;
		}
		if (StringUtil.isNull(packFileName)) {
			return;
		}

		if (packFileName.lastIndexOf(".") == -1)
			return;
		
		String ext = packFileName.substring(packFileName.lastIndexOf(".") + 1);
		 if ("gz".equalsIgnoreCase(ext)) {
			if (SysCfg.getInstance().isExist7ZCompressPath()) {
				/* 只能对单个的文件打包成gz文件 */
				for (String f : fileNames) {
					String pathName = f;
					f = f.substring(0,f.lastIndexOf("."));
					SevezipUtil.compressGZFile(pathName, f + ".gz", true);
				}
			} else {
				/* 只能对单个的文件打包成gz文件 */
				for (String f : fileNames) {
					String pathName = f;
					f = f.substring(0,f.lastIndexOf("."));
					gzPack(pathName, f + ".gz");
				}
			}
		}

	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void pack(List<String> fileNames, String packFileName) throws Exception {
		pack(fileNames, packFileName, null);
	}

	/**
	 * 获取文件后缀信息
	 * 
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static FilePackageInfo getFilePackExt(String packFileName) throws Exception {

		FilePackageInfo packInfo = new FilePackageInfo();
		packInfo.setFileName(packFileName);

		if (StringUtil.isNull(packFileName)) {
			return packInfo;
		}

		if (packFileName.lastIndexOf(".") == -1)
			return packInfo;

		boolean targzFlag = true;
		if (packFileName.endsWith("tar.gz") || packFileName.endsWith("TAR.GZ")) {
			packInfo.setFileExt(targzFlag);
			packInfo.setFileExt("tar.gz");
			return packInfo;
		}
		String ext = packFileName.substring(packFileName.lastIndexOf(".") + 1);

		if (StringUtil.isNull(ext))
			return packInfo;
		ext = ext.toLowerCase();

		if ("zip".equalsIgnoreCase(ext)) {
			packInfo.setFileExt(targzFlag);
			packInfo.setFileExt("zip");
			return packInfo;

		} else if ("rar".equalsIgnoreCase(ext)) {
			packInfo.setFileExt(targzFlag);
			packInfo.setFileExt("rar");
			return packInfo;
		} else if ("tar.gz".equalsIgnoreCase(ext))// tar.gz
		{
			packInfo.setFileExt(targzFlag);
			packInfo.setFileExt("tar.gz");
			return packInfo;
		} else if ("gz".equalsIgnoreCase(ext)) {
			packInfo.setFileExt(targzFlag);
			packInfo.setFileExt("gz");
			return packInfo;
		}

		return packInfo;
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void zipPack(String[] fileNames, String packFileName) throws Exception {

		zipPack(Arrays.asList(fileNames), packFileName);

	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	private static void zipPack(List<String> fileNames, String packFileName) throws Exception {
		zip(fileNames, packFileName);
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */
	public static void rarPack(String[] fileNames, String packFileName) throws Exception {
		rarPack(Arrays.asList(fileNames), packFileName);
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */

	private static void rarPack(List<String> fileNames, String packFileName) throws Exception {
		CompressionTools.compressWin(packFileName, fileNames);
	}

	/**
	 * 只能将一个文件打包为一个.gz格式，例如文件名为a.csv ，打包文件名为.gz，则打包后的文件为a.csv.gz
	 * 
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名
	 */

	private static void gzPack(String fileNames, String packFileName) throws Exception {

		if (fileNames == null)
			return;
		FileOutputStream fos = new FileOutputStream(packFileName);
		InputStream in = null;
		BufferedOutputStream out = null;
		try {
			in = new FileInputStream(fileNames);
			out = new BufferedOutputStream(new GZIPOutputStream(fos));
			int BUFFEREDSIZE = 1024 * 8;
			int c;
			byte[] by = new byte[BUFFEREDSIZE];
			while ((c = in.read(by)) != -1) {
				out.write(by, 0, c);
				out.flush();
			}

		} finally {
			if (in != null)
				in.close();
			if (out != null)
				out.close();
		}
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名(.tar.gz)
	 */
	public static void targzPack(List<String> fileNames, String packFileName) throws Exception {
		targzPack(fileNames, packFileName, null);

	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名(.tar.gz)
	 */
	public static void targzPack(List<String> fileNames, String packFileName, String encode) throws Exception {
		String tar = new String(packFileName);
		tar = tar.replaceAll(".tar.gz", ".tar").replace(".TAR.GZ", ".TAR");

		TarUtils tarUtil = new TarUtils();
		tarUtil.setEncode(encode);
		tarUtil.execute(fileNames, tar);
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名(.tar)
	 */
	public static void tarPack(List<String> fileNames, String packFileName, String encode) throws Exception {
		String tar = new String(packFileName);
		tar = tar.replaceAll(".tar", "").replace(".TAR", "");

		TarUtils tarUtil = new TarUtils();
		tarUtil.setEncode(encode);
		tarUtil.execute_tar(fileNames, tar);
	}

	/**
	 * @param fileNames
	 *            需要打包的文件集合
	 * @param packFileName
	 *            打包后的文件名(.tar.gz)
	 */
	public static void targzPack(String[] fileNames, String packFileName) throws Exception {
		boolean b = packFileName.toLowerCase().endsWith(".tar.gz");
		String fileName = null;
		if (!b)
			fileName = packFileName.replace(".gz", ".tar");
		else
			fileName = packFileName.replace(".tar.gz", ".tar");

		compress(packTarFile(fileNames, fileName));
	}

	/**
	 * @Title: pack
	 * @Description: 将一组文件打成tar包
	 * @param sources
	 *            要打包的原文件数组
	 * @param target
	 *            打包后的文件
	 * @return String 返回打包后的文件
	 * @throws
	 */
	/*
	 * public static String packFile(List<String> sourcesFileList, String packFileName) throws Exception {
	 * 
	 * return packFile(sourcesFileList.toArray(new String[sourcesFileList.size()]), packFileName);
	 * 
	 * }
	 */
	/**
	 * @Title: pack
	 * @Description: 将一组文件打成tar包
	 * @param sources
	 *            要打包的原文件数组
	 * @param target
	 *            打包后的文件
	 * @return String 返回打包后的文件
	 * @throws
	 */
	public static String packTarFile(String[] sources, String packFileName) throws Exception {
		if (sources == null || sources.length == 0) {
			LOG.warn("需要压缩的文件为空，打包名= " + packFileName);
			return packFileName;
		}
		FileOutputStream out = null;
		out = new FileOutputStream(packFileName);
		TarArchiveOutputStream os = new TarArchiveOutputStream(out);
		InputStream in = null;
		for (String file : sources) {
			File ff = new File(file);
			if (ff.isFile()) {
				File pFile = ff.getParentFile();
				if (!pFile.exists())
					pFile.mkdirs();
			} else
				ff.mkdirs();
			os.putArchiveEntry(new TarArchiveEntry(ff));
			in = new FileInputStream(file);
			IOUtils.copy(in, os);
			org.apache.commons.io.IOUtils.closeQuietly(in);
			os.closeArchiveEntry();
		}
		if (os != null) {
			try {
				os.flush();
				os.close();
			} catch (IOException e) {
			}
		}
		return packFileName;
	}

	/**
	 * @Title: pack
	 * @Description: 将一组文件打成tar包
	 * @param sources
	 *            要打包的原文件数组
	 * @param target
	 *            打包后的文件
	 * @return String 返回打包后的文件
	 * @throws
	 */
	public static String packFile(List<String> sources, String packFileName) throws FileNotFoundException, IOException {
		FileOutputStream out = null;
		out = new FileOutputStream(packFileName);
		TarArchiveOutputStream os = new TarArchiveOutputStream(out);
		try {
			for (String file : sources) {
				os.putArchiveEntry(new TarArchiveEntry(new File(file)));
				IOUtils.copy(new FileInputStream(file), os);
				os.closeArchiveEntry();
			}
		} finally {
			org.apache.commons.io.IOUtils.closeQuietly(out);
		}

		return packFileName;
	}

	/**
	 * @Title: compress
	 * @Description: 将文件用gzip压缩
	 * @param source
	 *            需要压缩的文件
	 * @return File 返回压缩后的文件
	 * @throws
	 */
	public static File compress(File source) throws FileNotFoundException, IOException {
		File target = new File(source.getAbsolutePath() + ".gz");
		FileInputStream in = null;
		GZIPOutputStream out = null;
		try {
			in = new FileInputStream(source);
			out = new GZIPOutputStream(new FileOutputStream(target));
			byte[] array = new byte[1024];
			int number = -1;
			while ((number = in.read(array, 0, array.length)) != -1) {
				out.write(array, 0, number);
			}
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}
		return target;
	}

	/**
	 * @param source
	 * @return
	 */
	public static File compress(String source) throws FileNotFoundException, IOException {
		File f = new File(source);
		return compress(f);
	}

	/**
	 * 压缩文件成Gzip格式，Linux上可使用 压缩文件夹生成后缀名为".gz"的文件并下载
	 * 
	 * @param folderPath
	 *            ,要压缩的文件夹的路径
	 * @param zipFilePath
	 *            ,压缩后文件的路径
	 * @param zipFileName
	 *            ,压缩后文件的名称
	 * @throws BizException
	 */
	public static void CompressedFiles_Gzip(String folderPath, String targzipFilePath, String targzipFileName) throws FileNotFoundException,
			IOException {
		File srcPath = new File(folderPath);
		int length = srcPath.listFiles().length;
		byte[] buf = new byte[1024]; // 设定读入缓冲区尺寸
		File[] files = srcPath.listFiles();
		FileOutputStream gzFile = null;
		FileOutputStream fout = null;
		TarOutputStream tout = null;
		GZIPOutputStream gzout = null;
		FileInputStream tarin = null;
		try {
			// 建立压缩文件输出流
			fout = new FileOutputStream(targzipFilePath);

			// 建立tar压缩输出流
			tout = new TarOutputStream(fout);

			for (int i = 0; i < length; i++) {
				String filename = srcPath.getPath() + File.separator + files[i].getName();
				// 打开需压缩文件作为文件输入流
				FileInputStream fin = new FileInputStream(filename); // filename是文件全路径
				TarEntry tarEn = new TarEntry(files[i]); // 此处必须使用new
															// TarEntry(File
															// file);
				tarEn.setName(files[i].getName()); // 此处需重置名称，默认是带全路径的，否则打包后会带全路径

				tout.putNextEntry(tarEn);
				int num;
				while ((num = fin.read(buf)) != -1) {
					tout.write(buf, 0, num);
				}
				tout.closeEntry();
				fin.close();
			}

			// 建立压缩文件输出流
			gzFile = new FileOutputStream(targzipFilePath + ".gz");
			// 建立gzip压缩输出流
			gzout = new GZIPOutputStream(gzFile);
			// 打开需压缩文件作为文件输入流
			tarin = new FileInputStream(targzipFilePath);
			int len;
			while ((len = tarin.read(buf)) != -1) {
				gzout.write(buf, 0, len);
			}

		} finally {
			if (tout != null)
				tout.close();

			if (fout != null)
				fout.close();

			if (gzFile != null)
				gzFile.close();
			if (tarin != null)
				tarin.close();
			if (gzout != null)
				gzout.close();
		}
	}

	/*
	 * 压缩文件
	 */
	public static void zip(String inputFilename, String zipFilename) throws IOException {
		zip(new File(inputFilename), zipFilename);
	}

	public static void zip(File inputFile, String zipFilename) throws IOException {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFilename));

		try {
			zip(inputFile, out, "");
		} catch (IOException e) {
			throw e;
		} finally {
			out.close();
		}
	}

	/** 将所有的文件打包，最后返回打包文件 */
	public static File zip(List<String> fList, String zipFilename) throws IOException {
		File f = new File(zipFilename);
		ZipOutputStream out = null;
		try {
			out = new ZipOutputStream(new FileOutputStream(f));
			// out.setEncoding(encode);
			zip(fList, out);
			out.flush();
		} finally {
			if (out != null)
				out.close();
		}
		return f;
	}

	/**
	 * 压缩一个文件夹或文件对象到已经打开的zip输出流 <b>不建议直接调用该方法</b>
	 * 
	 * @param zos
	 * @param f
	 * @param fileName
	 * @throws Exception
	 */
	public void compress(ZipOutputStream zos, File f, String fileName) throws Exception {
		if (f.isDirectory()) {
			// 压缩文件夹
			File[] fl = f.listFiles();
			zos.putNextEntry(new ZipEntry(fileName + "/"));
			fileName = fileName.length() == 0 ? "" : fileName + "/";
			for (int i = 0; i < fl.length; i++) {
				compress(zos, fl[i], fileName + fl[i].getName());
			}
		} else {
			// 压缩文件
			zos.putNextEntry(new ZipEntry(fileName));
			FileInputStream fis = new FileInputStream(f);
			this.inStream2outStream(fis, zos);
			fis.close();
			zos.closeEntry();
		}
	}

	private void inStream2outStream(InputStream is, OutputStream os) throws IOException {
		BufferedInputStream bis = new BufferedInputStream(is);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		int bytesRead = 0;
		for (byte[] buffer = new byte[BUFFEREDSIZE]; ((bytesRead = bis.read(buffer, 0, BUFFEREDSIZE)) != -1);) {
			bos.write(buffer, 0, bytesRead); // 将流写入
		}
	}

	public static void zip(List<String> fileList, ZipOutputStream out) throws IOException {

		if (fileList == null)
			return;
		for (String fName : fileList) {
			zip(new File(fName), out, "");
		}

	}

	private static void zip(File inputFile, ZipOutputStream out, String base) throws IOException {
		if (inputFile.isDirectory()) {
			File[] inputFiles = inputFile.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < inputFiles.length; i++) {
				zip(inputFiles[i], out, base + inputFiles[i].getName());
			}
		} else {
			if (base.length() > 0) {
				out.putNextEntry(new ZipEntry(base));
			} else {
				out.putNextEntry(new ZipEntry(inputFile.getName()));
			}
			FileInputStream in = new FileInputStream(inputFile);
			try {
				int c;
				byte[] by = new byte[BUFFEREDSIZE];
				while ((c = in.read(by)) != -1) {
					out.write(by, 0, c);
				}
			} finally {
				in.close();
			}
		}
	}

	/**
	 * 解压缩文件
	 * 
	 * @param zipFilename
	 *            zip文件名
	 * @param outputDirectory
	 *            解压到某个目录
	 * @throws IOException
	 */
	public static void unzip(String zipFilename, String outputDirectory) throws IOException {
		File outFile = new File(outputDirectory);
		if (!outFile.exists()) {
			outFile.mkdirs();
		}

		ZipFile zipFile = new ZipFile(zipFilename);
		@SuppressWarnings("rawtypes")
		Enumeration en = zipFile.getEntries();
		ZipEntry zipEntry = null;
		while (en.hasMoreElements()) {
			zipEntry = (ZipEntry) en.nextElement();
			if (zipEntry.isDirectory()) {
				String dirName = zipEntry.getName();
				dirName = dirName.substring(0, dirName.length() - 1);

				File f = new File(outFile.getPath() + File.separator + dirName);
				f.mkdirs();

			} else {
				// unzip file
				File f = new File(outFile.getPath() + File.separator + zipEntry.getName());
				f.createNewFile();
				InputStream in = zipFile.getInputStream(zipEntry);
				FileOutputStream out = new FileOutputStream(f);
				try {
					int c;
					byte[] by = new byte[BUFFEREDSIZE];
					while ((c = in.read(by)) != -1) {
						out.write(by, 0, c);
					}
				} catch (IOException e) {
					throw e;
				} finally {
					if (out != null) {
						out.flush();
						if (in != null)
							in.close();
						out.close();
					}

				}
			}
		}
	}

	// public static void main(String[] args)
	// {
	// // String[] sources = new String[] { "C:\\test\\liuwx.zip",
	// "C:\\test\\result.txt" };
	// // String target = new String("C:\\test\\result100.rar");
	// // try
	// // {
	// // pack(sources, target);
	// // }
	// // catch (Exception e)
	// // {
	// // e.printStackTrace();
	// // }
	// CompressedFiles_Gzip("C:\\cygwin\\test","C:\\cygwin\\aa.gz",null);
	// }
	public static void main(String[] args) throws IOException {
		// // 做准备压缩一个字符文件，注，这里的字符文件要是GBK编码方式的
		// BufferedReader in = new BufferedReader(new InputStreamReader(new
		// FileInputStream(
		// "C:\\数据源为3的120110516125700.xls"), "GBK"));
		// // 使用GZIPOutputStream包装OutputStream流，使其具体压缩特性，最后会生成test.txt.gz压缩包
		// // 并且里面有一个名为test.txt的文件
		// BufferedOutputStream out = new BufferedOutputStream(new
		// GZIPOutputStream(new FileOutputStream(
		// "C:\\数据源为3的120110516125700.xls.gz")));
		// System.out.println("开始写压缩文件...");
		// int c;
		// while ((c = in.read()) != -1)
		// {
		//
		// /*
		// * 注，这里是压缩一个字符文件，前面是以字符流来读的，不能直接存入c，因为c已是Unicode
		// 码，这样会丢掉信息的（当然本身编码格式就不对），所以这里要以GBK来解后再存入。
		// */
		// out.write(String.valueOf((char) c).getBytes("GBK"));
		// }
		// in.close();
		// out.close();

		// List<String> a = new ArrayList<String>();
		// a.add("C:\\a.txt");
		// a.add("C:\\a\\b.txt");
		// String ss[] = {"/home/win/app/ftp_dir/a.sh"
		//
		// };

//		try {
//			List<String> a = new ArrayList<String>();
//			a.add("/home/win/log/好人/文件.txt");
//
//			// Packer.zip(a, "/home/win/log/好人/文件.zip");
//		} catch (Exception e) {
//			e.printStackTrace(System.out);
//		}
//
//		String ss[] = {"C:\\Users\\Admin\\Desktop\\test\\2014082418_在线问题收集_导出数据表.xlsx"
//
//		};
//
//		// String tools = "C:\\Program Files\\7-Zip\\7z.exe";
//
//		try {
//			Packer.pack(Arrays.asList(ss), "C:\\Users\\Admin\\Desktop\\test\\test.tar.gz");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String dir = "C:\\Users\\Admin\\Desktop\\hb_log\\gansu\\100001_R2UtranHardHandoverCells_14Oct2015_1700-14Oct2015_1800.csv"; 
		String  fileName ="C:\\Users\\Admin\\Downloads\\a\\b\\HW_PM_20160321.1000+0800-1100+0800_G0207-R1\\A20160321.1000+0800-1100+0800_LBBU08291聚贤国际&东海航运大厦.xml";
//		Packer.unzip(dir+fileName, dir);
		String  packageName ="C:\\Users\\Admin\\Downloads\\a\\b\\HW_PM_20160321.1000+0800-1100+0800_G0207-R1\\1.tar.gz";
//        List<String>  fileList  =new ArrayList<String> ();
//        fileList.add(fileName);
//		try {
//			Packer.pack(fileList, packageName);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		
		
	}
}
