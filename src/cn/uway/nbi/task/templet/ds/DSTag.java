package cn.uway.nbi.task.templet.ds;

/**
 * 数据源模板(DataSource)
 * 
 * @author litp 2011-4-18
 */
public abstract class DSTag {

	protected int id;//

	protected int type;// 采集类型(100: db 200:file(200:local file , 201: ftp file)
						// 300:socket 400:others)

	public DSTag() {

	}

	public DSTag(int id, int type) {
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
}
