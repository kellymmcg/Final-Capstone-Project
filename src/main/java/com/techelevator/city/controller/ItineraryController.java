package com.techelevator.city.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.city.model.Itinerary;
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
		public String displayManageItineraryPage(@RequestParam Optional<Integer> id, ModelMap model) {
			if(! id.isPresent()){
				String userName = (String) model.get("currentUser");
				model.put("cItineraries", itineraryDAO.findCurrentItineraryByUser(userName));
				model.put("pItineraries", itineraryDAO.findCompletedItineraryByUser(userName));
				return "manageItinerary";
			}
			model.put("itinerary", itineraryDAO.findItineraryById(id.get(), (String)model.get("currentUser")));
			model.put("landmarks", landDAO.getLandmarksByItineraryId(id.get(), (String)model.get("currentUser")));
			if(model.get("itinerary") == null){
				// THROW EXCEPTION HERE?
			}
			return "itineraryPage";
		}
		
		@RequestMapping(path="/manageItinerary", method=RequestMethod.POST)
		public String deleteItinerary(@RequestParam String name, 
									  @RequestParam String userName, 
									  ModelMap model) {
			itineraryDAO.deleteItinerary(name, userName);
			return "redirect:/manageItinerary";
		}
		
		@RequestMapping(path="/addToItinerary", method=RequestMethod.POST)
		public String addLandmarkToItinerary(@RequestParam int id, 
											 @RequestParam int landmarkId, 
											 ModelMap model) {
			
			Itinerary itinerary = itineraryDAO.findItineraryById(id, (String)model.get("currentUser"));
			itinerary.setLandmark(landmarkId);
			itineraryDAO.addLandmarkToItinerary(itinerary);
			return "redirect:/manageItinerary";
		}
		
		@RequestMapping (path="/completeItinerary", method=RequestMethod.POST)
		public String markItineraryAsComplete(@RequestParam int id) {
			itineraryDAO.markItineraryAsCompleted(id);
			return "redirect:/manageItinerary";
		}
		
		@RequestMapping (path="/incompleteItinerary", method=RequestMethod.POST)
		public String markItineraryAsIncompleted(@RequestParam int id) {
			itineraryDAO.markItineraryAsIncompleted(id);
			return "redirect:/manageItinerary";
		}
		
		@RequestMapping (path="/createNewItinerary", method=RequestMethod.POST)
		public String createNewItinerary(@RequestParam String name,
										 @RequestParam String description,
										 ModelMap model){
			
			itineraryDAO.createItinerary((String)model.get("currentUser"), name, description);
			model.put("notice", "You've successfully created a new Itinerary!");
			return "redirect:/manageItinerary";
		}
		
}
