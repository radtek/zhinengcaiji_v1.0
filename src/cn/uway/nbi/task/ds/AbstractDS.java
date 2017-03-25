package cn.uway.nbi.task.ds;

import java.util.Map;

import cn.uway.nbi.framework.IDMember;
import cn.uway.nbi.ftp.FtpFileUnit;

/**
 * 抽象数据源
 * 
 * @author liuwx
 * @version 1.0
 * @created 22-二月-2011 16:10:57
 */
public abstract class AbstractDS implements DS {

	protected int id;//

	protected int type;// 采集类型(100: db 200:file(200:local file , 201: ftp file)
						// 300:socket 400:others)

	protected Map<String, FtpFileUnit> ftpFileUnitMap;

	protected String encode; // 本地文件编码

	public AbstractDS() {

	}

	public AbstractDS(int id, int type) {
		super();
		this.id = id;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Map<String, FtpFileUnit> getFtpFileUnitMap() {
		return ftpFileUnitMap;
	}

	public void setFtpFileUnitMap(Map<String, FtpFileUnit> ftpFileUnitMap) {
		this.ftpFileUnitMap = ftpFileUnitMap;
	}

	@Override
	public int getIDMemberId() {
		IDMember member = getClass().getAnnotation(IDMember.class);
		return member.id();
	}

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
	}
}