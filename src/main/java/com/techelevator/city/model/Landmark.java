package com.techelevator.city.model;

import java.text.DecimalFormat;

public class Landmark {

	private Long id;
	private String name;
	private float longitude;
	private float latitude;
	private String address;
	private String website;
	private int openTime;
	private int closeTime;
	private String phone;
	private String image;
	private int admission;
	private boolean handicapAccessible;
	private boolean consession;
	private boolean kidFriendly;
	private boolean water;
	private boolean restroom;
	private String description;

	public String getHandicapAccessible() {
		if(handicapAccessible == true){
			return "Yes";
		}
		return "No";
	}
	
	public boolean addHandicapAccessible() {
		return handicapAccessible;	
	}

	public void setHandicapAccessible(boolean handicapAccessible) {
		this.handicapAccessible = handicapAccessible;
	}

	public String getConsession() {
		if(consession == true){
			return "Yes";
		}
		return "No";
	}
	
	public boolean addConsession(){
		return consession;
	}
	
	public void setConsession(boolean consession) {
		this.consession = consession;
	}

	public String getKidFriendly() {
		if(kidFriendly == true){
			return "Yes";
		}
		return "No";
	}
	
	public boolean addKidFriendly() {
		return kidFriendly;
	}

	public void setKidFriendly(boolean kidFriendly) {
		this.kidFriendly = kidFriendly;
	}

	public String getWater() {
		if(water == true){
			return "Yes";
		}
		return "No";
	}
	
	public boolean addWater() {
		return water;
	}

	public void setWater(boolean water) {
		this.water = water;
	}

	public String getRestroom() {
		if(restroom == true){
			return "Yes";
		}
		return "No";
	}
	
	public boolean addRestroom() {
		return restroom;
	}

	public void setRestroom(boolean restroom) {
		this.restroom = restroom;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public int getOpenTime() {
		return openTime;
	}

	public void setOpenTime(int openTime) {
		this.openTime = openTime;
	}

	public int getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(int closeTime) {
		this.closeTime = closeTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAdmission() {
		DecimalFormat df = new DecimalFormat("'$'0.00");
		if(admission == 0) {
			return "No admission";
		}else if(admission == 808){
			return "Varies";
		}else{
			return df.format((double)admission / 100);
		}
	}
	
	public int addAdmission() {
		return admission;
	}

	public void setAdmission(int admission) {
		this.admission = admission;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
