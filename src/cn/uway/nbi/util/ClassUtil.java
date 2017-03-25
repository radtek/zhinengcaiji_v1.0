package cn.uway.nbi.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 类处理工具(加载同包中已知接口的实现类)
 * 
 * @author litp 2011-5-18
 */
public class ClassUtil {

	/**
	 * 给一个接口，返回这个接口的所有实现类
	 * 
	 * @param clazz
	 *            已经接口
	 * @return 此接口的所有实现类
	 * @throws Exception
	 */
	public static List<Class<?>> getAllClassByInterface(Class<?> clazz) throws Exception {
		List<Class<?>> subClassList = new ArrayList<Class<?>>(); // 返回结果
		// 如果不是一个接口，则不做处理
		// if ( !clazz.isInterface() )
		// return subClassList;
		String packageName = clazz.getPackage().getName(); // 获得当前的包名
		List<Class<?>> allClass = getClasses(packageName); // 获得当前包下以及子包下的所有类
		for (Class<?> c : allClass) {
			// 如果不是同一接口或者是它自己，都不加进去
			if (!clazz.isAssignableFrom(c) || clazz.equals(c))
				continue;
			subClassList.add(c);
		}
		return subClassList;
	}

	/**
	 * 从一个包中查找出所有的类，在jar包中不能查找
	 * 
	 * @throws Exception
	 */
	private static List<Class<?>> getClasses(String packageName) throws Exception {
		ArrayList<Class<?>> classes = new ArrayList<Class<?>>();
		String path = packageName.replace('.', '/');
		String jar = ClassUtil.class.getProtectionDomain().getCodeSource().getLocation().getFile();
		if (jar.endsWith(".jar")) {
			JarFile jf = new JarFile(jar);
			Enumeration<JarEntry> es = jf.entries();
			while (es.hasMoreElements()) {
				String name = es.nextElement().getName();
				if (!name.startsWith(path))
					continue;

				name = name.replace('/', '.');
				Class<?> c = getClass(name);
				if (c != null)
					classes.add(c);
			}
		} else {
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			// path路径下的所有资源
			Enumeration<URL> resources = classLoader.getResources(path);
			while (resources.hasMoreElements()) {
				// 获取此 URL 的文件名
				String fileName = resources.nextElement().getFile();
				classes.addAll(findClasses(new File(fileName), packageName));
			}
		}

		return classes;
	}

	/**
	 * @param directory
	 *            文件目录
	 * @param packageName
	 *            包名
	 * @return
	 * @throws Exception
	 */
	private static List<Class<?>> findClasses(File directory, String packageName) throws Exception {
		List<Class<?>> classes = new ArrayList<Class<?>>();
		if (!directory.exists())
			return classes;
		File[] files = directory.listFiles();
		for (File file : files) {
			String name = file.getName();
			if (name.contains(".svn"))
				continue;
			if (file.isDirectory()) {
				if (name.contains("."))
					throw new Exception("包名(" + file.getCanonicalPath() + ")路径中含有逗号(.)!");

				classes.addAll(findClasses(file, packageName + "." + name));
			} else {
				Class<?> c = getClass(packageName + '.' + name);
				if (c != null)
					classes.add(c);

			}
		}
		return classes;
	}

	private static Class<?> getClass(String name) throws ClassNotFoundException {
		Class<?> c = null;
		if (name.endsWith(".class")) {
			String fileName = name.substring(0, name.length() - 6);
			c = Class.forName(fileName);
		}
		return c;
	}
	
	/**
	 * 加载xml中的子节点
	 * 
	 * @throws Exception
	 */
	public static  Map<String, String> getProperties(Element parentE) throws Exception {
	
		List<Element> es = parentE.elements();
		if (es == null || es.isEmpty())
			throw new Exception("子元素为空,载入失败");
		Map<String, String> eMap = new LinkedHashMap<String, String>();
		for (Element e : es) {
			String tagName = e.getName();
			if ("property".equals(tagName)) {
				String name = e.attributeValue("name");
				String content = e.getText();
				eMap.put(name, content);
			}
		}
		return eMap;
	}
	
 /**
  * 把 connection-info.xml 中  conn 元素  指定的 ID ，  相关信息 包装成Map 返回。
  * @param connectionName  connection-info.xml 中的conn 元素的 ID值 
  * @return
  * @throws Exception
  */
	public static  Map<String, String> getConnctioninfoFileProperties(String connectionName) throws Exception   {
		connectionName=connectionName.replace("${", "").replace("}", "");
		Map<String,String > returnMap=new HashMap<String,String> ();
		Map<String, Map<String,String>> connectionAllMap=new HashMap<String,Map<String,String>> ();

		InputStream in = null;
		 Document doc=null;
		try {
			in = new FileInputStream(ConstDef.TEMPLET_CONNECTION_INFO);
			doc = new SAXReader().read(in);
			
			if (doc.selectSingleNode("/config") == null){
				throw new Exception("未发现根节点config"); 
			}
			
			List<Element> connList = doc.selectNodes("/config/conn");
			if (connList == null || connList.isEmpty()){
				throw new Exception("connection-info.xml中没有conn节点或者为空");
			}else{
				for (Element e : connList) {
					
					String strId = e.attributeValue("id");
					if (StringUtils.isEmpty(strId)){
						throw new Exception("connection-info.xml中没有conn节点的id不能为空！");
					}
					 
					connectionAllMap.put(strId, ClassUtil.getProperties(e));
					
					 
				}
			}
				
				if(connectionAllMap.get(connectionName)!=null){
					returnMap=connectionAllMap.get(connectionName); 
				}else{
					throw new Exception("connection-info.xml中没有id为"+connectionName+"的conn节点！");
				}
			
		}catch(Exception e){
			throw   e;
			
		}
		
		return returnMap;
	}
	

	public static void main(String[] args) throws Exception {
	}
}