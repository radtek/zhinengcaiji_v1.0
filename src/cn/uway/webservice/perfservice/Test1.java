package cn.uway.webservice.perfservice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// List<String> list1 = new ArrayList<String>();
		// List<String> list2 = new ArrayList<String>();
		// list1.add("g");
		// list1.add("s");
		// list1.add("a");
		// list1.add("f");
		// list2.add("g");
		// list2.add("c");
		// list2.add("b");
		// list2.add("a");
		// new ArrayList<String>(list1).retainAll(list2);
		// System.out.print(list1);
		// System.out.print(list2);

		Map<String, String> data1 = new HashMap<String, String>();

		Map<String, String> data2 = new HashMap<String, String>();
		String key = "key_";

		for (int i = 1; i < 800000; i++) {
			data1.put(key + i, key + i);
			data2.put(key + i, key + i);
		}

		Iterator<Entry<String, String>> it = data1.entrySet().iterator();
		long begin = System.currentTimeMillis();

		while (it.hasNext()) {
			Entry<String, String> en = it.next();
			data2.get(en.getKey());
		}

		long end = System.currentTimeMillis();

		System.out.println((end - begin));
	}

}
