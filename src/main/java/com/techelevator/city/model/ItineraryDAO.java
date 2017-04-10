package com.techelevator.city.model;

import java.util.Date;
import java.util.List;

public interface ItineraryDAO {
	
	public List<Itinerary> findItineraryByUser(String currentUser);
	
	public Itinerary findItineraryById(int id);
	
	public void addLandmarkToItinerary(int itineraryId, String user, int landmarkId, String name, Date date, String description);
	
	public void createItinerary(Itinerary itinerary);
	
	public void editItinerary(Itinerary itinerary);
	
	public void deleteItinerary(Itinerary itinerary);

}
