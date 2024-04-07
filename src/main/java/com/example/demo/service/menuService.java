package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.repository.menuRepository;
import com.example.demo.vo.menu;

@Service
public class menuService {


	
	@Autowired
	private menuRepository menuRepository;



	public void insertMenu(menu menuObj) {

		System.err.println("78989789789789789789789789789798");
		
		 menuRepository.insertMenu(menuObj);
		 System.out.println("Menu inserted successfully!");
		
	}


		/*
		 * public List<menu> crawlMenus(List<String> menuNames, List<Integer> prices,
		 * String shopName, int themeId, int categoryId) { // 메뉴 리스트 생성 List<menu>
		 * menuList = new ArrayList<>();
		 * 
		 * // 전달받은 메뉴 이름과 가격을 이용하여 메뉴 객체 생성 후 메뉴 리스트에 추가 for (int i = 0; i <
		 * menuNames.size(); i++) { String menuName = menuNames.get(i); int price =
		 * prices.get(i);
		 * 
		 * menu menuObj = new menu(menuName, price, shopName, themeId, categoryId);
		 * menuList.add(menuObj); }
		 * 
		 * // 추가된 부분: menuList 출력 System.out.println("Crawled Menu List:"); for (menu
		 * menuObj : menuList) { System.out.println(menuObj); }
		 * 
		 * // 메뉴 정보를 데이터베이스에 저장 for (menu menuObj : menuList) { registerMenu(menuObj);
		 * // 메뉴 정보를 저장하는 메서드 호출 }
		 * 
		 * return menuList; }
		 * 
		 * 
		 * // 메뉴 정보 가져오기 public List<menu> getMenus() { // 메뉴 정보를 데이터베이스에서 가져오는 등의 작업을
		 * 수행 List<menu> menus = menuRepository.getAllMenus(); return menus; }
		 */
	
}