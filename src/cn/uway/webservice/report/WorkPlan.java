package cn.uway.webservice.report;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.codehaus.xfire.client.Client;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.DateUtil;
import cn.uway.nbi.util.ConstDef;

/**
 * 作业计划工单四期
 * 
 * @author Admin
 * 
 */
public class WorkPlan {

	private static final Logger LOG = LoggerFactory.getLogger(WorkPlan.class);

	private static final String XMLHEAD = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";

	private long taskId;

	private static final String _R_N = "\r\n";

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	/**
	 * @param dataFile
	 *            解析模板文件绝对路径
	 * @param againTime
	 *            重试次数
	 */
	public WorkPlan(int againTime) {
		super();
		this.againTime = againTime;
	}

	/**
	 * 连接webservice失败的，重联次数
	 */
	private int againTime;

	public int getAgainTime() {
		return againTime;
	}

	public void setAgainTime(int againTime) {
		this.againTime = againTime;
	}

	/**
	 * 获取sql，XML格式
	 * 
	 * @param sqlType
	 * @return
	 */
	public String getNBISql(String url, String param, Date beginTime, Date endTime) {
		String xml = null;
		String message = "成功";
		try {
			File backupDir = new File(ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS);
			if (!backupDir.exists())
				backupDir.mkdirs();
		} catch (Exception e) {
			LOG.error("创建缓存目录{}失败", ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS, e);
		}

		StringBuilder sb = new StringBuilder();
		sb.append(XMLHEAD).append(_R_N);

		Client client = null;
		try {
			client = new Client(new URL(url));
			Object[] result1 = client.invoke("ExportJobPlanItems",
					new Object[]{DateUtil.getDateString_yyyyMMddHHmmss(beginTime), DateUtil.getDateString_yyyyMMddHHmmss(endTime)});
			xml = (String) result1[0];
			sb.append(xml);

		} catch (Exception e) {
			LOG.debug("访问 webservice : " + url + "失败，重试次数：" + ", info : " + e);
			message = "失败";
		}

		LOG.debug("访问 webservice : " + url + ", info : " + message);

		return sb.toString();
	}

	/**
	 * 获取sql，XML格式
	 * 
	 * @param sqlType
	 * @return
	 */
	public boolean outFileDataToFrontV2(String url, String fileDataString, int statusCode, String fileName) {
		String returnInfo = null;
		String message = "成功";
		boolean resultFlag = false;
		try {
			File backupDir = new File(ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS);
			if (!backupDir.exists())
				backupDir.mkdirs();
		} catch (Exception e) {
			LOG.error("创建缓存目录{}失败", ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS, e);
		}

		Client client = null;
		try {
			client = new Client(new URL(url));
			Object[] result1 = client.invoke("ImportJobPlanItemsV2", new Object[]{fileName, fileDataString, statusCode});
			returnInfo = (String) result1[0];

			if ("True".equalsIgnoreCase(returnInfo)) {
				resultFlag = true;
			}
		} catch (Exception e) {
			LOG.error(this.taskId + "访问 webservice : " + url + "失败，重试次数：" + ", info : " + e);
			message = "失败";
		}
		LOG.debug(this.taskId + ", 访问 webservice : " + url + ", " + " , 状态 : " + message + " , webservice 前台服务返回消息: " + returnInfo);

		return resultFlag;
	}

	public boolean outFileDataSHFault(String url, String fileDataString) {
		String returnInfo = null;
		String message = "成功";
		boolean resultFlag = false;

		Client client = null;
		try {
			client = new Client(new URL(url));
			Object[] result1 = client.invoke("sendResult", new Object[]{fileDataString});
			returnInfo = (String) result1[0];

			if (returnInfo != null && returnInfo.contains("RESPONSEDATA>")) {
				resultFlag = true;
			}
		} catch (Exception e) {
			LOG.error(this.taskId + "访问 webservice : " + url + "失败，重试次数：" + ", info : " + e);
			message = "失败";
		}
		LOG.debug(this.taskId + ", 访问 webservice : " + url + ", " + " , 状态 : " + message + " , webservice 前台服务返回消息: " + returnInfo);

		return resultFlag;
	}

	/**
	 * 获取sql，XML格式
	 * 
	 * @param sqlType
	 * @return
	 */
	public boolean outFileDataToFront(String url, String fileDataString) {
		String returnInfo = null;
		String message = "成功";
		boolean resultFlag = false;
		try {
			File backupDir = new File(ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS);
			if (!backupDir.exists())
				backupDir.mkdirs();
		} catch (Exception e) {
			LOG.error("创建缓存目录{}失败", ConstDef.TEMPLET_PATH_FOR_WORKPLAN_WS, e);
		}

		Client client = null;
		try {
			client = new Client(new URL(url));
			Object[] result1 = client.invoke("ImportJobPlanItems", new Object[]{fileDataString});
			returnInfo = (String) result1[0];

			if ("True".equalsIgnoreCase(returnInfo)) {
				resultFlag = true;
			}
		} catch (Exception e) {
			LOG.error(this.taskId + "访问 webservice : " + url + "失败，重试次数：" + ", info : " + e);
			message = "失败";
		}
		LOG.debug(this.taskId + ", 访问 webservice : " + url + ", " + " , 状态 : " + message + " , webservice 前台服务返回消息: " + returnInfo);

		return resultFlag;
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

	public String readFile(File file) {
		StringBuffer text = new StringBuffer();
		InputStream in = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		try {
			if (null == file || !file.exists()) {
				LOG.debug("文件为空或不存在，读取失败。file=" + file);
				return null;
			}
			in = new FileInputStream(file);
			isr = new InputStreamReader(in, "utf-8");
			br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null) {
				text.append(line).append(" \n");

			}
		} catch (FileNotFoundException e) {
			LOG.error("文件不存在！" + e.getLocalizedMessage());
		} catch (IOException e) {
			LOG.error("数据读取失败！" + e.getLocalizedMessage());
		} finally {
			IOUtils.closeQuietly(in);
			IOUtils.closeQuietly(isr);
			IOUtils.closeQuietly(br);

		}
		return text.toString();
	}

	public static void main(String[] args) {

		String url = "http://192.168.15.226:8088/Services/SQLBuilderService.asmx?wsdl";
		Client client = null;
		try {
			client = new Client(new URL(url));
			Object[] result1 = client.invoke("GetNbiSQL", new Object[]{"GATHER_MOD_CITY_D"});
			System.out.println(result1[0]);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String url2 = "http://192.168.15.71:8089/Services/JobPlanService.asmx?wsdl";
		Client client2 = null;
		try {
			client = new Client(new URL(url2));
			Object[] result1 = client2.invoke("ImportJobPlanItemsV2", new Object[]{"", "", 1});
			System.out.println(result1[0]);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
