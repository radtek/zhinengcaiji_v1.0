package cn.uway.nbi.dxsheet3.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.dxsheet3.db.dao.SheetDeclareParameter;

/**
 * 序列化磁盘
 * 
 * @author Administrator
 */
public class SerializeDiskFile {

	private static Logger log = LoggerFactory.getLogger(SerializeDiskFile.class);

	private static SerializeDiskFile serialize;

	private final String nbipath = System.getProperty("eoms_nbidata_path", "./nbi_data");

	public static SerializeDiskFile getInstance() {
		if (serialize == null) {
			serialize = new SerializeDiskFile();
		}
		return serialize;
	}

	public void initNbiFilePath() {
		File filepath = new File(nbipath);
		if (!filepath.isDirectory()) {
			filepath.mkdirs();
		}
	}

	/**
	 * 序列化文件
	 * 
	 * @param o
	 * @param filename
	 */
	public void saveSerialize(Object o, String filename) {
		FileOutputStream fos = null;
		ObjectOutputStream oos = null;
		try {
			fos = new FileOutputStream(nbipath + File.separatorChar + filename);
			oos = new ObjectOutputStream(fos);

			oos.writeObject(o);
			oos.flush();
		} catch (Exception e) {
			log.error("序列化文件{}失败.", filename, e);
		} finally {
			if (oos != null) {
				try {
					oos.close();
				} catch (IOException e) {
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
				}
			}
		}
	}

	/**
	 * 反序列化文件
	 * 
	 * @param filename
	 * @return
	 */
	public Object readSerialize(String filename) {
		Object o = null;
		String path = nbipath + File.separatorChar + filename;
		File file = new File(path);
		if (!file.isFile()) {
			return o;
		}

		FileInputStream fis = null;
		ObjectInputStream ois = null;
		try {
			fis = new FileInputStream(path);
			ois = new ObjectInputStream(fis);
			o = ois.readObject();
		} catch (Exception e) {
			log.error("反序列化文件{}失败.", filename, e);
		} finally {
			if (ois != null) {
				try {
					ois.close();
				} catch (IOException e) {
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
				}
			}
		}

		return o;
	}

	public static void main(String[] args) {
		SheetDeclareParameter p = new SheetDeclareParameter();
		p.dCreateTime = "2012-12-15";
		p.endState = "更新";
		p.faultCode = "EW-sdfasjdflasjdfl";
		p.mark = "7";
		p.orderid = "654644676461346764968763";
		p.shelfLife = "shelfLife + 1";

		SerializeDiskFile.getInstance().initNbiFilePath();
		// SerializeDiskFile.getInstance().saveSerialize(p, "ceshis");
		// System.out.println(SerializeDiskFile.getInstance().readSerialize("ceshis"));

		System.out.println(SerializeDiskFile.getInstance().readSerialize("eoms_mapfault_starttime"));
	}

}
