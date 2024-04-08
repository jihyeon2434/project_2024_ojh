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
	public void insertMenu(String menuName, String price, int themeId, int categoryId, String shopName);

	
	
	
	
	
	
	@Select("""
			SELECT *
			FROM service_menu
			""")
	public List<menu> getAllMenus();

	
	
	
	
	
	

}