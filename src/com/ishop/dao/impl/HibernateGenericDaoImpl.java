package com.ishop.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ishop.dao.GenericDao;


/**
 * Hibernate SessionFactory based generic DAO.
 * 
 * @author Jerry
 * @param <E> Entity type
 * @param <K> Key type - usually the entity's ID type
 */
@Transactional
public class HibernateGenericDaoImpl<E, K extends Serializable> implements GenericDao<E, K> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private final Class<? extends E> entityClass;
	
	/**
	 * Reify the entity class type during construction.
	 * @param entityClass
	 */
	public HibernateGenericDaoImpl(Class<? extends E> entityClass) {
		this.entityClass = entityClass;
	}
	
	protected Session session() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void add(E entity) {
		session().save(entity);
	}

	@Override
	public E find(K key) {
		return session().get(entityClass, key);
	}

	@Override
	public void update(E entity) {
		session().update(entity);
	}

	@Override
	public void remove(E entity) {
		session().delete(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> list() {
		String hql = "from " + entityClass.getSimpleName();
		return (List<E>)session().createQuery(hql, entityClass).getResultList();
	}

	@Override
	public Long count() {
		CriteriaBuilder builder = session().getCriteriaBuilder();
		CriteriaQuery<Long> countQuery = builder.createQuery(Long.class);
		countQuery.select(builder.count(countQuery.from(entityClass)));
		
		return session().createQuery(countQuery).getSingleResult();
	}

	@Override
	public List<E> rangedList(int first, int max) {
		CriteriaBuilder builder = session().getCriteriaBuilder();
		CriteriaQuery<E> criteriaQuery = (CriteriaQuery<E>) builder.createQuery(entityClass);
		
		Root<? extends E> from = criteriaQuery.from(entityClass);
		
		CriteriaQuery<? extends E> select = criteriaQuery.select(from);
		
		TypedQuery<E> typedQuery = (TypedQuery<E>) session().createQuery(select);
		
		// Zero based index.
		typedQuery.setFirstResult(first - 1);
		typedQuery.setMaxResults(max);
		
		return typedQuery.getResultList();
	}

}
