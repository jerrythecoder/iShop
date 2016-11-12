package com.ishop.service;

import com.ishop.model.Product;

/**
 * Service interface to be used to handle static file resources.
 * 
 * @author Jerry
 *
 */
public interface FileStorageService {
	
	/**
	 * Stores product image to a relative path of root directory.
	 * 
	 * @param product Product entity object
	 * @param rootDir Root directory of the web application
	 */
	void storeProductImage(Product product, String rootDir);
	
	/**
	 * Removes product image from a relative path of root directory.
	 * @param product Product entity object
	 * @param rootDir Root directory of the web application
	 */
	void deleteProductImage(Product product, String rootDir);

}
