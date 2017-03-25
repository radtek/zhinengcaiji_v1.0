package cn.uway.nbi.task.templet;

import static cn.uway.nbi.util.ConstDef.ALIAS_MAPING_PATH;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.commons.type.StringUtil;
import cn.uway.nbi.bsa.BsaUtil;
import cn.uway.nbi.db.pojo.CheckListLog;
import cn.uway.nbi.db.pojo.RTask;
import cn.uway.nbi.db.pojo.Task;
import cn.uway.nbi.framework.ClassMgr;
import cn.uway.nbi.framework.ProvinceNameMgr;
import cn.uway.nbi.task.ds.AbstractDS;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.resolver.Resolver;
import cn.uway.nbi.task.t.Strategy;
import cn.uway.nbi.task.t.TAction;
import cn.uway.nbi.task.t.TI;
import cn.uway.nbi.task.t.TO;
import cn.uway.nbi.task.triggerbean.TriggerBean;
import cn.uway.nbi.util.ClassUtil;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * 模板解析类
 * 
 * @author litp 2011-4-18
 */
public class TempletParser {

	private Map<Integer, DS> dsMap;

	private Map<Integer, TO> toMap;

	private Map<Integer, TI> tiMap;

	private Map<Integer, Strategy> strategyMap;

	private Map<Integer, TAction> tactionMap;

	private Map<Integer, TriggerBean> triggers;

	private Include include;

	private Templet templet;

	private String fileName;

	private Document doc;
	
	private Task task;

	private final static Logger LOG = LoggerFactory.getLogger(TempletParser.class);

	public TempletParser(Task task) {
		this.task = task;
		this.fileName = task.getTempletPath();
		init();
	}

	private void init() {
		dsMap = new HashMap<Integer, DS>();
		toMap = new HashMap<Integer, TO>();
		tiMap = new HashMap<Integer, TI>();
		tactionMap = new HashMap<Integer, TAction>();
		triggers = new HashMap<Integer, TriggerBean>();
		strategyMap = new HashMap<Integer, Strategy>();
	}

	private void clear() {
		dsMap.clear();
		toMap.clear();
		tiMap.clear();
		tactionMap.clear();
		triggers.clear();
	}

	public void parse() throws Exception {
		LOG.info("开始解析模板:({})", fileName);
		clear();
		InputStream in = null;
		try {
			in = new FileInputStream(fileName);
			doc = new SAXReader().read(in);
			if (doc.selectSingleNode("/config") == null)
				throw new Exception("未发现根节点config");
			// 加载映射文件
			loadMapping();

			// 注意加载顺序
			loadDS();
			loadTrigger();
			// loadStragety();
			loadStrategy();
			loadTOs();
			loadTIs();
			loadTs();
			// 最后构建模板对象
			buildTemplet();
		} finally {
			if (doc != null)
				doc.clearContent();
			if (in != null)
				in.close();
		}
		LOG.info("模板({})解析完毕！", fileName);
	}

	@SuppressWarnings("unchecked")
	private void loadMapping() throws Exception {
		Element e = (Element) doc.selectSingleNode("/config/include");
		if (e != null) {
			List<Element> eList = e.elements();
			if (eList != null && eList.size() > 0) {
				include = new Include();
				List<String> mList = new ArrayList<String>();// 存储多个mapping文件路径
				for (Element el : eList) {
					if (el.getName() != "property")
						continue;
					String name = el.attributeValue("name");
					if (name != null && name.equalsIgnoreCase("mapping")) {
						String path = ALIAS_MAPING_PATH + el.getText().trim();
						File f = new File(path);
						if (f.exists())
							mList.add(path);
						else
							LOG.warn("文件{}不存在.请确定配置", el.getText());
					}
					if (name != null && name.equalsIgnoreCase("loop")) {
						include.setLoop("true".equalsIgnoreCase(el.getText()) ? true : false);
					}
				}
				include.setMapingList(mList);
				Map<String, String> proviceMap = new HashMap<String, String>();// 存储省相关英文对应名
																				// ，以及通配符
				Map<String, Map<String, String>> cityMap = new HashMap<String, Map<String, String>>();// 存储城市的相关英文对应名,以及通配符
				/* 遍历并合并为一个集合(省，城市),并去重复 */
				for (String path : mList) {
					ProvinceNameMgr pro = new ProvinceNameMgr(path);
					for (Entry<String, Map<String, String>> en : pro.getCityMap().entrySet()) {
						if (!cityMap.containsKey(en.getKey())) {
							cityMap.put(en.getKey(), en.getValue());
						}
					}
					for (Entry<String, String> en : pro.getProvinceMap().entrySet()) {
						if (!proviceMap.containsValue(en.getValue())) {
							proviceMap.put(en.getKey(), en.getValue());
						}
					}
				}
				include.setProviceMap(proviceMap);
				include.setCityMap(cityMap);
			}

		}
	}

	/** 获取解析模板后对应的对象 */
	public Templet getTemplet() {
		return templet;
	}

	/** 构建模板 */
	private void buildTemplet() throws Exception {
		templet = new Templet();
		templet.setActions(new HashMap<Integer, TAction>(tactionMap));
		templet.setInclude(include);
	}

	// private void loadStragety() throws Exception
	// {
	// @SuppressWarnings("unchecked")
	// List<Element> strategyList = doc.selectNodes("/config/strategy");
	// if ( strategyList == null || strategyList.isEmpty() )
	// throw new Exception("没有trigger节点或者为空");
	//
	// for (Element e : strategyList)
	// {
	// Map<String, String> eMap = getProperties(e);
	// StrategyTag s = new StrategyTag();
	// String strId = e.attributeValue("id");
	// String maxTstr = e.attributeValue("maxtimes");
	// if ( StringUtils.isEmpty(strId) )
	// strId = "0";
	// if ( StringUtils.isEmpty(maxTstr) )
	// maxTstr = "3";
	//
	// int id = Integer.parseInt(strId);
	// int maxTimes = Integer.parseInt(maxTstr);
	// String failStr = eMap.get("failure");
	// if ( failStr != null )
	// s.setFailList(new ArrayList<String>(Arrays.asList(failStr.split(","))));
	// s.setMaxTimes(maxTimes);
	// strategys.put(id, s);
	// }
	// }

	@SuppressWarnings("unchecked")
	private void loadTrigger() throws Exception {
		List<Element> triggerList = doc.selectNodes("/config/trigger");
		if (triggerList == null || triggerList.isEmpty())
			throw new Exception("没有trigger节点或者为空");

		for (Element e : triggerList) {

			String strId = e.attributeValue("id");
			if (StringUtils.isEmpty(strId))
				strId = "0";

			String classBean = e.attributeValue("class");
			if (StringUtil.isNull(classBean)) {
				return;
			}
			int id = Integer.parseInt(strId);
			// add by tyler start--如果trigger下的property节点，name属性为"conn_id"并且内容以"${"开头,那么就只执行新的逻辑，原逻辑不执行；
			if(parseTriggerPops(e, id, classBean)){
				return;
			}
			// add by tyler end
			//下面内容认为trigger下面的所有property节点都是sql语句；
			List<String> sql = getPropertiesList(e);
			List<String> bsaSql = new ArrayList<String>();
			if (SysCfg.getInstance().getModelId() == ConstDef.BSA) {
				for (String string : sql) {
					bsaSql.addAll(BsaUtil.getBsaSql(string, 2));
				}
				sql = bsaSql;
			}

			if (sql != null) {
				// TriggerBean trigger = ClassMgr.getInstance()
				// .getTriggerBean(id);
				TriggerBean trigger = null;
				try {
					Object obj = Class.forName(classBean).newInstance();

					if (obj instanceof TriggerBean) {
						trigger = (TriggerBean) obj;
						if (trigger != null) {
							trigger.setParam(sql);
							triggers.put(id, trigger);
						}
					}
				} catch (Exception e1) {
					LOG.warn(fileName + " trigger bean 不存在，可以忽略掉.");
				}
			}
		}
	}
	
	/**
	 * 尝试解析trigger下是否存在<property name="conn_id">${xxx_ftp}</property></br>
	 * ${xxx_ftp}配置于connection-info.xml中</br>
	 * 如果存在，原罗辑将不会执行；如果不存在仍将执行原逻辑；
	 */
	@SuppressWarnings({"unchecked"})
	private boolean parseTriggerPops(Element e,int id ,String classBean) throws Exception{
		boolean connFlag = false;
		List<Element> es = e.elements();
		if (es == null || es.isEmpty())
			throw new Exception("子元素为空,载入失败");
		for (Element ele : es) {
			String tagName = ele.getName();
			if (!"property".equals(tagName)) {
				continue;
			}
			String name = ele.attributeValue("name");
			String content = ele.getText();
			if ("conn_id".equals(name) && content.startsWith("${")) {
				connFlag = true;
				break;
			}
		}
		if (connFlag) {
			Map<String, String> map = getProperties(e);
			if(map.containsKey("file_name")){
				map.put("file_name", explain(map.get("file_name")));
			}
			if(map.containsKey("path")){
				map.put("path", explain(map.get("path")));
			}
			try {
				Object obj = Class.forName(classBean).newInstance();

				if (obj instanceof TriggerBean) {
					TriggerBean trigger = (TriggerBean) obj;
					if (trigger != null) {
						trigger.setParam(map);
						triggers.put(id, trigger);
					}
				}
			} catch (Exception e1) {
				LOG.warn(fileName + " trigger bean 不存在，可以忽略掉.");
			}
		}
		return connFlag;
	}
	
	private String explain(String path){
		//TODO 此处还可以添加其它需要转换的逻辑，比如：城市ID替换
		path = ProvinceNameMgr.replaceProvince(path, include.getProviceMap());
		path = ConstDef.ParseFilePath(path, new Timestamp(task.getCurrDataTime().getTime()-SysCfg.getInstance().getDelyTime()));
		return path;
	}

	@SuppressWarnings("unchecked")
	private void loadTIs() throws Exception {
		List<Element> tiList = doc.selectNodes("/config/ti");
		if (tiList == null || tiList.isEmpty())
			throw new Exception("没有ti节点或者为空");

		for (Element e : tiList) {
			String strId = e.attributeValue("id");
			if (StringUtils.isEmpty(strId))
				strId = "0";
			int id = Integer.parseInt(strId);
			TI ti = null;
			// String strAft = e.attributeValue("after");
			Map<String, String> eMap = getProperties(e);

			boolean uflag = true;
			String uploadflag = e.attributeValue("uploadflag");
			if (StringUtil.isNotNull(uploadflag)) {
				if (!("true".equals(uploadflag) || "1".equals(uploadflag)))
					uflag = false;
			}

			boolean b = false;
			String fpass = eMap.get("conn_ftp_passive");
			if (StringUtil.isNotNull(fpass)) {
				// add by yanbo 2013-10-30
				// 修改ftp上传文件时，只能选择被动模式的情况，为了兼容以前的程序conn_ftp_passive不配置也
				// 为被动模式，只要有conn_ftp_passive且不为1就是主动模式，但是对于ftp下载文件来说，
				// conn_ftp_passive不配置是主动模式。nbi没有ftp下载，所以不考虑兼容以前的。如果重构注意这里
				b = fpass.equals("1") ? true : false;
			} else {
				b = true;
			}
			String path = eMap.get("path");
			path = path.replace("\\\\", "/").replace("\\", "/").replace("//", "/");
			if (!path.endsWith("/"))
				path = path + File.separator;
			
			path = explain(path);
			// 如果有多个参数，那么就是异地传输，否则就为本地传输
			if (eMap.size() > 1)
				ti = new TI(id, eMap.get("ftpip"), Integer.parseInt(eMap.get("port")), eMap.get("username"), eMap.get("password"), path,
						eMap.get("encode"), b, uflag);
			else
				ti = new TI(id, path, uflag);
			// oss2.0 公用字段设置
			task.getLog().setFilePath(path);
			tiMap.put(id, ti);
		}
	}

	@SuppressWarnings("unchecked")
	private void loadStrategy() throws Exception {
		List<Element> tiList = doc.selectNodes("/config/strategy");
		if (tiList == null || tiList.isEmpty())
			throw new Exception("没有strategy节点或者为空");

		for (Element e : tiList) {
			String strId = e.attributeValue("id");
			if (StringUtils.isEmpty(strId))
				strId = "0";
			int id = Integer.parseInt(strId);

			Strategy strategy = new Strategy();
			// String strAft = e.attributeValue("after");
			Map<String, String> eMap = getProperties(e);
			// 如果有多个参数，那么就是异地传输，否则就为本地传输

			String ids = eMap.get("ids");
			if (StringUtils.isEmpty(ids))
				continue;
			List<TriggerBean> triggerList = new ArrayList<TriggerBean>();
			for (String tid : ids.split(",")) {
				if (StringUtils.isEmpty(tid))
					continue;
				TriggerBean trig = triggers.get(Integer.valueOf(tid));

				triggerList.add(trig);

			}
			strategy.setTriggerList(triggerList);
			strategyMap.put(id, strategy);
		}
	}

	@SuppressWarnings("unchecked")
	private void loadTs() throws Exception {
		Element t = (Element) doc.selectSingleNode("/config/t");
		if (t == null)
			throw new Exception("没有t节点或者为空");

		List<Element> list = t.elements();
		for (Element e : list) {
			String tagName = e.getName();
			if (!"action".equals(tagName))
				continue;
			int id = Integer.parseInt(e.attributeValue("id"));
			int toid = Integer.parseInt(e.attributeValue("toid"));
			String tiids = e.attributeValue("tiid");
			int strategyid = Integer.parseInt(e.attributeValue("strategyid"));

			boolean is_delete_fileFlag = false;
			String is_delete_file = e.attributeValue("is_delete_file");
			if (StringUtil.isNotNull(is_delete_file)) {
				if (("true".equals(is_delete_file) || "1".equals(is_delete_file)))
					is_delete_fileFlag = true;
			}

			TO to = toMap.get(toid);
			String[] tiidtmp = tiids.split(",");
			TreeMap<Integer, TI> tiMapTmp = new TreeMap<Integer, TI>();
			for (String tiid : tiidtmp) {
				if (StringUtil.isNull(tiid))
					continue;
				int tiidkey = Integer.valueOf(tiid);
				TI ti = tiMap.get(tiidkey);
				if (!tiMapTmp.containsKey(tiidkey))
					tiMapTmp.put(tiidkey, ti);
			}
			Strategy strategy = strategyMap.get(strategyid);
			TAction action = new TAction(id, to, tiMapTmp, strategy, is_delete_fileFlag);
			tactionMap.put(id, action);
		}
	}

	@SuppressWarnings("unchecked")
	private void loadTOs() throws Exception {
		List<Element> toList = doc.selectNodes("/config/to");
		if (toList == null || toList.isEmpty())
			throw new Exception("没有to节点或者为空");

		for (Element e : toList) {
			TO to = new TO();
			int toId = Integer.parseInt(e.attributeValue("id"));
			to.setId(toId);

			String package_name = e.attributeValue("package_name");

			if (StringUtil.isNull(package_name))
				package_name = null;
			to.setPackerName(package_name);
			
			to.setCheckName(e.attributeValue("checkName"));
			
			to.setXmlName(e.attributeValue("xmlName"));
			to.setChkName(e.attributeValue("chkName"));
			to.setFinishTime(e.attributeValue("finishTime"));
			
			// oss2.0公用字段设置
			CheckListLog log = task.getLog();
			if(task instanceof RTask){
				log.setTaskId(((RTask) task).getTaskId());
			}
			else{
				log.setTaskId(task.getId());
			}
			
			log.setDataTime(task.getCurrDataTime());
			log.setSpeciality(e.attributeValue("speciality"));
			log.setFileSource(e.attributeValue("source"));
			log.setFileTarget(e.attributeValue("target"));
			log.setDataType(e.attributeValue("dataType"));
			log.setSystemName("NBI");
			task.setLastPack(e.attributeValue("lastPack"));
			
			List<Element> es = e.elements();
			List<Resolver> resolveList = new ArrayList<Resolver>();
			for (Element ee : es) {
				String tagName = ee.getName();

				// add by liu
				// if ( "package".equals(tagName) )
				// {
				// PackageTag pack = getPack(ee);
				// to.setPackerName(pack.getFilename());
				// }
				// else
				if ("resolve".equals(tagName)) {
					int dsId = Integer.parseInt(ee.attributeValue("dsid"));
					DS ds = dsMap.get(dsId);
					if (ds == null)
						throw new Exception("没有id为(" + dsId + ")的数据源！");

					String package_ame = ee.attributeValue("package_name");

					if (StringUtil.isNotNull(package_ame))
						package_ame = package_ame.trim();
					else
						package_ame = null;

					Resolver resolver = ClassMgr.getInstance().getResolverById(ds.getIDMemberId());
					resolver.setDs(ds);
					resolver.setDsMap(dsMap);// add
					resolver.setElement(ee);
					// add on 20131202
					resolver.setPackageNameResolver(package_ame);
					// end add
					resolveList.add(resolver);
					resolver.setStrategyMap(strategyMap);

				}
			}
			to.setResolvers(resolveList);
			toMap.put(toId, to);
		}
	}

	@SuppressWarnings("unchecked")
	private void loadDS() throws Exception {
		List<Element> dsList = doc.selectNodes("/config/ds");
		if (dsList == null || dsList.isEmpty())
			throw new Exception("没有ds节点或者为空");

		for (Element e : dsList) {
			String strId = e.attributeValue("id");
			String strYype = e.attributeValue("type");
			if (StringUtils.isEmpty(strId))
				throw new Exception("ds节点的id不能为空！");
			if (StringUtils.isEmpty(strYype))
				throw new Exception("id为(" + strId + ")的ds节点type为空");

			Map<String, String> elementMap = getProperties(e);
			int type = Integer.parseInt(strYype);
			int id = Integer.parseInt(strId);
			AbstractDS ds = (AbstractDS) ClassMgr.getInstance().getDSByType(type);
			ds.setId(id);
			ds.setType(type);
			ds.setFileds(elementMap);
			ds.setEncode(elementMap.get("encode"));
			dsMap.put(id, ds);
		}
	}

	/**
	 * 加载property节点
	 * 
	 * @throws Exception
	 */
	private List<String> getPropertiesList(Element parentE) throws Exception {
		@SuppressWarnings("unchecked")
		List<Element> es = parentE.elements();
		// if ( es == null || es.isEmpty() )
		// throw new Exception("子元素为空,载入失败");
		List<String> eMap = new ArrayList<String>();
		for (Element e : es) {
			String tagName = e.getName();
			if ("property".equals(tagName)) {
				String content = e.getText();
				eMap.add(content);
			}
		}
		return eMap;
	}

	/**
	 * 加载property节点
	 * 
	 * @throws Exception
	 */
	private Map<String, String> getProperties(Element parentE) throws Exception {
		@SuppressWarnings("unchecked")
		List<Element> es = parentE.elements();
		if (es == null || es.isEmpty())
			throw new Exception("子元素为空,载入失败");
		Map<String, String> elementMap = new LinkedHashMap<String, String>();
		for (Element e : es) {
			String tagName = e.getName();
			if ("property".equals(tagName)) {
				String name = e.attributeValue("name");
				String content = e.getText();
				elementMap.put(name, content);
			}
		}

		// modify jiangl 2014-10-28
		// 修改原因： 把 数据库的相关信息独立出来，在模板中只配制一个 占位符之类的。
		Map<String, String> connMap = null;
		if (elementMap.get("conn_id") != null && elementMap.get("conn_id").length() > 0) {
			try {
				// 去 connection-info.xml文件中， 读取　对应的元素
				connMap = ClassUtil.getConnctioninfoFileProperties(elementMap.get("conn_id"));
				if (connMap != null) {

					// 如果有元素 ，则把它放入到 elementMap 对像中去，如 elementMap 存在这个对象，则进行替换，没有则放入。
					Iterator i = connMap.entrySet().iterator();
					while (i.hasNext()) {

						java.util.Map.Entry entry = (java.util.Map.Entry) i.next();
						// 如果存在这个对象
						if (elementMap.get(entry.getKey().toString()) != null) {
							elementMap.remove(entry.getKey().toString());
						}

						elementMap.put(entry.getKey().toString(), entry.getValue().toString());

					}

				} else {
					LOG.error("connection-info.xml 文件 不存在id为({})的元素！", elementMap.get("connection-name"));
				}
			} catch (Exception e) {
				LOG.error("connection-info.xml 文件解析出现异常：({})！", e);
			}

		}
		return elementMap;

	}

	public Map<Integer, TriggerBean> getTriggers() {
		return triggers;
	}

	public void setTriggers(Map<Integer, TriggerBean> triggers) {
		this.triggers = triggers;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Document getDoc() {
		return doc;
	}

	public void setDoc(Document doc) {
		this.doc = doc;
	}

	public void setTemplet(Templet templet) {
		this.templet = templet;
	}

	public static void main(String[] args) {
	}
}
