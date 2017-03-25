package cn.uway.nbi.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.db.dbpool.DBPoolMgrCdma;
import cn.uway.nbi.db.dbpool.DBUtil;

/**
 * @author liuwx 公式配置： 非资源类指标 select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0810' order by id; select * from
 *         cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0804' order by id; select * from cfg_provice_perf t where t.datatype=2
 *         and classCode=1 and vendor='ZY0808' order by id; --资源类指标 select * from cfg_province_res t where t.isuser=1 and classCode=1 and
 *         vendor='ZY0808' order by id -- 查询sql详见“性能数据MSC1X查询sql.txt”。 -- MSC级别DO： -- 公式配置： -- 非资源类指标 select * from cfg_provice_perf t where
 *         t.datatype=2 and classCode=2 and vendor='ZY0810' order by id; select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and
 *         vendor='ZY0804' order by id; -- select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0808' order by id; 资源类指标
 *         select * from cfg_province_res t where t.isuser=1 and classCode=2 and vendor='ZY0808' order by id -- 查询sql详见“性能数据MSCDO查询sql.txt”。 --
 *         CITY级别1X： --公式配置： -- 非资源类指标 select * from cfg_provice_perf t where t.datatype= 2 and classCode=1 and vendor='ZY0000' order by id; select *
 *         from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0808' order by id; select * from cfg_provice_perf t where
 *         t.datatype=2 and classCode=1 and vendor='ZY0804' order by id; select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and
 *         vendor='ZY0810' order by id; -- 资源类指标 select * from cfg_province_res t where t.isuser=1 and classCode=1 and vendor='ZY0808' order by id
 *         --查询sql详见“性能数据CITY1X查询sql.txt”。 --CITY级别DO： -- 公式配置： -- 非资源类指标 select * from cfg_provice_perf t where t.datatype= 2 and classCode=2 and
 *         vendor='ZY0000' order by id; select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0808' order by id; select *
 *         from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0804' order by id; select * from cfg_provice_perf t where
 *         t.datatype=2 and classCode=2 and vendor='ZY0810' order by id; -- 资源类指标 select * from cfg_province_res t where t.isuser=1 and classCode=2
 *         and vendor='ZY0808' order by id;
 */
public class TempletGen_old {

	static String regex = "(\\[\\w*\\..?\\d*\\])";

	// 通过正则表达式查找
	private static List<String> findByRegex(String str, String regEx, int group) {
		String resultValue = null;
		List<String> list = new ArrayList<String>();
		if (str == null)
			return list;

		if (regEx == null || (regEx != null && "".equals(regEx.trim()))) {
			return list;
		}
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);

		while (m.find()) {

			resultValue = m.group(group);// 找出匹配的结果
			if (resultValue != null) {
				list.add(resultValue);
			}

		}

		return list;
	}

	/*
	 * ID NUMBER Y 命名规则 厂家+CLASSCODE+三位编号 LOGICEXPRESS VARCHAR2(300) Y 表达式 CHIAN_NAME VARCHAR2(500) Y 中文名称 EN_NAME VARCHAR2(500) Y 公式名称 VENDOR
	 * VARCHAR2(20) Y 厂家 CITY_ID NUMBER Y 城市 CLASSCODE VARCHAR2(500) Y 1:msc级1x 小类的数据(2.1表示1X数据，2.2表示是DO数据)(1.1代表是MSC类别数据.1.2 CLASSNAME VARCHAR2(500)
	 * Y ISUSER NUMBER Y 是否有效 DATATYPE NUMBER Y 类别(1代表配置数据，2代表性能数据，3代表用户呼叫分布统计上报 4 网优人员数据上报 5 厂商信息上报，6 仪器仪表信息）
	 */

	public String process2(String sql, int i) throws Exception {
		// StringBuilder sb = new StringBuilder( " select  ");
		StringBuilder sb = new StringBuilder("");

		ResultSet rs = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBPoolMgrCdma.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String CHIAN_NAME = rs.getString("CHIAN_NAME");
				String EN_NAME = rs.getString("EN_NAME");

				// System.out.println(CHIAN_NAME);
				sb.append(EN_NAME).append(" as ID").append(i).append(",");
				i++;
			}
		} finally {
			DBUtil.close(rs, preparedStatement, connection);
		}
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}

	public String process(String sql, int i) throws Exception {
		// StringBuilder sb = new StringBuilder( " select  ");
		StringBuilder sb = new StringBuilder("");

		ResultSet rs = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBPoolMgrCdma.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery();

			TreeMap<Long, Entry> ziMap = new TreeMap<Long, Entry>();
			TreeMap<String, String> expressMap = new TreeMap<String, String>();

			while (rs.next()) {
				String CHIAN_NAME = rs.getString("CHIAN_NAME");
				String EN_NAME = rs.getString("EN_NAME");
				String express = rs.getString("LOGICEXPRESS").trim();

				Long id = rs.getLong("id");

				Entry en = new Entry();
				en.id = id;
				en.chinaname = CHIAN_NAME;
				en.enname = EN_NAME;
				List<String> list = findByRegex(EN_NAME, regex, 1);
				en.list = list;
				if (list.size() > 0)
					en.isFlag = true;

				ziMap.put(id, en);
				expressMap.put(express, en.enname);
			}
			Iterator<Long> it = ziMap.keySet().iterator();
			while (it.hasNext()) {
				long key = it.next();
				Entry en = ziMap.get(key);
				if (en.isFlag) {
					for (String s : en.list) {
						String ss = s.replace("[", "").replace("]", "");
						String tmp = expressMap.get(ss);
						en.enname = en.enname.replace(s, "" + (StringUtil.isNull(tmp) ? null : tmp));
						// System.out.println("======== "+en.enname);
					}
					en.enname = en.enname.replace("[", "").replace("]", "");
				}
				sb.append(en.enname).append(" as ID").append(i).append(",");
				i++;
			}
		} finally {
			DBUtil.close(rs, preparedStatement, connection);
		}
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}

	class Entry {

		long id;

		String chinaname;

		String enname;

		boolean isFlag;// 是否包含[ ]

		List<String> list;

		String express;
	}

	/*
	 * select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0804' order by id; select * from cfg_provice_perf t where
	 * t.datatype=2 and classCode=1 and vendor='ZY0808' order by id;
	 */
	public static void main(String[] args) throws Exception {
		String sql1 = "   select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0810' order by id        ";
		String sql2 = "       select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0804' order by id   ";
		String sql3 = "      select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0808' order by id    ";
		String sql4 = "      select * from cfg_province_res t where t.isuser=1 and classCode=1 and vendor='ZY0808' order by id      ";
		String sql5 = "       select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0810' order by id   ";
		String sql6 = "       select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0804' order by id   ";
		String sql7 = "   select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0808' order by id         ";
		String sql8 = "       select * from cfg_province_res t where t.isuser=1 and classCode=2 and vendor='ZY0808' order by id     ";

		String sql9 = "   select * from cfg_provice_perf t where t.datatype= 2 and classCode=1 and vendor='ZY0000' order by id      ";
		String sql10 = "  select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0808' order by id       ";
		String sql11 = "  select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0804' order by id       ";
		String sql12 = "  select * from cfg_provice_perf t where t.datatype=2 and classCode=1 and vendor='ZY0810' order by id         ";
		String sql13 = "  select * from cfg_province_res t where t.isuser=1 and classCode=1 and vendor='ZY0808' order by id         ";
		String sql14 = "    select * from cfg_provice_perf t where t.datatype= 2 and classCode=2 and vendor='ZY0000' order by id    ";
		String sql15 = "    select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0808' order by id     ";
		String sql16 = "    select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0804' order by id     ";
		String sql17 = "    select * from cfg_provice_perf t where t.datatype=2 and classCode=2 and vendor='ZY0810' order by id     ";
		String sql18 = "    select * from cfg_province_res t where t.isuser=1 and classCode=2 and vendor='ZY0808' order by id       ";

		int i = 1;
		TempletGen_old gen = new TempletGen_old();
		// String result1= gen.process(sql1,i);
		// System.out.println(""+result1);
		// String result2= gen.process(sql2,i);
		// System.out.println(result2);
		// String result3= gen.process(sql3,i);
		// System.out.println(result3);
		// String result4= gen.process(sql4,i+300);
		// System.out.println(result4);
		// String result5= gen.process(sql5,i);
		// System.out.println(result5);
		// String result6= gen.process(sql6,i);
		// System.out.println(result6);
		// String result7= gen.process(sql7,i);
		// System.out.println(result7);
		// String result8= gen.process(sql8,i);
		// System.out.println(result8);

		String result9 = gen.process(sql9, i);
		System.out.println(result9);
		String result10 = gen.process(sql10, i);
		System.out.println(result10);
		String result11 = gen.process(sql11, i);
		System.out.println(result11);
		String result12 = gen.process(sql12, i);
		System.out.println(result12);
		String result13 = gen.process(sql13, i + 300);
		System.out.println(result13);
		String result14 = gen.process(sql14, i);
		System.out.println(result14);
		String result15 = gen.process(sql15, i);
		System.out.println(result15);
		String result16 = gen.process(sql16, i);
		System.out.println(result16);
		String result17 = gen.process(sql17, i);
		System.out.println(result17);
		String result18 = gen.process(sql18, i + 300);
		System.out.println(result18);

		// List<String> list = findByRegex("[m1.2]/[m.144][m.15554]",
		// "(\\[\\w*\\..?\\d*\\])", 1);
		// System.out.println(list);
	}

}
