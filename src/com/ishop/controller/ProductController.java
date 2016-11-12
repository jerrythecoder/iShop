package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishop.service.ProductService;

/**
 * Controller for general product information page.
 * 
 * @author Jerry
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/list")
	public String showProductList(Model model) {
		model.addAttribute("productList", productService.list());
		return "product/product-list";
	}
	
	@GetMapping("/detail/{productId}")
	public String showProductDetail(@PathVariable("productId") Long productId, Model model) {
		model.addAttribute("product", productService.find(productId));
		return "product/product-detail";
	}

}
