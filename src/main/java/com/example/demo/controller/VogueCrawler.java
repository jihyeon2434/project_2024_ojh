package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class VogueCrawler {

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

            // TODAY’S STORIES 섹션의 첫 번째 기사 정보 가져오기
            WebElement firstArticle = driver.findElement(By.cssSelector("div.ly_post_sticky.today_slot_1.ma_highlight"));

            // 기사 제목 가져오기
            WebElement titleElement = firstArticle.findElement(By.cssSelector("div.post_content h3"));
            String title = titleElement.getText();

            // 기사 링크 가져오기
            WebElement linkElement = firstArticle.findElement(By.tagName("a"));
            String link = linkElement.getAttribute("href");

            // 기사 이미지 URL 가져오기
            WebElement imageElement = firstArticle.findElement(By.cssSelector("div.thum img"));
            String imageUrl = imageElement.getAttribute("src");

            // 기사 날짜 가져오기
            WebElement dateElement = firstArticle.findElement(By.cssSelector("div.post_content p span:nth-of-type(2)"));
            String date = dateElement.getText();

            // 출력
            System.out.println("Title: " + title);
            System.out.println("Link: " + link);
            System.out.println("Image URL: " + imageUrl);
            System.out.println("Date: " + date);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // WebDriver 종료
            driver.quit();
        }
    }
}
