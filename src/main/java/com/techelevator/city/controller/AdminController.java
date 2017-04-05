package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
public class AdminController {

private UserDAO userDAO;
	
	@Autowired
	public AdminController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/addLandmark", method=RequestMethod.GET)
	public String displayAddLandmarkPage() {
		return "addLandmark";
	}
	
	
}
