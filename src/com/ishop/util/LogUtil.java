package com.ishop.util;

import org.apache.log4j.Logger;

/**
 * Get class specific logger object.
 *
 */
public class LogUtil {
	
	public static Logger getLogger() {
		String className = Thread.currentThread().getStackTrace()[2].getClassName();
		return Logger.getLogger(className);
	}

}
