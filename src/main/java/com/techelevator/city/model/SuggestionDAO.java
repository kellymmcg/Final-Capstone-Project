package com.techelevator.city.model;

import java.util.List;

public interface SuggestionDAO {
	
	public void submitSuggestion(String user, String name, String Address, String Description);
	public List<Suggestion> displayAllSuggestions();
	public void removeSuggestion(int id);
}
