package com.ishop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.dao.CustomerDao;
import com.ishop.exceptions.CustomerIdMismatchException;
import com.ishop.model.Cart;
import com.ishop.model.Customer;
import com.ishop.model.User;
import com.ishop.service.UserService;

/**
 * User service implementation.
 * 
 * @author Jerry
 *
 */
@Service("userService")
public class UserServiceImpl extends GenericServiceImpl<User, String> 
							implements UserService {

	private static final String ERROR_CUSTOMER_ID_MISMATCH 
			= "Customer with this ID is not bound to the current User: %s";
	
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public boolean isCustomerBoundToUser(String username) {
		if (find(username).getCustomer() == null) {
			return false;
		}
		return true;
	}
	
	@Override
	public Customer getCustomer(String username) {
		Customer customer = find(username).getCustomer();
		if (customer == null) {
			throw new IllegalArgumentException(
					"Customer does not exist with username: " + username);
		}
		return customer;
	}

	@Override
	public Customer getOrCreateCustomer(String username) {
		Customer customer = find(username).getCustomer();
		return customer != null ? customer : new Customer();
	}

	@Override
	public void bindCustomer(String username, Customer customer) {
		
		// Create a new Cart and bind it to the Customer.
		customer.setCart(new Cart());
		
		// Bind the Customer to the User.
		User user = this.find(username);
		user.setCustomer(customer);
		
		this.update(user);
	}

	@Override
	public void bindOrUpdateCustomer(String username, Customer customer) 
			throws CustomerIdMismatchException {

		if (customer.getCustomerId() == null) {
			// No customer bound.
			this.bindCustomer(username, customer);
		} else {
			// Customer already bound. Check ID then update.
			User user = this.find(username);
			
			if (user.getCustomer().getCustomerId() != customer.getCustomerId()) {
				throw new CustomerIdMismatchException(
						String.format(ERROR_CUSTOMER_ID_MISMATCH, customer.getCustomerId()));
			}
			user.setCustomer(customer);
			this.update(user);
		}
	}


}
