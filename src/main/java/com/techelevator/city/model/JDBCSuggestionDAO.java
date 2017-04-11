package com.techelevator.city.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCSuggestionDAO implements SuggestionDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSuggestionDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void submitSuggestion(Suggestion suggestion) {
		String sqlInsertSuggestion = "INSERT INTO suggestion("
				+"user_name, name, address, description"
				+"VALUES(?,?,?,?)";
		jdbcTemplate.update(sqlInsertSuggestion, suggestion.getUserName(), 
				suggestion.getName(), suggestion.getAddress(), suggestion.getDescription());
	}

	@Override
	public List<Suggestion> displayAllSuggestions() {
		List<Suggestion> suggestions = new ArrayList<>();
		String sqlSelectAllSuggestions = "SELECT * FROM suggestion";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSuggestions);
		while(results.next()) {
			Suggestion suggestion = null;
			suggestion = mapRowToSuggestion(results);
			suggestions.add(suggestion);
		}
		return suggestions;
	}


	@Override
	public void removeSuggestion(int id) {
		String sqlDeleteSuggestion = "DELETE FROM suggestion"
				+"WHERE id = ?";
		jdbcTemplate.update(sqlDeleteSuggestion, id);
	}
	
	private Suggestion mapRowToSuggestion(SqlRowSet results) {
		Suggestion suggestion = new Suggestion();
		suggestion.setUserName(results.getString("user_name"));
		suggestion.setName(results.getString("name"));
		suggestion.setAddress(results.getString("address"));
		suggestion.setDescription(results.getString("description"));
		return suggestion;
	}

}
