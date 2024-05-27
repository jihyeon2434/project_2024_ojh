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
	// 생성자 주입을 통해 의존성 주입
	public ScrapService(ScrapRepository reactionPointRepository) {
		this.scrapRepository = scrapRepository;
	}

	
	 // 사용자의 즐겨찾기 반응 상태 확인
	public ResultData usersReaction(int loginedMemberId, int categoryId, int themeId, int shopId) {

		if (loginedMemberId == 0) {
			return ResultData.from("F-L", "로그인 후 사용해주세요.");
		}

        // 사용자의 전체 즐겨찾기 점수 확인
		int sumReactionPointByMemberId = scrapRepository.getSumReactionPoint(loginedMemberId,
				categoryId, themeId, shopId);

		if (sumReactionPointByMemberId != 0) {
			return ResultData.from("F-1", "추천 불가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
		}

		return ResultData.from("S-1", "추천 가능", "sumReactionPointByMemberId", sumReactionPointByMemberId);
	}


	  //즐겨찾기를 이미 눌렀는지 확인하는 메서드 (boolean 반환)
	public boolean isAlreadyAddGoodRp(int memberId,int categoryId, int themeId, int shopId) {
		int getPointTypeCodeByMemberId = scrapRepository.getSumReactionPoint(memberId,categoryId, themeId, shopId);

		if (getPointTypeCodeByMemberId > 0) {
			return true;
		}

		return false;
	}


	  // 사용자가 상점을 즐겨찾기할 수 있는지 확인하는 메서드
	public ResultData usersShopScrap(int loginedMemberId, int categoryId, int themeId, int shopId) {


			if (loginedMemberId == 0) {
				return ResultData.from("F-L", "로그인 후 사용해주세요.");
			}
			// 상점을 즐겨찾기했는지 확인
			int sumScrapByMemberId = scrapRepository.getSumScrapCount(loginedMemberId, categoryId, themeId, shopId);
			 // 이미 즐겨찾기했다면 즐겨찾기 불가능 메시지 반환
			if (sumScrapByMemberId != 0) {
				return ResultData.from("F-1", "찜 불가능", "sumScrapByMemberId", sumScrapByMemberId);
			}
		     // 즐겨찾기 가능 상태 메시지 반환
			return ResultData.from("S-1", "찜 가능", "sumScrapByMemberId", sumScrapByMemberId);
		}



    // 즐겨찾기 삭제
	public ResultData deleteGoodReactionPoint(int loginedMemberId, int categoryId, int themeId, int shopId) {
		scrapRepository.deleteReactionPoint(loginedMemberId, categoryId, themeId, shopId);
		if (themeId == 1) {
			ConsultShopService.decreaseGoodReactionPoint(categoryId, themeId, shopId);
		} else {
			selfShopService.decreaseGoodReactionPoint(categoryId, themeId, shopId);
		}
		
	
		
		return ResultData.from("S-1", "좋아요 취소 됨");

	}




    // 즐겨찾기 추가
	public ResultData addGoodReactionPoint(int loginedMemberId, int categoryId, int themeId, int shopId) {

		
		int affectedRow = scrapRepository.addGoodReactionPoint(loginedMemberId,  categoryId, themeId, shopId);
		
		System.err.println(affectedRow);
		// 좋아요 추가 실패
		if (affectedRow != 1) {
			return ResultData.from("F-1", "좋아요 실패");
		}
	    // 테마에 따라 적절한 서비스를 호출하여 좋아요 점수 증가
		if (themeId == 1) {
		ConsultShopService.increaseGoodReactionPoint(categoryId, themeId, shopId);
		} else {selfShopService.increaseGoodReactionPoint(categoryId, themeId, shopId);
		}
		return ResultData.from("S-1", "좋아요!");
	}


	

}
