package cn.uway.webservice.perfservice.store;

/**   
 * @Description: 文件、文件夹的创建、写入练习。读写是使用对象流实现。
 * @version V1.0   
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.RandomAccessFile;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.framework.util.StringUtil;

public class FileCacheStore implements Store {

	private static final Logger log = LoggerFactory.getLogger(FileCacheStore.class);

	protected ReentrantLock lock = new ReentrantLock();

	protected RandomAccessFile dataFile = null;

	protected RandomAccessFile indexFile = null;

	/*
	 * protected InputStream dataFile = null; protected FileInputStream indexFile = null;
	 */

	private StoreParameter storePara;

	private String[] headArr;

	private Map<String, Integer> headIndexMap;

	// public static void main2(String[] args) {
	// //217
	// StoreParameter trstorePara = new StoreParameter();
	//
	// trstorePara.indexFile="F:\\test\\a\\a_2.index";
	// trstorePara.dataFile ="F:\\test\\a\\a_2.data";
	// FileCacheStore trstore = new FileCacheStore(trstorePara);
	// long begin = System.currentTimeMillis();
	//
	// for(int i =0 ; i< 1000000; i++){
	// Map<String,Integer> line =new HashMap<String,Integer> ();
	//
	// for( int j =0; j< 200; j++){
	// line.put(""+j,j);
	// }
	// trstore.addElement(""+i, line, null);
	// }
	// trstore.storeIndexFile();
	//
	// long end = System.currentTimeMillis();
	//
	// System.out.println((end-begin)/1000);
	//
	//
	// Iterator<Entry<String, IndexElement>> it = trstore.IndexElementMap.indexMap.entrySet().iterator();
	//
	// while(it.hasNext()){
	// Entry<String, IndexElement> en = it.next();
	// IndexElement ele= en.getValue();
	//
	// Map<String,Integer> val=(Map<String,Integer>) trstore.getElement(ele);
	// }
	//
	//
	// }

	public String[] getHeadArr() {
		return headArr;
	}

	public void setHeadArr(String[] headArr) {
		this.headArr = headArr;
	}

	public Map<String, Integer> getHeadIndexMap() {
		return headIndexMap;
	}

	public void setHeadIndexMap(Map<String, Integer> headIndexMap) {
		this.headIndexMap = headIndexMap;
	}

	public static void main(String[] args) {
		StoreParameter trstorePara = new StoreParameter();

		trstorePara.indexFile = "F:\\test\\a\\a_3.index";
		trstorePara.dataFile = "F:\\test\\a\\a_3.data";
		FileCacheStore trstore = new FileCacheStore(trstorePara);
		long begin = System.currentTimeMillis();

		String[] headArr = new String[200];
		for (int j = 0; j < 200; j++) {
			headArr[j] = "" + j;
		}

		for (int i = 0; i < 1000000; i++) {

			String[] valArr = new String[200];
			for (int j = 0; j < 200; j++) {
				valArr[j] = "" + j;
			}
			trstore.addElement("" + i, valArr, null, headArr);
		}
		trstore.storeIndexFile();

		long end = System.currentTimeMillis();

		System.out.println((end - begin) / 1000);

		Iterator<Entry<String, IndexElement>> it = trstore.IndexElementMap.indexMap.entrySet().iterator();

		while (it.hasNext()) {
			Entry<String, IndexElement> en = it.next();
			IndexElement ele = en.getValue();

			String[] val = (String[]) trstore.getElement(ele);
		}

	}

	// public static void main0(String[] args) {
	// StoreParameter storePara = new StoreParameter();
	// //String sss = "D:\\uwaysoft\\change_analysis\\data\\PARA_ZTEV3_3G_HO_CONTROL_20120102.index";
	// String sss = "F:\\test\\tmp\\114011_NBI_PERF_SPESCENE_1X_20140727000000_trid_1_tdid_1.index";
	//
	// String df = "F:\\test\\tmp\\114011_NBI_PERF_SPESCENE_1X_20140727000000_trid_1_tdid_1.data";
	//
	//
	//
	// storePara.indexFile = sss;
	// storePara.dataFile = df;
	// FileCacheStore s = new FileCacheStore(storePara);
	// IndexElementMap m = s.reLoaderIndexFileData(sss);
	// System.out.println("ss " + m.indexMap.size());
	// Iterator<Entry<String, IndexElement>> it = m.indexMap.entrySet().iterator();
	//
	// Iterator<Entry<String, IndexElement>> it2 = m.indexMap.entrySet().iterator();
	//
	// Map<String, IndexElement> m2=m.indexMap;
	//
	// StoreParameter trstorePara = new StoreParameter();
	//
	// trstorePara.indexFile="F:\\test\\a\\a_2.index";
	// trstorePara.dataFile ="F:\\test\\a\\a_2.data";
	// FileCacheStore trstore = new FileCacheStore(trstorePara);
	//
	// File indexFile = new File(trstorePara.indexFile);
	// File dataFile = new File(trstorePara.dataFile);
	//
	//
	// long begin =System.currentTimeMillis();
	// while(it.hasNext()){
	// Entry<String, IndexElement> en= it.next();
	// String key =en.getKey();
	// IndexElement element = en.getValue();
	// Map<String,String> map =(Map<String,String> )s.getElement(element);
	// // Set<Entry<String, String>> set =map.entrySet();
	//
	//
	// IndexElement e2= m2.get(key);
	// Map<String,String> map2 =(Map<String,String> )s.getElement(e2);
	// Map<String, String> newRow = new HashMap<String, String>();
	//
	// newRow.putAll(map);
	// newRow.putAll(map2);
	// trstore.addElement(key, newRow, null);
	// //
	// //
	// // for(Entry<String, String> v: map.entrySet()) {
	// // v.getKey();
	// // v.getValue();
	// // }
	// //
	// // for(Entry<String, String> v: map2.entrySet()) {
	// // v.getKey();
	// // v.getValue();
	// // }
	// //
	// }
	//
	// trstore.storeIndexFile();
	//
	// if (trstore != null)
	// trstore.close();
	//
	//
	// long end =System.currentTimeMillis();
	//
	// System.out.println((end-begin)/1000);
	//
	// /*
	// * long begin = System.currentTimeMillis(); FileCacheStore rr = new
	// * FileCacheStore();
	// *
	// * for (int i = 0; i < 480000; i++) { String key = "" + i;
	// *
	// * LineInfo line = new LineInfo(); line.keyDataList = key + "jjj";
	// *
	// * rr.addElement(key, line); } for (int i = 0; i < 480000; i++) {
	// * LineInfo line = (LineInfo) rr.getElement("" + i); //
	// * System.out.println(line.keyDataList); }
	// *
	// * long end = System.currentTimeMillis(); System.out.println((end -
	// * begin) / 1000);
	// */
	//
	// }

	/*
	 * private String dirPath; private String filename;
	 */

	private boolean isCurrDataStore = true;

	public IndexElementMap IndexElementMap = new IndexElementMap();

	public long currPosition = 0;

	public FileCacheStore() {
		// init();
	}

	public StoreParameter getStorePara() {
		return storePara;
	}

	public void setStorePara(StoreParameter storePara) {
		this.storePara = storePara;
	}

	public boolean isCurrDataStore() {
		return isCurrDataStore;
	}

	public void setCurrDataStore(boolean isCurrDataStore) {
		this.isCurrDataStore = isCurrDataStore;
	}

	public FileCacheStore(StoreParameter storePara) {
		this.storePara = storePara;
		init();
	}

	public void init() {
		try {
			createFile(storePara.dataFile);
			createFile(storePara.indexFile);
			createIndexDataFile();
		} catch (FileNotFoundException e) {
			log.error("索引文件或数据文件失败不存在,原因={}", e);
		} catch (Exception e) {
			log.error("创建索引文件或数据文件失败,原因={}", e);
		}
	}

	public void createIndexDataFile() {
		try {
			dataFile = new RandomAccessFile(storePara.dataFile, "rw");
			indexFile = new RandomAccessFile(storePara.indexFile, "rw");

		} catch (FileNotFoundException e) {
			log.error("索引文件或数据文件失败不存在,原因={}", e);
		} catch (Exception e) {
			log.error("创建索引文件或数据文件失败,原因={}", e);
		}
	}

	public IndexElementMap getIndexMap() {
		return IndexElementMap;
	}

	public void setIndexMap(IndexElementMap IndexElementMap) {
		this.IndexElementMap = IndexElementMap;
	}

	public void createFile(String file) throws IOException {
		File f = new File(file);
		if (!f.exists()) {
			File dir = f.getParentFile();
			if (!dir.exists())
				dir.mkdirs();
		}
		if (!f.exists()) {
			f.createNewFile();
		}
	}

	public void storeIndexFile() {
		ByteArrayOutputStream byteOut = null;
		ObjectOutputStream objOut = null;
		try {
			byteOut = new ByteArrayOutputStream();
			objOut = new ObjectOutputStream(byteOut);
			objOut.writeObject(IndexElementMap);
			objOut.flush();
			byte[] bs = byteOut.toByteArray();

			indexFile.write(bs);
		} catch (Exception e) {
			log.error("创建索引文件或数据文件失败storeIndexFile,原因={}", e);
		}
	}

	public IndexElementMap reLoaderIndexFileData() {
		if (this.storePara != null && StringUtil.isNotEmpty(this.storePara.indexFile)) {
			File indexFile = new File(this.storePara.indexFile);
			if (indexFile.exists()) {
				return this.reLoaderIndexFileData(indexFile.getAbsolutePath());
			}
		}

		return null;

	}

	public IndexElementMap reLoaderIndexFileData(String indexFile) {
		lock.lock();
		ByteArrayInputStream bIn = null;
		ObjectInputStream objIn = null;

		FileInputStream ins = null;
		try {
			File file = new File(indexFile);
			int len = (int) file.length();
			byte[] bs = new byte[len];

			ins = new FileInputStream(file);
			ins.read(bs);

			bIn = new ByteArrayInputStream(bs);
			objIn = new ObjectInputStream(bIn);
			Object obj = objIn.readObject();

			IndexElementMap = (IndexElementMap) obj;

			return IndexElementMap;
		} catch (Exception e) {
			log.error("索引文件载入失败storeIndexFile,原因={}", e);
		} finally {
			IOUtils.closeQuietly(bIn);
			IOUtils.closeQuietly(objIn);
			IOUtils.closeQuietly(ins);
			lock.unlock();
		}
		return null;
	}

	public boolean addElement(String key, Object element, String groupKey, String[] headArr) {
		lock.lock();
		ByteArrayOutputStream byteOut = null;
		ObjectOutputStream objOut = null;
		try {
			byteOut = new ByteArrayOutputStream();
			objOut = new ObjectOutputStream(byteOut);
			objOut.writeObject(element);
			objOut.flush();
			byte[] bs = byteOut.toByteArray();
			long len = bs.length;

			dataFile.write(bs);

			IndexElement indexElement = new IndexElement();
			indexElement.beginPos = currPosition;

			currPosition = currPosition + len;

			indexElement.endPos = currPosition;
			IndexElementMap.indexMap.put(key, indexElement);

			if (StringUtils.isNotEmpty(groupKey)) {
				if (IndexElementMap.indexGroupMap.containsKey(groupKey)) {
					IndexElementMap.indexGroupMap.get(groupKey).put(key, indexElement);
				} else {
					Map<String, IndexElement> groupDataMap = new HashMap<String, IndexElement>();
					groupDataMap.put(key, indexElement);
					IndexElementMap.indexGroupMap.put(groupKey, groupDataMap);
				}
			}

			return true;
		} catch (IOException e) {
			log.error("序列化文件失败", e);

			return false;
		} finally {
			IOUtils.closeQuietly(byteOut);
			IOUtils.closeQuietly(objOut);
			lock.unlock();
		}
	}

	public Object getElement(IndexElement indexElement) {
		lock.lock();
		ByteArrayInputStream bIn = null;
		ObjectInputStream objIn = null;

		try {
			if (indexElement == null)
				return null;
			int size = (int) (indexElement.endPos - indexElement.beginPos);
			byte[] bs = new byte[size];

			dataFile.seek(indexElement.beginPos);

			dataFile.read(bs);

			bIn = new ByteArrayInputStream(bs);
			objIn = new ObjectInputStream(bIn);
			Object obj = objIn.readObject();

			return obj;
		} catch (Exception e) {
			log.error("从文件反序列化Element失败", e);
		} finally {
			IOUtils.closeQuietly(bIn);
			IOUtils.closeQuietly(objIn);
			lock.unlock();
		}
		return null;
	}

	/*
	 * public Object getElement(String key) { ByteArrayInputStream bIn = null; ObjectInputStream objIn = null; lock.lock(); try { IndexElement
	 * indexElement = IndexElementMap.indexMap.get(key); if (indexElement == null) return null; int size = (int) (indexElement.endPos -
	 * indexElement.beginPos); byte[] bs = new byte[size];
	 * 
	 * dataFile.seek(indexElement.beginPos);
	 * 
	 * dataFile.read(bs);
	 * 
	 * bIn = new ByteArrayInputStream(bs); objIn = new ObjectInputStream(bIn); Object obj = objIn.readObject();
	 * 
	 * return obj; } catch (Exception e) { log.error("从文件反序列化Element失败", e); } finally { IOUtils.closeQuietly(bIn); IOUtils.closeQuietly(objIn);
	 * lock.unlock(); } return null; }
	 */

	public void close() {
		try {
			if (dataFile != null) {
				dataFile.close();
			}
			if (indexFile != null) {
				indexFile.close();
			}
		} catch (IOException e) {
		}

	}

	public void dispose() {
		if (IndexElementMap.indexMap != null)
			IndexElementMap.indexMap.clear();
		if(IndexElementMap.indexGroupMap!=null)
			IndexElementMap.indexGroupMap.clear();
		try {
			if (dataFile != null)
				dataFile.close();
			if (indexFile != null)
				indexFile.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
