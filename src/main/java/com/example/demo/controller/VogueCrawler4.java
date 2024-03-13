package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Component;

import com.example.demo.vo.vogueArticle;

@Component
public class VogueCrawler4 {

    public List<vogueArticle> crawlArticles() {
        WebDriver driver = null;
        List<vogueArticle> articles = new ArrayList<>();

        // ChromeDriver 경로 설정
        System.setProperty("webdriver.chrome.driver", "C:/work/chromedriver.exe");

        // Chrome 옵션 설정 (헤드리스 모드)
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless"); // 헤드리스 모드 활성화

        try {
            // WebDriver 인스턴스 생성
            driver = new ChromeDriver(options);

            // 웹 페이지로 이동
            driver.get("https://www.vogue.co.kr/");

            // 패션 섹션 데이터 크롤링
            try {
                WebElement fashionArticle = driver.findElement(By.cssSelector("[slot='main_fashion_category']"));
                articles.add(crawlArticle(fashionArticle, "Fashion"));
            } catch (NoSuchElementException e) {
                System.out.println("No fashion articles found: " + e.getMessage());
            }

            // 뷰티 섹션 데이터 크롤링
            try {
                WebElement beautyArticle = driver.findElement(By.cssSelector("div.ma_highlight[slot='main_beauty_highlight']"));
                articles.add(crawlArticle(beautyArticle, "Beauty"));
            } catch (NoSuchElementException e) {
                System.out.println("No beauty articles found: " + e.getMessage());
            }

            // Today's stories 섹션 데이터 크롤링
            try {
                WebElement todayArticle = driver.findElement(By.cssSelector("div.ly_post_sticky.today_slot_1[slot='main_today_highlight']"));
                articles.add(crawlArticle(todayArticle, "Today's Stories"));
            } catch (NoSuchElementException e) {
                System.out.println("No today's stories articles found: " + e.getMessage());
            }
        } finally {
            // WebDriver 종료
            if (driver != null) {
                driver.quit();
            }
        }

        return articles;
    }

    private vogueArticle crawlArticle(WebElement article, String sectionName) {
        vogueArticle newArticle = new vogueArticle();

        try {
            // 기사 제목 가져오기
            WebElement titleElement = article.findElement(By.cssSelector("h3"));
            String title = titleElement.getText();
            newArticle.setTitle(title);
            
            System.out.println(title);

            // 기사 링크 가져오기
            WebElement linkElement = article.findElement(By.tagName("a"));
            String link = linkElement.getAttribute("href");
            newArticle.setLink(link);

            // 기사 이미지 URL 가져오기
            WebElement imageElement = article.findElement(By.cssSelector("div.thum img"));
            String imageUrl = imageElement.getAttribute("src");
            newArticle.setImageUrl(imageUrl);

            // 기사 날짜 가져오기
            String date = "";
            try {
                // 패션 섹션의 경우
                WebElement dateElement = article.findElement(By.cssSelector("p.date"));
                date = dateElement.getText();
            } catch (NoSuchElementException e) {
                try {
                    // 뷰티 및 Today's Stories 섹션의 경우
                    WebElement postContent = article.findElement(By.cssSelector(".post_content"));
                    List<WebElement> spanElements = postContent.findElements(By.cssSelector("span"));
                    if (spanElements.size() >= 2) {
                        // 두 번째 span 요소에서 날짜 추출
                        date = spanElements.get(1).getText();
                    }
                } catch (NoSuchElementException ex) {
                    System.out.println("No date found for " + sectionName + " Article");
                }
            }
            newArticle.setDate(date);

        } catch (Exception e) {
            System.out.println("Failed to crawl " + sectionName + " Article: " + e.getMessage());
        }

        return newArticle;
    }
}
