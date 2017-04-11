package com.techelevator.city.model;

import java.util.List;

public interface ReviewDAO {
	
	public void submitAReview(Review review);
	public List<Review> displayReviewByLandmark(int landmarkId);

}
