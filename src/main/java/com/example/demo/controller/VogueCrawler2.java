package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class VogueCrawler2 {

    public static void main(String[] args) {
        // ChromeDriver 경로 설정
        System.setProperty("webdriver.chrome.driver", "C:/work/chromedriver.exe");

        // Chrome 옵션 설정 (헤드리스 모드)
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless"); // 헤드리스 모드 활성화

        // WebDriver 인스턴스 생성
        WebDriver driver = new ChromeDriver(options);

        try {
            // 웹 페이지로 이동
            driver.get("https://www.vogue.co.kr/");

            // 패션 섹션 데이터 크롤링
            WebElement fashionArticle = driver.findElement(By.cssSelector("li#p_462386[slot='main_fashion_category']"));
            crawlArticle(fashionArticle, "Fashion");

            // 뷰티 섹션 데이터 크롤링
            WebElement beautyArticle = driver.findElement(By.cssSelector("div.ma_highlight[slot='main_beauty_highlight']"));
            crawlArticle(beautyArticle, "Beauty");

            // Today's stories 섹션 데이터 크롤링
            WebElement todayArticle = driver.findElement(By.cssSelector("div.ly_post_sticky.today_slot_1[slot='main_today_highlight']"));
            crawlArticle(todayArticle, "Today's Stories");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // WebDriver 종료
            driver.quit();
        }
    }

    public static void crawlArticle(WebElement article, String sectionName) {
        try {
            // 기사 제목 가져오기
            WebElement titleElement = article.findElement(By.cssSelector("h3"));
            String title = titleElement.getText();

            // 기사 링크 가져오기
            WebElement linkElement = article.findElement(By.tagName("a"));
            String link = linkElement.getAttribute("href");

            // 기사 이미지 URL 가져오기
            WebElement imageElement = article.findElement(By.cssSelector("div.thum img"));
            String imageUrl = imageElement.getAttribute("src");

            // 기사 날짜 가져오기
            WebElement dateElement = article.findElement(By.cssSelector("p.date"));
            String date = dateElement.getText();

            // 출력
            System.out.println(sectionName + " Article:");
            System.out.println("Title: " + title);
            System.out.println("Link: " + link);
            System.out.println("Image URL: " + imageUrl);
            System.out.println("Date: " + date);
            System.out.println();
        } catch (Exception e) {
            System.out.println("Failed to crawl " + sectionName + " Article: " + e.getMessage());
        }
    }
}
