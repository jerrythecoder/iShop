package com.ishop.dao;

import java.util.List;

/**
 * A generic version of DAO interface, which contains the very basic CRUD 
 * operations.
 * 
 * @author Jerry
 * @param <E> Entity type
 * @param <K> Key type - usually the entity's ID type
 */
public interface GenericDao<E, K> {
	
	void add(E entity);
	
	E find(K key);
	
	void update(E entity);
	
	void remove(E entity);
	
	List<E> list();
}
