package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class ArticleService {

	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	  // 사용자 ID와 게시글 ID를 받아 권한이 있는 경우 게시글 정보를 반환하는 메소드
	public Article getForPrintArticle(int loginedMemberId, int articleId) {
	    Article article = articleRepository.getForPrintArticle(articleId);
	    if (article == null) {
	        return null; // 게시글이 없는 경우 null 반환
	    }

	    // 사용자 정보와 게시글의 shopName 일치 여부 검사
	    Member member = memberRepository.getMemberById(loginedMemberId);
	    if (article.getShopName().equals(member.getCompanyName()) || article.getMemberId() == loginedMemberId) {
	        controlForPrintData(loginedMemberId, article); // 권한 조정 로직 수행
	        return article;
	    }
	    return null; // 권한이 없는 경우 null 반환
	}

	  // 게시글의 수정 및 삭제 권한을 설정하는 내부 메소드
	private void controlForPrintData(int loginedMemberId, Article article) {
		if (article == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, article);
		article.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, article);
		article.setUserCanDelete(userCanDeleteRd.isSuccess());
	}
    // 사용자가 특정 게시글을 삭제할 권한이 있는지 확인하는 메소드
	public ResultData userCanDelete(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", article.getId()));
	}
    // 사용자가 특정 게시글을 수정할 권한이 있는지 확인하는 메소드
	public ResultData userCanModify(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", article.getId()));
	}
    // 새 게시글을 작성하고 작성된 게시글의 ID를 반환하는 메소드
	public ResultData<Integer> writeArticle(int memberId, String title, String body, int boardId, String shopName) {
		articleRepository.writeArticle(memberId, title, body, boardId, shopName);

		int id = articleRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}
    // 특정 ID의 게시글을 삭제하는 메소드
	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}
	// 특정 게시글을 수정하는 메소드
	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
	}
	   // 특정 ID를 가진 게시글을 검색하는 메소드
	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}
	 // 모든 게시글을 검색하여 반환하는 메소드
	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}
	   // 특정 조건에 따라 게시글의 총 수를 반환하는 메소드
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}
	 // 특정 게시글의 조회수를 증가시키는 메소드
	public ResultData increaseHitCount(int id) {
		int affectedRow = articleRepository.increaseHitCount(id);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물 없음", "id", id);
		}

		return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);

	}
	// 특정 게시글의 조회수를 검색하는 메소드
	public Object getArticleHitCount(int id) {
		return articleRepository.getArticleHitCount(id);
	}
	   // 특정 조건에 따라 페이지 단위로 게시글을 검색하는 메소드
	public List<Article> getForPrintArticles(int memberId, int boardId, int itemsInAPage, int page, String searchKeywordTypeCode,
            String searchKeyword) {
        int limitFrom = (page - 1) * itemsInAPage;
        int limitTake = itemsInAPage;

        return articleRepository.getForPrintArticles(memberId, boardId, limitFrom, limitTake, searchKeywordTypeCode,
                searchKeyword);
    }

	 // 게시글에 즐겨찾기 증가시키는 메소드
	public ResultData increaseGoodReactionPoint(int relId) {
		int affectedRow = articleRepository.increaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}


	  // 게시글에 즐겨찾기 취소시키는 메소드
	public ResultData decreaseGoodReactionPoint(int relId) {
		int affectedRow = articleRepository.decreaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
	}


	// 특정 게시글의 '좋아요' 점수를 검색하는 메소드
	public int getGoodRP(int relId) {
		return articleRepository.getGoodRP(relId);
	}

	
	 // 다음 게시글의 ID를 예상하여 반환하는 메소드
	public int getCurrentArticleId() {
		return articleRepository.getCurrentArticleId();
		
	}
    // 특정 업체명을 가진 게시글을 검색하는 메소드
	public List<Article> getArticlesByCompanyName(String companyName) {
	    return articleRepository.findArticlesByCompanyName(companyName);
	}


}