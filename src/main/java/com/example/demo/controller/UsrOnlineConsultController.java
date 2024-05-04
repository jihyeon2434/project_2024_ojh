package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.repository.OnlineConsultShopRepository;
import com.example.demo.service.GenFileService;
import com.example.demo.service.OnlineConsultService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.menuService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.OnlineConArticle;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrOnlineConsultController {

	@Autowired
	private Rq rq;




	@Autowired
	private ReplyService replyService;

	@Autowired
	private OnlineConsultService OnlineConsultService;



	@Autowired
	private menuService menuService;
	@Autowired
	private GenFileService genFileService;


	// 액션 메서드
	@RequestMapping("/usr/onlineConsulting/write")
	public String showJoin(Model model, HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");
		
		int currentId = OnlineConsultService.getCurrentArticleId();
		
		 model.addAttribute("currentId", currentId);
		 

		return "usr/onlineConsulting/write";
	}

	@RequestMapping("/usr/onlineConsulting/doWrite")
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

		ResultData<Integer> writeArticleRd = OnlineConsultService.writeArticle(rq.getLoginedMemberId(), title, body);

		int id = (int) writeArticleRd.getData1();

		OnlineConArticle onlineConArticle = OnlineConsultService.getArticle(id);

		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../onlineConsulting/detail?id=" + id);

	}
	
	
	@RequestMapping("/usr/onlineConsulting/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		OnlineConArticle onlineConArticle = OnlineConsultService.getForPrintArticle(rq.getLoginedMemberId(), id);
	

		List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);

		int repliesCount = replies.size();

		model.addAttribute("onlineConArticle", onlineConArticle);
		model.addAttribute("replies", replies);
		model.addAttribute("repliesCount", repliesCount);


		return "usr/onlineConsulting/detail";
	}
	
}