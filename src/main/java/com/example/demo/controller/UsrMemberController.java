package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ConsultShopService;
import com.example.demo.service.MemberService;

import com.example.demo.service.PaymentService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.selfShopService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Member;
import com.example.demo.vo.Payment;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;
import com.example.demo.vo.conShop;
import com.example.demo.vo.selfShop;
import com.example.demo.vo.ResultData; // 필요한 패키지 임포트

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrMemberController {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private Rq rq;
	@Autowired
	private ConsultShopService consultShopService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private selfShopService selfShopService;

	@Autowired
	private PaymentService paymentService;

	

	// 로그아웃 처리 메서드
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그아웃 상태입니다");
		}

		rq.logout();

		return Ut.jsReplace("S-1", "로그아웃 되었습니다", "/");
	}
	
	// 로그인 화면을 보여주는 메서드
	@RequestMapping("/usr/member/login")
	public String showLogin(HttpServletRequest req) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		return "usr/member/login";
	}

	// 로그인 처리 메서드
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw, String afterLoginUri) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 함");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s(은)는 존재하지 않는 아이디입니다", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다"));
		}

		rq.login(member);

		if (afterLoginUri.length() > 0) {
			return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), afterLoginUri);
		}

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	// 회원가입 화면을 보여주는 메서드
	@RequestMapping("/usr/member/join")
	public String showJoin(HttpServletRequest req) {

		return "usr/member/join";
	}

	// 회원가입 처리 메서드
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String loginPwCheck, String name,
			String nickname, String cellphoneNum, String email, String memberType, String companyName) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다");
		}

		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}
		if (!loginPw.equals(loginPwCheck)) {
			return Ut.jsHistoryBack("F-3", "비밀번호가 일치하지 않습니다.");
		}
		if ("업체".equals(memberType) && Ut.isNullOrEmpty(companyName)) {
			return Ut.jsHistoryBack("F-9", "업체명을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		if (!Ut.isValidEmail(email)) {
			return Ut.jsHistoryBack("F-7", "이메일 형식이 올바르지 않습니다.");
		}
		if (!Ut.isValidPassword(loginPw)) {
			return Ut.jsHistoryBack("F-8", "비밀번호는 최소 8자 이상, 대문자, 소문자, 숫자를 포함해야 합니다.");
		}

		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email,
				memberType, companyName);

		if (joinRd.isFail()) {
			return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
		}
		Member member = memberService.getMember(joinRd.getData1());

		return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
	}

	// 마이페이지 화면을 보여주는 메서드
	@RequestMapping("/usr/member/myPage")
	public String showMyPage() {

		return "usr/member/myPage";
	}

	// 마이페이지2 화면을 보여주는 메서드
	@RequestMapping("/usr/member/myPage2")
	public String showMyPage2(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		Integer memberId = rq.getLoginedMemberId();
		List<conShop> conshops = consultShopService.getForPrintScrapShops(memberId);

		model.addAttribute("conshops", conshops);
		return "usr/member/myPage2";
	}

	// 마이 캘린더 화면을 보여주는 메서드
	@RequestMapping("/usr/member/myCalendar")
	public String showMyCalendar(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		LocalDate currentDate = LocalDate.now();
		model.addAttribute("year", currentDate.getYear());
		model.addAttribute("month", currentDate.getMonthValue() - 1); // 월은 0부터 시작하므로 1을 빼줍니다.
		return "usr/member/myCalendar";
	}
	
	// 마이 예약 화면을 보여주는 메서드
	@RequestMapping("/usr/member/myReservation")
	public String showMyReservation(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		Rq rq = (Rq) req.getAttribute("rq");
		int memberId = rq.getLoginedMemberId();
		Member member = memberService.getMemberById(memberId); // 회원 정보를 가져오는 메소드
		Board board = boardService.getBoardById(boardId);

		int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

		if (board == null) {
			return rq.historyBackOnView("없는 게시판이야");
		}

		// 한페이지에 글 10개씩이야
		// 글 20개 -> 2 page
		// 글 24개 -> 3 page
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);

		List<Article> articles = articleService.getForPrintArticles(memberId, boardId, itemsInAPage, page,
				searchKeywordTypeCode, searchKeyword);

		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);
		model.addAttribute("memberType", member.getMemberType()); // 회원 유형을 모델에 추가

		if (member.getMemberType().equals("업체")) {
			// 업체 유형인 경우, 해당 업체의 문의글만 로드
			String companyName = member.getCompanyName();
			List<Article> inquiries = articleService.getArticlesByCompanyName(companyName);
			model.addAttribute("inquiries", inquiries);
		} else {
			// 고객 유형인 경우, 결제 내역을 로드
			List<Payment> payments = paymentService.getPaymentsByMemberId(memberId);
			model.addAttribute("payments", payments);
			System.err.println("Payments: " + payments);
		}

		return "usr/member/myReservation";
	}

	// 마이 스크랩 상점 화면을 보여주는 메서드
	@RequestMapping("/usr/member/myScrapShops")
	public String showMyScrapShops(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		List<conShop> conShopList = consultShopService.getscrapShopsList(rq.getLoginedMemberId());
		List<selfShop> selfShopList = selfShopService.getscrapShopsList(rq.getLoginedMemberId());
		model.addAttribute("conShopList", conShopList);
		model.addAttribute("selfShopList", selfShopList);
		return "usr/member/myScrapShops";
	}

	// 스크랩한 컨설팅 상점 목록을 가져오는 메서드
	@RequestMapping("/usr/member/conShopList")
	public @ResponseBody List<conShop> getConShopList(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");
		return consultShopService.getscrapShopsList(rq.getLoginedMemberId());
	}

	// 스크랩한 셀프 상점 목록을 가져오는 메서드
	@RequestMapping("/usr/member/selfShopList")
	public @ResponseBody List<selfShop> getSelfShopList(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");
		return selfShopService.getscrapShopsList(rq.getLoginedMemberId());
	}

	// 비밀번호 확인 화면을 보여주는 메서드
	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {

		return "usr/member/checkPw";
	}

	// 비밀번호 확인 처리 메서드
	@RequestMapping("/usr/member/doCheckPw")
	public String doCheckPw(String loginPw) {

		if (Ut.isNullOrEmpty(loginPw)) {
			return rq.historyBackOnView("비번 입력해");
		}

		if (rq.getLoginedMember().getLoginPw().equals(loginPw) == false) {
			return rq.historyBackOnView("비번 틀림");
		}

		return "usr/member/modify";
	}

	// 회원 정보 수정 처리 메서드
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		Rq rq = (Rq) req.getAttribute("rq");

		// 비밀번호 안바꿀 수도 있어서 비번 null 체크는 제거

		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");

		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		ResultData modifyRd;

		if (Ut.isNullOrEmpty(loginPw)) {
			modifyRd = memberService.modifyWithoutPw(rq.getLoginedMemberId(), name, nickname, cellphoneNum, email);
		} else {
			modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, cellphoneNum, email);
		}

		return Ut.jsReplace(modifyRd.getResultCode(), modifyRd.getMsg(), "../member/myPage");
	}

	// 회원 탈퇴를 처리하는 메서드
	@RequestMapping("/usr/member/doWithdraw")
	@ResponseBody
	public String doWithdraw(HttpServletRequest req,
			@RequestParam(defaultValue = "../member/login") String afterLogoutUri) {
		Rq rq = (Rq) req.getAttribute("rq");

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-1", "로그인이 필요합니다.");
		}

		Member loginedMember = rq.getLoginedMember();
		ResultData withdrawRd = memberService.withdrawMember(loginedMember.getId());

		if (withdrawRd.isFail()) {
			return Ut.jsReplace(withdrawRd.getResultCode(), withdrawRd.getMsg(), afterLogoutUri);
		}

		rq.logout(); // 회원 탈퇴 후 자동 로그아웃
		return Ut.jsReplace("S-1", "탈퇴 처리되었습니다.", "/");
	}

	
	// 로그인 아이디 찾기 화면을 보여주는 메서드
	@RequestMapping("/usr/member/findLoginId")
	public String findLoginId() {

		return "/usr/member/findLoginId";

	}

	// 로그인 아이디 찾기 처리 메서드
	@RequestMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public String findLoginId(String email) {
		// 입력된 이메일로 등록된 아이디를 찾아옵니다.
		String loginId = memberService.getLoginIdByEmail(email);

		if (loginId == null) {
			return Ut.jsHistoryBack("F-1", "해당 이메일로 등록된 아이디가 없습니다.");
		}

		return Ut.jsReplace("S-1", "회원님의 아이디는 " + loginId + " 입니다.", "../member/login");
	}
	/*
	 * @RequestMapping("/usr/member/findLoginPw") public String findLoginPw() {
	 * 
	 * return "/usr/member/findLoginPw";
	 * 
	 * }
	 * 
	 * @RequestMapping("/usr/member/doFindLoginPw")
	 * 
	 * @ResponseBody public String findLoginPw(@RequestParam String email) { String
	 * resultMessage = memberService.sendResetPasswordEmail(email); return
	 * resultMessage; }
	 */
}