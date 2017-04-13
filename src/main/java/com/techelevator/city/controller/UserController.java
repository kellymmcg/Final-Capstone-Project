package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.city.model.SuggestionDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
@SessionAttributes("currentUser")
public class UserController {
	
	private UserDAO userDAO;
	private SuggestionDAO suggestionDAO;
	
	
	@Autowired
	public UserController(UserDAO userDAO, SuggestionDAO suggestionDAO) {
		this.userDAO = userDAO;
		this.suggestionDAO = suggestionDAO;
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
	public String displayUserDashboard(RedirectAttributes redir, ModelMap model) {
		redir.addFlashAttribute("notice", "Welcome, "+ model.get("currentUser") +"!");
		return "redirect:/";
	}
	
	@RequestMapping(path="/changePassword", method=RequestMethod.GET)
	public String displayChangePasswordForm() {
		return "changePassword";
	}
	
	@RequestMapping(path="/changePassword", method=RequestMethod.POST)
	public String updatePassword(@RequestParam String userName, @RequestParam String password, RedirectAttributes redir) {	
		userDAO.updatePassword(userName, password);
		redir.addFlashAttribute("notice", "Your password has been updated.");
		return "redirect:/";
	}
	
	@RequestMapping(path="/suggestions", method=RequestMethod.GET)
	public String suggestALandmark() {
	return "suggestions";
	}
	
	@RequestMapping(path="/suggestions", method=RequestMethod.POST)
	public String submitALandmark(@RequestParam String user, 
							      @RequestParam String name, 
							      @RequestParam String address,
								  @RequestParam String description,
								  RedirectAttributes redir) {
		redir.addFlashAttribute("notice", "Thank you for your suggestion!  Our Admins will review it soon.");
		suggestionDAO.submitSuggestion(user, name, address, description);
		return "redirect:/";
	}
	
}
