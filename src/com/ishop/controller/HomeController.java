package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishop.service.ProductService;

/**
 * Home page controller.
 * 
 * @author Jerry
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping
	public String showHomePage(Model model) {
		
		// Only get the first 8 items for home page to display.
		model.addAttribute("suggestionList", productService.getPagedList(1, 8));
		return "home";
	}
	
	@GetMapping("contact")
	public String showContactPage() {
		return "contact";
	}

}
