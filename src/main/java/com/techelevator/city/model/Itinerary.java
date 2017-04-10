package com.techelevator.city.model;

import java.sql.Timestamp;
import java.util.Date;

public class Itinerary {

	private int id;
	private String userName;
	private int landmark;
	private String name;
	private String description;
	private Date dateCreated;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return userName;
	}

	public void setUser(String string) {
		this.userName = string;
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
