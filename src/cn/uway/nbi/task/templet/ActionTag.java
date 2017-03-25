package cn.uway.nbi.task.templet;

/**
 * 处理类配对接口
 * 
 * @author litp 2011-4-18
 */
public class ActionTag {

	private int id;// 编号

	private TOTag toTag;// 传输对象

	private TITag tiTag;// 传输接口

	private StrategyTag strategyTag;// 处理策略

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TOTag getToTag() {
		return toTag;
	}

	public void setToTag(TOTag toTag) {
		this.toTag = toTag;
	}

	public TITag getTiTag() {
		return tiTag;
	}

	public void setTiTag(TITag tiTag) {
		this.tiTag = tiTag;
	}

	public StrategyTag getStrategyTag() {
		return strategyTag;
	}

	public void setStrategyTag(StrategyTag strategyTag) {
		this.strategyTag = strategyTag;
	}

}
