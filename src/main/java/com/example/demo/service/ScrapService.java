package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ScrapRepository;
import com.example.demo.vo.ResultData;

@Service
public class ScrapService {

	@Autowired
	private selfShopService selfShopService;

	@Autowired
	private ConsultShopService ConsultShopService;

	@Autowired
	private ScrapRepository scrapRepository;

	public ScrapService(ScrapRepository reactionPointRepository) {
		this.scrapRepository = scrapRepository;
	}

	

	public ResultData usersReaction(int loginedMemberId, int categoryId, int themeId, int shopId) {

		if (loginedMemberId == 0) {
			return ResultData.from("F-L", "로그인 하고 써야해");
		}

		int sumReactionPointByMemberId = scrapRepository.getSumReactionPoint(loginedMemberId,
				categoryId, themeId, shopId);

		if (sumReactionPointByMemberId != 0) {
			return ResultData.from("F-1", "추천 불가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
		}

		return ResultData.from("S-1", "추천 가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
	}



	/*
	 * public ResultData addBadReactionPoint(int loginedMemberId, String
	 * relTypeCode, int relId) { int affectedRow =
	 * reactionPointRepository.addBadReactionPoint(loginedMemberId, relId);
	 * 
	 * if (affectedRow != 1) { return ResultData.from("F-1", "싫어요 실패"); }
	 * 
	 * switch (relTypeCode) { case "article":
	 * articleService.increaseBadReactionPoint(relId); break; }
	 * 
	 * return ResultData.from("S-1", "싫어요!"); }
	 */
	

	/*
	 * public ResultData deleteBadReactionPoint(int loginedMemberId, String
	 * relTypeCode, int relId) {
	 * reactionPointRepository.deleteReactionPoint(loginedMemberId, relId);
	 * 
	 * switch (relTypeCode) { case "article":
	 * articleService.decreaseBadReactionPoint(relId); break; } return
	 * ResultData.from("S-1", "싫어요 취소 됨"); }
	 */

	public boolean isAlreadyAddGoodRp(int memberId,int categoryId, int themeId, int shopId) {
		int getPointTypeCodeByMemberId = scrapRepository.getSumReactionPoint(memberId,categoryId, themeId, shopId);

		if (getPointTypeCodeByMemberId > 0) {
			return true;
		}

		return false;
	}



	public ResultData usersShopScrap(int loginedMemberId, int categoryId, int themeId, int shopId) {


			if (loginedMemberId == 0) {
				return ResultData.from("F-L", "로그인 하고 써야해");
			}

			int sumScrapByMemberId = scrapRepository.getSumScrapCount(loginedMemberId, categoryId, themeId, shopId);

			if (sumScrapByMemberId != 0) {
				return ResultData.from("F-1", "찜 불가능", "sumScrapByMemberId", sumScrapByMemberId);
			}

			return ResultData.from("S-1", "찜 가능", "sumScrapByMemberId", sumScrapByMemberId);
		}



	public ResultData deleteGoodReactionPoint(int loginedMemberId, int categoryId, int themeId, int shopId) {
		scrapRepository.deleteReactionPoint(loginedMemberId, categoryId, themeId, shopId);
		if (themeId == 1) {
			ConsultShopService.decreaseGoodReactionPoint(categoryId, themeId, shopId);
		} else {
			selfShopService.decreaseGoodReactionPoint(categoryId, themeId, shopId);
		}
		
	
		
		return ResultData.from("S-1", "좋아요 취소 됨");

	}




	public ResultData addGoodReactionPoint(int loginedMemberId, int categoryId, int themeId, int shopId) {

		
		int affectedRow = scrapRepository.addGoodReactionPoint(loginedMemberId,  categoryId, themeId, shopId);
		
		System.err.println(affectedRow);
		
		if (affectedRow != 1) {
			return ResultData.from("F-1", "좋아요 실패");
		}

		if (themeId == 1) {
		ConsultShopService.increaseGoodReactionPoint(categoryId, themeId, shopId);
		} else {selfShopService.increaseGoodReactionPoint(categoryId, themeId, shopId);
		}
		return ResultData.from("S-1", "좋아요!");
	}


	/*
	 * public boolean isAlreadyAddBadRp(int memberId, int relId) { int
	 * getPointTypeCodeByMemberId =
	 * reactionPointRepository.getSumReactionPoint(memberId, relId);
	 * 
	 * if (getPointTypeCodeByMemberId < 0) { return true; }
	 * 
	 * return false; }
	 */



	

}
