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
				+ "reviewid, name, longitude, latitude, address, "
				+ "website, open_time, close_time, phone, image, "
				+ "admission, handicap_accessible, "
				+ "consession, kid_friendly, water , "
				+ "restroom)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertLandmark, newLandmark.getReviewId(), newLandmark.getName(),
				newLandmark.getLongitude(), newLandmark.getLatitude(), newLandmark.getAddress(),
				newLandmark.getWebsite(), newLandmark.getOpenTime(), newLandmark.getCloseTime(),
				newLandmark.getPhone(), newLandmark.getImage(), newLandmark.getAdmission(),
				newLandmark.isHandicapAccessible(), newLandmark.isConsession(), 
				newLandmark.isKidFriendly(), newLandmark.isWater(), newLandmark.isRestroom());
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
		String sqlSelectLandmarkById ="SELECT * FROM landmark WHERE name LIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkById, landmarkName);
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
		landmark.setReviewId(results.getInt("reviewId"));
		landmark.setImage(results.getString("image"));
		landmark.setAdmission(results.getInt("admission"));
		landmark.setHandicapAccessible(results.getBoolean("handicap_accessible"));
		landmark.setConsession(results.getBoolean("consession"));
		landmark.setKidFriendly(results.getBoolean("kid_friendly"));
		landmark.setWater(results.getBoolean("water"));
		landmark.setRestroom(results.getBoolean("restroom"));
		return landmark;
	}

}
