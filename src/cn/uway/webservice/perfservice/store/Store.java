package cn.uway.webservice.perfservice.store;

/**
 * 缓存接口
 * 
 * @author liuwx
 */
public interface Store {

	public void init();

	// public boolean addElement(String key, Object element,String groupKey);

	public boolean addElement(String key, Object element, String groupKey, String[] headArr);

	// public Object getElement(String key);

	public Object getElement(IndexElement indexElement);

}
