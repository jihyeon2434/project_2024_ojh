package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;

import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ConsultShopService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.menuService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.Rq;
import com.example.demo.vo.conShop;
import com.example.demo.vo.menu;
import com.example.demo.vo.selfShop;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrConsultingController {

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private ReactionPointService reactionPointService;

	@Autowired
	private ConsultShopService consultShopService;
	
	@Autowired
	private menuService menuService;

	public UsrConsultingController() {

	}

	// 액션 메서드
	@RequestMapping("/usr/consulting/crawl")
	public String crawlConsultingShops(@RequestParam(required = false, defaultValue = "") String inputKey,
	                                    HttpServletRequest request) {
	    List<conShop> shopInfoList = consultShopService.crawlConsultingShops(inputKey);

	    return "usr/home/main";
	}

	@RequestMapping("/usr/consulting/crawl2")
	public String crawlConsultingShops2(@RequestParam(required = false, defaultValue = "") String inputKey) {
		List<conShop> shopInfoList = consultShopService.crawlConsultingShops2(inputKey);
		return "usr/home/main";
	}

	@RequestMapping("/usr/consulting/crawl3")
	public String crawlConsultingShops3(@RequestParam(required = false, defaultValue = "") String inputKey) {
		List<conShop> shopInfoList = consultShopService.crawlConsultingShops3(inputKey);
		return "usr/home/main";
	}

	@RequestMapping("/usr/consulting/list")
	public String showConsultingList(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 상담 가게 정보 가져오기
		List<conShop> shopInfoList = consultShopService.getShopsList();

		// 이미지 URI 출력
		for (conShop shop : shopInfoList) {
			System.out.println("Image URI: " + shop.getPhotoUrl1());
			System.out.println("totalstarPoint: " + shop.getTotalStarPoint());
		}

		// JSP에 상담 가게 정보 전달
		model.addAttribute("shopInfoList", shopInfoList);

		return "usr/consulting/list";
	}

	@GetMapping("/usr/consulting/showList")
	public ResponseEntity<?> showConsultingOptionList(@RequestParam int categoryId) {
		System.out.println("categoryId: " + categoryId); // categoryId 값 확인을 위한 로그 추가
		System.err.println(categoryId);

		// Rq rq = (Rq) req.getAttribute("rq");

		// 상담 가게 정보 가져오기
		List<conShop> shopInfoList = consultShopService.getByOptionShopsList(categoryId);

		// JSP에 상담 가게 정보 전달
		// model.addAttribute("shopInfoList", shopInfoList);

		return ResponseEntity.ok().body(shopInfoList);
	}
	
	 @GetMapping("/usr/consulting/getHighPointShops")
	    public ResponseEntity<?> getHighPointShops() {
	    	List<conShop> shopInfoList = consultShopService.getHighPointShops(); // 별점이 높은 가게 목록을 가져오는 서비스 메소드 호출
	    	return ResponseEntity.ok().body(shopInfoList);
	    }
	 
	 @GetMapping("/usr/consulting/getCheapestShops")
	    public ResponseEntity<?> getCheapestShops() {
	    	List<conShop> shopInfoList = consultShopService.getCheapestShops(); // 별점이 높은 가게 목록을 가져오는 서비스 메소드 호출
	    	return ResponseEntity.ok().body(shopInfoList);
	    }
	
	
	 @GetMapping("/usr/consulting/getShopsByArea")
	    public ResponseEntity<?> getShopsByArea(@RequestParam("area") String area) {
	    	List<conShop> shopInfoList = consultShopService.getShopsByArea(area); // 별점이 높은 가게 목록을 가져오는 서비스 메소드 호출
	    	return ResponseEntity.ok().body(shopInfoList);
	    }
	 
	 @GetMapping("/usr/consulting/getShopsByPriceRange")
	    public ResponseEntity<?> getShopsByPriceRange(int priceRange) {
		 System.err.println(priceRange);
		 System.err.println(priceRange);
		 System.err.println(priceRange);
	    	List<conShop> shopInfoList = consultShopService.getShopsByPriceRange(priceRange); // 별점이 높은 가게 목록을 가져오는 서비스 메소드 호출
	    	return ResponseEntity.ok().body(shopInfoList);
	    }
	 
	 @GetMapping("/usr/consulting/getShopsByOptions")
	 public ResponseEntity<?>  getShopsByOptions(@RequestParam String recommend, @RequestParam int category) {
		 List<conShop> shopInfoList = consultShopService.getShopsByOptions(recommend, category);
		 return ResponseEntity.ok().body(shopInfoList);  
	 }

	@RequestMapping("/usr/consulting/detail")
	public String showconsultingDetail(HttpServletRequest req, Model model, int themeId, int id, int categoryId) {
		Rq rq = (Rq) req.getAttribute("rq");
		conShop shop = consultShopService.getShopById(id);
		List<Review> reviews = consultShopService.getReviewsByIdandThemeandCategory(themeId, categoryId, id);
		model.addAttribute("reviews", reviews);
		model.addAttribute("shop", shop);
		return "usr/consulting/detail";
	}

	@RequestMapping("/usr/consulting/chat")
	public String showChat(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		return "usr/consulting/chat";
	}

	@RequestMapping("/usr/consulting/reservation")
	public String showReservation(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		return "usr/consulting/reservation";
	}

	@RequestMapping("/usr/consulting/reservation2")
	public String showReservation2(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		LocalDate currentDate = LocalDate.now();
		model.addAttribute("year", currentDate.getYear());
		model.addAttribute("month", currentDate.getMonthValue() - 1); // 월은 0부터 시작하므로 1을 빼줍니다.

		return "usr/consulting/reservation2";
	}

	@RequestMapping("/usr/consulting/reservation3")
	public String showReservation3(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		return "usr/consulting/reservation3";
	}

	@RequestMapping("/usr/consulting/reviewWrite")
	public String showReviewWrite(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "1") int themeId,
			@RequestParam(required = false, defaultValue = "1") int categoryId, int id) {
		conShop shop = consultShopService.getShopById(id);
		model.addAttribute("id", id);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("themeId", themeId);
		model.addAttribute("shop", shop);
		return "usr/consulting/reviewWrite";
	}

	@RequestMapping("/usr/consulting/doReviewWrite")
	@ResponseBody
	public String doReviewWrite(HttpServletRequest req, @RequestParam("title") String title,
			@RequestParam("body") String body, int themeId, int id, int categoryId,
			@RequestParam("rating") int rating) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeReviewRd = consultShopService.writeReview(rq.getLoginedMemberId(), title, body,
				themeId, categoryId, id, rating);

		int newReviewId = writeReviewRd.getData1();

		return Ut.jsReplace(writeReviewRd.getResultCode(), writeReviewRd.getMsg(), "../consulting/detail?id=" + id + "&categoryId=" + categoryId + "&themeId=" + themeId);

	}
}