package cn.uway.nbi.task.templet.function;

import java.io.IOException;
import java.io.Writer;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.nfunk.jep.JEP;

import cn.uway.commons.type.StringUtil;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/**
 * 处理省数据的类
 * 
 * @author litp 2011-6-15
 */
public class ProvinceData extends AbstractFunction implements TemplateDirectiveModel {

	private static JEP jep = new JEP();

	private static DecimalFormat df4 = new DecimalFormat("#.####");

	private static DecimalFormat df6 = new DecimalFormat("#.######");

	@Override
	@SuppressWarnings("rawtypes")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		// 限定方法中必须且必须传递四个参数
		if (params.size() != 5)
			throw new TemplateModelException("Wrong arguments!");

		TemplateSequenceModel datas = (TemplateSequenceModel) params.get("datas");
		TemplateHashModel indexs = (TemplateHashModel) params.get("indexs");
		String sep = params.get("sep").toString();
		// 列的索引，主要用于识别不同的数据行
		int diffIndex = Integer.parseInt(params.get("diffIndex").toString());
		// 需要求平均值的索引，此索引是从数据的第一行开始计数而不是从公式的第一行，如果C#中为101,102,103，那么在此处就应该为对应的索引加5
		String avgIndex = params.get("avgIndex").toString();
		List<Integer> avgList = null;
		if (!"".equals(avgIndex)) {
			avgList = new ArrayList<Integer>();
			String[] avgArr = avgIndex.split(",");
			for (String str : avgArr)
				avgList.add(Integer.parseInt(str));
		}
		Writer out = env.getOut();
		// 用于暂时存放一个省对应城市的数据
		List<TemplateSequenceModel> lines = new ArrayList<TemplateSequenceModel>();
		String diffVal = null;
		// 从第二行起获取所有数据，因为第一行为表头字段
		for (int i = 1; i < datas.size(); i++) {
			TemplateSequenceModel lineData = (TemplateSequenceModel) datas.get(i);
			String s = lineData.get(diffIndex).toString();
			if (diffVal == null || diffVal.equals(s)) {
				diffVal = s;
				lines.add(lineData);
			} else {
				diffVal = null;
				// 计算省公式
				calProvince(lineData, avgList, lines, sep, indexs, out);
			}
		}
		if (body != null)
			body.render(out);
	}

	/**
	 * 计算省公式
	 * 
	 * @param lineData
	 *            原始省公式信息
	 * @param avgList
	 *            求平均值的集合
	 * @param lines
	 *            此省对应的所有城市的数据
	 * @param sep
	 *            数据分隔符
	 * @param indexs
	 *            字段对应的索引
	 * @param out
	 *            输出对象
	 * @throws TemplateModelException
	 * @throws IOException
	 */
	private void calProvince(TemplateSequenceModel lineData, List<Integer> avgList, List<TemplateSequenceModel> lines, String sep,
			TemplateHashModel indexs, Writer out) throws TemplateModelException, IOException {
		/*
		 * 计算省公式,它的内容为(空、0、00、公式)，第一步：处理为空和0的字段，即将所有城市的对应值相加或者取平均， 第二步：计算公式的值，一般都为率的处理，如果不包有除号则赋值为0
		 */
		// 记录省公式率的公式<索引，公式>
		Map<Integer, String> rateMap = new LinkedHashMap<Integer, String>();
		// 此时的lineData为省数据的那条记录
		String[] provinceData = new String[lineData.size()];
		// 前一个字段不需要计算,直接赋值即可
		for (int j = 0; j < 5; j++)
			provinceData[j] = lineData.get(j).toString();
		for (int j = 5; j < lineData.size(); j++) {
			// 获取省公式provinceFormula
			// 第一步：计算一个省字段的数据(求和或者求平均)
			String pf = lineData.get(j).toString();
			if (avgList != null && avgList.contains(j)) {// 求平均
				StringBuilder str = getDataStr(lines, j);
				str.insert(0, "(").append(")/").append(lines.size());
				provinceData[j] = calShort(str.toString());
			} else if (pf == null || "".equals(pf) || "0".equals(pf)) {
				// 求和
				provinceData[j] = calLong(getDataStr(lines, j).toString());
			} else {
				// 如果为率计算的值，直接存入map即可，以便第二步计算；否则将此字段设置为0
				if (pf.contains("/"))
					rateMap.put(j, pf);
				else
					provinceData[j] = "0";// pf为00和不含/的公式
			}
		}
		// 第二步：计算公式的值，一般都为率的处理，如果不含有除号则赋值为0
		Set<Entry<Integer, String>> fSet = rateMap.entrySet();
		for (Entry<Integer, String> e : fSet) {
			int index = e.getKey();
			String value = e.getValue();
			// add by liuwx 2012-02-23
			if (StringUtil.isNull(value)) {
				provinceData[index] = "";
				continue;
			}
			// end

			Set<String> cols = getAll(value);
			for (String col : cols) {
				value = value.replace(col, provinceData[Integer.parseInt(indexs.get(col).toString())]);
			}
			provinceData[index] = cal100(value);
		}
		// 将城市数据写入文件
		for (TemplateSequenceModel line : lines) {
			out.write(getline(line, sep));
			super.setFileLineNum(out);
		}
		// 将省数据写入文件
		int size = provinceData.length - 1;
		for (int j = 0; j < size; j++) {
			out.write(provinceData[j]);
			out.write(sep);
		}
		out.write(provinceData[size]);
		out.write("\n");
		super.setFileLineNum(out);
		lines.clear();
	}

	/**
	 * 获取数据字符串
	 * 
	 * @param lines
	 *            此时间点所有的记录
	 * @param j
	 *            数据对应的列数
	 * @return 数据字符串，如：1+2+3...
	 * @throws TemplateModelException
	 */
	private StringBuilder getDataStr(List<TemplateSequenceModel> lines, int j) throws TemplateModelException {
		StringBuilder sb = new StringBuilder();
		for (TemplateSequenceModel line : lines) {
			String data = line.get(j).toString();
			if (data == null || data.equals(""))
				data = "0";
			sb.append(data).append("+");
		}
		if (sb.length() > 1)
			sb.deleteCharAt(sb.length() - 1);
		return sb;
	}

	/**
	 * 计算结果保留4位小数
	 * 
	 * @param exp
	 *            计算式
	 * @return
	 */
	private String calShort(String exp) {
		return cal(exp, df4, 1);
	}

	/**
	 * 计算结果保留6位小数
	 * 
	 * @param exp
	 *            计算式
	 * @return
	 */
	private String calLong(String exp) {
		return cal(exp, df6, 1);
	}

	/**
	 * 计算结果乘以100然后，保留4位小数
	 * 
	 * @param exp
	 *            计算式
	 * @return
	 */
	private String cal100(String exp) {
		return cal(exp, df4, 100);
	}

	/*
	 * 计算表达式的值
	 */
	private String cal(String exp, DecimalFormat df, int times) {
		if (exp.length() <= 1)
			return "0";
		jep.parseExpression(exp);
		if (jep.hasError())
			return "0";

		String value = jep.getValueAsObject().toString();
		if (jep.hasError())
			return "0";

		value = df.format(Double.parseDouble(value) * times);
		if (!value.matches("(?:\\+|-)?\\d+(?:\\.\\d+)?"))
			return "0";
		return value;
	}

	private Set<String> getAll(String value) {
		Set<String> list = new HashSet<String>();
		list.add(value);
		Set<String> list0 = get(list, "/");
		Set<String> list1 = get(list0, "\\+");
		Set<String> list2 = get(list1, "\\(");
		Set<String> list3 = get(list2, "\\)");
		Set<String> list4 = get(list3, "\\-");
		Set<String> list5 = get(list4, "\\*");
		return list5;
	}

	private Set<String> get(Set<String> list, String sep) {
		Set<String> relist = new HashSet<String>();
		for (String enName : list) {
			if (StringUtil.isNull(enName))
				continue;
			String[] aa = enName.split(sep);
			for (String s : aa) {
				// 如果s不为空，并且不为数字
				if (!"".equals(s) && !s.matches("(?:\\+|-)?\\d+(?:\\.\\d+)?"))
					relist.add(s);
			}
		}
		return relist;
	}

	/**
	 * 将一行数据组合为一个字符串
	 * 
	 * @param lineData
	 *            一行数据
	 * @param sep
	 *            分隔符
	 * @return
	 * @throws TemplateModelException
	 */
	private String getline(TemplateSequenceModel lineData, String sep) throws TemplateModelException {
		StringBuilder sb = new StringBuilder();
		int size = lineData.size() - 1;
		for (int i = 0; i < size; i++)
			sb.append(lineData.get(i)).append(sep);
		sb.append(lineData.get(size)).append("\n");
		return sb.toString();
	}
}