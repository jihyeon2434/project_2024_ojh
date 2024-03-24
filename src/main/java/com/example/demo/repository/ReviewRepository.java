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

	

	

}