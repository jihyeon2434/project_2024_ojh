package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.demo.service.ConsultShopService;
import com.example.demo.service.ScrapService;
import com.example.demo.service.selfShopService;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

@Controller
public class UsrScrapController {

	@Autowired
	private Rq rq;



	@Autowired
	private ScrapService scrapService;
	
	

	@Autowired
	private selfShopService selfShopService;
	
	@Autowired
	private ConsultShopService ConsultShopService;

	@RequestMapping("/usr/scrap/doGoodReaction")
	@ResponseBody
	public ResultData doGoodReaction( int categoryId, int themeId, int shopId, String replaceUri) {

		ResultData usersReactionRd = scrapService.usersReaction(rq.getLoginedMemberId(), categoryId, themeId, shopId);

		int usersReaction = (int) usersReactionRd.getData1();
		
		  int goodRP; // 메서드 전체에서 사용될 goodRP를 여기서 선언합니다
		if (usersReaction == 1) {
			ResultData rd = scrapService.deleteGoodReactionPoint(rq.getLoginedMemberId(), categoryId, themeId, shopId);
			 if (themeId == 1) {
	                goodRP = ConsultShopService.getGoodRP(categoryId, themeId, shopId);
	            } else {
	                goodRP = selfShopService.getGoodRP(categoryId, themeId, shopId);
	            }
	            return ResultData.from("S-1", "좋아요 취소", "goodRP", goodRP);
	        }

		ResultData reactionRd = scrapService.addGoodReactionPoint(rq.getLoginedMemberId(), categoryId, themeId, shopId);

		
		
		if (reactionRd.isFail()) {
			return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg());
		}
		
		 if (themeId == 1) {
	            goodRP = ConsultShopService.getGoodRP(categoryId, themeId, shopId);
	        } else {
	            goodRP = selfShopService.getGoodRP(categoryId, themeId, shopId);
	        }

	        return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg(), "goodRP", goodRP);
	    }



}
