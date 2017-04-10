package com.techelevator.city.model;

import java.util.List;

public interface ItineraryDAO {
	
	public List<Itinerary> findItineraryByUser(int user);
	
	public void createItinerary(Itinerary itinerary);
	
	public void editItinerary(Itinerary itinerary);
	
	public void deleteItinerary(Itinerary itinerary);

}
