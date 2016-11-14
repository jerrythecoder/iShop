package com.ishop.service.impl;

import org.springframework.stereotype.Service;

import com.ishop.model.User;
import com.ishop.service.UserService;

/**
 * User service implementation.
 * 
 * @author Jerry
 *
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, String> 
							implements UserService {

}
