package com.ishop.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.AuthorityDao;
import com.ishop.model.Authority;
import com.ishop.model.AuthorityPK;

/**
 * Authority DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class AuthorityDaoImpl extends HibernateGenericDaoImpl<Authority, AuthorityPK> 
							implements AuthorityDao {

	public AuthorityDaoImpl() {
		super(Authority.class);
	}

}
