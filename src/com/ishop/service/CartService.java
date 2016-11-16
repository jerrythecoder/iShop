package com.ishop.service;

import com.ishop.model.Cart;

/**
 * Cart service interface.
 * 
 * @author Jerry
 *
 */
public interface CartService extends GenericService<Cart, Long> {

	Cart getCart(String username);
	
	void addProductToCart(String username, Long productId);
}
