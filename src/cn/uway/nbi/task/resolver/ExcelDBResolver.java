package cn.uway.nbi.task.resolver;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.framework.IDMember;
import cn.uway.webservice.managecontrol.file.DefaultGenerateExcelFile;
import cn.uway.webservice.managecontrol.mode.ExcelPara;

/**
 * DB型数据源解释器(临时方案，为了兼容之前的代码。并且不想在这个类里面维护那么多属性，因此只重写了process方法，以后重构时，这里可从新考虑)
 * 
 * @author yanb
 * @since 1.0
 */
@IDMember(id = 600)
public class ExcelDBResolver extends DBResolver {

	private static final Logger LOG = LoggerFactory.getLogger(DBResolver.class);

	/**
	 * 数据处理
	 * 
	 * @param datas
	 *            所有数据
	 * @param index
	 *            数据对应的索引
	 * @param templetFile
	 *            模板文件名
	 * @param destFilePath
	 *            目标文件路径
	 */
	@Override
	protected final long process(Map<String, List<String[]>> datas, Map<String, Map<String, Integer>> indexs, String templetFile,
			String destFilePath, boolean append, MappingInfo info) throws Exception {
		LOG.debug(destFilePath);
		ExcelDataFormart excelDataFormart = new ExcelDataFormart();
		addStyle(excelDataFormart, info.excelFile.getExcelFileStyles());
		List<Object> list = new ArrayList<Object>();
		for (Map.Entry<String, List<String[]>> entry : datas.entrySet()) {
			List<String[]> values = entry.getValue();
			for (int i = 0; i < values.size(); i++) {
				if (i == 0) {
					if (null == info.excelFile.getTableHeader()) {
						list.add(Arrays.asList(values.get(i)));
					} else {
						list.add(Arrays.asList(info.excelFile.getTableHeader()));
					}
					continue;
				}
				list.add(arrayToList(excelDataFormart, values.get(i)));
			}

		}
		ExcelPara excelPara = new ExcelPara();
		excelPara.setFiledStyle(getFiledStyle(excelDataFormart));
		excelPara.setVersion(info.excelFile.getVersion());
		excelPara.setCellValues(list);
		excelPara.setSheetName(info.excelFile.getSheetName());
		new DefaultGenerateExcelFile().makeFile(destFilePath, excelPara, append);
		return 0;
	}

	private void addStyle(ExcelDataFormart excelDataFormart, List<ExcelFileStyle> styles) {
		for (ExcelFileStyle excelFileStyle : styles) {
			excelDataFormart.addStyle(excelFileStyle);
		}
	}

	private List<Object> arrayToList(ExcelDataFormart excelDataFormart, String[] datas) throws Exception {
		List<Object> list = new ArrayList<Object>();
		for (int i = 0; i < datas.length; i++) {
			String data = datas[i];
			if (excelDataFormart.isFloat(data)) {
				list.add(excelDataFormart.newFloat(data));
			} else if (excelDataFormart.isInteger(data)) {
				list.add(excelDataFormart.newInteger(data));
			} else if (excelDataFormart.isContain(i)) {
				list.add(excelDataFormart.getFiledType(i, data));
			} else {
				list.add(data);
			}
		}
		return list;
	}

	private Map<Integer, String> getFiledStyle(ExcelDataFormart excelDataFormart) {
		return excelDataFormart.getAllStyle();
	}

}