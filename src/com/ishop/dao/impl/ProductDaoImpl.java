package com.ishop.dao.impl;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.ProductDao;
import com.ishop.model.Product;

/**
 * Product DAO implementation.
 * 
 * @author Jerry
 *
 */
@Repository
@Transactional
public class ProductDaoImpl extends HibernateGenericDaoImpl<Product, Long> 
							implements ProductDao {
	
	public ProductDaoImpl() {
		super(Product.class);
	}

	private TypedQuery<Product> createSearchQuery(String keyword) {
		CriteriaBuilder criteriaBuiler = session().getCriteriaBuilder();
		CriteriaQuery<Product> criteriaQuery = criteriaBuiler.createQuery(Product.class);
		Root<Product> from = criteriaQuery.from(Product.class);
		
		// Very simple matcher String.
		String matcher = "%" + keyword + "%";
		
		criteriaQuery.where(criteriaBuiler.like(from.<String>get("productName"), matcher));
		return session().createQuery(criteriaQuery);
	}
	
	@Override
	public List<Product> listBySingleKeywordMatchingName(String keyword) {
		return this.createSearchQuery(keyword).getResultList();
	}
	
	@Override
	public List<Product> pagedListBySingleKeywordMatchingName(String keyword, int pageNumber, int pageSize) {
		
		TypedQuery<Product> query = this.createSearchQuery(keyword);
		
		query.setFirstResult(pageNumber - 1);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

}
