package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.Review;

@Mapper
public interface ReviewRepository {

	@Select("""
			SELECT *
			FROM service_review
			WHERE shopId = #{id}
			AND themeId = #{themeId}
			AND categoryId = #{categoryId}
			""")
	public List<Review> getReviewByIdandThemeandCategory(int themeId, int categoryId, int id);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
			FROM service_review
			WHERE shopId = #{id}
			AND themeId = #{themeId}
			AND categoryId = #{categoryId}
			""")
	public Review getReview(int themeId, int categoryId, int id);

	@Insert("""
			    INSERT INTO service_review
			    SET
			        regDate = NOW(),
			        updateDate = NOW(),
			        memberId = #{memberId},
			        themeId = #{themeId},
			        categoryId = #{categoryId},
			        shopId = #{id},
			        starPoint = #{rating},
			        title = #{title},
			        `body` = #{body}
			""")
	public void writeReview(int memberId, String title, String body, int themeId, int categoryId, int id, int rating);

}
