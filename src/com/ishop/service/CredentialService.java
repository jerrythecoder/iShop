package com.ishop.service;

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
	
}
