package com.techelevator.city.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	                        ModelMap model) {
	        
	        if(userDAO.searchForUsernameAndPassword(userName, password)) {
	            session.invalidate();
	            model.put("currentUser", userName);
	            
	            if(destinationIsValid(destination)) {
	                return "redirect:"+destination;
	            } else {
	                return "redirect:/users/"+userName;
	            }
	        } else {
	            return "redirect:/homePage";
	        }
	    }
		
		private boolean destinationIsValid(String destination) {
			return destination != null && destination.startsWith("http://localhost:8080/critter-app");
		}
		
	}
