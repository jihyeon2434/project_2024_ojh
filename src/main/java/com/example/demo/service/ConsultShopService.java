package com.example.demo.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.WebConsultingCrawler;
import com.example.demo.controller.WebConsultingCrawler2;
import com.example.demo.controller.WebConsultingCrawler3;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.conShop;

@Service
public class ConsultShopService {

	@Autowired
	private ConsultShopRepository consultShopRepository;// 상담 가게 정보를 관리하는 레파지토리

	
	@Autowired
	private menuService menuService; // 메뉴 관련 서비스
	
	@Autowired
	private ReviewRepository reviewRepository; // 리뷰 관련 레파지토리

	// 새로운 가게를 등록하는 메서드
	public void registerShop(conShop shopInfo) {
		 boolean exists = consultShopRepository.existsByShopNameAndRoadName(shopInfo.getShopName(), shopInfo.getRoadName());
	        if (!exists) {
		consultShopRepository.insertShop(shopInfo);
	        }else {
	            System.out.println("이미 존재하는 가게입니다.");
	        }
	}

	// 메뉴 정보를 삽입하는 메서드
	public void insertMenu(String menuName, int price, int themeId, int categoryId, String shopName) {
	    // 해당 가게에 이미 같은 이름의 메뉴가 있는지 확인합니다.
	   
	    	menuService.insertMenu(menuName, price, themeId, categoryId, shopName);
	}
	
	// 웹 크롤링을 통해 상담 가게 정보를 가져오는 메서드
	public List<conShop> crawlConsultingShops(String inputKey) {
	    WebConsultingCrawler crawler = new WebConsultingCrawler();
	    List<conShop> shopInfoList = crawler.crawlMap();
	    for (conShop shopInfo : shopInfoList) {
	        registerShop(shopInfo); // 크롤링한 가게 정보를 저장
	        extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
	    }
	    return shopInfoList; // 크롤링한 가게 정보를 반환
	}
	
	// 크롤링한 가게의 메뉴 정보를 추출하고 저장하는 메서드
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
	// 가격 정보를 추출하는 메서드
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

	// 추가 크롤러를 통한 가게 정보 가져오기 (비슷한 패턴의 메서드)
	public List<conShop> crawlConsultingShops2(String inputKey) {
		WebConsultingCrawler2 crawler = new WebConsultingCrawler2();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			 registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		        extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> crawlConsultingShops3(String inputKey) {
		WebConsultingCrawler3 crawler = new WebConsultingCrawler3();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
			  extractAndSaveMenuInfo(shopInfo); // 메뉴 정보 추출 및 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> getShopsList() {
		return consultShopRepository.getShopsList(); // 전체 가게 목록 가져오기
	}

	public List<conShop> getByOptionShopsList(int categoryId) {

		System.out.println("categoryId in getByOptionShopsList: " + categoryId); 

		return consultShopRepository.getByOptionShopsList(categoryId); // 카테고리에 따른 가게 목록 가져오기
	}

	public conShop getShopById(int id) {
		return consultShopRepository.getShopById(id); // ID에 따른 가게 정보 가져오기

	}

	// 리뷰 작성 메서드
	public ResultData<Integer> writeReview(int loginedMemberId, String title, String body, int themeId, int categoryId,
			int shopId, int rating) {
		reviewRepository.writeReview(loginedMemberId, title, body, themeId, categoryId, shopId, rating);

		int newReviewId = reviewRepository.getLastInsertId(); // 리뷰를 삽입한 후에 id를 가져오는 것은 여기서 필요하지 않음

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", newReviewId), "id", newReviewId);
	}

	/*
	 * public List<Review> getReviewsByIdandThemeandCategory(int themeId, int
	 * categoryId, int id) { return
	 * reviewRepository.getReviewByIdandThemeandCategory(themeId, categoryId, id); }
	 */

	public List<conShop> getHighPointShops() {
		
		return consultShopRepository.getHighPointShops(); // 별점이 높은 가게 목록 가져오기
	}

	public List<conShop> getCheapestShops() {
		
		return consultShopRepository.getCheapestShops(); // 가장 저렴한 가게 목록 가져오기
	}


	public List<conShop> getShopsByArea(String area) {
		
		return consultShopRepository.getShopsByArea(area); // 지역에 따른 가게 목록 가져오기
	}


	public List<conShop> getShopsByPriceRange(int priceRange) {
		
		
		return consultShopRepository.getShopsByPriceRange(priceRange);  // 가격 범위에 따른 가게 목록 가져오기
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


		/*
		 * public List<conShop> getShopsBySituation(String situation) {
		 * if(situation.equals("일상")) { return
		 * consultShopRepository.getShopsBySituation1(); }else
		 * if(situation.equals("면접")) { return
		 * consultShopRepository.getShopsBySituation2(); } return new ArrayList<>(); //
		 * 예외 처리 }
		 */


	

	    // 주어진 가격 범위, 지역, 상황에 따라 적합한 가게 목록을 반환합니다.
	public List<conShop> getShopsByMyOptions(int priceRange, String area, String situation) {
		if(situation.equals("일상")) {// 상황이 '일상'일 때
			if(priceRange ==300000) {// 가격 범위가 300000 이상일 경우
				return consultShopRepository.getShopsBySituation1Over3M(priceRange, area); // 해당 가격 이상의 '일상' 가게를 검색
			}
			return consultShopRepository.getShopsBySituation1(priceRange, area);  // 일상 가게를 검색
		}else if(situation.equals("면접")) {// 상황이 '면접'일 때
			if(priceRange ==300000) {// 가격 범위가 300000 이상일 경우
				return consultShopRepository.getShopsBySituation2Over3M(priceRange, area); // 해당 가격 이상의 '면접' 가게를 검색
			}
		return 	consultShopRepository.getShopsBySituation2(priceRange, area);// 면접 가게를 검색
		}
		 return new ArrayList<>(); // 예외 처리
	}



	  // 주어진 카테고리, 테마, 가게 ID에 따른 가게의 즐겨찾기 점수를 반환.
	public int getGoodRP(int categoryId, int themeId, int shopId) {
		// TODO Auto-generated method stub
		return consultShopRepository.getGoodRP(categoryId,themeId, shopId);// 좋아요 점수 가져오기
	}

	  // 주어진 카테고리, 테마, 가게 ID에 대해 즐겨찾기 수를 1 감소시키고 결과를 반환
	public ResultData  decreaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		int affectedRow = consultShopRepository.decreaseGoodReactionPoint(categoryId, themeId, shopId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");// 게시물이 없을 경우 실패 결과 반환
		}

		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);// 성공 결과 반환
	}

	// 주어진 카테고리, 테마, 가게 ID에 대해 즐겨찾기 수를 1 증가시키고 결과를 반환
	public ResultData  increaseGoodReactionPoint(int categoryId, int themeId, int shopId) {
		int affectedRow = consultShopRepository.increaseGoodReactionPoint(categoryId, themeId, shopId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}

	// 주어진 회원 ID에 따른 스크랩한 가게 목록을 반환
	public List<conShop> getForPrintScrapShops(int memberId) {
		
		return consultShopRepository.getForPrintScrapShops(memberId);// 회원이 스크랩한 가게 목록 가져오기
	}

	 // 로그인한 회원 ID에 따른 스크랩한 가게 목록을 반환.
	public List<conShop> getscrapShopsList(int loginedMemberId) {
		return consultShopRepository.getscrapShopsList(loginedMemberId);
	}

	
	

}
