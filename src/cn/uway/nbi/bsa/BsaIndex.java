package cn.uway.nbi.bsa;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class BsaIndex implements Serializable {

	public final String FULL = "FULL";

	public final String ADD = "ADD";

	public final String DEL = "DEL";

	public final String MOD = "MOD";

	public String EMGREQ_Type = "EMGREQ_Type";

	public String REQ_Type = "REQ_Type";

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int index = 0;

	public int max = 9999;

	// REQ_Type
	public Map<String, Integer> countMap = new HashMap<String, Integer>();
	{
		countMap.put(FULL, 0);
		countMap.put(ADD, 0);
		countMap.put(DEL, 0);
		countMap.put(MOD, 0);
	}

	public static void main(String[] args) {
		BsaIndex in = new BsaIndex();
		System.out.println(in.countMap);
	}

}
