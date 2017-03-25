package cn.uway.nbi.task.templet.function;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/**
 * 其他数据省际边界数据处理
 * 
 * @author liuwx 2011-7-5
 */
public class Border extends AbstractFunction implements TemplateDirectiveModel {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(Environment env, Map params, TemplateModel[] arg2, TemplateDirectiveBody arg3) throws TemplateException, IOException {
		if (params.size() != 5)
			throw new TemplateModelException("Wrong arguments!");
		TemplateSequenceModel datas = (TemplateSequenceModel) params.get("datas");
		TemplateHashModel indexs = (TemplateHashModel) params.get("indexs");

		String basekeyid = params.get("basekeyid").toString();// 源小区唯一标识+
		String seqnoid = params.get("seqnoid").toString();// 邻区顺序为关键字

		String sep = params.get("sep").toString();
		if (datas == null || datas.size() <= 0)
			return;
		if (indexs == null || indexs.isEmpty())
			return;
		List<TemplateSequenceModel> lines = new ArrayList<TemplateSequenceModel>();
		List<String> keys = new ArrayList<String>();

		TemplateSequenceModel firstLine = (TemplateSequenceModel) datas.get(0);

		lines.add(firstLine);

		for (int i = 1; i < datas.size(); i++) {
			// 一行数据
			TemplateSequenceModel model = (TemplateSequenceModel) datas.get(i);

			if (indexs.get(basekeyid) == null || indexs.get(seqnoid) == null) {
				continue;
			}
			String k = indexs.get(basekeyid).toString();
			int bkeyIndex = Integer.parseInt(k);
			int seqIndex = Integer.parseInt(indexs.get(seqnoid).toString());

			String bkey = model.get(bkeyIndex).toString();
			String seq = model.get(seqIndex).toString();

			// 拼接唯一标识符，防止重复
			String key = bkey + "||" + seq;
			// 过滤掉重复数据 以时间+源小区唯一标识+邻区顺序为关键字
			if (!keys.contains(key)) {
				keys.add(key);
				lines.add(model);
			}
		}
		// 输出，写入文件
		Writer out = env.getOut();
		for (int j = 0; j < lines.size(); j++) {
			TemplateSequenceModel m = lines.get(j);
			for (int n = 0; n < m.size(); n++) {
				out.write(m.get(n).toString());
				if (n != m.size() - 1)
					out.write(sep);
			}
			out.write("\n");
			out.flush();
			if (j != 0) {
				super.setFileLineNum(out);
			}
		}
	}
}
