package com.ishop.service;

import com.ishop.model.Customer;
import com.ishop.model.User;

/**
 * User service interface.
 * 
 * @author Jerry
 *
 */
public interface UserService extends GenericService<User, String> {
	
	boolean isCustomerBoundToUser(String username);
	
	Customer getCustomer(String username);
	
	Customer getOrCreateCustomer(String username);
	
	/**
	 * Binds a newly created Customer to the current User, and does the Customer 
	 * initialization work.
	 */
	void bindCustomer(String username, Customer customer);

}
