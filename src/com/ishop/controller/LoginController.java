package com.ishop.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.service.CredentialService;

/**
 * Controller for login page.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/login")
@SessionAttributes("sessionUsername")
public class LoginController {
	
	@Autowired
	private CredentialService credentialService;
	
	
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
	
	@GetMapping("/success")
	public String loginSuccessHandler(Authentication auth, Model model) {
		
		// Set session-wise attribute: username.
		model.addAttribute("sessionUsername", credentialService.getUsername(auth));
		
		// Redirect to different pages based on user role.
		if (credentialService.hasRoleAdmin(auth)) {
			return "redirect:/admin";
		} else {
			return "redirect:/customer/home";
		}
	}

}
