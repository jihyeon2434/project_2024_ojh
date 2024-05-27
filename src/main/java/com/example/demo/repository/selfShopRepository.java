package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.conShop;
import com.example.demo.vo.selfShop;

@Mapper
public interface selfShopRepository {
	 // 상점 정보를 데이터베이스에 삽입
	@Insert("""
			INSERT INTO service_selfshop SET
			         categoryId = #{categoryId},
			         shopName = #{shopName},
			         roadName = #{roadName},
			         review = #{review},
			         photoUrl1 = #{photoUrl1},
			         photoUrl2 = #{photoUrl2},
			         photoUrl3 = #{photoUrl3},
			         photoUrl4 = #{photoUrl4},
			         photoUrl5 = #{photoUrl5},
			         phoneNum = #{phoneNum},
			         operateTime = #{operateTime},
			         menu = #{menu},
			         themeId = #{themeId},
			         regDate = NOW(),
			         updateDate = NOW(),
			         delDate = #{delDate},
			         delStatus = #{delStatus}
			""")
	public void insertShop(selfShop shopInfo);
	
	 // 모든 상점 리스트를 조회
	@Select("""
			SELECT *
			FROM service_selfshop
			""")
	public List<selfShop> getShopsList();
		
	
	
    // 특정 상점 ID를 이용하여 상점 상세 정보 조회
	@Select("""
			<script>
			SELECT S.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_selfshop AS S
			LEFT JOIN service_review AS R ON S.categoryId = R.categoryId AND S.id = R.shopId
			WHERE S.id = #{id}
			GROUP BY  S.id, S.categoryId;
			</script>
			""")
	public selfShop getShopById(int id);
	// 상점명으로 상점 정보 조회
	@Select("""
			SELECT * FROM service_selfshop WHERE shopName = #{shopName}
			""")
	public selfShop getShopByName(String shopName);


	 // 특정 가격 범위 내의 상점 조회
	@Select("""

			SELECT S.*, M.menu, M.price
			FROM service_selfshop AS S
			INNER JOIN service_menu AS M
			ON S.themeId = M.themeId AND S.categoryId = M.categoryId AND S.shopName = M.shopName AND M.price > 0
			WHERE
			 (
			     M.price <= ${priceRange}

			 )
			GROUP BY S.shopName
			ORDER BY
			    M.price = 0,
			    M.price ASC;

			""")
	public List<selfShop> getShopsByPriceRange(int priceRange);

	 // 특정 지역의 상점 조회
	@Select("""
			 SELECT * FROM service_selfshop
			 WHERE LEFT(roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			""")
	public List<selfShop> getShopsByArea(String area);


	  // 가장 저렴한 상점 조회
	@Select("""
			SELECT *
			FROM (
			    SELECT S.*, MIN(M.price) AS min_price, AVG(M.price) AS avg_price
			    FROM service_selfshop AS S
			    LEFT JOIN service_menu AS M
			    ON S.themeId = M.themeId AND S.categoryId = M.categoryId AND S.shopName = M.shopName AND M.price > 0
			    GROUP BY S.shopName
			) AS subquery
			ORDER BY CASE WHEN subquery.avg_price IS NULL THEN 1 ELSE 0 END ASC, subquery.min_price ASC;
						""")
	public List<selfShop> getCheapestShops();



    // 별점이 가장 높은 상점 조회
	@Select("""
			<script>
			SELECT S.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_selfshop AS S
			LEFT JOIN service_review AS R ON S.categoryId = R.categoryId AND S.id = R.shopId
			GROUP BY S.id, S.categoryId
			ORDER BY totalStarPoint DESC;
			</script>
			""")
	public List<selfShop> getHighPointShops();

	   // 특정 옵션에 맞는 상점 조회
	@Select("""
		    <script>
		    SELECT * FROM service_selfshop
		    WHERE 1=1
		    <if test="categoryId != null">
		    AND categoryId = #{categoryId}
		    </if>
		    </script>
		""")
	public List<selfShop> getByOptionShopsList(int categoryId);


	
	/*
	 * @Select(""" SELECT S.*, M.menu, M.price FROM service_selfshop AS S INNER JOIN
	 * service_menu AS M ON S.themeId = M.themeId AND S.categoryId = M.categoryId
	 * AND S.shopName = M.shopName AND M.price > 0 WHERE M.price <= ${priceRange}
	 * AND LEFT(C.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인 AND
	 * (S.shopName LIKE '%면접%' OR C.shopName LIKE '%스피치%') -- 명시적으로 C 테이블에 속하는
	 * shopName으로 수정 GROUP BY S.shopName ORDER BY M.price = 0, M.price ASC; """)
	 * public List<selfShop> getShopsBySituation2(int priceRange, String area);
	 */


	// 가격 범위에 따른 상점을 조회하는 쿼리
	@Select("""
		    SELECT S.*, M.menu, M.price
		    FROM service_selfshop AS S
		    INNER JOIN service_menu AS M
		    ON S.themeId = M.themeId AND S.categoryId = M.categoryId AND S.shopName = M.shopName AND M.price > 0
		    WHERE 
		        M.price >= ${priceRange}
		        AND LEFT(S.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
		    GROUP BY S.shopName
		    ORDER BY
		        M.price = 0,
		        M.price ASC;
		""")
	public List<selfShop> getShopsBySituation1Over3M(int priceRange, String area);
	  // 지역과 가격을 기준으로 상점을 필터링하는 쿼리
	@Select("""
		    SELECT S.*, M.menu, M.price
		    FROM service_selfshop AS S
		    INNER JOIN service_menu AS M
		    ON S.themeId = M.themeId AND S.categoryId = M.categoryId AND S.shopName = M.shopName AND M.price > 0
		    WHERE 
		        M.price <= ${priceRange}
		        AND LEFT(S.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
		    GROUP BY S.shopName
		    ORDER BY
		        M.price = 0,
		        M.price ASC;
		""")
	public List<selfShop> getShopsBySituation1(int priceRange, String area);



	// 별점이 높은 상점을 조회하는 쿼리
	@Select("""
			SELECT S.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_selfshop AS S
			LEFT JOIN service_review AS R ON S.categoryId = R.categoryId AND S.id = R.shopId
			WHERE S.categoryId = #{category}
			GROUP BY S.id, S.categoryId
			ORDER BY totalStarPoint DESC;
			""")
	public List<selfShop> findShopsByHighRating(int category);

	 // 가격이 낮은 상점을 조회하는 쿼리
	@Select("""
			SELECT *
			FROM (
			    SELECT S.*, MIN(M.price) AS min_price, AVG(M.price) AS avg_price
			    FROM service_selfshop AS S
			    LEFT JOIN service_menu AS M
			    ON S.themeId = M.themeId AND S.categoryId = M.categoryId AND S.shopName = M.shopName AND M.price > 0
			    WHERE S.categoryId = #{category}
			    GROUP BY S.shopName
			) AS subquery
			ORDER BY CASE WHEN subquery.avg_price IS NULL THEN 1 ELSE 0 END ASC, subquery.min_price ASC;
						""")
	public List<selfShop> findShopsByLowPrice(int category);


	  // 상점 스크랩 여부를 확인하는 쿼리
	@Select("""
			SELECT ScrapCount
			FROM service_selfshop AS S
			WHERE id = #{shopId} AND categoryId = #{categoryId} AND 
			""")
	public int getDoScrap(int categoryId, int shopId);
	 // 즐겨찾기 점수를 증가시키는 쿼리
	  @Update("""
				UPDATE service_selfshop
				SET goodReactionPoint = goodReactionPoint + 1
				WHERE id = #{shopId}
				AND categoryId= #{categoryId}
				AND themeId= #{themeId}
				""")
	public int increaseGoodReactionPoint(int categoryId, int themeId, int shopId);

	  // 상점의 즐겨찾기 점수를 조회하는 쿼리
	  @Select("""
				SELECT goodReactionPoint
				FROM service_selfshop
				WHERE id = #{shopId}
				AND categoryId= #{categoryId}
				AND themeId= #{themeId}
				""")
	public int getGoodRP(int categoryId, int themeId, int shopId);


	// 즐겨찾기 점수를 감소시키는 쿼리
	  @Update("""
				UPDATE service_selfshop
				SET goodReactionPoint = goodReactionPoint - 1
				WHERE id = #{shopId}
				AND categoryId= #{categoryId}
				AND themeId= #{themeId}
				""")
	public int decreaseGoodReactionPoint(int categoryId, int themeId, int shopId);


	// 사용자가 즐겨찾기한 상점 목록을 조회하는 쿼리
		@Select("""
			    <script>
			    SELECT S.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			    FROM service_selfshop AS S
			    INNER JOIN scrap AS SC ON S.id = SC.shopId
			    LEFT JOIN service_review AS R ON S.id = R.shopId AND S.categoryId = R.categoryId
			    WHERE SC.memberId = #{loginedMemberId} AND SC.point = 1 AND SC.themeId = 2
			    AND S.categoryId IN (3, 4)
			    GROUP BY S.id, S.categoryId
			    ORDER BY totalStarPoint DESC;
			    </script>
			""") 
	public List<selfShop> getscrapShopsList(int loginedMemberId);




}
