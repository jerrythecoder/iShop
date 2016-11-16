package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.CartDao;
import com.ishop.model.Cart;

/**
 * Cart DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class CartDaoImpl extends HibernateGenericDaoImpl<Cart, Long> implements CartDao {

	public CartDaoImpl() {
		super(Cart.class);
	}

}
