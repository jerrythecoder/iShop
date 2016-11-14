package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.UserDao;
import com.ishop.model.User;

/**
 * User DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class UserDaoImpl extends HibernateGenericDaoImpl<User, String> 
						implements UserDao {
	
	public UserDaoImpl() {
		super(User.class);
	}

}
