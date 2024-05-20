package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.demo.controller.VogueCrawler;
import com.example.demo.vo.Rq;
import com.example.demo.vo.vogueArticle;

import java.util.List;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {
	@Autowired
	private Rq rq;

	@Autowired
	private VogueCrawler vogueCrawler;
	private static boolean isCrawled = false;
	private static List<vogueArticle> cachedArticles;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		rq.initBeforeActionInterceptor();

		// 서버 시작 후 첫 요청 시에만 크롤링 실행
		if (!isCrawled) {
			cachedArticles = vogueCrawler.crawlArticles();
			isCrawled = true; // 크롤링이 완료되었음을 표시
		}

		// 크롤링 데이터를 요청 객체에 추가 (필요한 경우)
		req.setAttribute("articles", cachedArticles);
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
