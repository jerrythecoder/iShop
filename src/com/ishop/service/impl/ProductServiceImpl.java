package com.ishop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.dao.ProductDao;
import com.ishop.model.Product;
import com.ishop.service.ProductService;

/**
 * An implementation of product service.
 * 
 * @author Jerry
 *
 */
@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Long> 
								implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public int getSearchPageCount(String keyword, int pageSize) {
		int totalCount = this.productDao.listBySingleKeywordMatchingName(keyword).size();
		return (totalCount / pageSize) + 1;
	}
	
	@Override
	public List<Product> getPagedSearchList(String keyword, int pageNumber, int pageSize) {
//		List<Product> productList = this.productDao
//				.pagedListBySingleKeywordMatchingName(keyword, pageNumber, pageSize);
		
		return this.productDao.pagedListBySingleKeywordMatchingName(keyword, pageNumber, pageSize);
	}


}
