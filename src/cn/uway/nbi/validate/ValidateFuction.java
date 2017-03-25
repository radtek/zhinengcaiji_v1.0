package cn.uway.nbi.validate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.uway.commons.type.StringUtil;
import cn.uway.framework.validate.ValidateDataService;
import cn.uway.framework.validate.ValidateDataServiceImpl;
import cn.uway.framework.validate.common.Config;
import cn.uway.framework.validate.mode.ValidateData;
import cn.uway.nbi.task.ds.DataBaseDS;

/**
 * 数据准确性核查模块功能.
 */
public class ValidateFuction {

	private Config config = null;

	private static int SIZE = 200000;

	private ValidateDataService service = null;

	private static int APPID = 1;

	/**
	 * 初始化
	 * 
	 * @param ds
	 */
	public void init(DataBaseDS ds) {
		config = new Config(ds.getDriver(), ds.getUsername(), ds.getPassword(), ds.getUrl(), SIZE);
		service = new ValidateDataServiceImpl(config);
	}

	/**
	 * 通过一行数据，组装成多个验证数据对象，并添加到集合中 <br>
	 * 将多个验证数据对象添加到队列中。消费线程从队列中获取对象进行消费
	 * 
	 * @param headLine
	 * @param values
	 * @param dataTime
	 * @param fileName
	 */
	public void process(String[] headLine, String[] values, Date dataTime, String fileName, int dataType, String neLevel, String neSysIDTagName) {
		List<ValidateData> datas = new ArrayList<ValidateData>();

		String neSysID = null;
		if (StringUtil.isNotNull(neSysIDTagName) && headLine != null) {
			int index = 0;
			// 查找网元信息在头中的索引
			for (String head : headLine) {
				if (head.equalsIgnoreCase(neSysIDTagName)) {
					break;
				}
				index++;
			}
			// 获取网元编号在数组中的值
			neSysID = values[index];
		}

		if (headLine == null)
			neSysID = null;

		// 通过一行数据，组装成多个验证数据对象，并添加到集合中
		int i = 0;
		for (String filedValue : values) {
			ValidateData vData = new ValidateData();
			vData.setAppID(APPID);

			vData.setDataTime(dataTime);
			vData.setDataType(dataType);
			vData.setFiledName(headLine[i]);
			vData.setFiledValue(filedValue);
			vData.setNeLevel(neLevel);
			vData.setNeSysID(neSysID);
			vData.setValidateObj(fileName);
			datas.add(vData);
			i++;
		}
		// 将多个验证数据对象添加到队列中。
		service.addData(datas);
	}

	public static void main(String[] args) {

	}
}
