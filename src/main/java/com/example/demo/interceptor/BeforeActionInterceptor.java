package com.example.demo.interceptor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.service.ConsultShopService;
import com.example.demo.vo.Rq;
import com.example.demo.vo.conShop;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {
    @Autowired
    private Rq rq;

    @Autowired
    private ConsultShopService consultShopService; // 상담 가게 서비스

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        // 프로그램 처음 실행 시 DB에 상담 가게 정보를 크롤링하여 저장
        rq.initBeforeActionInterceptor();

        // 이미 초기화가 되었는지 확인하여 중복 실행 방지
        if (!rq.isInit()) {
            // 여기서 원하는 동작을 수행하여 DB에 데이터 저장
            List<conShop> shopInfoList = consultShopService.getShopsList(); // 기존에 DB에 저장된 상점 목록 가져오기
            if (shopInfoList.isEmpty()) { // 만약 DB에 저장된 데이터가 없다면 크롤링하여 저장
                shopInfoList = webCrawler17.crawlConsultingShops();
                for (conShop shop : shopInfoList) {
                    if (isValidShopInfo(shop)) {
                        consultShopService.registerShop(shop);
                    }
                }
            }

            rq.setInit(true); // 초기화를 완료했음을 표시
        }

        return HandlerInterceptor.super.preHandle(req, resp, handler);
    }

    // 상점 정보가 유효한지 확인하는 메서드
    private boolean isValidShopInfo(conShop shop) {
        // 원하는 유효성 검사를 수행
        return shop != null;
    }
}
