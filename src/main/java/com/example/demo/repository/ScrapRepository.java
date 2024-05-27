package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ScrapRepository {



    // 좋아요 추가 메서드
	@Insert("""
			INSERT INTO scrap
			SET regDate = NOW(),
			updateDate = NOW(),
			categoryId = #{categoryId},
			themeId = #{themeId},
			shopId = #{shopId},
			memberId = #{loginedMemberId},
			`point` = 1
			""")
	public int addGoodReactionPoint(int loginedMemberId, int categoryId, int themeId, int shopId);

	
	   // 좋아요 삭제 메서드
	@Delete("""
			DELETE FROM scrap
			WHERE categoryId = #{categoryId}
			AND themeId = #{themeId}
			AND shopId = #{shopId}
			AND memberId = #{memberId}
			""")
	public void deleteReactionPoint(int memberId, int categoryId, int themeId, int shopId);

	
	 // 사용자의 즐겨찾기한 상품 점수 합계 조회: 특정 상점에 대한 사용자의 찜한 횟수를 계산
	@Select("""
	        SELECT IFNULL(SUM(S.point),0)
	        FROM scrap AS S
	        WHERE S.Id = #{shopId}
	        AND S.categoryId = #{categoryId}
	        AND S.themeId = #{themeId}
	        AND S.memberId = #{loginedMemberId}
	        """)
	public int getSumScrapCount(int loginedMemberId, int categoryId, int themeId, int shopId);


	 // 사용자의 즐겨찾기 점수 합계 조회: 특정 카테고리, 테마, 상점에 대해 사용자가 추가한 좋아요 점수의 합을 조회
	@Select("""
			SELECT IFNULL(SUM(S.point),0)
			FROM scrap AS S
			WHERE S.categoryId = #{categoryId}
			AND S.themeId = #{themeId}
			AND S.shopId = #{shopId}
			AND S.memberId = #{memberId}
			""")
	public int getSumReactionPoint(int memberId, int categoryId, int themeId, int shopId);



	
	

}
