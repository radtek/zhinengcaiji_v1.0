package cn.uway.nbi.framework;

/**
 * 模块接口
 * 
 * @author litp 2011-4-19
 */
public interface Module extends NBIObject {

	/**
	 * 初始化模块
	 */
	public void initialize();

	/**
	 * 启动模块
	 */
	public void start();

	/**
	 * 何止模块
	 */
	public void stop();

	/**
	 * 销毁模块
	 */
	public void dispose();

}
