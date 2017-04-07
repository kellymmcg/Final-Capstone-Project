package com.techelevator.city.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
public class UserController {
	
	private UserDAO userDAO;
	
	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/registration", method=RequestMethod.GET)
	public String displayRegistrationForm() {
		return "registration";
	}
	
	@RequestMapping(path="/registration", method=RequestMethod.POST)
	public String createUser(@RequestParam String userName, @RequestParam String password, RedirectAttributes redir) {
		userDAO.saveUser(userName, password);
		redir.addFlashAttribute("notice", "The registration was a success!");
		return "redirect:/";
	}
	
	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
	public String displayUserDashboard() {
		return "redirect:/";
	}
	
}
