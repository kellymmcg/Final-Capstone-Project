package com.techelevator.city.model;

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
	public Itinerary findItineraryByUser(int user) {
		Itinerary itinerary = null;
		String sqlSelectItineraryByUser = "SELECT * FROM itinerary WHERE app_user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectItineraryByUser, user);
		if(results.next()) {
			itinerary = mapRowToItinerary(results);
		}
		return null;
	}
	
	private Itinerary mapRowToItinerary(SqlRowSet results) {
		Itinerary itinerary = new Itinerary();
		itinerary.setItineraryId(results.getInt("id"));
		itinerary.setUser(results.getInt("app_user_id"));
		itinerary.setLandmark(results.getInt("landmark_id"));
		itinerary.setName(results.getString("name"));
		itinerary.setDateCreated(results.getTimestamp("date_started"));
		itinerary.setDescription(results.getString("description"));
		return itinerary;
	}
}
