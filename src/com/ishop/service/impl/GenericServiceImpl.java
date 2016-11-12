package com.ishop.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ishop.dao.GenericDao;
import com.ishop.service.GenericService;

/**
 * An implementation of the generic service interface.
 * 
 * @author Jerry
 * @param <E> Entity type
 * @param <K> Key type - usually the entity's ID type
 */
public class GenericServiceImpl<E, K extends Serializable> implements GenericService<E, K> {
	
	@Autowired
	private GenericDao<E, K> genericDao;

	@Override
	public void add(E entity) {
		genericDao.add(entity);
	}

	@Override
	public E find(K key) {
		return genericDao.find(key);
	}

	@Override
	public void update(E entity) {
		genericDao.update(entity);
	}

	@Override
	public void remove(E entity) {
		genericDao.remove(entity);
	}

	@Override
	public List<E> list() {
		return genericDao.list();
	}

}
