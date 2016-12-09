package com.ishop.service;

import java.util.List;

/**
 * A generic version of Service layer interface. Aims to abstract common 
 * CRUD calls to the DAO layer.
 * 
 * @author Jerry
 * @param <E> Entity type
 * @param <K> Key type - usually the entity's ID type
 */
public interface GenericService<E, K> {
	
	void add(E entity);
	
	E find(K key);
	
	void update(E entity);
	
	void remove(E entity);
	
	List<E> list();
	
	Long getTotalCount();
	
	Long getPageCount(int pageSize);
	
	List<E> getPagedList(int pageNumber, int pageSize);

}
