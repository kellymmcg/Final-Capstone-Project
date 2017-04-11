package com.techelevator.city.model;

public interface ReviewDAO {
	
	public void submitAReview(Review review);
	public Review displayReviewByLandmark(int landmarkId);

}
