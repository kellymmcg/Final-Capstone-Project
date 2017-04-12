package com.techelevator.city.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.city.model.City;
import com.techelevator.city.model.CityDAO;
import com.techelevator.city.model.Itinerary;
import com.techelevator.city.model.ItineraryDAO;
import com.techelevator.city.model.Landmark;
import com.techelevator.city.model.LandmarkDAO;
import com.techelevator.city.model.Review;
import com.techelevator.city.model.ReviewDAO;
import com.techelevator.city.model.UserDAO;

@Transactional
@Controller
@SessionAttributes("currentUser")
public class LandmarkController {

	private UserDAO userDAO;
	private LandmarkDAO landDAO;
	private ItineraryDAO itineraryDAO;
	private CityDAO cityDAO;
	private ReviewDAO reviewDAO;
	
	@Autowired
	public LandmarkController(UserDAO userDAO, LandmarkDAO landDAO, ItineraryDAO itineraryDAO, CityDAO cityDAO, ReviewDAO reviewDAO) {
		this.userDAO = userDAO;
		this.landDAO = landDAO;
		this.itineraryDAO = itineraryDAO;
		this.cityDAO = cityDAO;
		this.reviewDAO = reviewDAO;
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String submitLandmarkSearch(@RequestParam Optional<String> name, ModelMap model) {
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
		List<Review> reviews = reviewDAO.displayReviewByLandmark(id.get());
		List<Itinerary> itineraries = itineraryDAO.findCurrentItineraryByUser((String)model.get("currentUser"));
		model.put("itineraries", itineraries);
		model.addAttribute(landmark);
		model.put("reviews", reviews);
		return "landmarkDetails";
	}
	
	@RequestMapping(path="/landmarkDetails", method=RequestMethod.GET)
	public String displaySearchResults(ModelMap model) {
		return "landmarkDetails";
	}
	
	@RequestMapping(path="/landmarkDetails", method=RequestMethod.POST)
	public String addLandmarkToItinerary(@RequestParam String user, 
										 @RequestParam String name, 
										 @RequestParam String description, 
										 @RequestParam int landmarkId, 
										 ModelMap model) {
		Date date = new Date();
		itineraryDAO.addLandmarkAndCreateNewItinerary(user, landmarkId, name, date, description); // CURRENTLY HARDCODED
		return "redirect:/manageItinerary";
		
	}
	
	@RequestMapping(path="/proximitySearch", method=RequestMethod.GET)
	public String displaySearchResults(@RequestParam double radius, 
			   						   @RequestParam String city,
			   						   @RequestParam Optional<Long> id,
			   						   ModelMap model){
		
		if(! id.isPresent()){
			City sCity = cityDAO.getCityByName(city);
			List<Landmark> landmarks = landDAO.searchLandmarksByProximity(sCity.getLatitude(), sCity.getLongitude(), radius);
			model.put("landmarks", landmarks);
			model.put("radius", radius);
			model.put("city", city);
			return "proximitySearch";
		}

		return "proximitySearch";
	}
	
	@ResponseBody
	@RequestMapping(path="/jsonLandmarks", method=RequestMethod.GET)
	public String generateJsonLandmarks(@RequestParam double radius, 
			  					  		@RequestParam String city, 
			  					  		ModelMap model) throws JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		City sCity = cityDAO.getCityByName(city);
		List<Landmark> landmarks = landDAO.searchLandmarksByProximity(sCity.getLatitude(), sCity.getLongitude(), radius);
		return mapper.writeValueAsString(landmarks);
	}

}
