package cn.uway.nbi.task.templet.function;

import java.io.IOException;
import java.io.Writer;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import cn.uway.commons.type.DateUtil;
import cn.uway.commons.type.StringUtil;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/**
 * 平台使用情况,计算当天用户在线时长 规则：1：用户超过5分钟就进行统计 ；2：一直登陆没退出的情况
 * 
 * @author liuwx 2011-7-20
 */
public class UseState extends AbstractFunction implements TemplateDirectiveModel {

	// / 保留当前用户登录时间不交叉的记录
	private final Map<Date, Date> dicSpanLoginTime = new HashMap<Date, Date>();

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		// 限定方法中必须且必须传递5个参数
		if (params.size() != 3)
			throw new TemplateModelException("Wrong arguments!");
		/* 一天各个用户的登陆数据集合 */
		TemplateSequenceModel datas2 = (TemplateSequenceModel) params.get("datas2");
		/* 所有用户初始化在线统计信息 */
		TemplateSequenceModel datas3 = (TemplateSequenceModel) params.get("datas3");

		String sep = params.get("sep").toString();
		if (datas2 == null || datas2.size() <= 0 || null == datas3 || datas3.size() <= 0)
			return;
		// Map<longinname ,此登陆名对应的所有登陆信息>
		Map<String, List<TemplateSequenceModel>> map1 = new HashMap<String, List<TemplateSequenceModel>>();

		// Map<username,用户名对应的所有登陆信息>
		Map<String, String[]> map2 = new HashMap<String, String[]>();

		// Map<用户名:username,登陆名:loginname>
		Map<String, List<String>> nameMapping = new HashMap<String, List<String>>();

		/**
		 * <p>
		 * Map<longinname, List<时间序列>
		 * </p>
		 */
		Map<String, List<DateSeq>> dateSeqMap = new HashMap<String, List<DateSeq>>();

		for (int i = 0; i < datas2.size(); i++) {
			TemplateSequenceModel model = (TemplateSequenceModel) datas2.get(i);// 一行记录
			if (model == null)
				continue;
			String key = model.get(0).toString();// loginname登陆名
			if (!map1.containsKey(key)) {
				List<TemplateSequenceModel> l = new ArrayList<TemplateSequenceModel>();
				l.add(model);
				map1.put(key, l);
			} else
				map1.get(key).add(model);
			String username = model.get(1).toString();// 用户名username

			if (!nameMapping.containsKey(username)) {
				List<String> l = new ArrayList<String>();
				l.add(key);
				nameMapping.put(username, l);
			} else {
				if (!nameMapping.get(username).contains(key))
					nameMapping.get(username).add(key);
			}

		}

		/* 获取用户名在线的所有登陆信息，并保存到map2中 */
		for (int i = 0; i < datas3.size(); i++) {
			TemplateSequenceModel model = (TemplateSequenceModel) datas3.get(i);
			if (model == null)
				continue;
			String key = model.get(2).toString();
			if (!map2.keySet().contains(key)) {
				String[] s = new String[model.size()];
				for (int j = 0; j < model.size(); j++) {
					s[j] = model.get(j).toString();
				}
				map2.put(key, s);
			}

		}
		Set<Entry<String, String[]>> setdata = map2.entrySet();
		Iterator<Entry<String, String[]>> itor = setdata.iterator();
		while (itor.hasNext()) {
			Entry<String, String[]> entry = itor.next();

			String key = entry.getKey();// username用户名
			double loginTimeCout = 0;
			int count = 0;

			/* 对一个用户名登陆信息的收集 */
			if (nameMapping.get(key) != null) {

				List<String> li = nameMapping.get(key);
				for (String loginname : li) {
					List<TemplateSequenceModel> ls = map1.get(loginname);

					for (TemplateSequenceModel mdata : ls) {
						try {
							String s = mdata.get(2).toString();
							String e = mdata.get(3).toString();
							if (StringUtil.isNull(s) || StringUtil.isNull(e))
								continue;
							Date begin = DateUtil.getDate(s);// 登陆时间
							Date end = DateUtil.getDate(e);// 退出时间

							DateSeq seq = new DateSeq();
							seq.beginDate = begin;
							seq.endDate = end;
							List<DateSeq> lData = dateSeqMap.get(key);
							if (lData == null) {
								lData = new ArrayList<DateSeq>();

								lData.add(seq);
								dateSeqMap.put(key, lData);
							} else {
								if (!lData.contains(seq))
									lData.add(seq);
							}

						} catch (ParseException e) {
							e.printStackTrace();
						}
						count++;
					}

				}
			}
			dicSpanLoginTime.clear();
			// 对entertime进行排序，从小到大的顺序
			if (dateSeqMap.get(key) != null)
				sort(dateSeqMap.get(key));
			/* 统计一个用户名的在线时间片段 */
			if (dateSeqMap.get(key) != null) {
				calcLoginTime(dateSeqMap.get(key));
			}

			/* 统计一个用户名的在线时间总和 */
			Iterator<Date> it = this.dicSpanLoginTime.keySet().iterator();
			while (it.hasNext()) {
				Date star = it.next();
				Date end = dicSpanLoginTime.get(star);
				double userloginTimeCout = end.getTime() - star.getTime();
				loginTimeCout += userloginTimeCout;
			}
			double totalTime = round(loginTimeCout / (1000 * 60 * 60), 2);// 转化为在线时间(时间:分钟)
			String r = "";
			if (totalTime == 0.0) {
				r = String.valueOf((int) totalTime);
			} else {
				r = String.valueOf(totalTime);
			}

			entry.getValue()[3] = String.valueOf(count);

			entry.getValue()[4] = r;

			// 当日每个活动账号的有效登录次数。有效登录是指每次登录时长大于5分钟的登录。
			if (totalTime * 60 <= 5)
				itor.remove();

		}

		// 输出
		Writer out1 = env.getOut();
		out(out1, map2.values(), sep);
		body.render(out1);

	}

	/**
	 * 输出
	 * 
	 * @param out
	 * @param datas
	 * @param sep
	 * @throws IOException
	 */
	private void out(Writer out, Collection<String[]> datas, String sep) throws IOException {
		int count = 0;
		for (String[] ds : datas) {
			for (int j = 0; j < ds.length; j++) {

				out.write(ds[j]);
				if (j != ds.length - 1)
					out.write(sep);
			}

			if (count != datas.size() - 1)
				out.write("\n");
			count++;
		}
		setFileLineNum(out, count);
	}

	/**
	 * 四舍五入
	 * 
	 * @param d
	 * @param len
	 * @return
	 */
	public static double round(double d, int len) {
		String s = null;
		if (len > 0) {
			NumberFormat ddf1 = NumberFormat.getNumberInstance();
			ddf1.setMaximumFractionDigits(len);
			s = ddf1.format(d);
		} else {
			return Math.round(d);
		}
		return Double.parseDouble(s.replace(",", ""));
	}

	/**
	 * 排序
	 * 
	 * @param dateSeq
	 */
	public void sort(List<DateSeq> dateSeq) {
		if (dateSeq == null || dateSeq.size() <= 0)
			return;
		Collections.sort(dateSeq, new CompareObject());
	}

	/**
	 * 时间片段
	 * 
	 * @author liuwx 2011-7-20
	 */
	class DateSeq {

		Date beginDate;// 登陆时间

		Date endDate;// 退出时间

		@Override
		public String toString() {
			return DateUtil.getDateString(beginDate) + "  " + DateUtil.getDateString(endDate);
		}

	}

	class CompareObject implements Comparator<DateSeq> {

		@Override
		public int compare(DateSeq o1, DateSeq o2) {

			DateSeq a1 = o1;
			DateSeq a2 = o2;

			if (a1.beginDate != a2.beginDate)
				return a1.beginDate.compareTo(a2.beginDate);

			return 0;
		}

	}

	// / 计算登录时间片段：利用递归、及类似冒泡算法将一个帐户每天的登录时间片段合并成没有交叉（或包含）的时间片段。
	// / 返回N个断开的时间片段。
	private Map<Date, Date> calcLoginTime(List<DateSeq> timeTable) {
		Date exitTime = new Date();
		Date enterTime = new Date();
		Date maxExitTime = new Date();
		Date maxEnterTime = new Date();

		Date lastExitTime = new Date();
		Date lastEnterTime = new Date();
		Date tempExitTime = new Date();
		Date tempEnterTime = new Date();

		// 是否有交叉记录
		boolean bRecursion = false;

		// 首先判断表里的记录是否有交叉情况
		for (int i = 0; i < timeTable.size() - 1; i++) {
			if (bRecursion) {
				break;
			}
			tempExitTime = new Date();
			tempEnterTime = new Date();
			for (int y = i + 1; y < timeTable.size(); y++) {

				lastEnterTime = timeTable.get(i).beginDate;
				lastExitTime = timeTable.get(i).endDate;

				tempEnterTime = timeTable.get(y).beginDate;
				tempExitTime = timeTable.get(y).endDate;

				if (lastExitTime.getTime() > tempEnterTime.getTime() && lastExitTime.getTime() < tempExitTime.getTime()
						&& lastEnterTime.getTime() < tempEnterTime.getTime() && lastEnterTime.getTime() < tempExitTime.getTime()
						|| lastExitTime.getTime() > tempEnterTime.getTime() && lastExitTime.getTime() < tempExitTime.getTime()
						&& lastEnterTime.getTime() > tempEnterTime.getTime() && lastEnterTime.getTime() < tempExitTime.getTime()
						|| lastExitTime.getTime() > tempEnterTime.getTime() && lastExitTime.getTime() > tempExitTime.getTime()
						&& lastEnterTime.getTime() < tempEnterTime.getTime() && lastEnterTime.getTime() < tempExitTime.getTime()
						|| lastExitTime.getTime() > tempEnterTime.getTime() && lastExitTime.getTime() > tempExitTime.getTime()
						&& lastEnterTime.getTime() > tempEnterTime.getTime() && lastEnterTime.getTime() < tempExitTime.getTime()) {
					bRecursion = true;
					break;
				}
			}
		}

		if (bRecursion) {
			// #region 递归比较时间片段
			// 1.取得第一行的时间记录
			DateSeq onerow = timeTable.get(0);

			maxExitTime = onerow.endDate;
			maxEnterTime = onerow.beginDate;
			timeTable.remove(0);
			// 2.去除时间落在dicMaxLoginTime里的记录

			List<DateSeq> tempdt = new ArrayList<DateSeq>(timeTable);

			Iterator<DateSeq> itr = tempdt.iterator();
			while (itr.hasNext()) {
				DateSeq irow = itr.next();
				exitTime = irow.endDate;
				enterTime = irow.beginDate;
				if (enterTime.getTime() > maxEnterTime.getTime() && enterTime.getTime() < maxExitTime.getTime()
						&& exitTime.getTime() > maxEnterTime.getTime() && exitTime.getTime() < maxExitTime.getTime()) {
					itr.remove();
				}
			}

			// 3.去除结束时间落在dicMaxLoginTime里的记录，并置换MaxENTERTIME
			Iterator<DateSeq> itr2 = tempdt.iterator();
			while (itr2.hasNext()) {

				DateSeq jrow = itr2.next();
				exitTime = jrow.endDate;
				enterTime = jrow.beginDate;

				if (enterTime.getTime() < maxEnterTime.getTime() && exitTime.getTime() > maxEnterTime.getTime()
						&& exitTime.getTime() < maxExitTime.getTime()) {
					maxEnterTime = enterTime;
					itr2.remove();
				}
			}

			// 4.去除开始时间落在dicMaxLoginTime里的记录，并置换MaxEXITTIME
			while (itr2.hasNext()) {

				DateSeq mrow = itr2.next();

				exitTime = mrow.endDate;
				enterTime = mrow.beginDate;

				if (enterTime.getTime() > maxEnterTime.getTime() && enterTime.getTime() < maxExitTime.getTime()
						&& exitTime.getTime() > maxExitTime.getTime()) {
					maxExitTime = exitTime;
					itr2.remove();
				}
			}

			// 将比较出来的时间段存入到tempdt表中，继续比较，即合并比较

			DateSeq comb = new DateSeq();
			comb.beginDate = maxEnterTime;
			comb.endDate = maxExitTime;
			tempdt.add(comb);
			return calcLoginTime(tempdt);
		} else {
			// 返回N个断开的时间片段
			int scount = timeTable.size();
			for (int n = 0; n < scount; n++) {
				tempExitTime = new Date();
				tempEnterTime = new Date();

				DateSeq mrow = timeTable.get(n);
				tempExitTime = mrow.endDate;
				tempEnterTime = mrow.beginDate;

				tempExitTime = dealDate(tempExitTime, tempEnterTime);
				if (!dicSpanLoginTime.containsKey(tempEnterTime)) {
					dicSpanLoginTime.put(tempEnterTime, tempExitTime);
				}
			}
			return dicSpanLoginTime;

		}
	}

	@SuppressWarnings("deprecation")
	private Date dealDate(Date tempExitTime, Date tempEnterTime) {
		Date de = new Date(tempEnterTime.getTime() + 24 * 60 * 60 * 1000);
		de.setHours(0);
		de.setMinutes(0);
		de.setSeconds(0);
		if (tempExitTime.getTime() >= de.getTime())
			tempExitTime = new Date(de.getTime());

		return tempExitTime;
	}
}
