package com.ishop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Home page controller.
 * 
 * @author Jerry
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@GetMapping
	public String showHomePage() {
		return "home";
	}
	
	@GetMapping("contact")
	public String showContactPage() {
		return "contact";
	}

}
