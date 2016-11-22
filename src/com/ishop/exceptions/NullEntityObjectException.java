package com.ishop.exceptions;

/**
 * Customized checked exception to indicate a destination entity 
 * object is null but shouldn't be.
 * 
 * @author Jerry
 *
 */
public class NullEntityObjectException extends Exception {

	private static final long serialVersionUID = -4874470096204953168L;

	public NullEntityObjectException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NullEntityObjectException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public NullEntityObjectException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public NullEntityObjectException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public NullEntityObjectException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
