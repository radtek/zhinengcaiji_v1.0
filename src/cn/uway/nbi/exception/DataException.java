package cn.uway.nbi.exception;

public class DataException extends NorthInterfaceException {

	private static final long serialVersionUID = 6572349175932643967L;

	public DataException() {
		super();
	}

	public DataException(String message, Throwable cause) {
		super(message, cause);
	}

	public DataException(String message) {
		super(message);
	}

	public DataException(Throwable cause) {
		super(cause);
	}

}