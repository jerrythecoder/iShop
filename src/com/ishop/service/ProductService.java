package com.ishop.service;

import java.util.List;

import com.ishop.model.Product;

/**
 * Product service interface.
 * 
 * @author Jerry
 *
 */
public interface ProductService extends GenericService<Product, Long> {
	
	List<String> getProductCategoryList();
	
	int getSearchPageCount(String keyword, int pageSize);
	
	List<Product> getPagedSearchList(String keyword, int pageNumber, int pageSize);
	
}
