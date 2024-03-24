package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReviewRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	public ReviewService(ReviewRepository reviewRepository) {
		this.reviewRepository = reviewRepository;
	}

	// 서비스 메서드
	


	public Review getReview(int themeId, int categoryId, int id) {
		return reviewRepository.getReview(themeId, categoryId, id);
	}
	

	public List<Review> getReviewsByIdandThemeandCategory(int themeId, int categoryId, int id) {
	    return reviewRepository.getReviewByIdandThemeandCategory(themeId, categoryId, id);
	}

	  public ResultData<Integer> writeReview(int loginedMemberId, String title, String body, int themeId, int categoryId, int shopId) {
	        reviewRepository.writeReview(loginedMemberId, title, body, themeId, categoryId, shopId);

	        int newReviewId = reviewRepository.getLastInsertId(); // 리뷰를 삽입한 후에 id를 가져오는 것은 여기서 필요하지 않음

	        return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", newReviewId), "id", newReviewId);
	    }

	
	
	

}