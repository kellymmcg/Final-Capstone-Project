package com.techelevator.city.model;

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
				+"landmarkId, user_name, review, stars)"
				+"VALUES(?,?,?,?)";
		jdbcTemplate.update(sqlInsertReview, review.getLandmarkId(),
				review.getUserName(), review.getReview(), review.getStars());

	}

	@Override
	public Review displayReviewByLandmark(int landmarkId) {
		Review review = null;
		String sqlSelectReviewByLandmark="SELECT * FROM review WHERE landmarkId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectReviewByLandmark, landmarkId);
		if(results.next()) {
			review = mapRowToReview(results);
		}
		return review;
	}

	private Review mapRowToReview(SqlRowSet results) {
		Review review = new Review();
		review.setId(results.getInt("id"));
		review.setLandmarkId(results.getInt("landmarkId"));
		review.setUserName(results.getString("user_name"));
		review.setReview(results.getString("review"));
		review.setStars(results.getInt("stars"));
		return review;
	}

}
