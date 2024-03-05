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
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

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

	public UsrConsultingController() {

	}

	// 액션 메서드

	
	
	@RequestMapping("/usr/consulting/list")
	public String showConsultingList(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		

		return "usr/consulting/list";
	}
	
	@RequestMapping("/usr/consulting/detail")
	public String showconsultingDetail(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		

		return "usr/consulting/detail";
	}
	
	@RequestMapping("/usr/self/list")
	public String showselfList(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		

		return "usr/self/list";
	}
	
	@RequestMapping("/usr/self/detail")
	public String showselfDetail(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		

		return "usr/self/detail";
	}
	
	@RequestMapping("/usr/consulting/feedbackWrite")
	public String showfeedbackWrite(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");
		

		return "usr/consulting/feedbackWrite";
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
	

	
}