package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.vogueArticle;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrHomeController {

    @RequestMapping("/usr/home/main")
    public String showMain(HttpServletRequest request, Model model) {
        // 인터셉터에서 저장된 크롤링 결과를 가져옵니다.
        List<vogueArticle> articles = (List<vogueArticle>) request.getAttribute("articles");
        
        if (articles == null) {
            System.out.println("No articles found");
        } else {
            System.out.println("VOGUE article: " + articles.toString());
            model.addAttribute("articles", articles);
        }
        return "/usr/home/main";
    }

    @RequestMapping("/")
    public String showMain2(HttpServletRequest request, Model model) {
        // 인터셉터에서 저장된 크롤링 결과를 가져옵니다.
        List<vogueArticle> articles = (List<vogueArticle>) request.getAttribute("articles");
        
        if (articles == null) {
            System.out.println("No articles found");
        } else {
            System.out.println("VOGUE article: " + articles.toString());
            model.addAttribute("articles", articles);
        }
        return "redirect:/usr/home/main";
    }
}
