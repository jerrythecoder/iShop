package com.ishop.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.model.Cart;
import com.ishop.service.CartService;

@RestController
@RequestMapping("/customer/cart/rest")
@SessionAttributes("sessionUsername")
public class ShoppingCartRestController {

	@Autowired
	private CartService cartService;
	
	@GetMapping("/refresh-cart")
	public Cart retrieveCart(@ModelAttribute("sessionUsername") String username) {
		Cart cart = cartService.getCart(username);
		if (cart == null) {
			// TODO
			throw new NullPointerException("Null Cart");
		}
		return cart;
	}
	
	@PutMapping("/add-to-cart/{productId}")
	public void addToCart(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		cartService.addProductToCart(username, productId);
	}
	
}
