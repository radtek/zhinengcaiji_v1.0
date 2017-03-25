package cn.uway.nbi.task.resolver;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.webservice.report.WorkPlan;

/**
 * 电信四期作业计划工单解析接口
 * 
 * @author Admin
 * 
 */

@IDMember(id = 900)
public class WorkPlanResolver extends WSResolver {

	private static final Logger LOG = LoggerFactory.getLogger(WorkPlanResolver.class);

	public void write(String text, File file) {
		FileOutputStream fos = null;
		Writer out = null;
		BufferedWriter bos = null;
		try {
			if (text == null || "".equals(text.trim())) {
				LOG.debug("需要写入的数据为空。");
				return;
			}
			if (file == null) {
				LOG.debug("文件为空");
				return;
			}
			if (file.exists()) {
				file.delete();
			}
			fos = new FileOutputStream(file);
			out = new OutputStreamWriter(fos, "utf-8");
			bos = new BufferedWriter(out);
			bos.append(text, 0, text.length());
			bos.flush();
		} catch (IOException e) {
			LOG.error("数据写入失败！" + e.getLocalizedMessage());
		} finally {
			IOUtils.closeQuietly(bos);
			IOUtils.closeQuietly(out);
			IOUtils.closeQuietly(fos);
		}
	}

	@Override
	protected void resolveProcess(ResolverResult resolverResult, ResultSetHelper resultService, ResultSet rs, Statement ps, boolean isReplaceCitys,
			String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		boolean b = task.getTemplet().includeValidate();

		int dataType = 0;
		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			try {
				String destFilePath = getDestFilePath(info.fileName, cityId);

				// 硬编码 3次重联
				WorkPlan wsClient = new WorkPlan(1);
				wsClient.setTaskId(this.task.getId());

				LOG.debug("请求webservice 获取sql， url=" + info.wsURL + ";type=" + info.wsParam);
				// webservice调用
				String xml = wsClient.getNBISql(info.wsURL, info.wsParam, task.getCurrDataTime(), task.getNextDataTime());
				if (StringUtil.isNull(xml))
					continue;

				if (null != xml && !"".equals(xml.trim())) {
					File file = new File(destFilePath);
					write(xml, file);
				}

				// add on 20131203 , 如果是文件扩展名则打包
				String packageNameTmp = packageProcess(destFilePath, info, cityId, isReplaceCitys, b);
				// end add

				FileInfo fileInfo = new FileInfo();
				// fileInfo.setFileName(destFilePath);
				fileInfo.setFileName(packageNameTmp);

				fileInfo.setCount(0);
				fileInfo.setDataType(dataType);
				fileInfoMap.put(packageNameTmp, fileInfo);
			} catch (Exception e) {
				LOG.error("级别数据文件产生失败,模板{}，原因:{}", e);
			}
		}
		resolverResult.getUploadFileInfoMap().putAll(fileInfoMap);

	}
	
	public static void main(String[] args) {
		String  xml ="http://192.168.15.71:8089/Services/JobPlanService.asmx";
	}

}
