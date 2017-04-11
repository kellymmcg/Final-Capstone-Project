package com.techelevator.city.model;

import java.util.List;

public interface SuggestionDAO {
	
	public void submitSuggestion(Suggestion suggestion);
	public List<Suggestion> displayAllSuggestions();
	public void removeSuggestion(int id);
}
