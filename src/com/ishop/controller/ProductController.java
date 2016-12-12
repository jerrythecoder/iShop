package com.ishop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishop.model.Product;
import com.ishop.service.ProductService;

/**
 * Controller for general product information page.
 * 
 * @author Jerry
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	
	/*
	 * Note: Temporarily hard-coded the page size.
	 */
	private final int PAGE_SIZE = 10;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/list")
	public String showProductList() {
		return "redirect:/product/list/page/1";
	}
	
	@GetMapping("/list/page/{pageNumber}")
	public String showProductListPage(@PathVariable("pageNumber") int pageNumber, Model model) {
		
		List<Product> productList = null;
		try {
			productList = productService.getPagedList(pageNumber, PAGE_SIZE);
		} catch (IllegalArgumentException e) {
			// When invalid page number is supplied, view redirects to error page, with
			// back button linked to product list.
			model.addAttribute("backLink", "/product/list");
			return "error/page-not-exist";
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("productTotalCount", productService.getTotalCount());
		model.addAttribute("pageCount", productService.getPageCount(PAGE_SIZE));
		model.addAttribute("currentPageNumber", pageNumber);
		
		return "product/product-list";
	}
	
	@GetMapping("/detail/{productId}")
	public String showProductDetail(@PathVariable("productId") Long productId, 
			@RequestParam(value = "backLinkPageNumber", required = false) Integer backLinkPageNumber, 
			@RequestParam(value = "onSearch", required = false) boolean onSearch, 
			@RequestParam(value = "keyword", required = false) String keyword, 
			Model model) {
		
		model.addAttribute("product", productService.find(productId));
		
		if (backLinkPageNumber == null) {
			// Set to 1 if not provided.
			backLinkPageNumber = 1;
		}
		
		model.addAttribute("backLinkPageNumber", backLinkPageNumber);
		model.addAttribute("onSearch", onSearch);
		model.addAttribute("keyword", keyword);
		return "product/product-detail";
	}
	
	/**
	 * A basic implementation of product search function. Matching only a single 
	 * keyword from product name string.
	 */
	@GetMapping("/list/search/{pageNumber}")
	public String searchProduct(@PathVariable("pageNumber") int pageNumber, 
			@RequestParam("keyword") String keyword, Model model) {
		
		List<Product> productList = null;
		
		try {
			productList = productService.getPagedSearchList(keyword, pageNumber, PAGE_SIZE);
		} catch (IllegalArgumentException e) {
			// When invalid page number is supplied, view redirects to error page, with
			// back button linked to product list.
			model.addAttribute("backLink", "/product/list");
			return "error/page-not-exist";
		}
		
		model.addAttribute("productList", productList);
//		model.addAttribute("productTotalCount", productService.getTotalCount());
		model.addAttribute("pageCount", productService.getSearchPageCount(keyword, PAGE_SIZE));
		model.addAttribute("currentPageNumber", pageNumber);
		model.addAttribute("keyword", keyword);
		
		return "product/product-list";
	}

}
