package cn.uway.nbi.task.templet.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

/**
 * FreeMarker管理器
 * 
 * @author litp 2011-5-9
 */
public class FreeMarkerMgr {

	private static final Logger LOG = LoggerFactory.getLogger(FreeMarkerMgr.class);

	/** 文件分隔符 */
	public static final String F_SEP = File.separator;

	/** 要生成文件的模板 */
	public static final String TEMPLET_PATH_FOR_FILE = "." + F_SEP + "templet/file" + F_SEP;

	public static final String FREEMARKER_PROPERTIES_PATH = "." + F_SEP + "conf" + F_SEP + "freemarkerutils.properties";

	private Configuration cfg;

	private static Properties p = new Properties();

	public FreeMarkerMgr() {
		init();
	}

	private static class FMMgrContainer {

		private static FreeMarkerMgr instance = new FreeMarkerMgr();
	}

	public static FreeMarkerMgr getInstance() {
		return FMMgrContainer.instance;
	}

	/** 初始化FreeMarker配置 */
	private void init() {
		InputStream in = null;
		try {
			// 加载freemarker自定义工具类
			in = new FileInputStream(FREEMARKER_PROPERTIES_PATH);
			p.load(in);
		} catch (IOException e1) {
			LOG.error("加载属性文件({})失败.", FREEMARKER_PROPERTIES_PATH);
		} finally {
			if (in != null)
				IOUtils.closeQuietly(in);
		}
		// 创建一个Configuration实例
		cfg = new Configuration();
		// 设置对象包装器
		cfg.setObjectWrapper(new DefaultObjectWrapper());
		// 设计异常处理器
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
		try {
			// 设置FreeMarker的模版文件路径
			cfg.setDirectoryForTemplateLoading(new File(TEMPLET_PATH_FOR_FILE));

			cfg.setDefaultEncoding("UTF-8");
		} catch (IOException e) {
			LOG.error("设置FreeMarker的模版文件路径({})时错误.{}", TEMPLET_PATH_FOR_FILE, e);
		}

	}

	/**
	 * 数据处理(生成目标文件)
	 * 
	 * @param root
	 *            包装数据的集合
	 * @param templateName
	 *            模板文件名
	 * @param out
	 *            字节输出流
	 */
	public void process(Map<String, Object> root, String templateName, OutputStream out) throws Exception {
		process(root, templateName, new OutputStreamWriter(out));
	}

	/**
	 * 数据处理(生成目标文件)
	 * 
	 * @param root
	 *            包装数据的集合
	 * @param templateName
	 *            模板文件名
	 * @param out
	 *            字符输出流
	 */
	public void process(Map<String, Object> root, String templateName, Writer out) throws Exception {
		Template t = cfg.getTemplate(templateName);
		t.setEncoding("UTF-8");
		try {
			Enumeration<Object> em = p.keys();
			while (em.hasMoreElements()) {
				String key = (String) em.nextElement();
				String value = p.getProperty(key);
				Class<?> c = Class.forName(value);
				root.put(key, c.newInstance());
			}
		} catch (Exception e) {
			LOG.error("加载FreeMarker模板({})出现异常,原因:({})", FREEMARKER_PROPERTIES_PATH, e);
		}

		t.process(root, out);
		out.flush();
		out.close();
	}

	public static void main(String s[]) {
		// Map<String, Object> root = new HashMap<String, Object>();
		// // root.put(key, value)
		// FileWriter out;
		// try
		// {
		// out = new FileWriter("./templet/out/out.txt");
		// FreeMarkerMgr.getInstance().process(root, "util.ftl", out);
		// }
		// catch (IOException e)
		// {
		// e.printStackTrace();
		// }
		// catch (Exception e)
		// {
		// e.printStackTrace();
		// }

		String s1 = "基站标识";
		try {
			String s2 = new String(s1.getBytes("gbk"), "gbk");
			System.out.println(s2);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
