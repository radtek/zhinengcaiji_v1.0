package cn.uway.webservice.managecontrol;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.encoding.XMLType;
import org.codehaus.xfire.client.Client;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EMOSTest {

	private static final Logger LOG = LoggerFactory.getLogger(EMOSTest.class);

	/**
	 * @param method
	 *            访问的方法名
	 * @param type
	 *            类型
	 * @param id
	 *            id值
	 */
	public static void test(String method, String type, String id) {
		try {
			// 1.创建service对象，通过axis自带的类创建
			org.apache.axis.client.Service service = new org.apache.axis.client.Service();

			// 2.创建url对象
			String wsdlUrl = "http://192.168.15.99:8088/nbi/services/DTService?wsdl";// 请求服务的URL
			URL url = new URL(wsdlUrl);// 通过URL类的构造方法传入wsdlUrl地址创建URL对象

			// 2.创建服务方法的调用者对象call，设置call对象的属性
			Call call = (Call) service.createCall();
			call.setTargetEndpointAddress(url);// 给call对象设置请求的URL属性

			call.setOperationName(method);// 给call对象设置调用方法名属性
			// 给call对象设置方法的参数名、参数类型、参数模式
			call.addParameter("type", XMLType.XSD_STRING, ParameterMode.IN);
			String idName = "btsid";
			if ("getBtsDetailInfoXML".trim().equals(method)) {
				idName = "id";
			}
			boolean searchInfo = false;
			if (id != null && !"".equals(id.trim())) {
				searchInfo = true;
				call.addParameter(idName, XMLType.XSD_STRING, ParameterMode.IN);
			}
			call.addParameter("userName", XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter("password", XMLType.XSD_STRING, ParameterMode.IN);
			call.setReturnType(XMLType.SOAP_STRING);// 设置调用方法的返回值类型

			// 4.通过invoke方法调用webservice
			// g btsid 0088170535006000 id 0080800200087550 / w btsid
			// 2080200328626000 id 2080200321054361
			//
			String res = null;
			if (searchInfo) {
				res = (String) call.invoke(new Object[]{type, id, "dt_username", "dt_password"});// 调用服务方法
			} else {
				res = (String) call.invoke(new Object[]{type, "dt_username", "dt_password"});// 调用服务方法
			}
			// write(res, new
			// File("D:"+File.separator+"test"+File.separator+"json.txt"));
			System.out.println("-----finish------\n" + res);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public static void write(String text, File file) {
		try {
			if (file.exists()) {
				file = new File(file.getAbsoluteFile() + "_0");
			}
			FileWriter out = new FileWriter(file, false);
			BufferedWriter bos = new BufferedWriter(out);
			bos.append(text, 0, text.length());
			bos.flush();
			bos.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String zipText(String text, String encoding) {
		ByteArrayOutputStream out = null;
		GZIPOutputStream gzip = null;
		String str = null;
		try {
			out = new ByteArrayOutputStream();
			gzip = new GZIPOutputStream(out);
			gzip.write(text.getBytes());
			gzip.close();
			str = out.toString(encoding);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return str;

	}

	public static String unzipText(String zipText, String encoding) {
		try {
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			ByteArrayInputStream in = new ByteArrayInputStream(zipText.getBytes(encoding));
			GZIPInputStream upzip = new GZIPInputStream(in);
			byte[] read = new byte[256];
			int n = 0;
			while ((n = upzip.read(read)) > -1) {
				out.write(read, 0, n);
			}
			out.flush();
			out.close();
			upzip.close();
			return out.toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	public void test5() {
		String url = "http://localhost:8088/nbi/services/EMOSWebService?wsdl";
		String result = null;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("EMOSQuery", new Object[]{"{WN海心沙看台4区}", 1});
			result = (String) results[0];
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test6() {
		String url = "http://localhost:8088/nbi/services/EMOSWebService?wsdl";
		String result = null;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("EMOSQuery", new Object[]{"罗定谈滨", 0});
			result = (String) results[0];
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test7() {
		String url = "http://localhost:8088/nbi/services/EMOSWebService?wsdl";
		Integer result = 0;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("EMOSAsyncQuery", new Object[]{"W市委党校", 1});
			result = (Integer) results[0];
			System.out.println(result);
			Object[] results1 = client.invoke("EMOSAsyncQuery", new Object[]{"WN海心沙看台4区", 0});
			result = (Integer) results1[0];
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test8() {
		String url = "http://localhost:8088/nbi/services/UwayNoapService?wsdl";
		Integer result = 0;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("UwayKpiQueryAsync", new Object[]{"2013-08-08"});
			result = (Integer) results[0];
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test9() {
		String url = "http://192.168.15.123:8088/nbi/services/DcsWebService?wsdl";
		String result;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("dcsSceneSyncQuery", new Object[]{});
			result = String.valueOf(results[0]);
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test10() {
		String url = "http://192.168.15.123:8088/nbi/services/DcsWebService?wsdl";
		String result;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("dcsSceneCellSyncQuery", new Object[]{});
			result = String.valueOf(results[0]);
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public void test11() {
		String url = "http://192.168.15.123:8088/nbi/services/DcsWebService?wsdl";
		String result;
		// url = "http://192.168.15.225/cnoap_nbi/KpiSQLToolService.asmx?wsdl";
		try {
			Client client = new Client(new URL(url));
			Object[] results = client.invoke("dcsSceneBuildingSyncQuery", new Object[]{});
			result = String.valueOf(results[0]);
			System.out.println(result);
		} catch (Exception e) {
			LOG.error("调用泰合佳厂家性能数据异步查询回调服务(TescommCallBackService:EMOSCallBack)失败，原因", e);
		}

	}

	public static void main(String[] args) throws IOException {
		EMOSTest test = new EMOSTest();
		// test.test5();
		// test.test6();
		// test.test7();
		// test.test8();
		test.test9();
		test.test10();
		test.test11();
	}
}
