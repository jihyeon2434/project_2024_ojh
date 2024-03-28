package com.example.demo.service;

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
	private ReviewRepository reviewRepository;

	public void registerShop(conShop shopInfo) {
		consultShopRepository.insertShop(shopInfo);
	}

	public List<conShop> crawlConsultingShops(String inputKey) {
		WebCrawler17 crawler = new WebCrawler17();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> crawlConsultingShops2(String inputKey) {
		WebCrawler19 crawler = new WebCrawler19();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
		}
		return shopInfoList; // 크롤링한 가게 정보를 리턴
	}

	public List<conShop> crawlConsultingShops3(String inputKey) {
		WebCrawler21 crawler = new WebCrawler21();
		List<conShop> shopInfoList = crawler.crawlMap();
		for (conShop shopInfo : shopInfoList) {
			registerShop(shopInfo); // 크롤링한 가게 정보를 저장
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
}
