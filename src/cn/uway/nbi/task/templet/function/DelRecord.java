package cn.uway.nbi.task.templet.function;

import java.io.IOException;
import java.io.Writer;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/**
 * 删除重复记录
 * 
 * @author litp 2011-6-23
 */
public class DelRecord extends AbstractFunction implements TemplateDirectiveModel {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		// 限定方法中必须且必须传递三个参数
		if (params.size() != 3)
			throw new TemplateModelException("Wrong arguments!");
		TemplateSequenceModel datas = (TemplateSequenceModel) params.get("datas");
		int index = Integer.parseInt(params.get("index").toString());
		String sep = params.get("sep").toString();
		Writer out = env.getOut();
		Set<String> set = new HashSet<String>();
		int count = 0;
		for (int i = 0; i < datas.size(); i++) {
			TemplateSequenceModel lineData = (TemplateSequenceModel) datas.get(i);
			String s = lineData.get(index).toString();
			if (s == null || "".equalsIgnoreCase(s))
				continue;
			s = s.trim();
			if (set.contains(s))
				continue;
			String line = getline(lineData, sep);
			out.write(line);
			count++;
			set.add(s);
		}
		super.setFileLineNum(out, count > 1 ? count - 1 : count);
		out.flush();
		if (body != null)
			body.render(out);
	}

	private String getline(TemplateSequenceModel lineData, String sep) throws TemplateModelException {
		StringBuilder sb = new StringBuilder();
		int size = lineData.size() - 1;
		for (int i = 0; i < size; i++)
			sb.append(lineData.get(i)).append(sep);
		sb.append(lineData.get(size)).append("\n");
		return sb.toString();
	}
}