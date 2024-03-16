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
				FROM service_Conshop AS S
				WHERE S.id = #{id}
			</script>
				""")
	public selfShop getShopById(int id);

	@Select("""
			SELECT * FROM service_Conshop WHERE shopName = #{shopName}
			""")
	public selfShop getShopByName(String shopName);

}
