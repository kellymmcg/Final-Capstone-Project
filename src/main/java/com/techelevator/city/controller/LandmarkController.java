package com.techelevator.city.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.city.model.Landmark;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
@SessionAttributes("currentUser")
public class LandmarkController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
	
	@Autowired
	public LandmarkController(UserDAO userDAO, LandmarkDAO landDAO) {
		this.userDAO = userDAO;
		this.landDAO = landDAO;
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
	public String displaySearchResults() {
		return "landmarkDetails";
	}

}
