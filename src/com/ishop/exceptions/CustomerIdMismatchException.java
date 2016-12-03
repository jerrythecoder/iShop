package com.ishop.exceptions;

/**
 * Customized checked exception to indicate that a User is trying to access 
 * a Customer object that does not match the bound one.
 * 
 * @author Jerry
 *
 */
public class CustomerIdMismatchException extends Exception {

	private static final long serialVersionUID = -5650540668848788304L;

	public CustomerIdMismatchException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerIdMismatchException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public CustomerIdMismatchException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public CustomerIdMismatchException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public CustomerIdMismatchException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
