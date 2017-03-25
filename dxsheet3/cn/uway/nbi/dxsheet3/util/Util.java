package cn.uway.nbi.dxsheet3.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.Reader;
import java.io.Writer;
import java.net.InetAddress;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Util {

	private static Logger logger = LoggerFactory.getLogger(Util.class);

	public static String buildFileName(String name) {
		String fileName = "";
		if (name != null && name.lastIndexOf(".") != -1) {
			fileName = name.substring(0, name.lastIndexOf(".") - 1);
		} else {
			fileName = name;
		}

		fileName = fileName + "_" + getDateStr() + ".xml";

		return fileName;
	}

	public static String getDateStr() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(new Date());
	}

	public static boolean writerMessage(String mge, File file) {
		Writer writer = null;
		try {
			File teseFile = file.getParentFile();
			if (!teseFile.exists()) {
				teseFile.mkdir();
			}
			writer = new FileWriter(file);
			if (mge != null) {
				writer.write(mge);
			}
			writer.close();
		} catch (Exception e) {
			logger.error("消息：" + mge + "，写入文件：" + file.getPath() + "失败。exception：" + e.getMessage(), e);
			IOUtils.closeQuietly(writer);
			return false;
		}
		return true;
	}

	public static String ReaderMessage(File file) {
		StringBuffer strBuff = new StringBuffer();
		try {
			Reader reader = new FileReader(file);
			BufferedReader buffread = new BufferedReader(reader);

			String str;
			while ((str = buffread.readLine()) != null) {
				strBuff.append(str);
			}
			buffread.close();
			reader.close();
		} catch (Exception e) {
			logger.error("加载本地缓存文件[" + file.getPath() + "]失败。exception：" + e.getMessage(), e);
			return null;
		}
		return strBuff.toString();
	}

	/**
	 * 加密字段
	 * 
	 * @param filed
	 * @return
	 */
	public static String getMd5Encrypt(String filed) {
		java.security.MessageDigest md = null;
		if (filed != null) {
			try {
				md = MessageDigest.getInstance("MD5");
				byte[] bs = filed.getBytes();
				md.update(bs);
				filed = bytes2Hex(md.digest()).toUpperCase();
			} catch (NoSuchAlgorithmException e) {
			}
		}
		return filed;
	}

	/**
	 * 加密文件MD5
	 * 
	 * @param file
	 * @param encName
	 * @return
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
		} finally {
			IOUtils.closeQuietly(in);
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

	/**
	 * @return 本机IP
	 */
	public static String getRealIp() {
		String localip = null;// 本地IP，如果没有配置外网IP则返回它
		// String netip = null;// 外网IP
		try {
			// Enumeration<NetworkInterface> netInterfaces =
			// NetworkInterface.getNetworkInterfaces();
			// InetAddress ip = null;
			// boolean finded = false;// 是否找到外网IP
			// while (netInterfaces.hasMoreElements() && !finded)
			// {
			// NetworkInterface ni = netInterfaces.nextElement();
			// Enumeration<InetAddress> address = ni.getInetAddresses();
			// while (address.hasMoreElements())
			// {
			// ip = address.nextElement();
			// if ( !ip.isSiteLocalAddress() && !ip.isLoopbackAddress() &&
			// ip.getHostAddress().indexOf(":") == -1 )
			// {// 外网IP
			// netip = ip.getHostAddress();
			// finded = true;
			// break;
			//
			// }
			// else if ( ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
			// && ip.getHostAddress().indexOf(":") == -1 )
			// {// 内网IP
			// localip = ip.getHostAddress();
			// }
			// }
			// }
			InetAddress inet = InetAddress.getLocalHost();
			localip = inet.getHostAddress();

		} catch (Exception e) {
		}
		// if ( netip != null && !"".equals(netip) )
		// {
		// return netip;
		// }
		// else
		// {
		return localip;
		// }
	}

	public static void main(String[] args) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(df.format(new Date()));

		System.out.println(getMd5Encrypt("eoms_uway_op"));

		System.out.println(getMd5Encrypt("1132.96.10.70NetOp"));

		InetAddress inet = InetAddress.getLocalHost();
		System.out.println("本机的ip=" + inet.getHostAddress());

		System.out.println("本机的ip=" + getRealIp());
		// return inet;

	}
}
