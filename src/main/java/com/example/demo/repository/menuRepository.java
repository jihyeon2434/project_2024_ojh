package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.conShop;
import com.example.demo.vo.menu;

@Mapper
public interface menuRepository {


	@Insert("""
			INSERT INTO service_menu SET
					 themeId = #{themeId},
			         categoryId = #{categoryId},
			         shopName = #{shopName},
			         menu = #{menuName},
			         price= #{price}
			        
			""")
	public void insertMenu(String menuName, int price, int themeId, int categoryId, String shopName);

	
	
	
	
	
	
	@Select("""
			SELECT *
			FROM service_menu
			""")
	public List<menu> getAllMenus();






	  
	 






	 @Select("SELECT COUNT(*) > 0 FROM service_menu WHERE menu = #{menuName} AND shop_name = #{shopName}")
	    boolean existsByMenuNameAndShopName(@Param("menuName") String menuName, @Param("shopName") String shopName);


	
	
	
	
	
	

}