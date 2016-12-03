package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.service.UserService;

/**
 * Handling customer related operations.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/customer")
@SessionAttributes("sessionUsername")
public class CustomerController {
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/home")
	public String showCustomerHomepage(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		/*
		 * If no customer is bound to the user, simply redirect to customer 
		 * register wizard flow.
		 */
		if (!userService.isCustomerBoundToUser(username)) {
			return "redirect:/customer/register-wizard";
		}
		
		model.addAttribute("customer", userService.getCustomer(username));
		return "customer/customer-home";
	}
}
