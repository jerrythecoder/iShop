package com.ishop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.dao.CartItemDao;
import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Cart;
import com.ishop.model.CartItem;
import com.ishop.service.CartService;
import com.ishop.service.ProductService;
import com.ishop.service.UserService;

/**
 * Cart service implementation.
 * 
 * @author Jerry
 *
 */
@Service
public class CartServiceImpl extends GenericServiceImpl<Cart, Long> 
							implements CartService {
	
	private static final String ERROR_CART_NOT_FOUND = 
			"Cart was not found, username: %s";
	
	private static final String ERROR_CARTITEM_NOT_FOUND = 
			"CartItem was not found, username: %s, productId: %s";
	

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	
	@Override
	public Cart getCart(String username) {
		return userService.getCustomer(username).getCart();
	}
	
	/**
	 * Throws an NullEntityObjectException if Cart is null.
	 */
	@Override
	public Cart getNonNullCart(String username) throws NullEntityObjectException {
		
		Cart cart = userService.getCustomer(username).getCart();
		
		if (cart == null) {
			throw new NullEntityObjectException (
					String.format(ERROR_CART_NOT_FOUND, username));
		}
		return cart;
	}
	
	@Override
	public CartItem getCartItem(String username, Long productId) 
			throws NullEntityObjectException {
		
		Cart cart = getNonNullCart(username);
		return cartItemDao.getItemByCartIdAndProductId(cart.getCartId(), productId);
	}
	
	/**
	 * Throws an NullEntityObjectException if CartItem is null.
	 * @throws NullEntityObjectException 
	 */
	private CartItem getNoneNullCartItem(String username, Long productId) 
			throws NullEntityObjectException {
		
		CartItem item = getCartItem(username, productId);
		
		if (item == null) {
			throw new NullEntityObjectException (
					String.format(ERROR_CARTITEM_NOT_FOUND, username, productId));
		}
		return item;
	}

	@Override
	public void addProduct(String username, Long productId) 
			throws NullEntityObjectException {
		
		CartItem item = getCartItem(username, productId);
		
		if (item != null) {
			// Item already exists. Increase quantity by 1.
			item.setQuantity(item.getQuantity() + 1);
			
			// Persist the CartItem by updating.
			cartItemDao.update(item);
			
		} else {
			// Item does not exist. Create one and set quantity to 1.
			item = new CartItem();
			item.setCart(getCart(username));
			item.setProduct(productService.find(productId));
			item.setQuantity(1);
			
			// Persist the CartItem by adding.
			cartItemDao.add(item);
		}
		
	}

	@Override
	public void removeProduct(String username, Long productId) 
			throws NullEntityObjectException {
		
		CartItem item = getNoneNullCartItem(username, productId);
		
		/*
		 * Decrease quantity by 1 if there's at least 1 Product, otherwise
		 * remove the CartItem from Cart.
		 */
		Integer quantity = item.getQuantity();
		
		if (quantity >= 1) {
			item.setQuantity(quantity - 1);
			// Persist CartItem.
			cartItemDao.update(item);
		} else {
			cartItemDao.remove(item);
		}
		
	}

	@Override
	public void removeCartItem(String username, Long productId) 
			throws NullEntityObjectException {
		
		CartItem item = getNoneNullCartItem(username, productId);
		cartItemDao.remove(item);
	}

	@Override
	public void clearCart(String username) throws NullEntityObjectException {
		Cart cart = getNonNullCart(username);
		cart.getCartItems().clear();
		update(cart);
	}

	@Override
	public int getProductQuantity(String username, Long productId) 
			throws NullEntityObjectException {
		return getNoneNullCartItem(username, productId).getQuantity();
	}



}
