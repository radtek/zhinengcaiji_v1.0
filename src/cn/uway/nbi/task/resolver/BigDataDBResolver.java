package cn.uway.nbi.task.resolver;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.ResultSetHelper;
import cn.uway.nbi.util.Util;
import cn.uway.nbi.validate.CheckMapping;
import cn.uway.nbi.validate.CheckMappingMgr;

/**
 * 用户数据核查
 * 
 * @since 1.0
 */
@IDMember(id = 800)
public class BigDataDBResolver extends DBResolver {

	private static final Logger LOG = LoggerFactory.getLogger(DBResolver.class);

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

		// Map<String,String> paraMap =new HashMap<String,String>();
		// paraMap.put("datacheck", "true");
		// task.setParaMap(paraMap);

		// 遍历所有的mapping,每个mapping表示生成一个文件
		for (MappingInfo info : mappingInfos) {
			try {
				Map<String, Map<String, Integer>> indexs = new HashMap<String, Map<String, Integer>>();
				Map<String, List<String[]>> datas = new HashMap<String, List<String[]>>();
				String destFilePath = getDestFilePath(info.fileName, cityId);
				if (destFilePath.contains("${index}")) {
					destFilePath = destFilePath.replace("${index}", BSAIndexMgr.getInstance().getIndex());
				}
				String oldFilePath = destFilePath;
				//
				destFilePath = getFileName(destFilePath);

				boolean bFlag = info.fileName.toLowerCase().contains(".csv");

				boolean b = task.getTemplet().includeValidate();

				String ext = Util.getPackageExt(info.fileName);

				int recordCount = 0;
				boolean errFlag = false;

				int dataType = 0;

				processStrategy(info);

				Header header = info.header;

				List<Boolean> prefixList = new ArrayList<Boolean>();

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
						errFlag = true;
						LOG.error(task + "," + info.fileName + " , templet: " + info.templetFileName + ", 查询数据源出现错误,可能无此厂家设备，原因:{}", e);
						throw e;
						//break;
					}
					String[] headLine = resultService.getColumnNames(rs);

					if (header.headList != null && header.headList.length > 0 && header.headList.length > headLine.length) {

					}

					/* index */
					Map<String, Integer> index = new HashMap<String, Integer>();
					for (int j = 0; j < headLine.length; j++)
						index.put(headLine[j], j);
					int sqlNum = i + 1;
					indexs.put("d" + sqlNum, index);
					/* data */
					List<String[]> data = new ArrayList<String[]>();
					datas.put("d" + sqlNum, data);
					if (info.batchNum <= 0 || info.addHead && sqlNum == 1)
						data.add(headLine);
					// 在初次产生文件时候，如果这个文件存在，则删除
					File oldFile = new File(destFilePath);
					if (oldFile.exists())
						oldFile.delete();
					//
					String fileName = new File(oldFilePath).getName();

					String neLevel = null;
					String neSysIDTagName = null;

					// 模板中的功能模块是否开启了核查功能
					boolean singleCheckFlag = false;
					// 判断是否开启了模块核查功能
					boolean ischeckGlobal = CheckMappingMgr.getInstance().isCheck();
					if (ischeckGlobal) {
						CheckMapping checkMapping = checkMgr.findByFileName(fileName);

						// add by yanb 2013.8.21 修改核查checkMapping为空的校验
						if (null != checkMapping) {
							dataType = Integer.valueOf(checkMapping.getDataType());
							neLevel = checkMapping.getLevel();
							neSysIDTagName = checkMapping.getNe_sys_id();

							singleCheckFlag = checkMapping.isUsed();
						}
					}
					boolean ischeck = ischeckGlobal && singleCheckFlag;

					int count = 0;
					while (rs.next()) {
						String[] values = resultService.getColumnValues(rs, bFlag);
						if (values == null)
							continue;
						// 调用数据验证接口,如果开启了模块校验功能。则开启
						if (ischeck)
							// bsa的时候 filename需要修改
							validateFuction.process(headLine, values, task.getCurrDataTime(), fileName, dataType, neLevel, neSysIDTagName);

						count++;
						data.add(values);
						if (info.batchNum >= 1 && data.size() >= info.batchNum) {
							lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, true, info);
							data.clear();
						}
					}
					recordCount += count;

					// 如果前置条件不满足，则不会执行下面的sql，也不会产生对于的文件
					if (count == 0 && sqlEntry.isPrefixCondition) {
						prefixList.add(false);
						break;
					}
				}
				if (errFlag) {
					continue;
				}

				// 如果前置条件不满足，则不会产生mapping对于的文件
				if (prefixList.size() > 0) {
					LOG.warn(task + "  ， 提示  ： " + destFilePath + " 由于没有满足前置条件，暂时不输出文件,不是错误");
					continue;
				}

				lineNum = lineNum + this.process(datas, indexs, info.templetFileName, destFilePath, info.batchNum >= 1, info);
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

	public static void writer(String destFilePath, String[] value) {
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(destFilePath));
			writer.flush();
			writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}