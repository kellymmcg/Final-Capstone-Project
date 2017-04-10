package com.techelevator.city.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCItineraryDAO implements ItineraryDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCItineraryDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Itinerary> findItineraryByUser(String currentUser) {
		List<Itinerary> itineraries = new ArrayList<>();
		String sqlSelectItineraryByUser = "SELECT * FROM itinerary WHERE user_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, currentUser);
		while(results.next()) {
			Itinerary itinerary = new Itinerary();
			itinerary = mapRowToItinerary(results);
			itineraries.add(itinerary);
		}
		return itineraries;
	}
	
	@Override
	public Itinerary findItineraryById(int id) {
		Itinerary itinerary = null;
		String sqlSelectItineraryById = "SELECT * FROM itinerary WHERE itineraryId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryById, id);
		while(results.next()) {
			itinerary = mapRowToItinerary(results);
		}
		return itinerary;
	}
	
	@Override
	public void createItinerary(Itinerary itinerary) {
		String sqlInsertItinerary = "INSERT INTO itinerary("
				+"app_user_id, landmark_id, name, date_started, description"
				+"VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertItinerary, itinerary.getUserName(), itinerary.getLandmark(),
				itinerary.getName(), itinerary.getDateCreated(), itinerary.getDescription());
	}
	@Override
	public void editItinerary(Itinerary itinerary) {
		String sqlUpdateItinerary = "UPDATE itinerary"
				+"SET app_user_id = ?, landmark_id = ?, name = ?, description= ?"
				+"WHERE id= ?";
		jdbcTemplate.update(sqlUpdateItinerary, itinerary.getUserName(), itinerary.getLandmark(),
				itinerary.getName(), itinerary.getDescription(), itinerary.getId());
	}
	
	@Override
	public void deleteItinerary(String itineraryName, String userName) {
		String sqlDeleteItinerary = "DELETE FROM itinerary "
				+"WHERE name = ? "
				+ "AND user_name = ?";
		jdbcTemplate.update(sqlDeleteItinerary, itineraryName, userName);
	}
	
	@Override
	public void addLandmarkToItinerary(int itineraryId, String user, int landmarkId, String name, Date date, String description) {
		String sqlInsertNewLandmarkToItinerary = "INSERT INTO itinerary(itineraryId, user_name, landmarkId, name, date_started, description) "
				+ "VALUES (?, ?, ?, ?, ?, ?);";
		jdbcTemplate.update(sqlInsertNewLandmarkToItinerary, itineraryId, user, landmarkId, name, date, description);
		
	}
	
	private Itinerary mapRowToItinerary(SqlRowSet results) {
		Itinerary itinerary = new Itinerary();
		itinerary.setId(results.getInt("itineraryId"));
		itinerary.setUserName(results.getString("user_name"));
		itinerary.setLandmark(results.getInt("landmarkId"));
		itinerary.setName(results.getString("name"));
		itinerary.setDateCreated(results.getDate("date_started"));
		itinerary.setDescription(results.getString("description"));
		return itinerary;
	}


}
