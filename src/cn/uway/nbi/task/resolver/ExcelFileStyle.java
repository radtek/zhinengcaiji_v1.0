package cn.uway.nbi.task.resolver;

/**
 * excel文件每列生成的样式
 * 
 * @author yanb @ 2013年10月14日
 */
public class ExcelFileStyle {

	private int index;

	private String filedName;

	private String filedType;

	private String style;

	public int getIndex() {
		return this.index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getFiledName() {
		return this.filedName;
	}

	public void setFiledName(String filedName) {
		this.filedName = filedName;
	}

	public String getFiledType() {
		return this.filedType;
	}

	public void setFiledType(String filedType) {
		this.filedType = filedType;
	}

	public String getStyle() {
		return this.style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}
