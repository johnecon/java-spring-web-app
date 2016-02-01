package com.johnecon.spring.web.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.johnecon.spring.web.dao.Offer;
import com.johnecon.spring.web.dao.User;
import com.johnecon.spring.web.service.UsersService;

@Controller
public class LoginController {

	private UsersService usersService;
	
	@Autowired
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	@RequestMapping("/login")
	public String showLogIn() {
		return "login";
	}
	
	@RequestMapping("/admin")
	public String showAdmin(Model m) {
		m.addAttribute("users", usersService.getAllUsers());
		return "admin";
	}
	
	@RequestMapping("/loggedOut")
	public String showLoggedOut() {
		return "loggedout";
	}
	
	@RequestMapping("/newAccount")
	public String showNewAccount(Model model) {
		model.addAttribute("user", new User());
		return "newaccount";
	}
	
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(Model model, @Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			return "newaccount";
		}
		user.setAuthority("user");
		user.setEnabled(true);
		
		if (usersService.exists(user.getUsername())) {
			result.rejectValue("username", "Duplicate.user.username");
			return "newaccount";
		}
		try {
			usersService.create(user);
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "newaccount";
		}
		return "accountcreated";
	}
}
