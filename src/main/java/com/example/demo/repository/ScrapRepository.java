package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ScrapRepository {



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

	/*
	 * @Insert(""" INSERT INTO scrap SET regDate = NOW(), updateDate = NOW(), relId
	 * = #{relId}, memberId = #{memberId}, `point` = -1 """) public int
	 * addBadReactionPoint(int memberId, String relTypeCode, int relId);
	 */

	@Delete("""
			DELETE FROM scrap
			WHERE categoryId = #{categoryId}
			AND themeId = #{themeId}
			AND shopId = #{shopId}
			AND memberId = #{memberId}
			""")
	public void deleteReactionPoint(int memberId, int categoryId, int themeId, int shopId);

	
	
	@Select("""
	        SELECT IFNULL(SUM(S.point),0)
	        FROM scrap AS S
	        WHERE S.Id = #{shopId}
	        AND S.categoryId = #{categoryId}
	        AND S.themeId = #{themeId}
	        AND S.memberId = #{loginedMemberId}
	        """)
	public int getSumScrapCount(int loginedMemberId, int categoryId, int themeId, int shopId);


	
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
