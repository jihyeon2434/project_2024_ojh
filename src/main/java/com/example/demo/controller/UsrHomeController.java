package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.vogueArticle;

@Controller
public class UsrHomeController {
    
	@Autowired
    private VogueCrawler4 vogueCrawler;

//    public UsrHomeController(VogueCrawler4 vogueCrawler) {
//        this.vogueCrawler = vogueCrawler;
//    }

    @RequestMapping("/usr/home/main")
    public String showMain(Model model) {
    	
        List<vogueArticle> articles = vogueCrawler.crawlArticles();
        
        System.out.println("VOGUE articel: " + articles.toString());
        
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
}