package com.techelevator.city.model;

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
				+ "+website, open_time, close_time, phone, image, "
				+ "int admission, boolean handicap_accessible, "
				+ "boolean consession, boolean kid_friendly, boolean water , "
				+ "boolean restroom)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Long id = getNextId();
		jdbcTemplate.update(sqlInsertLandmark, newLandmark.getReviewId(),
				newLandmark.getLongitude(), newLandmark.getLatitude(), newLandmark.getAddress(),
				newLandmark.getWebsite(), newLandmark.getOpenTime(), newLandmark.getCloseTime(),
				newLandmark.getPhone(), newLandmark.getImage(), newLandmark.getAdmission(),
				newLandmark.isHandicapAccessible(), newLandmark.isConsession(), 
				newLandmark.isKidFriendly(), newLandmark.isWater(), newLandmark.isRestroom());
				newLandmark.setId(id);
	}

	@Override
	public Landmark searchLandmarkById(long landmarkId) {
		Landmark landmark = null;
		String sqlSelectLandmarkById ="SELECT * FROM landmark WHERE id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkById, landmarkId);
		if(results.next()) {
			landmark = mapRowToLandmark(results);
		}
		return landmark;
	}
	
	@Override
	public Landmark searchLandmarkByName(String landmarkName) {
		Landmark landmark = null;
		String sqlSelectLandmarkById ="SELECT * FROM landmark WHERE name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectLandmarkById, landmarkName);
		if(results.next()) {
			landmark = mapRowToLandmark(results);
		}
		return landmark;
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

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_landmark_id')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if (result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next order id");
		}
	}


}
