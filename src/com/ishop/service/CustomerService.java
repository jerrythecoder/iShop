package com.ishop.service;

import com.ishop.exceptions.CustomerIdMismatchException;
import com.ishop.exceptions.InvalidCustomerAddressCategoryException;
import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Customer;
import com.ishop.model.CustomerAddress;
import com.ishop.model.CustomerOrder;

/**
 * Customer service interface.
 * 
 * @author Jerry
 *
 */
public interface CustomerService extends GenericService<Customer, Long> {

	Customer getNonNullCustomer(String username) throws NullEntityObjectException;
	
	CustomerAddress getOrCreateBillingAddress(String username) throws NullEntityObjectException;
	
	CustomerAddress getOrCreateShippingAddress(String username) throws NullEntityObjectException;
	
	void saveBillingAddress(String username, CustomerAddress billingAddress) 
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException;
	
	void saveShippingAddress(String username, CustomerAddress shippingAddress) 
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException;
	
	CustomerAddress getBillingAddress(String username) throws NullEntityObjectException;
	
	CustomerAddress getShippingAddress(String username) throws NullEntityObjectException;
	
	Long saveCustomerOrder(String username) throws NullEntityObjectException;
	
	CustomerOrder getNonNullCustomerOrder(String username, Long orderId) 
			throws NullEntityObjectException, CustomerIdMismatchException;
	
}
