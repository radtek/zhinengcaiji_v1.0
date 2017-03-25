package cn.uway.nbi.task.resolver;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.ftp.DownStructer;
import cn.uway.nbi.ftp.FtpFileUnit;
import cn.uway.nbi.ftp.FtpUtils;
import cn.uway.nbi.task.ds.FTPFileDS;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;
import cn.uway.webservice.report.WorkPlan;

/**
 * 电信四期作业计划工单下发解析接口
 * 
 * @author Admin
 * 
 */

@IDMember(id = 901)
public class WorkPlanDownServerResolver extends FTPFileResolver {

	private static final Logger LOG = LoggerFactory.getLogger(WorkPlanDownServerResolver.class);

	private static Map<String, String> map = new HashMap<String, String>();

	static {

		// map.put("1000", "正常解析入库");
		// map.put("1001", "未正常解析入库");
		// map.put("1002", "文件乱码");
		// map.put("1003", "文件格式错误");
		// map.put("1004", "文件解压报错");
		// map.put("1099", "文件其他错误");
		// map.put("1101", "日期格式错误");
		// map.put("1102", "字段为空");
		// map.put("1199", "字段其他错误");

		map.put("1000", "1000");
		map.put("1001", "1001");
		map.put("1002", "1002");
		map.put("1003", "1003");
		map.put("1004", "1004");
		map.put("1099", "1099");
		map.put("1101", "1101");
		map.put("1102", "1102");
		map.put("1199", "1199");

	}

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
	public ResolverResult resolve() throws Exception {
		ResolverResult resolverResult = new ResolverResult();
		Map<String, FileInfo> recordCountMap = new HashMap<String, FileInfo>();
		resolverResult.setUploadFileInfoMap(recordCountMap);

		LOG.info("开始进行FTP数据收集!");
		FTPFileDS ds = (FTPFileDS) getDs();

		ftpUnitMap = ds.getFtpFileUnitMap();

		String localdir = ds.getLocalDownPath();

		String curDir = null;

		if (StringUtil.isNotNull(localdir)) {
			localdir = localdir.replace("\\", "/");
			if (localdir.lastIndexOf("/") != localdir.length() - 1)
				localdir = localdir + "/";
			File f = new File(localdir);
			if (!f.exists())
				f.mkdirs();
			curDir = localdir;

		} else {
			curDir = SysCfg.getInstance().getCurrentpath().replace("\\", "/");
		}

		if (ftpUnitMap == null) {
			ftpUnitMap = new HashMap<String, FtpFileUnit>();
			// ftpUnitMap.put(ftpFileUnit.getKey(), ftpFileUnit);
			ftpUnitMap.putAll(ftpRawUnitMap);
		}

		// for (FtpFileUnit ftpFileUnit : ftpUnitMap.values()) {
		for (Entry<String, FtpFileUnit> entity : ftpRawUnitMap.entrySet()) {

			Map<String, String> pathMap = new HashMap<String, String>();

			FtpFileUnit ftpFileUnit = entity.getValue();

			FtpUtils ftp = new FtpUtils(ds.getIp(), ds.getPort(), ds.getUsername(), ds.getPassword(), ds.getEncode(), ds.isbPasv());
			String zipFile = ftpFileUnit.getName();
			try {

				// 如果打包文件名不为空，则进行参数替换,例如省参数。
				if (zipFile != null && !"".equals(zipFile.trim())) {
					zipFile = ProvinceNameMgr.replaceProvince(zipFile, task.getTemplet().getInclude().getProviceMap());
					zipFile = processParaMap(zipFile, "${", "}", null);
					zipFile = ConstDef.ParseFilePath(zipFile, new Timestamp(task.getCurrDataTime().getTime()));
					// 打包全路径名.
					zipFile = SysCfg.getInstance().getCurrentpath() + File.separator + zipFile;
				}

				// 通过通配符下载数据文件
				for (String fName : ftpFileUnit.getFilenameList()) {

					fName = ProvinceNameMgr.replaceProvince(fName, task.getTemplet().getInclude().getProviceMap());
					fName = processParaMap(fName, "${", "}", null);

					String tmpFile = ConstDef.ParseFilePath(fName, new Timestamp(task.getCurrDataTime().getTime()));
					String ftpFname = tmpFile;

					String localPath = curDir + File.separator + ftpFname;
					localPath = localPath.replace("\\", "/");
					localPath = localPath.replace("//", "/");
					String dir = localPath.substring(0, localPath.length() - ftpFname.length());
					File f = new File(dir);
					if (!f.exists())
						f.mkdir();

					// String localFName = localPath + tmpFile;
					// 下载文件
					DownStructer result = ftp.downFile(ftpFname, dir);

					for (String tmp : result.getSuc()) {
						pathMap.put(tmp, tmp);
						// 调用ws服务

						FtpFileUnit info = entity.getValue();
						if (StringUtil.isNull(info.getWsInfo().wsURL))
							continue;
						// 硬编码 3次重联
						String messageinfo = "taskid= " + task.getId() + " , 请求webservice ， url=" + info.getWsInfo().wsURL + ";type="
								+ info.getWsInfo().wsParam;
						try {
							WorkPlan wsClient = new WorkPlan(1);
							wsClient.setTaskId(this.task.getId());
							LOG.debug(messageinfo);
							// webservice调用
							// boolean resultFlag = wsClient.outFileDataToFront(info.getWsInfo().wsURL,
							// FileToContentString(tmp, info.getWsInfo().encode));
							//
							String stateResult = "0";

							String xmlContent = FileToContentString(tmp, info.getWsInfo().encode);

							if (!(xmlContent.contains("xml") || xmlContent.contains("XML")))
								stateResult = map.get("1003");

							 boolean resultFlag = wsClient.outFileDataToFrontV2(info.getWsInfo().wsURL,
							 xmlContent, Integer.valueOf(stateResult),ftpFname);

//							boolean resultFlag = wsClient.outFileDataToFront(info.getWsInfo().wsURL, xmlContent);

							if (resultFlag) {
								LOG.debug(messageinfo + " 访问成功");
							} else {
								LOG.debug(messageinfo + ",结果纯在错误");
							}
						} catch (Exception e) {
							LOG.error(messageinfo + "出现异常，原因:", e);
						}
					}
				}
			} catch (Exception e) {
				LOG.error("FTP 方式 下载数据文件()失败. ", ftpFileUnit.getFilenameList(), e);
			} finally {
				if (ftp != null)
					ftp.closeConnect();
			}
		}
		resolverResult.setIgnore(true);

		return resolverResult;
	}

	public String FileToContentString(String file, String encode) {
		StringBuilder sb = new StringBuilder();
		File f = new File(file);
		if (!f.exists())
			return "";
		BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream(file), encode));

			String line = null;
			while ((line = in.readLine()) != null) {
				sb.append(line).append("\n");
			}
		} catch (IOException e) {
			LOG.error(this + "出现异常，原因:", e);
		} finally {
			IOUtils.closeQuietly(in);
		}
		return sb.toString();
	}
}
