package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.city.model.Landmark;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller

public class ItineraryController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
		
		@Autowired
		public ItineraryController(UserDAO userDAO, LandmarkDAO landDAO) {
			this.userDAO = userDAO;
			this.landDAO = landDAO;
		}
		
		@RequestMapping(path="/createItinerary", method=RequestMethod.GET)
		public String displayCreateItineraryPage() {
			return "createItinerary";
		}
		
		@RequestMapping(path="/manageItinerary", method=RequestMethod.GET)
		public String displayManageItineraryPage() {
			return "manageItinerary";
		}
}
