package com.ishop.service.impl;

import org.springframework.stereotype.Service;

import com.ishop.model.CustomerOrder;
import com.ishop.service.CustomerOrderService;

/**
 * CustomerOrder service implementation.
 * 
 * @author Jerry
 *
 */
@Service
public class CustomerOrderServiceImpl extends GenericServiceImpl<CustomerOrder, Long> 
		implements CustomerOrderService {

}
