package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReplyController {

	@Autowired
	private Rq rq;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private BoardService boardService;

	public UsrReplyController() {

	}

	// 액션 메서드


//	@RequestMapping("/usr/reply/write")
//	public String showJoin(HttpServletRequest req) {

//		return "usr/reply/write";
//	}

	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String content, String relTypeCode, String relId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isNullOrEmpty(content)) {
		return Ut.jsHistoryBack("F-1", "내용을 입력해주세요");
		}
		

	//ResultData<Integer> writeReplyRd = ReplyService.writeContent(rq.getLoginedMemberId(), content, relTypeCode, relId);

	//	int id = (int) writeArticleRd.getData1();

	//	Article article = articleService.getArticle(id);

	//	return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);

		return "댓글";
	}

	

}