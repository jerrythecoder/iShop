package com.ishop.service;

import org.springframework.security.core.Authentication;

import com.ishop.model.Authority;
import com.ishop.model.User;

/**
 * Manages user credentials such as User, Authority and Customer info.
 * 
 * @author Jerry
 *
 */
public interface CredentialService {
	
	boolean verifyUsernameAvailability(User user);
	
	boolean verifyAuthorityAvailability(Authority authority);
	
	boolean createUser(User user);
	
	String getUsername(Authentication auth);
	
	boolean hasRoleUser(Authentication auth);
	
	boolean hasRoleAdmin(Authentication auth);
	
}
