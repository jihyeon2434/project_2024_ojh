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
	// 좋아요 반응 처리 메서드
	@RequestMapping("/usr/scrap/doGoodReaction")
	@ResponseBody
	public ResultData doGoodReaction( int categoryId, int themeId, int shopId, String replaceUri) {
		// 사용자의 좋아요 반응 상태 확인
		ResultData usersReactionRd = scrapService.usersReaction(rq.getLoginedMemberId(), categoryId, themeId, shopId);

		int usersReaction = (int) usersReactionRd.getData1();
		
		  int goodRP; // 메서드 전체에서 사용될 goodRP를 여기서 선언합니다
		if (usersReaction == 1) {
			   // 이미 좋아요가 되어있으면 취소 처리
			ResultData rd = scrapService.deleteGoodReactionPoint(rq.getLoginedMemberId(), categoryId, themeId, shopId);
			 if (themeId == 1) {
	                goodRP = ConsultShopService.getGoodRP(categoryId, themeId, shopId);
	            } else {
	                goodRP = selfShopService.getGoodRP(categoryId, themeId, shopId);
	            }
	            return ResultData.from("S-1", "좋아요 취소", "goodRP", goodRP);
	        }
		 // 새로운 좋아요 처리
		ResultData reactionRd = scrapService.addGoodReactionPoint(rq.getLoginedMemberId(), categoryId, themeId, shopId);

		
		// 좋아요 반응 추가 실패 여부 확인
		if (reactionRd.isFail()) {
			  // 실패했다면, 실패 원인을 클라이언트에 전달
			return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg());
		}
		// 좋아요 반응 추가 성공했다면, 해당 테마의 상점 좋아요 점수 조회
		 if (themeId == 1) {
	            goodRP = ConsultShopService.getGoodRP(categoryId, themeId, shopId);// 상담 가게 서비스를 통해 좋아요 점수를 가져옴
	        } else {
	            goodRP = selfShopService.getGoodRP(categoryId, themeId, shopId);// 자체 가게 서비스를 통해 좋아요 점수를 가져옴
	        }
		// 성공적으로 좋아요 점수를 갱신하고 클라이언트에 반환
	        return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg(), "goodRP", goodRP);
	    }



}
