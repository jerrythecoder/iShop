package com.ishop.dao.impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.CartItemDao;
import com.ishop.model.CartItem;

/**
 * CartItem DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class CartItemDaoImpl extends HibernateGenericDaoImpl<CartItem, Long> 
							implements CartItemDao {

	public CartItemDaoImpl() {
		super(CartItem.class);
	}

	@Override
	public CartItem getItemByCartIdAndProductId(Long cartId, Long productId) {
		
		String hql = "from CartItem item where item.cart.cartId=? and item.product.productId=?";
		
		// Create and parameterize the query.
		Query<CartItem> query = session().createQuery(hql, CartItem.class);
		query.setParameter(0, cartId);
		query.setParameter(1, productId);
		
		// Return null if there's no item exists.
		List<CartItem> itemList = query.getResultList();
		if (itemList.isEmpty()) {
			return null;
		}
		
		// Return the first CartItem if exists. However, there shouldn't 
		// be more then one CartItems in this list.
		return itemList.get(0);
	}
	
	

}
