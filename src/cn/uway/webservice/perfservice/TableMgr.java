package cn.uway.webservice.perfservice;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.task.resolver.WSResolver;
import cn.uway.nbi.util.CSVWriterUtils;
import cn.uway.nbi.util.SysCfg;
import cn.uway.webservice.perfservice.store.FileCacheStore;
import cn.uway.webservice.perfservice.store.IndexElement;
import cn.uway.webservice.perfservice.store.IndexElementMap;
import cn.uway.webservice.perfservice.store.StoreParameter;

public class TableMgr {

	private static final Logger LOG = LoggerFactory.getLogger(TableMgr.class);

	private Integer total = 0;

	private String[] out_head = null;

	protected Task task;

	private String outFile;

	private WSResolver resolver;

	protected static final String CURRPATH = SysCfg.getInstance().getCurrentpath();

	public TableMgr() {
		super();
		table = new Table();
		init();
	}

	public WSResolver getResolver() {
		return resolver;
	}

	public void setResolver(WSResolver resolver) {
		this.resolver = resolver;
	}

	/**
	 * table结构体
	 */
	private Table table;

	public String getOutFile() {
		return outFile;
	}

	public void setOutFile(String outFile) {
		this.outFile = outFile;
	}

	/**
	 * 初始化数据
	 */
	private void init() {
	}

	public Table getTable() {
		return table;
	}

	public void setTable(Table table) {
		this.table = table;
		table.setOrderByIndex();
	}

	public void setTask(Task task) {
		this.task = task;
	}

	/**
	 * 将所有的数据结果根据输出字段List 转化为list<String[]> 用户 freemarker输出
	 ***/
	public List<String[]> mapTo(List<Map<String, String>> result, List<String> outFiels) {
		List<String[]> olist = new ArrayList<String[]>();

		for (Map<String, String> em : result) {
			olist.add(mapTo(em, outFiels));
		}

		return olist;

	}

	/**
	 * 将需要输出的字段List 转化为String[]
	 ***/
	public String[] mapTo(Map<String, String> result, List<String> outFiels) {
		String value = null;
		int i = 0;
		String[] outs = new String[outFiels.size()];
		for (String s : outFiels) {
			value = result.get(s);
			outs[i] = value;
			i++;
		}

		return outs;

	}

	/**
	 * 将多个TD的结果集应用leftJoin 进行处理，合并为一个结果集
	 * 
	 * @param tdList
	 * @return
	 */
	public ResultSet leftJoin(TR tr, boolean isOutOneTr) {
		ResultSet result = new ResultSet();

		TD td1 = tr.getTdList().get(0);
		CSVWriterUtils csvWriter = null;
		int count = 0;

		if (isOutOneTr) {
			csvWriter = new CSVWriterUtils(outFile);
			csvWriter.writerHeader(table.getHeadStrList());
		}

		/**
		 * 表主键
		 **/
		String[] keys = table.getKeyFields();

		List<String> keysKey = Arrays.asList(keys);

		FileCacheStore td1FileCacheStore = null;
		FileCacheStore td2CacheStore = null;

		try {

			// Map<String, Integer> td1FieldIndex =
			// td1.getResultSet().getHeadLine();
			TD td2 = tr.getTdList().get(1);
			ResultSet td1Reuslt = td1.getResultSet();
			ResultSet td2Result = td2.getResultSet();
			String[] headTd2 = td2.getResultSet().getHeads();

			List<String> outFields = table.getOutField();

			// 需要剔除的字段,根据outFields中的输出字段为标准， 不在此范围内的字段，则剔除掉

			/**
			 * 第一个数据集中的表头
			 **/
			String[] headTd1 = td1.getResultSet().getHeads();
			if (out_head != null) {
				int size = table.getKeyFields().length;
				out_head = new String[size + headTd1.length];
				System.arraycopy(table.getKeyFields(), 0, out_head, 0, size);
				System.arraycopy(headTd1, 0, out_head, size, headTd1.length);
			}
			List<String> primaryKey = tr.getPrimaryKeyList();

			List<String> tdPrimaryKey = new ArrayList<String>();
			for (String hTd2 : headTd2) {
				if (primaryKey.contains(hTd2))
					tdPrimaryKey.add(hTd2);
			}

			List<String> tmpHeadTd1 = Util.removeRight(Arrays.asList(headTd1), primaryKey);

			List<String> tmpHeadTd2 = Util.removeRight(Arrays.asList(headTd2), primaryKey);

			//
			List<String> del = new ArrayList<String>();

			// 所有的指标td1,td2
			Set<String> all = new HashSet<String>();
			all.addAll(Arrays.asList(headTd1));
			all.addAll(Arrays.asList(headTd2));

			for (String val : all) {
				if (!outFields.contains(val)) {
					del.add(val);
				}
			}

			List<String> outFileDefault = new ArrayList<String>();
			Map<String, Integer> outFileDefaultMap = new HashMap<String, Integer>();
			// 需要输出的字段，但是在td1,td2中找不到字段
			int fieldDefaultIndex = 0;
			for (String val : outFields) {
				if (!all.contains(val)) {
					outFileDefault.add(val);
					outFileDefaultMap.put(val, fieldDefaultIndex);
				}
				fieldDefaultIndex++;
			}
			tr.setOutFileDefaultValueMap(outFileDefaultMap);

			/**
			 * td1和td2中的公共字段
			 ***/
			List<String> commonField = Util.overlaps(tmpHeadTd1, tmpHeadTd2);

			int tmpHeadTd2Size = tmpHeadTd2.size();

			int tmpHeadTd1Size = tmpHeadTd1.size();

			/**
			 * 公共字段 占多少个数
			 ***/
			int commonSize = commonField.size();

			total = tmpHeadTd2Size + tmpHeadTd1Size - commonSize + primaryKey.size();//

			total = outFields.size();//

			/**
			 * td1和td2中的公共字段 在td2中对应的索引
			 ***/
			Map<String, Integer> commonIndex_td2 = Util.fieldIndex(Util.list2StringArray(tmpHeadTd2), commonField);
			/**
			 * td1和td2中的公共字段 在td1中对应的索引
			 ***/
			Map<String, Integer> commonIndex_td1 = Util.fieldIndex(Util.list2StringArray(tmpHeadTd1), commonField);

			/**
			 * 公共字段在 td1,td2 中对应的索引映射关系
			 ***/
			Map<Integer, Integer> mapping = new HashMap<Integer, Integer>();
			if (commonSize > 0) {
				for (String field : commonField) {
					int td1Index = commonIndex_td1.get(field);
					int td2Index = commonIndex_td2.get(field);
					mapping.put(td1Index, td2Index);
				}
			}

			/**
			 * 合并后的tr数据结果集合 Map<orderby字段值，多个数据>
			 ***/

			td2CacheStore = td2Result.getCacheStore();

			// 通过索引文件加载索引文件中的数据信息
			IndexElementMap td2IndexMap = td2CacheStore.IndexElementMap;

			Map<String, Map<String, IndexElement>> td2Group = td2IndexMap.indexGroupMap;

			StoreParameter trstorePara = this.resolver.getCacheFileName(tr.getDataType(), tr.getId(), null);
			FileCacheStore trstore = new FileCacheStore(trstorePara);

			File indexFile = new File(trstorePara.indexFile);
			deleteFile(indexFile);
			File dataFile = new File(trstorePara.dataFile);
			deleteFile(dataFile);

			String[] td2HeadSrc = td2CacheStore.getHeadArr();
			Map<String, Integer> headIndexMaptd2 = td2CacheStore.getHeadIndexMap();

			Map<String, Integer> newRowIndexMap = new HashMap<String, Integer>();
			int m = 0;
			for (String outHead : outFields) {
				newRowIndexMap.put(outHead, m);
				m++;
			}

			/**
			 * 用于存放td1,td2合并的数据结果
			 **/

			td1FileCacheStore = td1Reuslt.getCacheStore();

			Map<String, Integer> headIndexMaptd1 = td1FileCacheStore.getHeadIndexMap();

			Set<String> set = new TreeSet<String>(td1FileCacheStore.IndexElementMap.indexGroupMap.keySet());

			// String key = entry.getKey(); // 数据时间
			for (String key : set) {

				Map<String, IndexElement> it1Map = td1FileCacheStore.IndexElementMap.indexGroupMap.get(key);

				/**
				 * 新一行数据
				 **/
				List<String[]> newRowResult = new ArrayList<String[]>();

				for (Map.Entry<String, IndexElement> indexElementEntry : it1Map.entrySet()) {

					String key1 = indexElementEntry.getKey();

					String[] row = (String[]) td1FileCacheStore.getElement(indexElementEntry.getValue());

					String[] newRow = new String[total];

					Map<String, IndexElement> td2GroupMap = td2Group.get(key1);
					IndexElement indexElement = null;
					if (td2GroupMap != null && td2GroupMap.size() > 0) {
						List<IndexElement> tmp = new ArrayList<IndexElement>(td2GroupMap.values());
						indexElement = tmp.get(0);
					}

					/**
					 * 能够关联上
					 **/
					if (indexElement != null) {
						String[] td2Row = (String[]) td2CacheStore.getElement(indexElement);

						int outIndexTd1 = 0;
						for (String outHead : outFields) {
							Integer tmp = headIndexMaptd1.get(outHead);
							if (tmp != null) {
								newRow[outIndexTd1] = row[tmp];
							}
							outIndexTd1++;
						}
						int outIndexTd2 = 0;
						for (String outHead : outFields) {
							Integer tmp = headIndexMaptd2.get(outHead);
							if (tmp != null) {
								newRow[outIndexTd2] = td2Row[tmp];
							}
							outIndexTd2++;
						}

						/** 公共字段 ,如果td1,td2 中的公共字段，在td2中不为0则替换td1中的字段 **/
						for (String common : commonField) {
							// td2RowTmp.remove(common);
							int td2CommonIndex = headIndexMaptd2.get(common);
							String val = td2Row[td2CommonIndex];
							if (StringUtil.isNotNull(val)) {
								// row.put(common, val);
								Integer index = newRowIndexMap.get(common);
								if (index != null)
									newRow[index] = val;
							}
							// td2RowTmp.remove(common);
							// td2Row.remove(common);
						}
						// newRow.putAll(row);// 将td1中的数据添加到结果行中
						// // newRow.putAll(td2RowTmp);// 将td2中的数据添加到结果行中
						// newRow.putAll(td2Row);// 将td2中的数据添加到结果行中
					} else {

						int outIndexTd1 = 0;
						for (String outHead : outFields) {

							Integer tmp = headIndexMaptd1.get(outHead);
							if (tmp != null) {
								newRow[outIndexTd1] = row[tmp];
							}
							outIndexTd1++;
						}
						/**
						 * 不能关联上
						 **/

						// int td2Tmp = tmpHeadTd2.size() - commonSize;
						Map<String, String> td2Row = new HashMap<String, String>();
						for (String td2Field : tmpHeadTd2) {
							if (keysKey.contains(td2Field))
								continue;
							td2Row.put(td2Field, "0");

							Integer tmp = newRowIndexMap.get(td2Field);
							if (tmp != null) {
								newRow[tmp] = "0";
							}
						}
					}
					if (!isOutOneTr) {
						newRowResult.add(newRow);

					} else {
						count += csvWriter.writerCsvFile(newRow);
					}
				}

				if (!isOutOneTr) {
					trstore.addElement(key, newRowResult, null, outFields.toArray(new String[outFields.size()]));
				}
			}
			//用完之后，销毁资源add 20150806
			set=null;
			//end add 
			
			// 如果不是一个tr
			if (!isOutOneTr) {
				trstore.storeIndexFile();
				result.setCacheStore(trstore);
			}
			//add 20150806
			else {
				if (trstore != null) {
					trstore.IndexElementMap = null;
					trstore.close();
				}
			}
			//end add 
		} catch (Exception e) {
			LOG.error("出现异常。", e);
		}

		finally {
			if (td1FileCacheStore != null) {
				td1FileCacheStore.IndexElementMap = null;
				td1FileCacheStore.close();
				td1FileCacheStore=null;
			}
			if (td2CacheStore != null) {
				td2CacheStore.IndexElementMap = null;
				td2CacheStore.close();
				td2CacheStore=null;
			}
			if (csvWriter != null)
				csvWriter.close();
		}
		return result;
	}

	public void deleteFile(File file) {
		if (file.exists())
			file.delete();
	}

	/**
	 * 对一个Table中多个tr数据块，进行合并，输出一个整体的结果集合.
	 * 
	 * @param table
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int merger(Table tab) {
		int count = 0;
		FileCacheStore fcs = null;
		CSVWriterUtils csvWriter = null;
		ResultSet tr1Data = null;
		ResultSet tr2Data = null;

		try {

			TR tr1 = tab.getTrList().get(0);
			long begin = System.currentTimeMillis();

			boolean isOneTr = false;
			if (tab.getTrList().size() <= 1) {
				isOneTr = true;
			}

			tr1Data = leftJoin(tr1, isOneTr);

			long end = System.currentTimeMillis();

			LOG.debug(task.getId() + " , trId=" + tr1.getId() + " ,  数据合并 消耗时间{}秒", (end - begin) / 1000);

			if (!isOneTr) {
				TR tr2 = tab.getTrList().get(1);

				long beginTr2 = System.currentTimeMillis();

				tr2Data = leftJoin(tr2, false);

				end = System.currentTimeMillis();

				LOG.debug(task.getId() + " , trId=" + tr2.getId() + " ,  数据合并 消耗时间{}秒", (end - beginTr2) / 1000);

				long beginMerger = System.currentTimeMillis();

				count = merger2Data(tr1Data, tr2Data, total);

				long endMerger = System.currentTimeMillis();

				LOG.debug(task.getId() + " ,trId=1, trId=2,  数据合并 并写文件，消耗时间{}秒", (endMerger - beginMerger) / 1000);

			}

		} catch (Exception e) {
			LOG.error("出现异常。", e);
		} finally {

			if (tr1Data != null) {
				if (tr1Data.getCacheStore() != null)
					tr1Data.getCacheStore().close();
			}
			if (tr2Data != null) {
				if (tr2Data.getCacheStore() != null)
					tr2Data.getCacheStore().close();
			}

			if (fcs != null)
				fcs.close();
			if (csvWriter != null)
				csvWriter.close();
		}

		return count;
	}

	public int writeFile(ResultSet tr1Data) {
		if (tr1Data == null)
			return 0;
		int count = 0;
		FileCacheStore fcs = tr1Data.getCacheStore();
		Map<String, IndexElement> resultMap = fcs.IndexElementMap.indexMap;
		List<String> rList = new ArrayList<String>(resultMap.keySet());

		CSVWriterUtils csvWriter = null;
		csvWriter = new CSVWriterUtils(outFile);
		csvWriter.writerHeader(table.getHeadStrList());

		for (String dataTime : rList) {
			IndexElement ielement = resultMap.get(dataTime);
			// result.addAll((List<String[]>) fcs.getElement(ielement));
			List<String[]> groupList = (List<String[]>) fcs.getElement(ielement);
			count += csvWriter.writerCsvFile(groupList);

		}

		return count;
	}

	public int writeFileOneTr(List<String[]> hourGroupDataList, int count, CSVWriterUtils csvWriter) {

		count += csvWriter.writerCsvFile(hourGroupDataList);

		return count;
	}

	/**
	 * 合并2个结果集数据
	 * 
	 * @param tr1Data
	 * @param tr2Data
	 * @return
	 */
	public int merger2Data(ResultSet tr1Data, ResultSet tr2Data, int len) {
		// List<String[]> dataResult = new ArrayList<String[]>();
		int count = 0;
		FileCacheStore tr1Stor = null;
		FileCacheStore tr2Stor = null;
		try {

			tr1Stor = tr1Data.getCacheStore();

			Map<String, IndexElement> tr1GroupMap = tr1Stor.IndexElementMap.indexMap;

			/**
			 * tr1 结果集数据
			 **/
			// Iterator<Entry<String, IndexElement>> it = tr1GroupMap.entrySet()
			// .iterator();

			// 通过ArrayList构造函数把map.entrySet()转换成list
			ArrayList<Map.Entry<String, IndexElement>> mappingList = new ArrayList<Map.Entry<String, IndexElement>>(tr1GroupMap.entrySet());
			// 通过比较器实现比较排序
			Collections.sort(mappingList, new Comparator<Map.Entry<String, IndexElement>>() {

				public int compare(Map.Entry<String, IndexElement> mapping1, Map.Entry<String, IndexElement> mapping2) {
					return mapping1.getKey().compareTo(mapping2.getKey());
				}
			});

			CSVWriterUtils csvWriter = new CSVWriterUtils(outFile);
			csvWriter.writerHeader(table.getHeadStrList());

			/**
			 * 省数据为空，则只取第一个tr1的数据并返回
			 ***/
			if (tr2Data == null) {
				IndexElement iElement=null;
				List<String[]> value=null;
				for (Map.Entry<String, IndexElement> entry : mappingList) {

					/* tr1 结果集数据 */
					// String key = entry.getKey();
					iElement = entry.getValue();
					value = (List<String[]>) tr1Stor.getElement(iElement);

					/* 将城市的某个时间块的数据 copy 到结果数据中 */
					for (String[] line : value) {
						String[] lineData = new String[len];
						System.arraycopy(line, 0, lineData, 0, line.length);
						// dataResult.add(lineData);
						csvWriter.writerCsvFile(lineData);

					}
					count += value.size();
					// dataResult.addAll(value);
				}
				csvWriter.close();
				return count;
				// return dataResult;
			}

			/* tr2 结果集数据 */
			// Map<String, IndexElement> tr2Map = tr2Data.getData();

			tr2Stor = tr2Data.getCacheStore();

			Map<String, IndexElement> tr2Map = tr2Stor.IndexElementMap.indexMap;
			
			IndexElement iElement =null;
			
			String[] lineData1 =null;
			String[] lineData=null;
			
			IndexElement tr2Element=null;
			
			List<String[]> provinceData=null;

			for (Map.Entry<String, IndexElement> entry : mappingList) {
				/* tr1 结果集数据 */
				String key = entry.getKey();

				iElement = entry.getValue();

				List<String[]> value = (List<String[]>) tr1Stor.getElement(iElement);

				/* 将城市的某个时间块的数据 copy 到结果数据中 */
				for (String[] line : value) {
					lineData1 = new String[len];
					System.arraycopy(line, 0, lineData1, 0, line.length);
					// dataResult.add(lineData);

					csvWriter.writerCsvFile(lineData1);
					count += 1;

				}
				/* tr2 省结果集数据 */
				tr2Element = tr2Map.get(key);

				 provinceData = (List<String[]>) tr2Stor.getElement(tr2Element);

				if (provinceData == null)
					continue;
				
				/* 将省的某个时间块的数据 copy 到结果数据中 */
				for (String[] line : provinceData) {
					lineData = new String[len];
					System.arraycopy(line, 0, lineData, 0, line.length);
					// dataResult.add(lineData);
					csvWriter.writerCsvFile(lineData);
					count += 1;
				}
			}

		} catch (Exception e) {
			LOG.error("合并tr数据出现场异常", e);
		} finally {
			if (tr1Stor != null)
				tr1Stor.close();

			if (tr2Stor != null)
				tr2Stor.close();
		}
		return count;
		// return dataResult;
	}

	public String[] getOutHead() {
		return out_head;
	}

	public Map<String, Integer> getOutIndex() {

		Map<String, Integer> outIndex = new HashMap<String, Integer>();
		if (out_head != null) {
			int i = 0;
			for (String s : out_head) {
				outIndex.put(s, i);
				i++;
			}
		}
		return outIndex;
	}

	public String[] zero(int length) {
		String[] t = new String[length];
		for (int i = 0; i < length; i++) {
			t[i] = "0";
		}
		return t;
	}

	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("MD1.0", "MD__1.0");
		map.put("MD5.0", "MD__5.0");
		map.put("MD3.0", "MD__3.0");
		map.put("AD4.0", "MD__4.0");
		map.put("MD2.0", "MD__2.0");
		// map = sortMapByKey(map, false);
		for (Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry.getKey() + " - " + entry.getValue());
		}

		StoreParameter trstorePara = new StoreParameter();
		trstorePara.indexFile = "F:\\test\\1_1.index";
		trstorePara.dataFile = "F:\\test\\1_1.data";

		for (int i = 0; i < 1000000; i++) {
			// trstore.addElement("key"+i, "key"+i, null);
		}

	}
}
