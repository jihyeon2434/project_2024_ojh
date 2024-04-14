package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReactionPointRepository;
import com.example.demo.repository.ScrapRepository;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Scrap;

@Service
public class scrapService {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private ReactionPointRepository reactionPointRepository;
	
	@Autowired
	private ScrapRepository scrapRepository;
	

	public scrapService(ScrapRepository scrapRepository) {
		this.scrapRepository = scrapRepository;
	}

	

	public ResultData usersReaction(int loginedMemberId,int themeId, int categoryId, int shopId, int memberId) {

		if (loginedMemberId == 0) {
			return ResultData.from("F-L", "로그인 하고 써야해");
		}

		int sumReactionPointByMemberId = scrapRepository.getSumReactionPoint(themeId, categoryId, shopId, memberId);

		if (sumReactionPointByMemberId != 0) {
			return ResultData.from("F-1", "추천 불가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
		}

		return ResultData.from("S-1", "추천 가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
	}

	public ResultData addGoodReactionPoint(int loginedMemberId,int themeId, int categoryId, int shopId) {

		int affectedRow = scrapRepository.addGoodReactionPoint(loginedMemberId, themeId, categoryId, shopId);
		
		System.err.println(affectedRow);
		
		if (affectedRow != 1) {
			return ResultData.from("F-1", "좋아요 실패");
		}

		

		return ResultData.from("S-1", "좋아요!");
	}

	public ResultData addBadReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		int affectedRow = reactionPointRepository.addBadReactionPoint(loginedMemberId, relTypeCode, relId);

		if (affectedRow != 1) {
			return ResultData.from("F-1", "싫어요 실패");
		}

		switch (relTypeCode) {
		case "article":
			articleService.increaseBadReactionPoint(relId);
			break;
		}

		return ResultData.from("S-1", "싫어요!");
	}

	public ResultData deleteGoodReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		reactionPointRepository.deleteReactionPoint(loginedMemberId, relTypeCode, relId);

		switch (relTypeCode) {
		case "article":
			articleService.decreaseGoodReactionPoint(relId);
			break;
		}
		return ResultData.from("S-1", "좋아요 취소 됨");

	}

	public ResultData deleteBadReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		reactionPointRepository.deleteReactionPoint(loginedMemberId, relTypeCode, relId);

		switch (relTypeCode) {
		case "article":
			articleService.decreaseBadReactionPoint(relId);
			break;
		}
		return ResultData.from("S-1", "싫어요 취소 됨");
	}

	public boolean isAlreadyAddGoodRp(int themeId, int categoryId, int shopId, int memberId) {
		int getPointTypeCodeByMemberId = scrapRepository.getSumReactionPoint(themeId, categoryId, shopId, memberId);

		if (getPointTypeCodeByMemberId > 0) {
			return true;
		}

		return false;
	}

	public boolean isAlreadyAddBadRp(int memberId, int relId, String relTypeCode) {
		int getPointTypeCodeByMemberId = reactionPointRepository.getSumReactionPoint(memberId, relTypeCode, relId);

		if (getPointTypeCodeByMemberId < 0) {
			return true;
		}

		return false;
	}



	 public Scrap getScrap(String themeId, String categoryId, int shopId, int memberId) {
	        return scrapRepository.getScrap(themeId, categoryId, shopId, memberId);
	    }



	


	public void removeScrap(String themeId, String categoryId, int shopId, int memberId) {
		scrapRepository.removeScrap(themeId, categoryId, shopId, memberId);
		return;
		
	}



	public ResultData deleteScrapPoint(int loginedMemberId, int themeId, int categoryId, int shopId) {
		scrapRepository.deleteScrapPoint(loginedMemberId, themeId, categoryId, shopId);
		return null;
	}

}