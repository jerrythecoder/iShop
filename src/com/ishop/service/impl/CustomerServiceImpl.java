package com.ishop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.exceptions.InvalidCustomerAddressCategoryException;
import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Customer;
import com.ishop.model.CustomerAddress;
import com.ishop.service.CustomerService;
import com.ishop.service.UserService;

/**
 * Customer service implementation.
 * 
 * @author Jerry
 *
 */
@Service("customerService")
public class CustomerServiceImpl extends GenericServiceImpl<Customer, Long> 
								implements CustomerService {
	
	private static final int BILLING_ADDRESS_CAT_CODE = 0;
	private static final int SHIPPING_ADDRESS_CAT_CODE = 1;
	private static final int ORDER_ADDRESS_CAT_CODE = 2;
	
	private static final String ERROR_CUSTOMER_NOT_FOUND = 
			"Customer was not found, username: %s";
	
	private static final String ERROR_INVALID_ADDRESS_CODE =
			"Invalid customer address category code, expected code: %s";
	
	@Autowired
	private UserService userService;

	@Override
	public Customer getNonNullCustomer(String username) throws NullEntityObjectException {
		Customer customer = userService.getCustomer(username);
		if (customer == null) {
			throw new NullEntityObjectException(String.format(ERROR_CUSTOMER_NOT_FOUND, username));
		}
		return customer;
	}
	
	@Override
	public CustomerAddress getOrCreateBillingAddress(String username) 
			throws NullEntityObjectException {
		
		CustomerAddress address = this.getNonNullCustomer(username).getBillingAddress();
		if (address == null) {
			address = new CustomerAddress();
			// Set category code as 0 to indicate this is a billing address.
			address.setCategoryCode(BILLING_ADDRESS_CAT_CODE);
		}
		return address;
	}

	@Override
	public CustomerAddress getOrCreateShippingAddress(String username) 
			throws NullEntityObjectException {
		CustomerAddress address = this.getNonNullCustomer(username).getShippingAddress();
		if (address == null) {
			address = new CustomerAddress();
			// Set category code as 1 to indicate this is a shipping address.
			address.setCategoryCode(SHIPPING_ADDRESS_CAT_CODE);
		}
		return address;
	}

	@Override
	public void saveBillingAddress(String username, CustomerAddress billingAddress)
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException {
		
		// Checking address category code.
		if (billingAddress.getCategoryCode() != BILLING_ADDRESS_CAT_CODE) {
			throw new InvalidCustomerAddressCategoryException(
					String.format(ERROR_INVALID_ADDRESS_CODE, BILLING_ADDRESS_CAT_CODE));
		}
		
		Customer customer = this.getNonNullCustomer(username);
		customer.setBillingAddress(billingAddress);
		this.update(customer);
	}

	@Override
	public void saveShippingAddress(String username, CustomerAddress shippingAddress)
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException {
		
		// Checking address category code.
		if (shippingAddress.getCategoryCode() != SHIPPING_ADDRESS_CAT_CODE) {
			throw new InvalidCustomerAddressCategoryException(
					String.format(ERROR_INVALID_ADDRESS_CODE, SHIPPING_ADDRESS_CAT_CODE));
		}
		
		Customer customer = this.getNonNullCustomer(username);
		customer.setShippingAddress(shippingAddress);
		this.update(customer);
	}

}
