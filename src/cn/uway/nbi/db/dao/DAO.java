package cn.uway.nbi.db.dao;

import java.util.List;

/**
 * @author liuwx
 * @version 1.0
 */
public interface DAO<T> {

	public List<T> find(String hql) throws Exception;

	public void delete(T entity) throws Exception;

	public void add(T entity) throws Exception;

	public boolean update(T entity) throws Exception;

	public List<T> loadTasks() throws Exception;
}