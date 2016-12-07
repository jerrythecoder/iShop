package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Cart;
import com.ishop.service.CartService;
import com.ishop.service.CredentialService;
import com.ishop.service.UserService;

/**
 * Handling customer shopping cart operations.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/customer/cart")
@SessionAttributes("sessionUsername")
public class ShoppingCartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CredentialService credentialService;
	
	// Add the session attribute before every request.
	@ModelAttribute("sessionUsername")
	public String getSessionUsername(Authentication auth) {
		return credentialService.getUsername(auth);
	}
	
	@GetMapping
	public String showCartContent(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		/*
		 * If no customer is bound to the user, simply redirect to customer 
		 * register wizard flow.
		 */
		if (!userService.isCustomerBoundToUser(username)) {
			return "redirect:/customer/register-wizard";
		}
		
		Cart cart = null;
		
		try {
			cart = cartService.getNonNullCart(username);
		} catch (NullEntityObjectException e) {
			// TODO ...
		}
		
		model.addAttribute("cart", cart);
		return "customer/cart";
	}
	

}
