package com.example.demo.service;

import com.example.demo.controller.WebConsultingCrawler;
import com.example.demo.controller.WebSelfCrawler;
import com.example.demo.controller.WebSelfCrawler2;
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
    // 새로운 상점 등록
	public void registerShop(selfShop shopInfo) {
		selfShopRepository.insertShop(shopInfo);
	}

    // 입력 키워드를 기반으로 상점 크롤링
	public List<selfShop> crawlSelfShops(String inputKey) {
		WebSelfCrawler crawler = new WebSelfCrawler();
		List<selfShop> shopInfoList = crawler.crawlMap();
		for (selfShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<selfShop> crawlSelfShops2(String inputKey) {
		WebSelfCrawler2 crawler = new WebSelfCrawler2();
		List<selfShop> shopInfoList = crawler.crawlMap();
		for (selfShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}
	  // 등록된 모든 상점 리스트 가져오기
	public List<selfShop> getShopsList() {
		return selfShopRepository.getShopsList();
	}
    // 특정 ID의 상점 상세 정보 가져오기
	public selfShop getShopById(int id) {
		return selfShopRepository.getShopById(id);

	}
	 // 특정 가격대의 상점 목록 가져오기
	public List<selfShop> getShopsByPriceRange(int priceRange) {
		return selfShopRepository.getShopsByPriceRange(priceRange);
	}

    // 지역별 상점 목록 가져오기
	public List<selfShop> getShopsByArea(String area) {
		return selfShopRepository.getShopsByArea(area);
	}
    // 가장 저렴한 상점 목록 가져오기

	public List<selfShop> getCheapestShops() {
		return selfShopRepository.getCheapestShops();
	}
	  // 별점이 높은 상점 목록 가져오기
	public List<selfShop> getHighPointShops() {
		return selfShopRepository.getHighPointShops();
	}
	   // 카테고리 옵션에 따른 상점 목록 가져오기
	public List<selfShop> getByOptionShopsList(int categoryId) {
		System.out.println("categoryId in getByOptionShopsList: " + categoryId);

		return selfShopRepository.getByOptionShopsList(categoryId);
	}
	   // 사용자 정의 옵션(가격대, 지역)에 따른 상점 목록 가져오기
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
	   // 추천 옵션(별점 높은, 가장 저렴한)에 따른 상점 목록 가져오기
	public List<selfShop> getShopsByOptions(String recommend, int category) {
		// recommend와 category를 기반으로 적절한 쿼리를 생성하여 레파지토리로 전달
		if (recommend.equals("별점이 높은")) {
			return selfShopRepository.findShopsByHighRating(category);
		} else if (recommend.equals("가장 저렴한")) {
			return selfShopRepository.findShopsByLowPrice(category);
		}
		return new ArrayList<>(); // 예외 처리
	}
	// 특정 카테고리와 상점 ID에 따른 스크랩 여부 확인
	public int getDoScrap(int categoryId, int shopId) {
		return selfShopRepository.getDoScrap(categoryId, shopId);
	}
	// 좋아요 증가 처리
	public ResultData increaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		int affectedRow = 0; 

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
		return selfShopRepository.getGoodRP(categoryId, themeId, shopId);
	}
	 // 좋아요 감소 처리
	public ResultData decreaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		 int affectedRow = 0; 
	        
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
	   // 사용자가 스크랩한 상점 목록 가져오기
	public List<selfShop> getscrapShopsList(int loginedMemberId) {
		return selfShopRepository.getscrapShopsList(loginedMemberId);
	}

}
