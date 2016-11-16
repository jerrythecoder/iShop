package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.service.CartService;

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
	
	@GetMapping
	public String showCartContent(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		model.addAttribute("cart", cartService.getCart(username));
		return "customer/cart";
	}

}
