package com.example.demo.repository;

import com.example.demo.vo.conShop;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConsultShopRepository {

	 @Insert("""
	            INSERT INTO
	            service_Conshop SET
	            categoryId = #{categoryId},
	            shopName = #{shopName},
	            roadName_num = #{roadNameNum},
	            review = #{review},
	            phoneNum = #{phoneNum},
	            con_availableTime = #{conAvailableTime},
	            operateTime = #{operateTime},
	            price = #{price},
	            themeId = #{themeId},
	            regDate = #{regDate},
	            updateDate = #{updateDate},
	            delDate = #{delDate},
	            delStatus = #{delStatus}
	            """)
    public void insertShop(conShop shopInfo);
}
