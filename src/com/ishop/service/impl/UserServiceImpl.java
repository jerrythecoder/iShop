package com.ishop.service.impl;

import org.springframework.stereotype.Service;

import com.ishop.model.Customer;
import com.ishop.model.User;
import com.ishop.service.UserService;

/**
 * User service implementation.
 * 
 * @author Jerry
 *
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, String> 
							implements UserService {

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
		try {
			return getCustomer(username);
		} catch (IllegalArgumentException e) {
			// Return an empty Customer object.
			return new Customer();
		}
	}

}
