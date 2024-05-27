package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.conShop;

@Mapper
public interface ConsultShopRepository {

	// 데이터베이스에 새로운 상담 가게를 다양한 속성과 함께 삽입
	@Insert("""
			INSERT INTO service_Conshop SET
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
			         con_availableTime = #{conAvailableTime},
			         operateTime = #{operateTime},
			         menu = #{menu},
			         themeId = #{themeId},
			         regDate = NOW(),
			         updateDate = NOW(),
			         delDate = #{delDate},
			         delStatus = #{delStatus}
			""")
	public void insertShop(conShop shopInfo);

	// 상담 가게를 모두 검색하며, 리뷰를 조인하여 평균 별점을 계산
	@Select("""
			<script>
			SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
			GROUP BY  C.id, C.categoryId;
			</script>
			""")
	public List<conShop> getShopsList();

	// 카테고리에 따라 가게를 필터링하여 검색
	@Select("""
			    <script>
			    SELECT * FROM service_Conshop
			    WHERE 1=1
			    <if test="categoryId != null">
			    AND categoryId = #{categoryId}
			    </if>
			    </script>
			""")
	List<conShop> getByOptionShopsList(@Param("categoryId") int categoryId);

	// 특정 ID의 가게를 검색하며, 리뷰를 조인하여 평균 별점을 계산
	@Select("""
			<script>
			SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
			WHERE C.id = #{id}
			GROUP BY  C.id, C.categoryId;
			</script>
			""")
	public conShop getShopById(int id);

	@Select("""
			SELECT * FROM service_Conshop WHERE shopName = #{shopName}
			""")
	public conShop getShopByName(String shopName);

	// 평균 별점을 기준으로 정렬하여 별점이 높은 가게를 검색
	@Select("""
			<script>
			SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
			GROUP BY C.id, C.categoryId
			ORDER BY totalStarPoint DESC;
			</script>
			""")
	public List<conShop> getHighPointShops();

	// 가격이 저렴한 가게를 검색하기 위해 최소 가격과 평균 가격을 기준으로 정렬합니다.
	@Select("""
			SELECT *
			FROM (
			    SELECT C.*, MIN(M.price) AS min_price, AVG(M.price) AS avg_price
			    FROM service_Conshop AS C
			    LEFT JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    GROUP BY C.shopName
			) AS subquery
			ORDER BY CASE WHEN subquery.avg_price IS NULL THEN 1 ELSE 0 END ASC, subquery.min_price ASC;
						""")
	public List<conShop> getCheapestShops();

	// 주어진 상점 이름과 도로 이름을 가진 상점이 이미 존재하는지 확인합니다.
	@Select("""
			SELECT COUNT(*) > 0 FROM service_Conshop
			WHERE shopName = #{shopName} AND roadName = #{roadName}
			""")
	public boolean existsByShopNameAndRoadName(@Param("shopName") String shopName, @Param("roadName") String roadName);

	// 주어진 지역 코드와 일치하는 도로명을 가진 가게를 검색합니다.
	@Select("""
			 SELECT * FROM service_Conshop
			 WHERE LEFT(roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			""")
	public List<conShop> getShopsByArea(String area);

	// 특정 가격 범위 이하의 메뉴를 가진 가게를 검색합니다.
	@Select("""

			SELECT C.*, M.menu, M.price
			FROM service_Conshop AS C
			INNER JOIN service_menu AS M
			ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			WHERE
			 (
			     M.price <= ${priceRange}

			 )
			GROUP BY C.shopName
			ORDER BY
			    M.price = 0,
			    M.price ASC;

			""")
	public List<conShop> getShopsByPriceRange(@Param("priceRange") int priceRange);

	// 주어진 카테고리에 따라 별점이 높은 순으로 가게를 검색
	@Select("""
			SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
			WHERE C.categoryId = #{category}
			GROUP BY C.id, C.categoryId
			ORDER BY totalStarPoint DESC;
			""")
	List<conShop> findShopsByHighRating(@Param("category") int category);

	// 주어진 카테고리에 따라 최저 가격과 평균 가격을 기준으로 정렬하여 가장 저렴한 가게를 검색
	@Select("""
			SELECT *
			FROM (
			    SELECT C.*, MIN(M.price) AS min_price, AVG(M.price) AS avg_price
			    FROM service_Conshop AS C
			    LEFT JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    WHERE C.categoryId = #{category}
			    GROUP BY C.shopName
			) AS subquery
			ORDER BY CASE WHEN subquery.avg_price IS NULL THEN 1 ELSE 0 END ASC, subquery.min_price ASC;
						""")
	public List<conShop> findShopsByLowPrice(int category);

	// 특정 가격 범위 이하이면서 특정 지역에 위치하고 '면접' 또는 '스피치'가 포함된 가게 이름을 가진 가게를 검색
	@Select("""
			    SELECT C.*, M.menu, M.price
			    FROM service_Conshop AS C
			    INNER JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    WHERE
			        M.price <= ${priceRange}
			        AND LEFT(C.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			        AND (C.shopName LIKE '%면접%' OR C.shopName LIKE '%스피치%') -- 명시적으로 C 테이블에 속하는 shopName으로 수정
			    GROUP BY C.shopName
			    ORDER BY
			        M.price = 0,
			        M.price ASC;
			""")
	public List<conShop> getShopsBySituation2(@Param("priceRange") int priceRange, @Param("area") String area);

	// 특정 가격 범위 이하이면서 특정 지역에 위치하고 '면접' 또는 '스피치'가 포함되지 않은 가게 이름을 가진 가게를 검색합니다.
	@Select("""
			    SELECT C.*, M.menu, M.price
			    FROM service_Conshop AS C
			    INNER JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    WHERE
			        M.price <= ${priceRange}
			        AND LEFT(C.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			        AND C.shopName NOT LIKE '%면접%'
			        AND C.shopName NOT LIKE '%스피치%'
			    GROUP BY C.shopName
			    ORDER BY
			        M.price = 0,
			        M.price ASC;
			""")
	public List<conShop> getShopsBySituation1(@Param("priceRange") int priceRange, @Param("area") String area);

	// 300만원 이상의 가격 범위에 있으면서 특정 지역에 위치하고 '면접' 또는 '스피치'가 포함되지 않은 가게 이름을 가진 가게를 검색합니다.
	@Select("""
			    SELECT C.*, M.menu, M.price
			    FROM service_Conshop AS C
			    INNER JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    WHERE
			        M.price >= ${priceRange}
			        AND LEFT(C.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			        AND C.shopName NOT LIKE '%면접%'
			        AND C.shopName NOT LIKE '%스피치%'
			    GROUP BY C.shopName
			    ORDER BY
			        M.price = 0,
			        M.price ASC;
			""")
	public List<conShop> getShopsBySituation1Over3M(int priceRange, String area);

	// 특정 가격 범위 이상이면서 특정 지역에 위치하고 '면접' 또는 '스피치'가 포함된 가게 이름을 가진 가게를 검색합니다.
	@Select("""
			    SELECT C.*, M.menu, M.price
			    FROM service_Conshop AS C
			    INNER JOIN service_menu AS M
			    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			    WHERE
			        M.price >= ${priceRange}
			        AND LEFT(C.roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			        AND (C.shopName LIKE '%면접%' OR C.shopName LIKE '%스피치%') -- 명시적으로 C 테이블에 속하는 shopName으로 수정
			    GROUP BY C.shopName
			    ORDER BY
			        M.price = 0,
			        M.price ASC;
			""")
	public List<conShop> getShopsBySituation2Over3M(int priceRange, String area);

	// 주어진 가게, 카테고리, 회원 ID에 해당하는 스크랩 수를 반환합니다.
	@Select("""
			SELECT ScrapCount
			FROM service_Conshop AS C
			WHERE id = #{shopId} AND categoryId = #{categoryId} AND
			""")
	public int getDoScrap(int categoryId, int shopId, int memberId);

	// 주어진 가게, 카테고리, 테마 ID에 해당하는 좋아요 수를 반환합니다.
	@Select("""
			SELECT goodReactionPoint
			FROM service_Conshop
			WHERE id = #{shopId}
			AND categoryId= #{categoryId}
			AND themeId= #{themeId}
			""")
	public int getGoodRP(int categoryId, int themeId, int shopId);

	// 주어진 가게, 카테고리, 테마 ID에 해당하는 가게의 좋아요 수를 1 증가시킵니다.
	@Update("""
			UPDATE service_Conshop
			SET goodReactionPoint = goodReactionPoint + 1
			WHERE id = #{shopId}
			AND categoryId= #{categoryId}
			AND themeId= #{themeId}
			""")
	public int increaseGoodReactionPoint(int categoryId, int themeId, int shopId);

	// 주어진 가게, 카테고리, 테마 ID에 해당하는 가게의 좋아요 수를 1 증가시킵니다.
	@Update("""
			UPDATE service_Conshop
			SET goodReactionPoint = goodReactionPoint - 1
			WHERE id = #{shopId}
			AND categoryId= #{categoryId}
			AND themeId= #{themeId}
			""")
	public int decreaseGoodReactionPoint(int categoryId, int themeId, int shopId);

	// 로그인한 회원이 스크랩한 가게 목록을 반환합니다. 최신 업데이트 순으로 정렬됩니다.
	@Select("""
			SELECT C.id, C.shopName, C.roadName, C.photoUrl1, C.photoUrl2, C.photoUrl3, C.photoUrl4, C.photoUrl5, C.phoneNum, C.con_availableTime, C.operateTime, C.menu, C.themeId, C.regDate, C.updateDate, C.delDate, C.delStatus, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			INNER JOIN scrap AS S
			ON S.shopId = C.id AND S.categoryId = C.categoryId
			WHERE S.memberId = #{memberId}
			GROUP BY C.id
			ORDER BY S.updateDate DESC
			""")
	public List<conShop> getForPrintScrapShops(int memberId);

	// 로그인한 회원이 스크랩한 가게 목록을 별점이 높은 순으로 반환합니다.
	@Select("""
			    <script>
			    SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			    FROM service_Conshop AS C
			    INNER JOIN scrap AS S ON C.id = S.shopId
			    LEFT JOIN service_review AS R ON C.id = R.shopId AND C.categoryId = R.categoryId
			    WHERE S.memberId = #{loginedMemberId} AND S.point = 1 AND S.themeId = 1
			    AND C.categoryId IN (1, 2)
			    GROUP BY C.id, C.categoryId
			    ORDER BY totalStarPoint DESC;
			    </script>
			""")
	public List<conShop> getscrapShopsList(int loginedMemberId);

}