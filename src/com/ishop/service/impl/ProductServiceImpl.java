package com.ishop.service.impl;

import java.util.ArrayList;
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

	// Enumeration for product category names.
	private enum ProductCategory {
		PHONE("Cell Phones"), 
		TABLET("Tablets & Pads"),
		DESKTOP("Desktop Compoters"),
		LAPTOP("Laptops & Notebooks"),
		WATCH("Smart Watches"), 
		WEARABLE("Wearable Technologies"),
		CAMERA("Digital Cameras"),
		TV_VIDEO("TV & Videos"),
		PHONE_ACCE("Phone Accessories"),
		TABLET_ACCE("Tablet Accessories"),
		LAPTOP_ACCE("Laptop Accessories");
		
		ProductCategory(String name) {
			this.name = name;
		}
		
		private final String name;
		
		public String getName() {
			return name;
		}
	}
	
	private List<String> categories;
	
	@Autowired
	private ProductDao productDao;
	
	
	/*
	 * Constructor to instantiate category list.
	 */
	public ProductServiceImpl() {
		this.categories = new ArrayList<>();
		for (ProductCategory cate : ProductCategory.values()) {
			this.categories.add(cate.getName());
		}
	}
	
	@Override
	public List<String> getProductCategoryList() {
		return this.categories;
	}
	
	@Override
	public int getSearchPageCount(String keyword, int pageSize) {
		int totalCount = this.productDao.listBySingleKeywordMatchingName(keyword).size();
		return (totalCount / pageSize) + 1;
	}
	
	@Override
	public List<Product> getPagedSearchList(String keyword, int pageNumber, int pageSize) {
		return this.productDao.pagedListBySingleKeywordMatchingName(keyword, pageNumber, pageSize);
	}



}
