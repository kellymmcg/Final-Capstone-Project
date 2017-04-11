package com.techelevator.city.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCityDAO implements CityDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCCityDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public City getCityByName(String name) {
		City city = new City();
		String sqlGetCityByName = "SELECT * FROM city WHERE name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCityByName, name);
		if(results.next()){
			mapRowToCity(city, results);
		}
		return city;
	}

	private void mapRowToCity(City city, SqlRowSet results) {
		city.setName(results.getString("name"));
		city.setLatitude(results.getFloat("latitude"));
		city.setLongitude(results.getFloat("longitude"));
	}

}
