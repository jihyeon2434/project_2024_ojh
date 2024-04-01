package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.conShop;

@Mapper
public interface ConsultShopRepository {

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

	@Select("""
			<script>
			SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
			FROM service_Conshop AS C
			LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
			GROUP BY  C.id, C.categoryId;
			</script>
			""")
	public List<conShop> getShopsList();

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

}