package cn.uway.nbi.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import cn.uway.commons.type.StringUtil;

/**
 * 外部命令工具类
 */
public class ExternalCmd {

	private String cmd;

	public ExternalCmd() {
		super();
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	/** 执行命令 */
	public int execute(String cmd) throws Exception {
		this.cmd = cmd;

		return execute();
	}

	/** 执行命令 */
	public int execute() throws Exception {
		if (StringUtil.isNull(cmd))
			return 0;

		int retCode = -1;

		Process proc = null;

		try {
			proc = Runtime.getRuntime().exec(cmd);

			new StreamGobbler(proc.getErrorStream()).start();
			new StreamGobbler(proc.getInputStream()).start();

			proc.waitFor();
			retCode = proc.exitValue();
		} catch (Exception e) {
			throw e;
		} finally {
			if (proc != null)
				proc.destroy();
		}

		return retCode;
	}

	class StreamGobbler extends Thread {

		InputStream is;

		StreamGobbler(InputStream is) {
			this.is = is;
		}

		public void run() {
			BufferedReader br = null;

			try {
				br = new BufferedReader(new InputStreamReader(is));

				while (br.readLine() != null) {

				}
			} catch (Exception e) {
				// e.printStackTrace();
			} finally {
				try {
					if (br != null) {
						br.close();
					}
				} catch (Exception e) {
				}
			}
		}
	}

}
