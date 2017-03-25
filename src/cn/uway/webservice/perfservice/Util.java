package cn.uway.webservice.perfservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Util {

	/**
	 * 两个集合的交集
	 * 
	 * @return
	 */
	public static List<String> overlaps(List<String> head1, List<String> head2) {
		List<String> list = new ArrayList<String>(head1);
		list.retainAll(head2);
		return list;

	}

	/**
	 * 属于左边的结果集，但是不属于右边的结果集合
	 * 
	 * @return
	 */
	public static List<String> removeRight(List<String> left, List<String> right) {
		List<String> list = new ArrayList<String>(left);
		list.removeAll(right);
		return list;

	}

	/**
	 * 属于左边的结果集，但是不属于右边的结果集合
	 * 
	 * @return
	 */
	public static List<String> totalHead(List<String> left, List<String> right) {
		List<String> list = new ArrayList<String>(left);
		list.removeAll(right);
		return list;

	}

	/**
	 * 将list 转化为 String []
	 * 
	 * @param list
	 * @return
	 */
	public static String[] list2StringArray(List<String> list) {
		int size = list.size();
		return list.toArray(new String[size]);

	}

	/**
	 * 公共字段 在 表头字段 中对应的索引
	 * 
	 * @param src
	 *            表头字段
	 * @param common
	 *            公共字段
	 * @return
	 */
	public static Map<String, Integer> fieldIndex(String[] src, List<String> common) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		List<Integer> index = new ArrayList<Integer>();

		String e = null;
		for (int i = 0; i < src.length; i++) {
			e = src[i];
			if (common.contains(e)) {
				map.put(e, i);
				index.add(i);
			}
		}
		return map;
	}

	/**
	 * td1,td2中的公共字段对应的索引映射关系
	 * 
	 * @param src
	 *            表头字段
	 * @param common
	 *            公共字段
	 * @return Map<td1 index ,td2 index>
	 */
	public static Map<String, Integer> fieldIndex(String[] td1, String[] td2, List<String> common) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		List<Integer> index = new ArrayList<Integer>();

		String e = null;
		for (int i = 0; i < td2.length; i++) {
			e = td2[i];
			if (common.contains(e)) {
				map.put(e, i);
				index.add(i);
			}
		}
		return map;
	}

	/**
	 * 公共字段 在 表头字段 中对应的索引
	 * 
	 * @param src
	 *            表头字段
	 * @param common
	 *            公共字段
	 * @return
	 */
	public static List<Integer> fieldIndexList(String[] src, List<String> common) {
		List<Integer> index = new ArrayList<Integer>();
		String e = null;
		for (int i = 0; i < src.length; i++) {
			e = src[i];
			if (common.contains(e)) {
				index.add(i);
			}
		}

		return index;

	}
}
