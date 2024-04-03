package com.example.demo.service;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.controller.WebCrawler19;
import com.example.demo.controller.WebCrawler21;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.repository.menuRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.conShop;
import com.example.demo.vo.menu;

@Service
public class menuService {

	@Autowired
	private ConsultShopRepository consultShopRepository;
	
	@Autowired
	private menuRepository menuRepository;


	public void registerMenu(menu menuList) {
		menuRepository.insertMenu(menuList);
	}


	 public List<menu> crawlMenus() {
	        WebCrawler17 crawler = new WebCrawler17();
	        List<menu> menuList = crawler.crawlMenus(); // 크롤링 메서드를 호출하여 메뉴 정보를 가져옴
	        
	        // 크롤링한 메뉴 정보를 데이터베이스에 저장
	        for (menu menu : menuList) {
	            registerMenu(menu);
	        }
	        
	        return menuList;
	    }


	
}
