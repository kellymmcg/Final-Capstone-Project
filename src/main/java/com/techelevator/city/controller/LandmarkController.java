package com.techelevator.city.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.city.model.Landmark;
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
	public String displayLandmarkSuggestionPage() {
		return "suggestions";
	}
	
	@RequestMapping(path="/suggestions", method=RequestMethod.POST)
	public String submitLandmarkSuggestion(@ModelAttribute Landmark landmark, ModelMap model) {
		landDAO.addLandmark(landmark);
		return"redirect:/submitSuggestion";
	}
	
	@RequestMapping(path="submitSuggestion", method=RequestMethod.GET)
	public String suggestionConfirmation() {
		return "submitSuggestion";
	}
	
	@RequestMapping(path="/landmarkSearch", method=RequestMethod.GET)
	public String submitLandmarkSearch(@RequestParam Optional<String> landmarkName, ModelMap model) {
		if(! landmarkName.isPresent()){
			return "landmarkSearch";
		}else{
		Landmark landmark = landDAO.searchLandmarkByName(landmarkName.get());
		model.addAttribute("landmark", landmark);
		return "landmarkDetail";
		}
	}
	
	@RequestMapping(path="/landmarkDetail", method=RequestMethod.GET)
	public String displaySearchResults() {
		return "landmarkDetail";
	}

}
