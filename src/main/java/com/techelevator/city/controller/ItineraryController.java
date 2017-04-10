package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.city.model.ItineraryDAO;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
@SessionAttributes("currentUser")
public class ItineraryController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
	private ItineraryDAO itineraryDAO;
		
		@Autowired
		public ItineraryController(UserDAO userDAO, LandmarkDAO landDAO, ItineraryDAO itineraryDAO) {
			this.userDAO = userDAO;
			this.landDAO = landDAO;
			this.itineraryDAO = itineraryDAO;
		}
		
		@RequestMapping(path="/createItinerary", method=RequestMethod.GET)
		public String displayCreateItineraryPage() {
			return "createItinerary";
		}
		
		@RequestMapping(path="/manageItinerary", method=RequestMethod.GET)
		public String displayManageItineraryPage(ModelMap model) {
			model.put("itineraries", itineraryDAO.findItineraryByUser(4));
			return "manageItinerary";
		}
}
