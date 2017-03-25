package cn.uway.nbi.framework;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.uway.nbi.db.dao.DAO;
import cn.uway.nbi.task.ds.DS;
import cn.uway.nbi.task.resolver.Resolver;
import cn.uway.nbi.task.trigger.Trigger;
import cn.uway.nbi.task.triggerbean.TriggerBean;
import cn.uway.nbi.util.ClassUtil;

/**
 * 类实体管理器
 * 
 * @author litp 2011-5-18
 */
public class ClassMgr implements Module {

	private Map<Integer, Class<?>> dsMap;

	private Map<Integer, Class<?>> daoMap;

	private Map<Integer, Class<?>> resolverMap;

	private Map<Integer, Class<?>> triggerMap;

	private Map<Integer, Class<?>> triggerParaMap;

	private static final Logger LOG = LoggerFactory.getLogger(ClassMgr.class);

	private ClassMgr() {
		initialize();
	}

	public static ClassMgr getInstance() {
		return ClassMgrContainer.classMgr;
	}

	private static class ClassMgrContainer {

		private static ClassMgr classMgr = new ClassMgr();
	}

	@Override
	public void initialize() {
		dsMap = new HashMap<Integer, Class<?>>();

		daoMap = new HashMap<Integer, Class<?>>();

		resolverMap = new HashMap<Integer, Class<?>>();

		triggerMap = new HashMap<Integer, Class<?>>();

		triggerParaMap = new HashMap<Integer, Class<?>>();
	}

	@Override
	public void start() {
		try {
			loadClasses(daoMap, DAO.class);// 加载dao
			loadClasses(dsMap, DS.class);// 加载ds
			loadClasses(resolverMap, Resolver.class);// 加载parser

			loadClasses(triggerMap, Trigger.class);// 加载触发器
			loadClasses(triggerParaMap, TriggerBean.class);// 加载对应的bean参数名
		} catch (Exception e) {
			LOG.error("加载类信息时异常：原因：", e);
		}

	}

	/**
	 * 加载已知接口中所有注解的类信息
	 * 
	 * @param map
	 *            存放类信息的容器
	 * @param clazz
	 *            已知接口
	 * @throws Exception
	 */
	private void loadClasses(Map<Integer, Class<?>> container, Class<?> clazz) throws Exception {
		List<Class<?>> classList = ClassUtil.getAllClassByInterface(clazz);
		for (Class<?> c : classList) {
			IDMember member = c.getAnnotation(IDMember.class);
			if (member == null)
				continue;

			int id = member.id();
			if (id == -1)
				continue;

			if (container.containsKey(id)) {
				LOG.error("类({})和类({})的注解配置相同!", c.getCanonicalName(), container.get(id).getCanonicalName());
				continue;
			}
			container.put(id, c);
		}
	}

	/**
	 * 根据id获取数据源
	 * 
	 * @param id
	 * @return
	 */
	public DS getDSByType(int type) {
		DS ds = null;
		if (!dsMap.containsKey(type))
			return ds;
		try {
			ds = (DS) dsMap.get(type).newInstance();
		} catch (Exception e) {
			LOG.error("获取DS时异常：type=({}),原因：({})", type, e);
		}
		return ds;
	}

	@SuppressWarnings("rawtypes")
	public DAO getDAOById(int id) {
		DAO ds = null;
		if (!daoMap.containsKey(id))
			return ds;
		try {
			ds = (DAO) daoMap.get(id).newInstance();
		} catch (Exception e) {
			LOG.error("获取daoMap时异常：type=({}),原因：({})", id, e);
		}
		return ds;
	}

	/**
	 * 根据id获取解析器
	 * 
	 * @param id
	 * @return
	 */
	public TriggerBean getTriggerBean(int id) {
		TriggerBean triggerbean = null;
		if (!triggerParaMap.containsKey(id))
			return triggerbean;
		try {
			triggerbean = (TriggerBean) triggerParaMap.get(id).newInstance();
		} catch (Exception e) {
			LOG.error("获取TriggerBean时异常：id=({}),原因：({})", id, e);
		}
		return triggerbean;
	}

	/**
	 * 根据id获取解析器
	 * 
	 * @param id
	 * @return
	 */
	public Resolver getResolverById(int id) {
		Resolver resolver = null;
		if (!resolverMap.containsKey(id))
			return resolver;
		try {
			resolver = (Resolver) resolverMap.get(id).newInstance();
		} catch (Exception e) {
			LOG.error("获取parser时异常：id=({}),原因：({})", id, e);
		}
		return resolver;
	}

	@Override
	public String getName() {
		return this.getClass().getName();
	}

	@Override
	public void dispose() {
		dsMap = null;
		resolverMap = null;
	}

	@Override
	public void stop() {
		dsMap.clear();
		resolverMap.clear();
	}

	public static void main(String s[]) {
		ClassMgr.getInstance().start();
	}
}
