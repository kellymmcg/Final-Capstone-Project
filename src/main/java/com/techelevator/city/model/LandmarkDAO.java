package com.techelevator.city.model;

import java.util.List;

public interface LandmarkDAO {

	public void addLandmark(Landmark newLandmark);
	
	public Landmark searchLandmarkById(Long landmarkId);

	public List<Landmark> searchLandmarksByName(String landmarkName);
	
	public List<Landmark> searchLandmarksByAddress(String landmarkAddress);
	
	public List<Landmark> getLandmarksByItineraryId (int id);
	
}
