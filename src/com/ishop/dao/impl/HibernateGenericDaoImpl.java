package com.ishop.dao.impl;

import java.io.Serializable;
import java.util.List;

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
		session().saveOrUpdate(entity);
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

}
