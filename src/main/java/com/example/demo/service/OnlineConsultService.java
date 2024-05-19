package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.repository.OnlineConsultShopRepository;
import com.example.demo.repository.ReviewRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.OnlineConArticle;
import com.example.demo.vo.ResultData;

@Service
public class OnlineConsultService {

	@Autowired
	private OnlineConsultShopRepository OnlineConsultShopRepository;

	
	@Autowired
	private menuService menuService;
	
	@Autowired
	private ReviewRepository reviewRepository;



	public ResultData<Integer> writeArticle(int loginedMemberId, String title, String body) {
		OnlineConsultShopRepository.writeArticle(loginedMemberId, title, body);
		int id = OnlineConsultShopRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}


	public OnlineConArticle getArticle(int id) {
		return OnlineConsultShopRepository.getArticle(id);
	}


	public OnlineConArticle getForPrintArticle(int loginedMemberId, int id) {
		return OnlineConsultShopRepository.getForPrintArticle(loginedMemberId, id);
	}


	public int getCurrentArticleId() {
		return OnlineConsultShopRepository.getCurrentArticleId();
	}


	public List<OnlineConArticle> getInquiriesForCompany(int memberId) {
		return OnlineConsultShopRepository.getInquiriesForCompany(memberId);
	}

	
	

}
