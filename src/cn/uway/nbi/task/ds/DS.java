package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.nbi.ftp.FtpFileUnit;

/**
 * 数据源接口
 * 
 * @author liuwx
 */
public interface DS {

	public void setFileds(Map<String, String> elementMap);

	public int getIDMemberId();

	public void setFtpFileUnitMap(Map<String, FtpFileUnit> ftpFileUnitMap);
}
