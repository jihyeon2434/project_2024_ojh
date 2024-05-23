package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.GenFileService;
import com.example.demo.service.PaymentService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private GenFileService genFileService;

	public UsrArticleController() {

	}

	// 액션 메서드
	// 게시판 목록을 보여주는 메소드
	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		Rq rq = (Rq) req.getAttribute("rq");
		int memberId = rq.getLoginedMemberId();
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

		return "usr/article/list";
	}

	// 게시글 상세 정보를 보여주는 메소드
	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");
		int memberId = rq.getLoginedMemberId();

		Article article = articleService.getForPrintArticle(memberId, id);
		if (article == null) {
			return rq.historyBackOnView("접근 권한이 없습니다."); // 권한이 없을 경우 경고
		}

		List<Reply> replies = replyService.getForPrintReplies(memberId, "Article", id);
		int repliesCount = replies.size();

		model.addAttribute("article", article);
		model.addAttribute("replies", replies);
		model.addAttribute("repliesCount", repliesCount);

		return "usr/article/detail";
	}

	// 게시글 조회수를 증가시키는 메소드
	@RequestMapping("/usr/article/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData doIncreaseHitCountRd(int id) {

		ResultData increaseHitCountRd = articleService.increaseHitCount(id);

		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount", articleService.getArticleHitCount(id));

		rd.setData2("id", id);

		return rd;

	}

	// 게시글 작성 페이지를 보여주는 메소드
	@RequestMapping("/usr/article/write")
	public String showJoin(Model model) {

		int currentId = articleService.getCurrentArticleId();

		model.addAttribute("currentId", currentId);

		return "usr/article/write";
	}

	// 게시글을 작성하고 결과를 처리하는 메소드
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, int boardId, String title, String body, String replaceUri,
			MultipartRequest multipartRequest, String shopName) {

		Rq rq = (Rq) req.getAttribute("rq");
		int memberId = rq.getLoginedMemberId();

		// 권한 검사
		Boolean canWrite = paymentService.canWriteArticle(memberId, shopName);

		System.err.println("canWrite:" + canWrite);
		if (canWrite == null || !canWrite) {
			return Ut.jsHistoryBack("F-1", "해당 업체에 대한 글 작성 권한이 없습니다.");
		}

		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		System.err.println("shopName:" + shopName);

		ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId,
				shopName);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		// 권한 사용
		paymentService.useArticleWritePermission(memberId, shopName);

		return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);

	}

	// 게시글 수정 페이지를 표시하는 메소드
	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");
		// 현재 로그인한 사용자 ID로 게시글 조회
		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		// 게시글이 존재하지 않을 경우 오류 메시지와 함께 이전 페이지로 돌아가기
		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}
		// 게시글 정보를 모델에 추가하여 뷰에 전달
		model.addAttribute("article", article);

		return "usr/article/modify";
	}

	// 게시글 수정 요청을 처리하는 메소드
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {
		Rq rq = (Rq) req.getAttribute("rq");
		// 요청된 ID로 게시글 조회
		Article article = articleService.getArticle(id);
		// 게시글이 존재하지 않을 경우 오류 메시지 출력
		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}
		// 로그인한 사용자가 해당 게시글을 수정할 권한이 있는지 확인
		ResultData loginedMemberCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);
		// 수정 권한이 있을 경우 게시글 수정 진행
		if (loginedMemberCanModifyRd.isSuccess()) {
			articleService.modifyArticle(id, title, body);
		}
		// 수정 후 게시글 상세 페이지로 리다이렉트
		return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
				"../article/detail?id=" + id);
	}

	// 게시글 삭제 요청을 처리하는 메소드
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		Rq rq = (Rq) req.getAttribute("rq");
		// 요청된 ID로 게시글 조회
		Article article = articleService.getArticle(id);
		// 게시글이 존재하지 않을 경우 오류 메시지 출력
		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}
		// 로그인한 사용자가 해당 게시글을 삭제할 권한이 있는지 확인
		ResultData loginedMemberCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);
		// 삭제 권한이 있을 경우 게시글 삭제 진행
		if (loginedMemberCanDeleteRd.isSuccess()) {
			articleService.deleteArticle(id);
		}
		// 삭제 후 게시글 목록 페이지로 리다이렉트
		return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
				"../article/list");
	}

}