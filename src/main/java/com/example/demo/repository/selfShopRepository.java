package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Article;
import com.example.demo.vo.conShop;
import com.example.demo.vo.selfShop;

@Mapper
public interface selfShopRepository {

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
	

	@Select("""
			SELECT *
			FROM service_selfshop
			""")
	public List<selfShop> getShopsList();
		
	
	
	
	@Select("""
			<script>
				SELECT *
				FROM service_selfshop AS S
				WHERE S.id = #{id}
			</script>
				""")
	public selfShop getShopById(int id);

	@Select("""
			SELECT * FROM service_selfshop WHERE shopName = #{shopName}
			""")
	public selfShop getShopByName(String shopName);


	
	@Select("""

			SELECT C.*, M.menu, M.price
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


	@Select("""
			 SELECT * FROM service_selfshop
			 WHERE LEFT(roadName, 2) = #{area} -- roadName의 앞 두글자가 지역과 일치하는지 확인
			""")
	public List<selfShop> getShopsByArea(String area);


	
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




	@Select("""
			SELECT S.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_selfshop AS S
			LEFT JOIN service_review AS R ON S.categoryId = R.categoryId AND S.id = R.shopId
			WHERE S.categoryId = #{category}
			GROUP BY S.id, S.categoryId
			ORDER BY totalStarPoint DESC;
			""")
	public List<selfShop> findShopsByHighRating(int category);

	
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




}
