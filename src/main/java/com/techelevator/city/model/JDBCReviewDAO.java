package com.techelevator.city.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCReviewDAO implements ReviewDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCReviewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void submitAReview(Review review) {
		String sqlInsertReview ="INSERT INTO review("
				+"landmarkId, user_name, title, review, stars)"
				+"VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sqlInsertReview, review.getLandmarkId(),
				review.getUserName(), review.getTitle(), review.getReview(), review.getStars());

	}

	@Override
	public List<Review> displayReviewByLandmark(int landmarkId) {
		List<Review> reviews = new ArrayList<>();
		String sqlSelectReviewByLandmark="SELECT * FROM review WHERE landmarkId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectReviewByLandmark, landmarkId);
		while(results.next()) {
			Review review = null;
			review = mapRowToReview(results);
			reviews.add(review);
		}
		return reviews;
	}

	private Review mapRowToReview(SqlRowSet results) {
		Review review = new Review();
		review.setId(results.getInt("id"));
		review.setLandmarkId(results.getInt("landmarkId"));
		review.setUserName(results.getString("user_name"));
		review.setTitle(results.getString("title"));
		review.setReview(results.getString("review"));
		review.setStars(results.getInt("stars"));
		return review;
	}

}
