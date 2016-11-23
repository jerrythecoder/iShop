package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;

import com.ishop.dao.CustomerOrderDao;
import com.ishop.model.CustomerOrder;

/**
 * CustomerOrder DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
public class CustomerOrderDaoImpl extends HibernateGenericDaoImpl<CustomerOrder, Long> 
								implements CustomerOrderDao {

	public CustomerOrderDaoImpl() {
		super(CustomerOrder.class);
	}
	
}
