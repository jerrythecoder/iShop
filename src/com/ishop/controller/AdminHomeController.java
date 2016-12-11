package com.ishop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishop.service.CustomerOrderService;
import com.ishop.service.ProductService;

/**
 * Controller for admin home page.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	
	@GetMapping
	public String showAdminHome() {
		return "admin/admin-home";
	}
	
	/**
	 * Show product inventory list.
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/product-inventory")
	public String showProductInventoryPage(Model model) {
		model.addAttribute("productList", productService.list());
		return "admin/product-inventory";
	}
	
	/**
	 * Show product inventory list.
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/order-management")
	public String showCustomerOrderPage(Model model) {
		model.addAttribute("customerOrderList", customerOrderService.list());
		return "admin/order-management";
	}
	
	@GetMapping("/customer-management")
	public String showCustomerManagementPage(Model model) {
		// TODO
		return "admin/customer-management";
	}
	


}
