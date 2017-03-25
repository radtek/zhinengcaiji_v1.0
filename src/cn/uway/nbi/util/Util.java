package cn.uway.nbi.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.text.ParseException;

import org.nfunk.jep.JEP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;

/**
 * @author liuwx May 19, 2011
 */
public class Util {

	private static Logger LOG = LoggerFactory.getLogger(Util.class);

	/** 判断是否为windows操作系统 */
	public static boolean isWindows() {
		boolean bReturn = false;

		String os = System.getProperties().getProperty("os.name").toLowerCase();
		if (os == null && "".equals(os))
			return true;

		if (os.indexOf("window") >= 0) {
			bReturn = true;
		}

		return bReturn;
	}
	
	/**  针对 String 对象，  判段对象是否为空。为空返回空 字符串 */
	public static String objecTrimNull(Object a) {
	 
	 
		if (a==null  ){
			return "";
		}else{
			return a.toString().trim();
		}
			 

	 
 
	}

	/**
	 * 去掉打包文件的后缀名 例如a.txt.zip ->返回 a.txt
	 * 
	 * @param destFilePath
	 *            带打包后缀名的文件名
	 * @return
	 */
	public static String filterPackageExt(String destFilePath) {
		String path = destFilePath;
		if (path.endsWith(".TAR.GZ") || path.endsWith(".tar.gz")) {
			int index = path.lastIndexOf(".TAR.GZ");
			if (index == -1)
				index = path.lastIndexOf(".tar.gz");
			path = path.substring(0, index);
		} else if (path.endsWith(".GZ") || path.endsWith(".gz")) {
			int index = path.lastIndexOf(".GZ");
			if (index == -1)
				index = path.lastIndexOf(".gz");
			path = path.substring(0, index);
		} else if (path.endsWith(".ZIP") || path.endsWith(".zip")) {
			int index = path.lastIndexOf(".ZIP");
			if (index == -1)
				index = path.lastIndexOf(".zip");
			path = path.substring(0, index);
		}
		return path;
	}

	/**
	 * 是否是压缩文件
	 * 
	 * @param destFilePath
	 *            文件名
	 * @return
	 */
	public static boolean isPackageExt(String destFilePath) {
		String path = destFilePath;
		boolean b = false;
		if (path.endsWith(".TAR.GZ") || path.endsWith(".tar.gz")) {
			b = true;
		} else if (path.endsWith(".GZ") || path.endsWith(".gz")) {
			b = true;
		} else if (path.endsWith(".ZIP") || path.endsWith(".zip")) {
			b = true;
		}
		return b;
	}

	/**
	 * 取得文件后缀
	 * 
	 * @param destFilePath
	 *            文件名
	 * @return
	 */
	public static String getPackageExt(String destFilePath) {
		String path = destFilePath;
		String ext = null;
		if (path.endsWith(".TAR.GZ") || path.endsWith(".tar.gz")) {
			ext = ".tar.gz";
		} else if (path.endsWith(".GZ") || path.endsWith(".gz")) {
			ext = ".gz";
		} else if (path.endsWith(".ZIP") || path.endsWith(".zip")) {
			ext = ".zip";
		}
		return ext;
	}

	// 计算两个经纬度间的距离
	public static double rad(double d) {
		return d * Math.PI / 180.0;
	}

	/** 执行外部命令 */
	public static int execExternalCmd(String cmd) throws Exception {
		ExternalCmd externalCmd = new ExternalCmd();

		return externalCmd.execute(cmd);
	}

	public static Timestamp getDate(String d) {
		try {
			return new Timestamp(DateUtil.getDate(d).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}// /** 计算字符串表达式的值 ，比如 字符串"1+2" 计算后为3 */

	public static int parseExpression(String str) {
		JEP myParser = new JEP();

		myParser.parseExpression(str);

		return (int) myParser.getValue();
	}

	/** 获取本地计算机名 */
	public static String getHostName() {
		String strHostName = null;
		String pidtmp = "";
		String pid = SysCfg.getInstance().getHostPid();
		if (StringUtil.isNotNull(pid))
			pidtmp = "@" + pid;

		try {
			strHostName = InetAddress.getLocalHost().getHostName() + pidtmp;
		} catch (UnknownHostException e) {
		}
		return strHostName;
	}

	/**
	 * @Explain crc32加密
	 * @Date 2012-5-9 下午3:19:07
	 * @author yinhl
	 * @method getCRC32
	 * @param 输入参数
	 * @return String
	 * @Exception 抛出的异常
	 */
	public static String getCRC32(File file) {
		FileInputStream in = null;
		java.util.zip.CRC32 crc32 = new java.util.zip.CRC32();
		String s = null;
		try {
			in = new FileInputStream(file);
			byte[] bs = new byte[1024];
			int ret = -1;
			while ((ret = in.read(bs)) > -1) {
				crc32.update(bs, 0, ret);
			}

			s = Long.toHexString(crc32.getValue()).toUpperCase();
		} catch (Exception e) {
			LOG.debug("{}文件CRC32加密失败!", file.getName(), e);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
		}
		return s;
	}

	/**
	 * @Explain MD5或者SHA1加密
	 * @Date 2012-5-9 下午4:53:52
	 * @author yinhl
	 * @method getSHA1OrMD5
	 * @param 输入参数
	 * @return String
	 * @Exception 抛出的异常
	 */
	public static String getSHA1OrMD5(File file, String encName) {
		java.security.MessageDigest md = null;
		FileInputStream in = null;
		String s = null;
		try {
			if (encName == null) {
				encName = "MD5";
			}
			md = MessageDigest.getInstance(encName);
			in = new FileInputStream(file);
			byte[] bs = new byte[1024];
			int ret = -1;
			while ((ret = in.read(bs)) > -1) {
				md.update(bs, 0, ret);
			}
			s = bytes2Hex(md.digest()).toUpperCase(); // to HexString
		} catch (Exception e) {
			LOG.debug("{}文件" + encName + "加密失败!", file.getName(), e);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
		}
		return s;
	}

	private static String bytes2Hex(byte[] bts) {
		String des = "";
		String tmp = null;
		for (int i = 0; i < bts.length; i++) {
			tmp = (Integer.toHexString(bts[i] & 0xFF));
			if (tmp.length() == 1) {
				des += "0";
			}
			des += tmp;
		}
		return des;
	}

	public static boolean isNullOrEmplet(String input) {
		if (null == input || "".equals(input.trim()))
			return true;
		return false;
	}

	 /** *//**文件重命名 
	    * @param path 文件目录 
	    * @param oldname  原来的文件名 
	    * @param newname 新文件名 
	 * @throws Exception 
	    */ 
	    public static boolean renameFile(String path,String oldname,String newname) throws Exception{
	       boolean returnValue=false;
	       try{
	    	if(!oldname.equals(newname)){//新的文件名和以前文件名不同时,才有必要进行重命名 
	            File oldfile=new File(path+oldname); 
	            File newfile=new File(path+"/"+newname); 
	            if(!oldfile.exists()){
	                return returnValue;//重命名文件不存在
	            }
	            if(newfile.exists())//若在该目录下已经有一个文件和新文件名相同，则不允许重命名 
	                System.out.println(newname+"已经存在！"); 
	            else{ 
	                oldfile.renameTo(newfile); 
	                returnValue=true;
	            } 
	        }else{
	           // System.out.println("新文件名和旧文件名相同...");
	        	returnValue=true;
	        }
	       }catch(Exception e){
	    	   returnValue=false;
	    	   throw e;
	       }
	       
	       return  returnValue;
	    }
	    
	public static void main(String[] args) {
//		File file = new File("E:/ftp_root/GZ/PERF/wypt_201204_bts.txt");
//		System.out.println(Util.getCRC32(file));
//		System.out.println(Util.getSHA1OrMD5(file, "MD5"));
//		System.out.println(Util.getSHA1OrMD5(file, "SHA-1"));
		
		System.out.println(Double.valueOf(""));
	}
}
