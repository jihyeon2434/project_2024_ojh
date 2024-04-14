package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.scrapService;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scrap;

@Controller
public class UsrScrapPointController {

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private scrapService scrapService;

	@RequestMapping("/usr/scrap/doScrap")
	@ResponseBody
	public ResultData doScrap(int themeId, int categoryId, int shopId, int memberId) {

		ResultData usersReactionRd = scrapService.usersReaction(rq.getLoginedMemberId(), themeId, categoryId, shopId,
				memberId);

		int usersReaction = (int) usersReactionRd.getData1();

		if (usersReaction == 1) {
			ResultData rd = scrapService.deleteScrapPoint(rq.getLoginedMemberId(), themeId, categoryId, shopId);
			/* int goodRP = articleService.getGoodRP(relId); */

			return ResultData.from("S-1", "좋아요 취소");
		}

		ResultData reactionRd = scrapService.addGoodReactionPoint(rq.getLoginedMemberId(), themeId, categoryId, shopId);

		return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg());

	}
}