package com.ishop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.dao.CartItemDao;
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

	@Override
	public void addProductToCart(String username, Long productId) {

		Cart cart = userService.getCustomer(username).getCart();
		CartItem item = cartItemDao.getItemByCartIdAndProductId(cart.getCartId(), productId);
		
		if (item != null) {
			// Item already exists. Increase quantity by 1.
			item.setQuantity(item.getQuantity() + 1);
			
			// Persist the CartItem by updating.
			cartItemDao.update(item);
			
		} else {
			// Item does not exist. Create one and set quantity to 1.
			item = new CartItem();
			item.setCart(cart);
			item.setProduct(productService.find(productId));
			item.setQuantity(1);
			
			// Persist the CartItem by adding.
			cartItemDao.add(item);
		}
		
	}

}
