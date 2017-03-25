package cn.uway.nbi.ui;

public class SeqMgr {

	private SeqMgr() {

	}

	private static class SeqMgrContainer {

		public static SeqMgr instance = new SeqMgr();

	}

	public static SeqMgr getInstance() {
		return SeqMgrContainer.instance;
	}

	public synchronized String getSeq() {
		// long time = new Date().getTime();
		long rad = (int) (Math.random() * 10000);
		long rad1 = (int) (Math.random() * 10000);
		return rad + "" + rad1;

	}
}
