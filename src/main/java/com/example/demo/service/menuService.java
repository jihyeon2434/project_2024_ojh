package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.WebConsultingCrawler;
import com.example.demo.repository.menuRepository;
import com.example.demo.vo.menu;

@Service
public class menuService {


	
	@Autowired
	private menuRepository menuRepository;


	/*
	 * public void insertMenu(menu menuObj) {
	 * 
	 * System.err.println("78989789789789789789789789789798");
	 * 
	 * menuRepository.insertMenu(menuObj);
	 * System.out.println("Menu inserted successfully!");
	 * 
	 * }
	 */


	 public void insertMenu(String menuName, int price, int themeId, int categoryId, String shopName) {
	        // 해당 가게에 이미 같은 이름의 메뉴가 있는지 확인합니다.
	        if (!menuRepository.existsByMenuNameAndShopName(menuName, shopName)) {
	            // 메뉴가 존재하지 않으면 새로 추가합니다.
	        	menuRepository.insertMenu(menuName, price, themeId, categoryId, shopName);
	        } else {
	            // 이미 메뉴가 존재하는 경우, 중복 처리를 해줍니다.
	            System.out.println("가게 '" + shopName + "'에 메뉴 '" + menuName + "'가 이미 존재합니다.");
	            // 중복된 항목을 처리하는 방법에 따라 로깅하거나 예외를 던지거나 다른 조치를 취할 수 있습니다.
	        }
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