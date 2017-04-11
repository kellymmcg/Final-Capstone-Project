package com.techelevator.city.model;

public class Review {

	private int id;
	private int landmarkId;
	private String userName;
	private String title;
	private String review;
	private int stars;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLandmarkId() {
		return landmarkId;
	}

	public void setLandmarkId(int landmarkId) {
		this.landmarkId = landmarkId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

}
