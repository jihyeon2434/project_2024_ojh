package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import io.github.bonigarcia.wdm.WebDriverManager;

@Controller
public class SeleniumWebCrawler {

   @RequestMapping("/usr/sele/test")
   public String selTest() {
      // WebDriver 초기화
      WebDriverManager.chromedriver().setup();
      WebDriver driver = new ChromeDriver();

      try {
         // 웹 페이지로 이동
         driver.get(
               "https://map.naver.com/p/search/%EC%9D%B4%EB%AF%B8%EC%A7%80%EB%A9%94%EC%9D%B4%ED%82%B9?c=15.00,0,0,0,dh");

         // 웹 페이지에서 정보 가져오기
         // 예: 페이지 타이틀
         String title = driver.getTitle();
         System.out.println("Page title is: " + title);

         // 예: 특정 요소의 텍스트 가져오기 (여기서는 h1 태그)
         WebElement h1Element = driver.findElement(By.tagName("a"));
         System.out.println("First H1 Text: " + h1Element.getText());

         // 예: 클래스 이름으로 요소들을 찾기
         java.util.List<WebElement> elements = driver.findElements(By.className("P7gyV"));
         for (WebElement element : elements) {
            System.out.println("Class Element Text: " + element.getText());
         }

         // 예: 링크의 href 속성 가져오기
         java.util.List<WebElement> links = driver.findElements(By.tagName("a"));
         for (WebElement link : links) {
            System.out.println("Link: " + link.getAttribute("href"));
         }

      } finally {
         // 브라우저 닫기
         driver.quit();
      }
      return null;
   }
}