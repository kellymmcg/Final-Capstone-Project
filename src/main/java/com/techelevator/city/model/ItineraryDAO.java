package com.techelevator.city.model;

import java.util.Date;
import java.util.List;

public interface ItineraryDAO {
	
	public List<Itinerary> findCurrentItineraryByUser(String currentUser);
	
	public List<Itinerary> findCompletedItineraryByUser(String currentUser);
	
	public Itinerary findItineraryById(int id);
	
	public void markItineraryAsCompleted(int id);
	
	public void markItineraryAsIncompleted(int id);
	
	public void addLandmarkAndCreateNewItinerary(String user, int landmarkId, String name, Date date, String description);
	
	public void createItinerary(String user, String name, String description);
	
	public void addLandmarkToItinerary(Itinerary itinerary);
	
	public void editItinerary(Itinerary itinerary);
	
	public void deleteItinerary(String itineraryName, String userName);

}
