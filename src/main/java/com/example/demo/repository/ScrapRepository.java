package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Scrap;

@Mapper
public interface ScrapRepository {

	@Select("""
			SELECT * FROM service_scrap
			WHERE themeId = #{themeId} AND categoryId = #{categoryId} AND shopId = #{shopId} AND memberId = #{memberId}
			""")
	public Scrap getScrap(@Param("themeId") String themeId, @Param("categoryId") String categoryId,
			@Param("shopId") int shopId, @Param("memberId") int memberId);

	@Delete("""
	        DELETE FROM service_scrap
	        WHERE memberId = #{memberId}
	        AND themeId = #{themeId}
	        AND categoryId = #{categoryId}
	        AND shopId = #{shopId}
	        """)
	int removeScrap(String themeId, String categoryId, int shopId, int memberId);

	@Select("""
	        SELECT IFNULL(SUM(SC.scrapPoint),0)
	        FROM service_scrap AS SC
	        WHERE memberId = #{memberId}
	        AND themeId = #{themeId}
	        AND categoryId = #{categoryId}
	        AND shopId = #{shopId}
	        """)
	public int getSumReactionPoint(int themeId, int categoryId, int shopId, int memberId);


	@Insert("""
			INSERT INTO service_scrap
			SET memberId =#{memberId},
			themeId =#{themeId},
			categoryId =#{categoryId},
			shopId =#{shopId},
			scrapDate= NOW(),
			scrapUpdateDate= NOW(),
			scrapPoint=1
			""")
	public int addGoodReactionPoint(int memberId, int themeId, int categoryId, int shopId);

	@Delete("""
			DELETE FROM service_scrap
			WHERE memberId = #{memberId} AND
			themeId = #{themeId} AND
			categoryId = #{categoryId} AND
			shopId = #{shopId}
			""")
	public void deleteScrapPoint(int memberId, int themeId, int categoryId, int shopId);

}