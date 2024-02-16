package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Service
public class ReplyService {

	@Autowired
	private ArticleRepository articleRepository;

	public ReplyService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	

//	public static ResultData<Integer> writeContent(int loginedMemberId, String content, String relTypeCode, String relId) {
//		replyRepository.writeReply(int loginedMemberId, String content, relTypeCode,relId);

//		int id = replyRepository.getLastInsertId();

//		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
//	}
//		return null;
//	}

}