package cn.uway.nbi.db.dao;

import java.util.List;

/**
 * 抽象DAO
 * 
 * @author litp 2011-4-21
 */
public abstract class AbstractDAO<T> implements DAO<T> {

	public AbstractDAO() {
		super();
	}

	@Override
	public List<T> find(String hql) throws Exception {
		return null;
	}

	@Override
	public void delete(T entity) throws Exception {

	}

	@Override
	public void add(T entity) throws Exception {

	}

	public abstract boolean update(T entity) throws Exception;

	@Override
	public List<T> loadTasks() throws Exception {
		return null;
	}

}
