package com.ishop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishop.model.User;
import com.ishop.service.CredentialService;

/**
 * Handling user register functionalities.
 * 
 * @author Jerry
 *
 */
@Controller
@RequestMapping("/register")
@SessionAttributes("sessionUsername")
public class RegisterController {
	
	private static final String ERROR_INVALID_USER 
			= "Invalid username, please try another one";
	private static final String ERROR_MISMATCH_PASSWORD
			= "Passwords mismatch";
	
	@Autowired
	private CredentialService credentialService;
	
    @Autowired
    protected AuthenticationManager authenticationManager;
	
	
	@GetMapping
	public String registerCustomer(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}
	
	@PostMapping("submit")
	public String createNewUser(HttpServletRequest request, 
			@ModelAttribute("user") User user,
			@RequestParam("confirmPassword") String confirmPassword, 
			Model model) {
		
		if (!user.getPassword().equals(confirmPassword)) {
			model.addAttribute("passwordError", ERROR_MISMATCH_PASSWORD);
			return "register";
		}
		
		if (!credentialService.createUser(user)) {
			model.addAttribute("userError", ERROR_INVALID_USER);
			return "register";
		}
		
		/*
		 * Directly authenticate user after successful registration, so that the 
		 * user is logged-in automatically. 
		 * 
		 * Discussions for this solution can be found here: <http://stackoverflow.com/
		 * questions/3813028/auto-login-after-successful-registeration>
		 */
		this.authenticateUserAndSetSession(user, request);
		
		// Set username as a SessionAttribute.
		model.addAttribute("sessionUsername", user.getUsername());
		
		// Redirect to Customer form page to guide the user submit more information.
		return "redirect:/customer/info-form";
	}
	
	/**
	 * A utility method to get a User authenticated and set a session with the 
	 * authenticated user.
	 * 
	 * @param user
	 * @param request
	 */
	private void authenticateUserAndSetSession(User user, HttpServletRequest request) {
		String username = user.getUsername();
		String password = user.getPassword();
		UsernamePasswordAuthenticationToken token = 
				new UsernamePasswordAuthenticationToken(username, password);
		
		// Generate session if one doesn't exist
		request.getSession();
		
		token.setDetails(new WebAuthenticationDetails(request));
		
		try {
			Authentication auth = authenticationManager.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(auth);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
