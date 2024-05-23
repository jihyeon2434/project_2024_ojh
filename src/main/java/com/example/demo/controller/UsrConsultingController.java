package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.repository.ScrapRepository;
import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ConsultShopService;
import com.example.demo.service.GenFileService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.ScrapService;
import com.example.demo.service.menuService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Review;
import com.example.demo.vo.Rq;
import com.example.demo.vo.conShop;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrConsultingController {

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;


	@Autowired
	private ConsultShopService consultShopService;

	@Autowired
	private menuService menuService;
	@Autowired
	private GenFileService genFileService;
	
	@Autowired
	private ScrapService scrapService;

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
		System.err.println("shopInfoList:"+shopInfoList);

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
	public ResponseEntity<?> getShopsByPriceRange(@RequestParam("priceRange") int priceRange) {
		System.err.println(priceRange);
		System.err.println(priceRange);
		System.err.println(priceRange);
		List<conShop> shopInfoList = consultShopService.getShopsByPriceRange(priceRange); // 별점이 높은 가게 목록을 가져오는 서비스 메소드
																							// 호출
		return ResponseEntity.ok().body(shopInfoList);
	}

	@GetMapping("/usr/consulting/getShopsByOptions")
	public ResponseEntity<?> getShopsByOptions(@RequestParam String recommend, @RequestParam int category) {
		List<conShop> shopInfoList = consultShopService.getShopsByOptions(recommend, category);
		return ResponseEntity.ok().body(shopInfoList);
	}
	


	@GetMapping("/usr/consulting/getShopsByMyOptions")
	public ResponseEntity<?> getShopsByMyOptions(@RequestParam("priceRange") int priceRange, @RequestParam("area") String area, @RequestParam String situation) {
		List<conShop> shopInfoList = consultShopService.getShopsByMyOptions(priceRange, area,situation );
		return ResponseEntity.ok().body(shopInfoList);
	}
	
	
	/*
	 * @GetMapping("/usr/consulting/getShopsBySituation") public ResponseEntity<?>
	 * getShopsBySituation(@RequestParam String situation) { // situation에 따라 업체 목록을
	 * 가져오는 비즈니스 로직을 수행하고, 결과를 반환합니다. List<conShop> shopInfoList =
	 * consultShopService.getShopsBySituation(situation); return
	 * ResponseEntity.ok().body(shopInfoList); }
	 */
	
	
	@RequestMapping("/usr/consulting/detail")
	public String showConsultingDetail(HttpServletRequest req, Model model, int themeId, int id, int categoryId) {
	    Rq rq = (Rq) req.getAttribute("rq");  // 세션에서 Rq 객체를 직접 가져오는 방법으로 변경
	    if (rq == null) {
	        return "redirect:/login";  // Rq 객체가 null이면 로그인 페이지로 리디렉트
	    }

	    conShop shop = consultShopService.getShopById(id);
	    List<Review> reviews = reviewService.getReviewsByIdandThemeandCategory(themeId, categoryId, id);

	    ResultData usersScrapRd = scrapService.usersShopScrap(rq.getLoginedMemberId(), themeId, id, categoryId);

	    if (usersScrapRd.isSuccess()) {
	        model.addAttribute("userCanScrap", usersScrapRd.isSuccess());
	    }

	    model.addAttribute("isAlreadyAddGoodRp", scrapService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), themeId, id, categoryId));
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
	public String showReservation2(HttpServletRequest req, @RequestParam("id") int shopId, Model model) {
	    Rq rq = (Rq) req.getAttribute("rq");
	    Member loginedMember = rq.getLoginedMember(); // 로그인한 사용자의 정보를 가져옵니다.
	    conShop shop = consultShopService.getShopById(shopId);
	    LocalDate currentDate = LocalDate.now();
	    System.err.println("loginedMember:"+loginedMember);
	    model.addAttribute("year", currentDate.getYear());
	    model.addAttribute("month", currentDate.getMonthValue() - 1); // 월은 0부터 시작하므로 1을 빼줍니다.
	    model.addAttribute("loginedMember", loginedMember); // 로그인한 사용자 정보를 모델에 추가합니다.
	    model.addAttribute("shop", shop);
	    return "usr/consulting/reservation2";
	}

	// 예시 컨트롤러 메소드
	@RequestMapping("/usr/consulting/reservation3")
	public String showReservation3(HttpServletRequest req, @RequestParam("shopId") int shopId, Model model) {
	    Rq rq = (Rq) req.getAttribute("rq");
	    Member loginedMember = rq.getLoginedMember();
	    conShop shop = consultShopService.getShopById(shopId);  // 상점 정보 조회

	    if (shop != null) {
	        model.addAttribute("shopName", shop.getShopName());  // 상점 이름을 모델에 추가
	    } else {
	        model.addAttribute("shopName", "상점 정보 없음");
	    }

	    // 다른 필요한 데이터 모델에 추가
	    model.addAttribute("loginedMember", loginedMember);

	    return "usr/consulting/reservation3";  // JSP 페이지 이름
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

		ResultData<Integer> writeReviewRd = reviewService.writeReview(rq.getLoginedMemberId(), title, body,
				themeId, categoryId, id, rating);

		int newReviewId = writeReviewRd.getData1();

		return Ut.jsReplace(writeReviewRd.getResultCode(), writeReviewRd.getMsg(),
				"../consulting/detail?id=" + id + "&categoryId=" + categoryId + "&themeId=" + themeId);

	}
	
	

	/*
	 * @RequestMapping("/usr/consulting/video") public String
	 * showvideo(HttpServletRequest req) { Rq rq = (Rq) req.getAttribute("rq");
	 * 
	 * return "usr/consulting/video"; }
	 */
	
	@RequestMapping("/usr/consulting/write")
	public String showJoin(Model model) {

		/* int currentId = consultShopService.getCurrentArticleId(); */

		/* model.addAttribute("currentId", currentId); */

		return "usr/consulting/write";
	}

	@RequestMapping("/usr/consulting/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, String replaceUri,
			MultipartRequest multipartRequest) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		ResultData<Integer> writeArticleRd = consultShopService.writeArticle(rq.getLoginedMemberId(), title, body);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);

	}
	
}