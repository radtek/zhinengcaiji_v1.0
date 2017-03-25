package cn.uway.nbi.task.templet.function;

import java.util.List;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

/**
 * 通过精度，纬度，计算格子数目
 * 
 * @author liuwx 2011-6-5
 */
public class Grid implements TemplateMethodModel {

	@SuppressWarnings("rawtypes")
	@Override
	public Object exec(List list) throws TemplateModelException {
		double LongitudeL = Double.parseDouble(list.get(0).toString().trim());
		double LatitudeL = Double.parseDouble(list.get(1).toString().trim());
		double LongitudeR = Double.parseDouble(list.get(2).toString().trim());
		double LatitudeR = Double.parseDouble(list.get(3).toString().trim());
		return FreemarkerUtils.grid(LongitudeL, LatitudeL, LongitudeR, LatitudeR);
	}

}
