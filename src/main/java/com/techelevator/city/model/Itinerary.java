package com.techelevator.city.model;

import java.sql.Timestamp;
import java.util.Date;

public class Itinerary {

	private int itineraryId;
	private int user;
	private int landmark;
	private String name;
	private String description;
	private Date dateCreated;

	public int getItineraryId() {
		return itineraryId;
	}

	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public int getLandmark() {
		return landmark;
	}

	public void setLandmark(int landmark) {
		this.landmark = landmark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

}
