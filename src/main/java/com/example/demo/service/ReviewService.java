package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReviewRepository;
import com.example.demo.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	public ReviewService(ReviewRepository reviewRepository) {
		this.reviewRepository = reviewRepository;
	}

	// 서비스 메서드
	


	
	

	public List<Review> getReviewsByIdandThemeandCategory(int themeId, int categoryId, int id) {
	    return reviewRepository.getReviewByIdandThemeandCategory(themeId, categoryId, id);
	}

}