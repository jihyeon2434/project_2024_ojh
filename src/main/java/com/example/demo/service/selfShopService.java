package com.example.demo.service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.controller.WebCrawler18;
import com.example.demo.controller.WebCrawler20;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.repository.selfShopRepository;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.conShop;
import com.example.demo.vo.selfShop;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class selfShopService {

	@Autowired
	private selfShopRepository selfShopRepository;

	@Autowired
	private ConsultShopRepository consultShopRepository;

	public void registerShop(selfShop shopInfo) {
		selfShopRepository.insertShop(shopInfo);
	}

	public List<selfShop> crawlSelfShops(String inputKey) {
		WebCrawler18 crawler = new WebCrawler18();
		List<selfShop> shopInfoList = crawler.crawlMap();
		for (selfShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<selfShop> crawlSelfShops2(String inputKey) {
		WebCrawler20 crawler = new WebCrawler20();
		List<selfShop> shopInfoList = crawler.crawlMap();
		for (selfShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<selfShop> getShopsList() {
		return selfShopRepository.getShopsList();
	}

	public selfShop getShopById(int id) {
		return selfShopRepository.getShopById(id);

	}

	public List<selfShop> getShopsByPriceRange(int priceRange) {
		return selfShopRepository.getShopsByPriceRange(priceRange);
	}

	public List<selfShop> getShopsByArea(String area) {
		return selfShopRepository.getShopsByArea(area);
	}

	public List<selfShop> getCheapestShops() {
		return selfShopRepository.getCheapestShops();
	}

	public List<selfShop> getHighPointShops() {
		return selfShopRepository.getHighPointShops();
	}

	public List<selfShop> getByOptionShopsList(int categoryId) {
		System.out.println("categoryId in getByOptionShopsList: " + categoryId);

		return selfShopRepository.getByOptionShopsList(categoryId);
	}

	public List<selfShop> getShopsByMyOptions(int priceRange, String area) {
		try {
			if (priceRange == 300000) {
				return selfShopRepository.getShopsBySituation1Over3M(priceRange, area);
			} else {
				return selfShopRepository.getShopsBySituation1(priceRange, area);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 에러 로그 출력 (필요에 따라 수정)
			return new ArrayList<>(); // 예외 발생 시 빈 리스트 반환
		}
	}

	public List<selfShop> getShopsByOptions(String recommend, int category) {
		// recommend와 category를 기반으로 적절한 쿼리를 생성하여 레파지토리로 전달
		if (recommend.equals("별점이 높은")) {
			return selfShopRepository.findShopsByHighRating(category);
		} else if (recommend.equals("가장 저렴한")) {
			return selfShopRepository.findShopsByLowPrice(category);
		}
		return new ArrayList<>(); // 예외 처리
	}

	public int getDoScrap(int categoryId, int shopId) {
		return selfShopRepository.getDoScrap(categoryId, shopId);
	}

	public ResultData increaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		int affectedRow = 0; // Declare affectedRow here to make it accessible throughout the method

		if (themeId == 1) {
			affectedRow = consultShopRepository.increaseGoodReactionPoint(categoryId, themeId, shopId);
		} else {
			affectedRow = selfShopRepository.increaseGoodReactionPoint(categoryId, themeId, shopId);
		}
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}

	public int getGoodRP(int categoryId, int themeId, int shopId) {
		// TODO Auto-generated method stub
		return selfShopRepository.getGoodRP(categoryId, themeId, shopId);
	}

	public ResultData decreaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		 int affectedRow = 0; // Declare affectedRow here to make it accessible throughout the method
	        
	        if (themeId == 1) {
		affectedRow = consultShopRepository.decreaseGoodReactionPoint(categoryId, themeId, shopId);
	        } else {
	            affectedRow = selfShopRepository.increaseGoodReactionPoint(categoryId, themeId, shopId);
	        }
		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
	}

}
