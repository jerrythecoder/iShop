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
	protected GenericDao<E, K> dao;

	@Override
	public void add(E entity) {
		dao.add(entity);
	}

	@Override
	public E find(K key) {
		return dao.find(key);
	}

	@Override
	public void update(E entity) {
		dao.update(entity);
	}

	@Override
	public void remove(E entity) {
		dao.remove(entity);
	}

	@Override
	public List<E> list() {
		return dao.list();
	}

	@Override
	public Long getTotalCount() {
		return dao.count();
	}

	@Override
	public Long getPageCount(int pageSize) {
		if (pageSize <= 0) {
			throw new IllegalArgumentException("Page size must be greater than 0.");
		}
		return (this.getTotalCount() / pageSize) + 1;
	}

	@Override
	public List<E> getPagedList(int pageNumber, int pageSize) {
		if (pageNumber < 1 || pageNumber > this.getPageCount(pageSize)) {
			throw new IllegalArgumentException("Invalid page number: " + pageNumber);
		}
		
		// Index of first row.
		int first = (pageNumber - 1) * pageSize + 1;
		
		return dao.rangedList(first, pageSize);
	}

}
