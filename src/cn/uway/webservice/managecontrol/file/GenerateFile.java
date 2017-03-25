package cn.uway.webservice.managecontrol.file;

/**
 * 生成上报文件
 * 
 * @author yanb @ 2013年10月9日
 */
public interface GenerateFile {

	void makeFile(String fileName, Object context) throws Exception;

	void makeFile(String fileName, Object context, boolean append) throws Exception;

	void close() throws Exception;
}
