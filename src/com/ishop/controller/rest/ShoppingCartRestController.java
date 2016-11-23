package com.ishop.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Cart;
import com.ishop.service.CartService;

@RestController
@RequestMapping("/customer/cart/rest")
@SessionAttributes("sessionUsername")
public class ShoppingCartRestController {

	@Autowired
	private CartService cartService;
	
	@GetMapping("/verify-cart-empty")
	public boolean verifyCartEmpty(@ModelAttribute("sessionUsername") String username) {
		
		boolean result = true;
		
		try {
			result = cartService.isCartEmpty(username);
		} catch (NullEntityObjectException e) {
			// TODO ...
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/retrieve-cart")
	public Cart retrieveCart(@ModelAttribute("sessionUsername") String username) {
		
		Cart cart = null;
		
		try {
			cart = cartService.getNonNullCart(username);
		} catch (NullEntityObjectException e) {
			// TODO ...
			e.printStackTrace();
		}
		return cart;
	}
	
	@GetMapping("/retrieve-quantity/{productId}")
	public int retrieveProductQuantity(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		int quantity = 0;
		try {
			quantity = cartService.getNoneNullCartItem(username, productId).getQuantity();
		} catch (NullEntityObjectException e) {
			// TODO ...
			e.printStackTrace();
		}
		
		return quantity;
	}
	
	@PutMapping("/add-product/{productId}")
	public boolean addProduct(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		try {
			cartService.addProduct(username, productId);
		} catch (NullEntityObjectException e) {
			return false;
		}
		
		return true;
	}
	
	@DeleteMapping("/remove-product/{productId}")
	public boolean removeProduct(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		try {
			cartService.removeProduct(username, productId);
		} catch (NullEntityObjectException e) {
			return false;
		}
		
		return true;
	}
	
	@DeleteMapping("/remove-item/{productId}")
	public boolean removeCartItem(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		try {
			cartService.removeCartItem(username, productId);
		} catch (NullEntityObjectException e) {
			return false;
		}
		
		return true;
	}
	
	@DeleteMapping("/clear-cart")
	public boolean clearCart(@ModelAttribute("sessionUsername") String username) {
		
		try {
			cartService.clearCart(username);
		} catch (NullEntityObjectException e) {
			return false;
		}
		
		return true;
	}
	
	@GetMapping("/verify-product-added/{productId}")
	public boolean verifyProductAdded(
			@ModelAttribute("sessionUsername") String username, 
			@PathVariable("productId") Long productId) {
		
		try {
			if (cartService.getNoneNullCartItem(username, productId).getQuantity() <= 0) {
				return false;
			}
		} catch (NullEntityObjectException e) {
			return false;
		}
		return true;
	}
	
}
