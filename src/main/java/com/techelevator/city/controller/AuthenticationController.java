package com.techelevator.city.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.city.model.UserDAO;

	@Transactional
	@Controller
	@SessionAttributes("currentUser")
	public class AuthenticationController {
		
		private UserDAO userDAO;
		
		@Autowired
		public AuthenticationController(UserDAO userDAO){
			this.userDAO = userDAO;
		}
		
		@RequestMapping(path="/", method=RequestMethod.POST)
	    public String login(@RequestParam String userName, 
	                        @RequestParam String password,
	                        @RequestParam(required=false) String destination,
	                        HttpSession session,
	                        ModelMap model,
	                        RedirectAttributes redir) {
	        
	        if(userDAO.searchForUsernameAndPassword(userName, password)) {
	            session.invalidate();
	            model.put("currentUser", userName);
	            
	            if(destinationIsValid(destination)) {
	                return "redirect:"+destination;
	            } else {
	                return "redirect:/users/"+userName;
	            }
	        } else {
	        	redir.addFlashAttribute("loginFailure", "Incorrect username or password!");
	            return "redirect:/";
	        }                                                                
	    }
		
		private boolean destinationIsValid(String destination) {
			return destination != null && destination.startsWith("http://localhost:8080/capstone");
		}
		
		@RequestMapping(path="/logout", method=RequestMethod.POST)
		public String logout(ModelMap model, HttpSession session) {
			model.remove("currentUser");
			session.removeAttribute("currentUser");
			return "redirect:/";
		}
		
	}
