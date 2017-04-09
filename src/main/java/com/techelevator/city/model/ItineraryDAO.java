package com.techelevator.city.model;

public interface ItineraryDAO {
	
	public Itinerary findItineraryByUser(int user);
	
	public void createItinerary(Itinerary itinerary);
	
	public void editItinerary(Itinerary itinerary);
	
	public void deleteItinerary(Itinerary itinerary);

}
