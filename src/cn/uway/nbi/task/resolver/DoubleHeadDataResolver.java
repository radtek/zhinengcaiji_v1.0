package cn.uway.nbi.task.resolver;

import java.io.File;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.bsa.BSAIndexMgr;
import cn.uway.nbi.db.pojo.BSATask;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.util.CSVWriterUtils;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.Util;

/**
 * DB型数据源解释器 --针对于大数据，且 双表头取自FTL文件
 * 
 * @since 1.0
 */
@IDMember(id = 101)
public class DoubleHeadDataResolver extends DBResolver {

	private static final Logger LOG = LoggerFactory.getLogger(DoubleHeadDataResolver.class);

	/**
	 * 解析处理
	 * 
	 * @param result
	 * @param resultService
	 * @param rs
	 * @param ps
	 * @param isReplaceCitys
	 * @param cityId
	 * @throws Exception
	 */
	@Override
	protected void resolveProcess(ResolverResult result, ResultSetHelper resultService, ResultSet rs, Statement ps, boolean isReplaceCitys,
			String cityId) throws Exception {
		Map<String, FileInfo> fileInfoMap = new HashMap<String, FileInfo>();

		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			try {
				String destFilePath = getDestFilePath(info.fileName, cityId);
				if (destFilePath.contains("${index}")) {
					destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
				}
				String oldFilePath = destFilePath;
				destFilePath = getFileName(destFilePath);

				boolean bFlag = info.fileName.toLowerCase().contains(".csv");

				boolean b = task.getTemplet().includeValidate();

				String ext = Util.getPackageExt(info.fileName);

				int recordCount = 0;

				int dataType = 0;

				processStrategy(info);

				long lineNum = 0;
				for (int i = 0; i < info.sqls.size(); i++) {
					SqlEntry sqlEntry = info.sqls.get(i);
					String sql = sqlEntry.sql;

					if (StringUtil.isNull(sql))
						continue;
					if (isReplaceCitys)// 替换城市相关占位符
					{
						sql = ProvinceNameMgr.replaceAllName(sql, cityId, task.getTemplet().getInclude().getProviceMap(), task.getTemplet()
								.getInclude().getCityMap());
					} else if (b)// 替换省相关占位符
					{
						sql = ProvinceNameMgr.replaceProvince(sql, task.getTemplet().getInclude().getProviceMap());
					}
					sql = processParaMap(sql, "${", "}", null);
					// 修改on 2012-10-12 ParseFilePath-> ParseFilePathForDB
					sql = ConstDef.ParseFilePathForDB(sql, new Timestamp(task.getCurrDataTime().getTime()));

					if (task instanceof BSATask) {
						if (sql.contains("${planno}")) {
							BSATask tasktmp = (BSATask) task;
							sql = sql.replace("${planno}", tasktmp.getPlanno());
						}
					}
					LOG.debug(task + " , sql=" + sql);
					try {
						rs = ps.executeQuery(sql);
					} catch (Exception e) {
						LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
						break;
					}
					// ftl 模板中取出表头
					List<String> headStrList = readFileHeadStrList(ConstDef.TEMPLET_PATH_FOR_FILE + info.templetFileName, ",");

					// 在初次产生文件时候，如果这个文件存在，则删除
					File oldFile = new File(destFilePath);
					if (oldFile.exists())
						oldFile.delete();

					CSVWriterUtils csvWriter = new CSVWriterUtils(destFilePath);
					csvWriter.writerHeader(headStrList);

					int count = 0;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs, bFlag);
						if (values == null)
							continue;

						count += csvWriter.writerCsvFile(values);
					}
					recordCount += count;

				}

				String fkey = destFilePath + (ext == null ? "" : ext);// 具体某个时间对应的数据文件
				LOG.debug("file templet mapping :  file:" + destFilePath + "   templet :" + info.templetFileName + " key :" + fkey);

				File filetmp = new File(destFilePath);
				if (filetmp.exists() && filetmp.length() > 0) {
					destFilePath = oldFilePath;

					// add on 20131203 , 如果是文件扩展名则打包
					String packageNameTmp = packageProcess(destFilePath, info, cityId, isReplaceCitys, b);

					// end add

					FileInfo fileInfo = new FileInfo();
					fileInfo.setFileName(packageNameTmp);

					fileInfo.setCount((int) (lineNum == 0 ? recordCount : lineNum));

					fileInfo.setDataType(dataType);

					result.getUploadFileInfoMap().put(fkey, fileInfo);

				}
			} catch (Exception e) {
				LOG.error("级别数据文件产生失败,模板{}，原因:{}" + info.templetFileName, e);
			}
		}

		result.getUploadFileInfoMap().putAll(fileInfoMap);
	}
}