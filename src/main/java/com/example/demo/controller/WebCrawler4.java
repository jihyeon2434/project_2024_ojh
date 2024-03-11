package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;

import java.util.ArrayList;
import java.util.List;

public class WebCrawler4 {

    // WebDriver
    private WebDriver driver;
    private String url;

    // Properties
    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:\\\\work\\\\sts-4.21.0.RELEASE-workspace\\\\chromedriver-win64\\\\chromedriver-win64/chromedriver.exe";

    public void crawlMap() throws InterruptedException {
        // System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        // Driver SetUp
        ChromeOptions options = new ChromeOptions();
        //options.setCapability("w3c", false); // Remove this line
        //options.setExperimentalOption("w3c", false); // Remove this line

        driver = new ChromeDriver(options); // 변경된 부분
        
        // 네이버 지도
        url = "https://map.naver.com/v5/";
        driver.get(url);
        Thread.sleep(5000);

        // 네이버 지도 검색창에 입력 후 엔터
        WebElement inputSearch = driver.findElement(By.className("input_search"));
        inputSearch.sendKeys("이미지라이징 연구소 퍼스널컬러진단");
        Thread.sleep(1000);
        inputSearch.sendKeys(Keys.ENTER);
        Thread.sleep(3000);

        // 데이터가 iframe 안에 있는 경우(HTML 안 HTML) 이동
        driver.switchTo().frame("entryIframe");

        // 플레이스 정보가 나오는 요소 선택
        WebElement placeElement = driver.findElement(By.cssSelector("#_title div span.Fc1rA"));

        // 플레이스 이름 출력
        System.out.println("Place Name: " + placeElement.getText());

        // 플레이스 클릭하여 상세 정보로 이동
        placeElement.click();
        Thread.sleep(2000);
        driver.switchTo().parentFrame(); // 부모 프레임으로 이동
        driver.switchTo().frame(driver.findElement(By.id("entryIframe"))); // 옆 iframe으로 이동

        // 주소 정보 가져오기
        WebElement addressElement = driver.findElement(By.className("LDgIH"));
        System.out.println("Address: " + addressElement.getText());

        // 전화번호 가져오기
        try {
            WebElement phoneNumberElement = driver.findElement(By.className("xlx7Q"));
            System.out.println("Phone Number: " + phoneNumberElement.getText());
        } catch (Exception ex) {
            System.out.println("Phone Number not found");
        }

        // 메뉴 정보 가져오기
        try {
            List<WebElement> menuElements = driver.findElements(By.className("_1q3GD"));
            List<WebElement> priceElements = driver.findElements(By.className("_2nGYH"));
            for (int i = 0; i < menuElements.size(); i++) {
                String menu = menuElements.get(i).getText();
                String price = priceElements.get(i).getText();
                System.out.println("Menu: " + menu + ", Price: " + price);
            }
        } catch (Exception ex) {
            System.out.println("Menu information not found");
        }

        // 창 닫기
        driver.close();
    }


    public static void main(String[] args) throws InterruptedException {
        WebCrawler4 test = new WebCrawler4();
        test.crawlMap();
    }
}
