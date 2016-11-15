package com.ishop.service.impl;

import org.springframework.stereotype.Service;

import com.ishop.model.Customer;
import com.ishop.service.CustomerService;

/**
 * Customer service implementation.
 * 
 * @author Jerry
 *
 */
@Service
public class CustomerServiceImpl extends GenericServiceImpl<Customer, Long> 
								implements CustomerService {

}
