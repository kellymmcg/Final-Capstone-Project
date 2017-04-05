package com.techelevator.city.model;

public interface LandmarkDAO {

	public void addLandmark(Landmark newLandmark);
	
	public Landmark searchLandmarkById(long landmarkId);

	public Landmark searchLandmarkByName(String landmarkName);
	
}
