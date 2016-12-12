package com.ishop.dao;

import java.util.List;

import com.ishop.model.Product;

/**
 * Product DAO interface.
 * 
 * @author Jerry
 * 
 */
public interface ProductDao extends GenericDao<Product, Long> {

	List<Product> listBySingleKeywordMatchingName(String keyword);
	
	List<Product> pagedListBySingleKeywordMatchingName(String keyword, int pageNumber, int pageSize);
	
}
