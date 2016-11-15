package com.ishop.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import com.ishop.model.Authority;
import com.ishop.model.AuthorityPK;
import com.ishop.model.User;
import com.ishop.service.AuthorityService;
import com.ishop.service.CredentialService;
import com.ishop.service.UserService;

/**
 * Credential service implementation.
 * @author Jerry
 *
 */
@Service
public class CredentialServiceImpl implements CredentialService {
	
	private static final String ROLE_USER = "ROLE_USER";
	private static final String ROLE_ADMIN = "ROLE_ADMIN";
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthorityService authorityService;
	

	@Override
	public boolean verifyUsernameAvailability(User user) {
		if (userService.find(user.getUsername()) != null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean verifyAuthorityAvailability(Authority authority) {
		AuthorityPK authPK = new AuthorityPK(authority.getUsername(), 
				authority.getAuthority());
		if (authorityService.find(authPK) != null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean createUser(User user) {
		
		if (!this.verifyUsernameAvailability(user)) {
			return false;
		}
		
		// Create a user authority.
		Authority authority = new Authority();
		authority.setUsername(user.getUsername());
		authority.setAuthority(ROLE_USER);
		
		if (!this.verifyAuthorityAvailability(authority)) {
			return false;
		}
		
		// No duplicate user or authority, create the user and enable by default.
		user.setEnabled(true);
		userService.add(user);
		authorityService.add(authority);
		
		return true;
	}

	@Override
	public String getUsername(Authentication auth) {
		return auth.getName();
	}

	/*
	 * Loop to verify the destination authority.
	 */
	private boolean hasRole(Authentication auth, String role) {
		for (GrantedAuthority authority : auth.getAuthorities()) {
			if (role.equals(authority.getAuthority())) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean hasRoleUser(Authentication auth) {
		return hasRole(auth, ROLE_USER);
	}

	@Override
	public boolean hasRoleAdmin(Authentication auth) {
		return hasRole(auth, ROLE_ADMIN);
	}
	
}
