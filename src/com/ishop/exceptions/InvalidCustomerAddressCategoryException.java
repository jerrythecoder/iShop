package com.ishop.exceptions;

/**
 * Customized checked exception to indicate that the CsutomerAddress category code
 * does not match its actual address type.
 * 
 * @author Jerry
 *
 */
public class InvalidCustomerAddressCategoryException extends Exception {

	private static final long serialVersionUID = -6754544104549609961L;

	public InvalidCustomerAddressCategoryException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InvalidCustomerAddressCategoryException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public InvalidCustomerAddressCategoryException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public InvalidCustomerAddressCategoryException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public InvalidCustomerAddressCategoryException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
}
