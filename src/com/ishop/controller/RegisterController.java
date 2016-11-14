package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishop.model.User;
import com.ishop.service.CredentialService;

/**
 * Handling user register functionalities.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
	
	private static final String ERROR_INVALID_USER 
			= "Invalid username, please try another one";
	private static final String ERROR_MISMATCH_PASSWORD
			= "Passwords mismatch";
	
	@Autowired
	private CredentialService credentialService;
	
	@GetMapping
	public String registerCustomer(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}
	
	@PostMapping("submit")
	public String createNewUser(@ModelAttribute("user") User user,
			@RequestParam("confirmPassword") String confirmPassword, 
			Model model) {
		
		if (!user.getPassword().equals(confirmPassword)) {
			model.addAttribute("passwordError", ERROR_MISMATCH_PASSWORD);
			return "register";
		}
		if (!credentialService.createUser(user)) {
			model.addAttribute("userError", ERROR_INVALID_USER);
			return "register";
		}
		
		return "redirect:/product/list";
	}

}
