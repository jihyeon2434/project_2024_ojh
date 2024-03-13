package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ConsultShopService;
import com.example.demo.vo.conShop;
import com.example.demo.vo.vogueArticle;

@Controller
public class UsrHomeController {

	@Autowired
	private VogueCrawler4 vogueCrawler;

	@Autowired
    private WebCrawler17 webCrawler17;
	
	@Autowired
	private ConsultShopService consultShopService;

//    public UsrHomeController(VogueCrawler4 vogueCrawler) {
//        this.vogueCrawler = vogueCrawler;
//    }

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {

		List<vogueArticle> articles = vogueCrawler.crawlArticles();
		System.out.println("VOGUE articel: " + articles.toString());

		 // 상담 가게 리스트 크롤링
        List<conShop> shopInfoList = webCrawler17.crawlConsultingShops();
        System.out.println("Consulting Shops: " + shopInfoList.toString());

        // 크롤링한 상담 가게 리스트를 DB에 저장
        for (conShop shop : shopInfoList) {
            // 크롤링 데이터 중 일부가 null인 경우를 대비하여 데이터 유효성 검사 추가
            if (isValidShopInfo(shop)) {
                consultShopService.registerShop(shop);
            }
        }

        // 여기서 articles를 사용하여 필요한 작업을 수행합니다.
        model.addAttribute("articles", articles);
        return "/usr/home/main";
    }

    @RequestMapping("/")
    public String showMain2(Model model) {
        List<vogueArticle> articles = vogueCrawler.crawlArticles();
        System.out.println("VOGUE articel: " + articles.toString());

        // 여기서 articles를 사용하여 필요한 작업을 수행합니다.
        model.addAttribute("articles", articles);
        return "/usr/home/main";
    }

    // 상점 정보가 유효한지 확인하는 메서드
    private boolean isValidShopInfo(conShop shop) {
        // 상점 이름과 주소가 모두 존재해야 유효한 정보로 간주
        return shop.getShopName() != null && shop.getRoadNameNum() != null;
    }
}