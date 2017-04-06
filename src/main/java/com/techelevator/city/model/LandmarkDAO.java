package com.techelevator.city.model;

import java.util.List;

public interface LandmarkDAO {

	public void addLandmark(Landmark newLandmark);
	
	public Landmark searchLandmarkById(long landmarkId);

	public List<Landmark> searchLandmarksByName(String landmarkName);
	
}
