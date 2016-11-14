package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.CustomerDao;
import com.ishop.model.Customer;

/**
 * Customer DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class CustomerDaoImpl extends HibernateGenericDaoImpl<Customer, Long> 
							implements CustomerDao {

	public CustomerDaoImpl() {
		super(Customer.class);
	}

}
