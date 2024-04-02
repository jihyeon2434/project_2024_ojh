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
			         shopId = #{shopId},
			         shopName = #{shopName},
			         menu = #{menu},
			         price= #{price}
			        
			""")
	public void insertMenu(menu menuList);

	
	
	
	
	
	

}