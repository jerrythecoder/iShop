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
	public String showProductList() {
//		model.addAttribute("productList", productService.list());
//		model.addAttribute("productTotalCount", productService.getTotalCount());
//		return "product/product-list";
		
		return "redirect:/product/list/page/1";
	}
	
	@GetMapping("/list/page/{pageNumber}")
	public String showProductListPage(@PathVariable("pageNumber") int pageNumber, Model model) {
		/*
		 * Note: Temporarily hard-coded the page size.
		 */
		final int PAGE_SIZE = 10;
		
		model.addAttribute("productList", productService.getPagedList(pageNumber, PAGE_SIZE));
		model.addAttribute("productTotalCount", productService.getTotalCount());
		model.addAttribute("pageCount", productService.getPageCount(PAGE_SIZE));
		model.addAttribute("currentPageNumber", pageNumber);
		
		return "product/product-list";
	}
	
	@GetMapping("/detail/{productId}")
	public String showProductDetail(@PathVariable("productId") Long productId, Model model) {
		model.addAttribute("product", productService.find(productId));
		return "product/product-detail";
	}

}
