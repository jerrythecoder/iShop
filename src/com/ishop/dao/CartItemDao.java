package com.ishop.dao;

import com.ishop.model.CartItem;

/**
 * CartItem DAO interface.
 * 
 * @author Jerry
 *
 */
public interface CartItemDao extends GenericDao<CartItem, Long> {
	
	CartItem getItemByCartIdAndProductId(Long cartId, Long productId);
}
