package com.ishop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishop.model.Product;
import com.ishop.service.FileStorageService;
import com.ishop.service.ProductService;

/**
 * Controller for product management of admin.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileStorageService fileStorageService;
	
	/**
	 * Adds new product.
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/product-form-add")
	public String showProductAddingForm(Model model) {
		model.addAttribute("product", new Product());
		return "admin/product-form";
	}
	
	/**
	 * Updates existing product.
	 * 
	 * @param productId
	 * @param model
	 * @return
	 */
	@GetMapping("/product-form-update/{productId}")
	public String showProductUpdatingForm(
			@PathVariable("productId") Long productId, Model model) {
		model.addAttribute("product", productService.find(productId));
		return "admin/product-form";
	}
	
	/**
	 * Adds a new or updates an existing product. Also saves the static product
	 * image if present.
	 * 
	 * @param request
	 * @param product
	 * @param result
	 * @return
	 */
	@PostMapping(value = {"/submit", "/product-form-update/submit"})
	public String addOrUpdateProduct(HttpServletRequest request, 
			@Valid @ModelAttribute("product") Product product, 
			BindingResult result) {
		
		// Validate form data
		if (result.hasErrors()) {
			return "admin/product-form";
		}
		
		if (product.getProductId() == null) {
			productService.add(product);
		} else {
			productService.update(product);
		}
		
		// Get root directory
		String rootDir = request.getSession().getServletContext().getRealPath("/");
		// Save product image
		fileStorageService.storeProductImage(product, rootDir);
		
		return "redirect:/admin/product-inventory";
	}
	
	/**
	 * Deletes product image if present. Then removes the product.
	 * 
	 * @param request
	 * @param productId
	 * @return
	 */
	@GetMapping("/product-delete/{productId}")
	public String deleteProduct(HttpServletRequest request, 
			@PathVariable("productId") Long productId) {
		
		Product product = productService.find(productId);
		
		// Get root directory
		String rootDir = request.getSession().getServletContext().getRealPath("/");
		// Delete image if exists
		fileStorageService.deleteProductImage(product, rootDir);
		
		// Then delete product from persistence layer
		productService.remove(product);
		
		return "redirect:/admin/product-inventory";
	}

}
