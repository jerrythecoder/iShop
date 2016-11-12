package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.ProductDao;
import com.ishop.model.Product;

/**
 * Product DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class ProductDaoImpl extends HibernateGenericDaoImpl<Product, Long> 
							implements ProductDao {
	
	public ProductDaoImpl() {
		super(Product.class);
	}

}
