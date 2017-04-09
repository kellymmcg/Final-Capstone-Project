package com.techelevator.city.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCLandmarkDAO implements LandmarkDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCLandmarkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void addLandmark(Landmark newLandmark) {
		String sqlInsertLandmark = "INSERT INTO landmark("
				+ "itinerary_id, name, longitude, latitude, address, "
				+ "website, open_time, close_time, phone, image, "
				+ "admission, handicap_accessible, "
				+ "consession, kid_friendly, water , "
				+ "restroom, description)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertLandmark, newLandmark.getName(),
				newLandmark.getLongitude(), newLandmark.getLatitude(), newLandmark.getAddress(),
				newLandmark.getWebsite(), newLandmark.getOpenTime(), newLandmark.getCloseTime(),
				newLandmark.getPhone(), newLandmark.getImage(), newLandmark.addAdmission(),
				newLandmark.addHandicapAccessible(), newLandmark.addConsession(), 
				newLandmark.addKidFriendly(), newLandmark.addWater(), newLandmark.addRestroom(), newLandmark.getDescription());
	}

	@Override
	public Landmark searchLandmarkById(Long landmarkId) {
		Landmark landmark = null;
		String sqlSelectLandmarkById ="SELECT * FROM landmark WHERE id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkById, landmarkId);
		if(results.next()) {
			landmark = mapRowToLandmark(results);
		}
		return landmark;
	}
	
	@Override
	public List<Landmark> searchLandmarksByName(String landmarkName) {
		List<Landmark> landmarks = new ArrayList<>();
		landmarkName = "%"+landmarkName+"%";
		String sqlSelectLandmarkByName ="SELECT * FROM landmark WHERE name LIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkByName, landmarkName);
		while(results.next()) {
			Landmark landmark = null;
			landmark = mapRowToLandmark(results);
			landmarks.add(landmark);
		}
		return landmarks;
	}

	@Override
	public List<Landmark> searchLandmarksByAddress(String landmarkAddress) {
		List<Landmark> landmarks = new ArrayList<>();
		landmarkAddress = "%"+landmarkAddress+"%";
		String sqlSelectLandmarkByAddress ="SELECT * FROM landmark WHERE address LIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkByAddress, landmarkAddress);
		while(results.next()) {
			Landmark landmark = null;
			landmark = mapRowToLandmark(results);
			landmarks.add(landmark);
		}
		return landmarks;
	}

	private Landmark mapRowToLandmark(SqlRowSet results) {
		Landmark landmark = new Landmark();
		landmark.setId(results.getLong("id"));
		landmark.setName(results.getString("name"));
		landmark.setLongitude(results.getFloat("longitude"));
		landmark.setLatitude(results.getFloat("latitude"));
		landmark.setAddress(results.getString("address"));
		landmark.setWebsite(results.getString("website"));
		landmark.setOpenTime(results.getInt("open_time"));
		landmark.setCloseTime(results.getInt("close_time"));
		landmark.setPhone(results.getString("phone"));
		landmark.setImage(results.getString("image"));
		landmark.setAdmission(results.getInt("admission"));
		landmark.setHandicapAccessible(results.getBoolean("handicap_accessible"));
		landmark.setConsession(results.getBoolean("consession"));
		landmark.setKidFriendly(results.getBoolean("kid_friendly"));
		landmark.setWater(results.getBoolean("water"));
		landmark.setRestroom(results.getBoolean("restroom"));
		landmark.setDescription(results.getString("description"));
		return landmark;
	}


}
