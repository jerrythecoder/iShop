package com.ishop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller for login page.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping
	public String login(
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, 
			Model model) {
				
		if (error != null) {
			model.addAttribute("error", "Invalid username or password.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "You've been logged out successfully.");
		}
		
		return "login";
	}

}
