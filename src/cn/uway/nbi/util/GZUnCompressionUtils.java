package cn.uway.nbi.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;
import org.apache.commons.compress.compressors.gzip.GzipCompressorInputStream;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * gz解压缩
 * 
 * @author liuwx 2013-8-23
 */
public class GZUnCompressionUtils {

	protected static Logger LOG = LoggerFactory.getLogger(GZUnCompressionUtils.class);

	private static final int buffersize = 8048;

	public static void main(String[] args) {
		String file = "C:\\Users\\Admin\\Downloads\\HW_PM_20160315.0700+0800-0800+0800_G0207-R1.tar.gz";
		String destDir = "C:\\Users\\Admin\\Downloads\\a";

		GZUnCompressionUtils o = new GZUnCompressionUtils();

		/*
		 * File f = o.deCompressTGZFile(file, destDir); o.deCompressTARFile(f);
		 */

		o.deCompressTAR_GZFile(file, destDir);
	}

	public List<String> deCompressTAR_GZFile(String srcFile, String destDir) {
		File f = deCompressTGZFile(srcFile, destDir);
		List<String> result = new ArrayList<String>();
		result = deCompressTARFile(f);

		return result;
	}

	public File deCompressTGZFile(String srcFile, String destDir) {
		return deCompressGZFile(new File(srcFile), destDir);
	}

	private File deCompressGZFile(File file, String destDir) {
		FileOutputStream out = null;
		GzipCompressorInputStream gzIn = null;
		try {
			FileInputStream fin = new FileInputStream(file);
			BufferedInputStream in = new BufferedInputStream(fin);
			File outFile = new File(destDir + File.separator + file.getName() + "_tmp.tar");
			out = new FileOutputStream(outFile);
			gzIn = new GzipCompressorInputStream(in);
			final byte[] buffer = new byte[buffersize];
			int n = 0;
			while (-1 != (n = gzIn.read(buffer))) {
				out.write(buffer, 0, n);
			}
			return outFile;
		} catch (Exception e) {
			LOG.error("解压缩失败,原因={}", e);
			return null;
		} finally {
			IOUtils.closeQuietly(out);
			IOUtils.closeQuietly(gzIn);
		}
	}

	private List<String> deCompressTARFile(File file) {
		List<String> result = new ArrayList<String>();

		String basePath = file.getParent() + File.separator;
		TarArchiveInputStream is = null;
		try {
			is = new TarArchiveInputStream(new FileInputStream(file));
			while (true) {
				TarArchiveEntry entry = is.getNextTarEntry();
				
				if (entry == null) {
					break;
				}
				if (entry.isDirectory()) {// 这里貌似不会运行到，跟ZipEntry有点不一样
					new File(basePath + entry.getName()).mkdirs();
				} else {
					FileOutputStream os = null;
					try {
						File f = new File(basePath + entry.getName());
						if (!f.getParentFile().exists()) {
							f.getParentFile().mkdirs();
						}
						if (!f.exists()) {
							f.createNewFile();
						}
						if (f.exists())
							result.add(f.getAbsolutePath());
						os = new FileOutputStream(f);
						byte[] bs = new byte[buffersize];
						int len = -1;
						while ((len = is.read(bs)) != -1) {
							os.write(bs, 0, len);
						}
						os.flush();
					} catch (Exception e) {
						LOG.error("解压缩文件失败,原因={}", e);
					} finally {
						if (os != null)
							os.close();
					}
				}
			}
		} catch (Exception e) {
			LOG.error("解压缩失败,原因={}", e);
		} finally {
			IOUtils.closeQuietly(is);
			file.deleteOnExit();
		}
		return result;
	}
}
