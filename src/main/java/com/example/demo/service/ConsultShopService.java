package com.example.demo.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.controller.WebCrawler19;
import com.example.demo.controller.WebCrawler21;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.conShop;

@Service
public class ConsultShopService {

	@Autowired
	private ConsultShopRepository consultShopRepository;

	
	@Autowired
	private menuService menuService;
	
	@Autowired
	private ReviewRepository reviewRepository;

	public void registerShop(conShop shopInfo) {
		 boolean exists = consultShopRepository.existsByShopNameAndRoadName(shopInfo.getShopName(), shopInfo.getRoadName());
	        if (!exists) {
		consultShopRepository.insertShop(shopInfo);
	        }else {
	            System.out.println("이미 존재하는 가게입니다.");
	        }
	}

	
	public void insertMenu(String menuName, int price, int themeId, int categoryId, String shopName) {
	    // 해당 가게에 이미 같은 이름의 메뉴가 있는지 확인합니다.
	   
	    	menuService.insertMenu(menuName, price, themeId, categoryId, shopName);
	   
	}
	
	public List<conShop> crawlConsultingShops(String inputKey) {
	    WebCrawler17 crawler = new WebCrawler17();
	    List<conShop> shopInfoList = crawler.crawlMap();
	    for (conShop shopInfo : shopInfoList) {
	        registerShop(shopInfo); // 크롤링한 가게 정보를 저장
	        extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
	    }
	    return shopInfoList; // 크롤링한 가게 정보를 리턴
	}
	
	public void extractAndSaveMenuInfo(conShop shopInfo) {
	    String menuInfo = shopInfo.getMenu(); // 가게 정보로부터 메뉴 정보 추출
	    if (menuInfo != null && !menuInfo.isEmpty()) {
	        // 메뉴 정보가 존재할 경우
	        String[] menuEntries = menuInfo.split(";");
	        for (String entry : menuEntries) {
	            String[] parts = entry.split(":");
	            if (parts.length == 2) {
	                // 메뉴 정보가 유효한 형태일 경우
	                String menuName = parts[0].trim(); // 메뉴명 추출
	                String priceString = parts[1].trim(); // 가격 문자열 추출
	                 
	                // "원~" 문자로 가격 범위를 분리하여 첫 번째 값을 사용
	                String[] priceRange = priceString.split("~");
	                System.err.println(priceRange);
	                System.err.println(priceRange);
	                String priceStringBeforeWon = priceRange[0].trim(); // "원~" 이전의 값만 사용
	                System.err.println(priceStringBeforeWon);
	                System.err.println(priceStringBeforeWon);
	                
	                // 가격 정보에서 숫자만 추출하여 정수형으로 변환
	                int price = extractPrice(priceStringBeforeWon);
	                System.err.println(price);
	                int themeId = shopInfo.getThemeId(); // 테마 아이디 추출
	                int categoryId = shopInfo.getCategoryId(); // 카테고리 아이디 추출
	                String shopName = shopInfo.getShopName(); // 가게 이름 추출
	                // 메뉴 정보 저장
	                menuService.insertMenu(menuName, price, themeId, categoryId, shopName);
	            }else if (parts.length >= 2) {
	                // 메뉴 정보가 다른 형태일 경우 (예: 가격에 ":"가 포함될 경우)
	                // 마지막 ":"를 기준으로 메뉴명과 가격을 추출
	                String priceString = parts[parts.length - 1].trim(); // 가격 문자열 추출
	                String menuName = String.join(":", Arrays.copyOfRange(parts, 0, parts.length - 1)).trim(); // 메뉴명 추출
	                
	                // 가격 정보에서 숫자만 추출하여 정수형으로 변환
	                int price = extractPrice(priceString);
	                int themeId = shopInfo.getThemeId(); // 테마 아이디 추출
	                int categoryId = shopInfo.getCategoryId(); // 카테고리 아이디 추출
	                String shopName = shopInfo.getShopName(); // 가게 이름 추출
	                // 메뉴 정보 저장
	                menuService.insertMenu(menuName, price, themeId, categoryId, shopName);
	            }
	            
	        }
	    }
	}

	public int extractPrice(String priceString) {
	    // 가격 문자열에서 숫자만 추출하여 정수형으로 변환
	    int price = 0;
	    try {
	        // "원" 문자를 제거하고 숫자만 남기고 변환
	        price = Integer.parseInt(priceString.replaceAll("[^\\d]", ""));
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    }
	    return price;
	}


	public List<conShop> crawlConsultingShops2(String inputKey) {
		WebCrawler19 crawler = new WebCrawler19();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			 registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		        extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> crawlConsultingShops3(String inputKey) {
		WebCrawler21 crawler = new WebCrawler21();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
			  extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> getShopsList() {
		return consultShopRepository.getShopsList();
	}

	public List<conShop> getByOptionShopsList(int categoryId) {

		System.out.println("categoryId in getByOptionShopsList: " + categoryId); 

		return consultShopRepository.getByOptionShopsList(categoryId);
	}

	public conShop getShopById(int id) {
		return consultShopRepository.getShopById(id);

	}

	public ResultData<Integer> writeReview(int loginedMemberId, String title, String body, int themeId, int categoryId,
			int shopId, int rating) {
		reviewRepository.writeReview(loginedMemberId, title, body, themeId, categoryId, shopId, rating);

		int newReviewId = reviewRepository.getLastInsertId(); // 리뷰를 삽입한 후에 id를 가져오는 것은 여기서 필요하지 않음

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", newReviewId), "id", newReviewId);
	}

	public List<Review> getReviewsByIdandThemeandCategory(int themeId, int categoryId, int id) {
		return reviewRepository.getReviewByIdandThemeandCategory(themeId, categoryId, id);
	}

	public List<conShop> getHighPointShops() {
		
		return consultShopRepository.getHighPointShops();
	}

	public List<conShop> getCheapestShops() {
		
		return consultShopRepository.getCheapestShops();
	}


	public List<conShop> getShopsByArea(String area) {
		
		return consultShopRepository.getShopsByArea(area);
	}


	public List<conShop> getShopsByPriceRange(int priceRange) {
		
		System.err.println(priceRange);
		System.err.println(priceRange);
		
		return consultShopRepository.getShopsByPriceRange(priceRange);
	}


	


	 public List<conShop> getShopsByOptions(String recommend, int category) {
	        // recommend와 category를 기반으로 적절한 쿼리를 생성하여 레파지토리로 전달
	        if (recommend.equals("별점이 높은")) {
	            return consultShopRepository.findShopsByHighRating(category);
	        } else if (recommend.equals("가장 저렴한")) {
	            return consultShopRepository.findShopsByLowPrice(category);
	        }
	        return new ArrayList<>(); // 예외 처리
	    }
}
