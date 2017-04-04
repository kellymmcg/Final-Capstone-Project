package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
public class LandmarkController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
	
	@Autowired
	public LandmarkController(UserDAO userDAO, LandmarkDAO landDAO) {
		this.userDAO = userDAO;
		this.landDAO = landDAO;
	}
	
	@RequestMapping(path="/suggestions", method=RequestMethod.GET)
	public String displayLandmarkSearchPage() {
		return "suggestions";
	}
	
}
