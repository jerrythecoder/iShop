package com.ishop.service.impl;

import org.springframework.stereotype.Service;

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

}
