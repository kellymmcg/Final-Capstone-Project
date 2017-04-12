package com.techelevator.city.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.city.model.Landmark;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.SuggestionDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
public class AdminController {

private UserDAO userDAO;
private LandmarkDAO landDAO;
private SuggestionDAO suggestionDAO;
	
	@Autowired
	public AdminController(UserDAO userDAO, LandmarkDAO landDAO, SuggestionDAO suggestionDAO) {
		this.userDAO = userDAO;
		this.landDAO = landDAO;
		this.suggestionDAO = suggestionDAO;
	}
	
	@RequestMapping(path="/addLandmark", method=RequestMethod.GET)
	public String displayAddLandmarkPage() {
		return "addLandmark";
	}
	
	@RequestMapping(path="/addLandmark", method=RequestMethod.POST)
	public String submitLandmarkToDatabase(@ModelAttribute Landmark landmark, Model model) {
		landDAO.addLandmark(landmark);
		return "successfulLandmarkAddition";
	}
	
	@RequestMapping(path="/viewSuggestions", method=RequestMethod.GET)
	public String showUserSuggestions(ModelMap modelMap){
		modelMap.put("suggestions", suggestionDAO.displayAllSuggestions());
		return "viewSuggestions";
	}
	@RequestMapping(path="/viewSuggestions", method=RequestMethod.POST)
	public String deleteItinerary(@RequestParam int id,
								  ModelMap model) {
		suggestionDAO.removeSuggestion(id);
		return "redirect:/viewSuggestions";
	}
}
