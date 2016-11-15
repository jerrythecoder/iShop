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
	
	Customer getCustomer(String username);
	
	Customer getOrCreateCustomer(String username);

}
