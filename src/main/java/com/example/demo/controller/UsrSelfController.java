package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BoardService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.selfShopService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.Rq;
import com.example.demo.vo.selfShop;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrSelfController {

	@Autowired
	private Rq rq;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ReactionPointService reactionPointService;

	@Autowired
	private selfShopService selfShopService;

	public UsrSelfController() {

	}

	// 액션 메서드

	@RequestMapping("/usr/self/crawl")
	public String crawlSelfShops(@RequestParam(required = false, defaultValue = "") String inputKey) {
		List<selfShop> shopInfoList = selfShopService.crawlSelfShops(inputKey);
		return "usr/home/main";
	}
	
	@RequestMapping("/usr/self/crawl2")
	public String crawlSelfShops2(@RequestParam(required = false, defaultValue = "") String inputKey) {
		List<selfShop> shopInfoList = selfShopService.crawlSelfShops2(inputKey);
		return "usr/home/main";
	}

	@RequestMapping("/usr/self/list")
	public String showselfList(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 상담 가게 정보 가져오기
		List<selfShop> shopInfoList = selfShopService.getShopsList();

		// JSP에 상담 가게 정보 전달
		model.addAttribute("shopInfoList", shopInfoList);

		return "usr/self/list";
	}

	@RequestMapping("/usr/self/detail")
	public String showconsultingDetail(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "2") int themeId, int id,
			@RequestParam(required = false, defaultValue = "3") int categoryId) {
		Rq rq = (Rq) req.getAttribute("rq");
		selfShop shop = selfShopService.getShopById(id);
		List<Review> reviews = reviewService.getReviewsByIdandThemeandCategory(themeId, categoryId, id);
		model.addAttribute("reviews", reviews);
		model.addAttribute("shop", shop);
		return "usr/self/detail";
	}

	@RequestMapping("/usr/self/reviewWrite")
	public String showReviewWrite(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "2") int themeId,
			@RequestParam(required = false, defaultValue = "3") int categoryId, int id) {
		selfShop shop = selfShopService.getShopById(id);
		model.addAttribute("id", id);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("themeId", themeId);
		model.addAttribute("shop", shop);
		return "usr/self/reviewWrite";
	}

	@RequestMapping("/usr/self/doReviewWrite")
	@ResponseBody
	public String doReviewWrite(HttpServletRequest req, 
	        @RequestParam("title") String title, 
	        @RequestParam("body") String body, 
	        @RequestParam("themeId") int themeId, 
	        @RequestParam("id") int id, 
	        @RequestParam("categoryId") int categoryId,
	        @RequestParam("rating") int rating) {
	    Rq rq = (Rq) req.getAttribute("rq");

	    if (Ut.isNullOrEmpty(title)) {
	        return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
	    }
	    if (Ut.isNullOrEmpty(body)) {
	        return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
	    }

	    ResultData<Integer> writeReviewRd = reviewService.writeReview(rq.getLoginedMemberId(), title, body, themeId,
	            categoryId, id, rating);

	    int newReviewId = writeReviewRd.getData1();

	    return Ut.jsReplace(writeReviewRd.getResultCode(), writeReviewRd.getMsg(), "../self/detail?id=" + id);
	}


}