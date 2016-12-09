package com.ishop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.exceptions.CustomerIdMismatchException;
import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.CustomerOrder;
import com.ishop.service.CredentialService;
import com.ishop.service.CustomerService;
import com.ishop.service.UserService;

/**
 * Handling customer related operations.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/customer")
@SessionAttributes("sessionUsername")
public class CustomerController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CredentialService credentialService;
	
	// Add the session attribute before every request.
	@ModelAttribute("sessionUsername")
	public String getSessionUsername(Authentication auth) {
		return credentialService.getUsername(auth);
	}
	
	@GetMapping("/home")
	public String showCustomerHomepage(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		/*
		 * If no customer is bound to the user, simply redirect to customer 
		 * register wizard flow.
		 */
		if (!userService.isCustomerBoundToUser(username)) {
			return "redirect:/customer/register-wizard";
		}
		
		model.addAttribute("customer", userService.getCustomer(username));
		
		// Add order list and its status to model.
		List<CustomerOrder> orderList = userService.getCustomer(username).getOrderList();
		boolean orderListEmpty = false;
		
		if (orderList.isEmpty()) {
			orderListEmpty = true;
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderListEmpty", orderListEmpty);
		
		return "customer/customer-home";
	}
	
	@GetMapping("/order/list")
	public String showOrderList(
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		model.addAttribute("orderList", userService.getCustomer(username).getOrderList());
		return "customer/order-list";
	}
	
	@GetMapping("/order/detail/{orderId}")
	public String showOrderDetail(@PathVariable("orderId") Long orderId, 
			@ModelAttribute("sessionUsername") String username, 
			Model model) {
		
		CustomerOrder order = null;
		
		try {
			order = this.customerService.getNonNullCustomerOrder(username, orderId);
		} catch (NullEntityObjectException | CustomerIdMismatchException e) {
			e.printStackTrace();
			
			// Either non-existing or invalid order access will redirect to the error page.
			model.addAttribute("backLink", "/customer/order/list");
			return "error/page-not-exist";
		}
		
		model.addAttribute("order", order);
		return "customer/order-detail";
	}
	
	/**
	 * This handler serves as redirector. If the user hasn't log in and clicks on "Sign in
	 * to buy" button, the sign in page will be displayed. After successfully signed in, view 
	 * will be redirected to normal product detail page.
	 */
	@GetMapping("/product/detail/{productId}")
	public String showProductDetailAfterLogin(@PathVariable("productId") Long productId, 
			@RequestParam("backLinkPageNumber") int backLinkPageNumber, 
			Model model) {
		
		model.addAttribute("backLinkPageNumber", backLinkPageNumber);
		return "redirect:/product/detail/" + productId;
	}
	
	/**
	 * This handler serves as redirector. If the user hasn't log in and clicks on "Sign in
	 * to buy" button, the sign in page will be displayed. After successfully signed in, view 
	 * will be redirected to normal product list page.
	 */
	@GetMapping("/product/list")
	public String showProductListAfterLogin(@RequestParam("destPageNumber") int destPageNumber ) {
		return "redirect:/product/list/page/" + destPageNumber;
	}
	
}
