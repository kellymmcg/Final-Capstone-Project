package com.techelevator.city.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.city.model.ItineraryDAO;
import com.techelevator.city.model.Landmark;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
@SessionAttributes("currentUser")
public class LandmarkController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
	private ItineraryDAO itineraryDAO;
	
	@Autowired
	public LandmarkController(UserDAO userDAO, LandmarkDAO landDAO, ItineraryDAO itineraryDAO) {
		this.userDAO = userDAO;
		this.landDAO = landDAO;
		this.itineraryDAO = itineraryDAO;
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String submitLandmarkSearch(@RequestParam Optional<String> name, ModelMap model) {
		if(model.get("currentUser") == null){
			return "redirect:/loginPage";
		}
		if(! name.isPresent()){
			return "search";
		}
		List<Landmark> landmarks = landDAO.searchLandmarksByName(name.get());
		model.put("landmarks", landmarks);
		model.put("search", name.get());
		return "searchResults";
	}
	
	@RequestMapping(path="/searchResults", method=RequestMethod.GET)
	public String showSearchResults(@RequestParam Optional<Long> id, ModelMap model){
		if(! id.isPresent()){
			return "searchResults";
		}
		Landmark landmark = landDAO.searchLandmarkById(id.get());
		model.addAttribute(landmark);
		return "landmarkDetails";
	}
	
	@RequestMapping(path="/landmarkDetails", method=RequestMethod.GET)
	public String displaySearchResults(ModelMap model) {
		String userName = (String) model.get("currentUser");
		model.put("itineraries", itineraryDAO.findItineraryByUser(userName));
		return "landmarkDetails";
	}
	
	@RequestMapping(path="/landmarkDetails", method=RequestMethod.POST)
	public String addLandmarkToItinerary(@RequestParam String user, 
										 @RequestParam String name, 
										 @RequestParam String description, 
										 @RequestParam int landmarkId, 
										 ModelMap model) {
		Date date = new Date();
		itineraryDAO.addLandmarkToItinerary(2, user, landmarkId, name, date, description); // CURRENTLY HARDCODED
		return "redirect:/manageItinerary";
		
	}

}
