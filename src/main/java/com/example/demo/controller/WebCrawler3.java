package com.example.demo.controller;

import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import jakarta.annotation.PostConstruct;


public class WebCrawler3 {

    @PostConstruct
    public void init() {
        // Chrome WebDriver 경로 설정
        System.setProperty("webdriver.chrome.driver", "/path/to/chromedriver");

        // Chrome 브라우저를 실행시키기 위한 옵션 설정
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless"); // 화면 표시 없이 실행

        // WebDriver 객체 생성
        WebDriver driver = new ChromeDriver(options);

        // 브라우저 사이즈 조절
        driver.manage().window().maximize();

        // 사이트 접속
        driver.get("https://map.naver.com/v5/search");

        // 팝업 창 닫기
        WebElement popupCloseButton = driver.findElement(By.cssSelector("button#intro_popup_close"));
        popupCloseButton.click();

        // 검색어 입력
        WebElement searchBox = driver.findElement(By.cssSelector("div.input_box>input.input_search"));
        searchBox.sendKeys("마라탕");
        searchBox.sendKeys(Keys.ENTER);

        // 데이터 수집
        for (int p = 0; p < 20; p++) {
            try {
                Thread.sleep(2000); // 2초 대기
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // 페이지 소스 가져오기
            String pageSource = driver.getPageSource();

            // 파싱을 위한 대기
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("div.ps-content")));

            // HTML 파싱
            List<WebElement> contents = driver.findElements(By.cssSelector("div.item_search"));
            for (WebElement content : contents) {
                WebElement searchBoxHtml = content.findElement(By.cssSelector(".search_box"));
                String name = searchBoxHtml.findElement(By.cssSelector(".title_box .search_title .search_title_text")).getText();
                System.out.println("식당명: " + name);

                WebElement phoneElement;
                try {
                    phoneElement = searchBoxHtml.findElement(By.cssSelector(".search_text_box .phone"));
                } catch (Exception e) {
                    phoneElement = null;
                }

                String phone = (phoneElement != null) ? phoneElement.getText() : "NULL";
                System.out.println("전화번호: " + phone);

                String address = searchBoxHtml.findElement(By.cssSelector(".ng-star-inserted .address")).getText();
                System.out.println("주소: " + address);

                System.out.println("--".repeat(30));
            }

            // 다음 페이지로 이동
            try {
                WebElement nextBtn = driver.findElement(By.cssSelector("button.btn_next"));
                nextBtn.click();
            } catch (Exception e) {
                System.out.println("데이터 수집 완료");
                break;
            }
        }

        // WebDriver 종료
        driver.quit();
    }
}
