package cn.uway.nbi.validate;

public class CommonFunction {

	protected String dataType;

	protected String nameFunction;

	protected boolean isUsed = false;

	public boolean isUsed() {
		return isUsed;
	}

	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getNameFunction() {
		return nameFunction;
	}

	public void setNameFunction(String nameFunction) {
		this.nameFunction = nameFunction;
	}

}
