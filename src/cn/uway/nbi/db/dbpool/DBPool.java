package cn.uway.nbi.db.dbpool;

import java.sql.Connection;

/**
 * 数据库连接池接口
 * 
 * @author liuwx
 * @since 1.0 2011-04-18
 */
public interface DBPool {

	/* 初始化 */
	public void init() throws Exception;

	/* 创建数据库连接池 */
	public void createDBPool() throws Exception;

	/* 获得连接 */
	public Connection getConnection() throws Exception;

	/* 关闭数据库连接池 */
	public void close() throws Exception;

	/* 数据库连接池销毁,释放资源 */
	public void destory() throws Exception;

}
