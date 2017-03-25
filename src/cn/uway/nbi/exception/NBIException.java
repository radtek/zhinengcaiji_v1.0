package cn.uway.nbi.exception;

/**
 * @author liuwx
 * @version 1.0
 * @created 22-二月-2011 16:11:11
 */
public class NBIException extends Exception {

	private static final long serialVersionUID = 151731790606562035L;

	public NBIException() {
		super();
	}

	public NBIException(String message, Throwable cause) {
		super(message, cause);
	}

	public NBIException(String message) {
		super(message);
	}

	public NBIException(Throwable cause) {
		super(cause);
	}

}