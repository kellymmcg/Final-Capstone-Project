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
	public List<Itinerary> findCurrentItineraryByUser(String currentUser) {
		boolean status = false;
		List<Itinerary> itineraries = new ArrayList<>();
		String sqlSelectItineraryByUser = "SELECT DISTINCT itineraryId, user_name, name, date_started, "
									    + "description, completed FROM itinerary WHERE user_name = ? AND completed = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, currentUser, status);
		while(results.next()) {
			Itinerary itinerary = new Itinerary();
			itinerary = mapRowToItinerary(results);
			itineraries.add(itinerary);
		}
		return itineraries;
	}
	
	@Override
	public List<Itinerary> findCompletedItineraryByUser(String currentUser) {
		boolean status = true;
		List<Itinerary> itineraries = new ArrayList<>();
		String sqlSelectItineraryByUser = "SELECT DISTINCT itineraryId, user_name, name, date_started, "
									    + "description, completed FROM itinerary WHERE user_name = ? AND completed = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, currentUser, status);
		while(results.next()) {
			Itinerary itinerary = new Itinerary();
			itinerary = mapRowToItinerary(results);
			itineraries.add(itinerary);
		}
		return itineraries;
	}
	
	@Override
	public Itinerary findItineraryById(int id, String user) {
		Itinerary itinerary = null;
		String sqlSelectItineraryById = "SELECT * FROM itinerary WHERE itineraryId = ? AND user_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryById, id, user);
		while(results.next()) {
			itinerary = mapRowToItinerary(results);
		}
		return itinerary;
	}
	
	@Override
	public void createItinerary(String user, String name, String description) {
		Date date = new Date();
		String sqlInsertItinerary = "INSERT INTO itinerary("
				+"user_name, name, date_started, description) "
				+"VALUES(?,?,?,?)";
		jdbcTemplate.update(sqlInsertItinerary, user, name, date, description);
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
	public void addLandmarkAndCreateNewItinerary(String user, int landmarkId, String name, Date date, String description) {
		String sqlInsertNewLandmarkToItinerary = "INSERT INTO itinerary(user_name, landmarkId, name, date_started, description) "
				+ "VALUES (?, ?, ?, ?, ?);";
		jdbcTemplate.update(sqlInsertNewLandmarkToItinerary, user, landmarkId, name, date, description);
		
	}
	
	@Override
	public void addLandmarkToItinerary(Itinerary itinerary) {
		String sqlInsertNewLandmarkToItinerary = "INSERT INTO itinerary(itineraryId, user_name, landmarkId, name, date_started, description) "
				+ "VALUES (?, ?, ?, ?, ?, ?);";
		jdbcTemplate.update(sqlInsertNewLandmarkToItinerary, itinerary.getId(), itinerary.getUserName(), itinerary.getLandmark(), itinerary.getName(), itinerary.getDateCreated(), itinerary.getDescription());
		
	}
	
	@Override
	public void markItineraryAsCompleted(int id) {
		boolean completed = true;
		String sqlMarkItineraryAsCompleted = "UPDATE itinerary SET completed = ? WHERE itineraryId = ?";
		jdbcTemplate.update(sqlMarkItineraryAsCompleted, completed, id);
		
	}
	
	@Override
	public void markItineraryAsIncompleted(int id) {
		boolean completed = false;
		String sqlMarkItineraryAsCompleted = "UPDATE itinerary SET completed = ? WHERE itineraryId = ?";
		jdbcTemplate.update(sqlMarkItineraryAsCompleted, completed, id);
		
	}
	
	
	private Itinerary mapRowToItinerary(SqlRowSet results) {
		Itinerary itinerary = new Itinerary();
		itinerary.setId(results.getInt("itineraryId"));
		itinerary.setUserName(results.getString("user_name"));
		try{
			itinerary.setLandmark(results.getInt("landmarkId"));
		}catch (Exception e){
			// ONLY HAPPENS WHEN DISPLAYING UNIQUE ITINERARIES 
		}
		itinerary.setName(results.getString("name"));
		itinerary.setDateCreated(results.getDate("date_started"));
		itinerary.setDescription(results.getString("description"));
		itinerary.setCompleted(results.getBoolean("completed"));
		return itinerary;
	}


}
