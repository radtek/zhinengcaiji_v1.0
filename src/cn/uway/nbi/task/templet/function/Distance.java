package cn.uway.nbi.task.templet.function;

import java.util.List;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

/**
 * 计算精度纬度之间的距离
 * 
 * @author liuwx 2011-6-6
 */
public class Distance implements TemplateMethodModel {

	@SuppressWarnings("rawtypes")
	@Override
	public Object exec(List list) throws TemplateModelException {
		double lat1 = Double.parseDouble(list.get(0).toString().trim());
		double lng1 = Double.parseDouble(list.get(1).toString().trim());
		double lat2 = Double.parseDouble(list.get(2).toString().trim());
		double lng2 = Double.parseDouble(list.get(3).toString().trim());
		return FreemarkerUtils.getDistance(lat1, lng1, lat2, lng2);
	}
}
