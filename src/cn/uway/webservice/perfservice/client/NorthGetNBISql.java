package cn.uway.webservice.perfservice.client;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Closeable;
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
import java.rmi.RemoteException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.framework.util.StringUtil;
import cn.uway.nbi.exception.CfgException;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.PropertiesXML;

/**
 * 北向接口调用 NorthGetNBISql
 * 
 * @author dengap 2013-4-27
 */
public class NorthGetNBISql {

	private static final Logger LOG = LoggerFactory.getLogger(NorthGetNBISql.class);

	/**
	 * @param dataFile
	 *            解析模板文件绝对路径
	 * @param againTime
	 *            重试次数
	 */
	public NorthGetNBISql(int againTime) {
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
	 * 上报SQL类型 SQLType 2013-4-27
	 */
	/*
	 * public enum SQLType { NBI_PERF_MSC_1X, NBI_PERF_MSC_DO, NBI_PERF_CITY_1X, NBI_PERF_CITY_DO, NBI_PERF_SCENE_1X, NBI_PERF_SCENE_DO }
	 */
	/**
	 * 获取sql，XML格式
	 * 
	 * @param sqlType
	 * @return
	 */
	public String getNBISql(String url, String param) {
		String xml = null;
		String message = "";
		try {
			File backupDir = new File(ConstDef.TEMPLET_PATH_FOR_TASK_WS);
			if (!backupDir.exists())
				backupDir.mkdirs();
		} catch (Exception e) {
			LOG.error("创建缓存目录{}失败", ConstDef.TEMPLET_PATH_FOR_TASK_WS, e);
		}

		File backup = new File(ConstDef.TEMPLET_PATH_FOR_TASK_WS + param + ".xml");

		File backupOld = new File(ConstDef.TEMPLET_PATH_FOR_TASK_WS + param + ".xml.old");

		for (int i = 0; i < againTime; i++) {
			try {
				LOG.info("访问webservice 开始");
				// String url =
				// "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx";
				String namespace = "http://tempuri.org/";
				String methodName = "GetNbiSQL";
				String soapActionURI = "http://tempuri.org/GetNbiSQL";
				Service service = new Service();
				Call call = null;
				call = (Call) service.createCall();
				call.setTargetEndpointAddress(new java.net.URL(url));
				call.setUseSOAPAction(true);
				// 这个地方没设对就会出现Server was unable to read request的错误
				call.setSOAPActionURI(soapActionURI);
				call.setOperationName(new QName(namespace, methodName));
				/*
				 * 这里如果设置成call.addParameter(new QName(namespace,"s"), XMLType.XSD_STRING,ParameterMode.IN);就是调用document风格的.net服务端
				 * 如果设反了，.net服务端就接不到参数,接到的是null
				 */
				call.addParameter(new QName(namespace, "nbisqltype"), XMLType.XSD_STRING, ParameterMode.IN);
				call.setReturnType(XMLType.XSD_STRING);
				xml = (String) call.invoke(new Object[]{param});
				if (null != xml && !"".equals(xml.trim())) {
					String tmp = readFile(backup);

					boolean validXml = true;
					try {
						// add on 2013-09-29 by liuwx
						// 用xml来检验.net服务反馈过来的字符串不是xml文档，并且没有无nbi_perf_table节点，则设置为false标记;
						PropertiesXML pUtil = new PropertiesXML(xml, 1);
						String root = pUtil.getProperty("nbi_perf_table");
						if (StringUtil.isNullOrEmptyString(root)) {
							validXml = false;
						}
						// end add on 2013-09-29
					} catch (CfgException e) {
						validXml = false;
						LOG.error(".net服务接口{}出现异常,返回内容: " + xml + " ,原因:{}", param, e);
					}
					// add on 20150731
					if(xml.contains("Exception") || xml.contains("配置错误"))
						validXml=false;
					
					//end add
					
					if ((tmp != null && !tmp.equalsIgnoreCase(xml)) && validXml) {
						write(tmp, backupOld);// 备份原来的文件
						write(xml, backup);// 创建新的文件
						LOG.info("写入本次xml  sql数据完成！file:" + backup.getAbsolutePath());
					}else {
						write(xml, backup);// 创建新的文件
					}
					
					return xml;
				}
			} catch (MalformedURLException e) {
				message = e.getLocalizedMessage();
			} catch (ServiceException e) {
				message = e.getLocalizedMessage();
			} catch (RemoteException e) {
				message = e.getLocalizedMessage();
			}
			LOG.debug("访问 webservice : " + url + "失败，重试次数：" + (i + 1) + ", info : " + message);
		}
		LOG.debug("无法访问 webservice : " + url + "，开始执行上一次成功的上报数据！");
		xml = readFile(backup);
		if (null == xml || "".equals(xml.trim())) {
			LOG.debug("读取最后一次上报数据的sql失败！ file = " + backup.getAbsolutePath());
		}
		return xml;
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
			closeIO(bos);
			closeIO(out);
			closeIO(fos);
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
			closeIO(in);
			closeIO(isr);
			closeIO(br);
		}
		return text.toString();
	}

	public void closeIO(Closeable c) {
		if (c != null) {
			try {
				c.close();
			} catch (IOException e) {
				LOG.error("关闭流失败！");
			}
		}
	}

	private NorthGetNBISql() {
		super();
	}

	public static void main2(String[] args) {
		/*
		 * NorthGetNBISql sql = new NorthGetNBISql(1); String url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx"; String type =
		 * "CQ_PERF_SECTOR_DO"; String xml = sql.getNBISql(url, type); System.out.println(xml);
		 */

		// String text = sql.readFile(new
		// File(ConstDef.TEMPLET_PATH_FOR_TASK_WS+"NBI_PERF_MSC_DO.xml"));
		// System.out.println(text);

		String xml = "aaa";
		String param = "";

		boolean validXml = true;
		try {
			// add on 2013-09-29 by liuwx
			// 用xml来检验.net服务反馈过来的字符串不是xml文档，并且没有无nbi_perf_table节点，则设置为false标记;
			PropertiesXML pUtil = new PropertiesXML(xml, 1);
			Element root = pUtil.getElementsByXpathSingleNode("nbi_perf_table");
			if (root == null) {
				validXml = false;
			}
			// end add on 2013-09-29
		} catch (CfgException e) {
			validXml = false;
			LOG.error(".net服务接口{}出现异常" + xml + ",原因:{}", param, e);
		}
		System.out.println(validXml);

	}
	public static void main(String[] args) {
		NorthGetNBISql_new sql = new NorthGetNBISql_new(1);
		String url = "http://192.168.15.226:8088/services/SQLBuilderService.asmx?wsdl";
		String type = "NBI_PERF_MSC_1X";
		String xml = sql.getNBISql(url, type);
		System.out.println(xml);
	}

}
