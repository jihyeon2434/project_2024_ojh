package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

public class WebCrawler10 {

    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public void crawlKakaoHairShop(String location) {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        url = "https://hairshop.kakao.com/";
        driver.get(url);

        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 클릭할 링크 요소를 찾습니다.
        WebElement quickLink = driver.findElement(By.xpath("//a[@class='link_quick' and @href='/search/around?type=hairShop']"));

        // 링크를 클릭합니다.
        quickLink.click();

        // WebDriverWait를 생성하여 최대 10초 동안 대기합니다.
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        try {
            // 요소가 나타날 때까지 대기합니다.
            WebElement resultSection = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='hairshop-result']")));

            List<WebElement> elements = driver.findElements(By.xpath("//div[@class='hairshop-result']"));

            for (WebElement e : elements) {
                WebElement nameElement = e.findElement(By.xpath(".//div[@class='store-name']"));
                WebElement addressElement = e.findElement(By.xpath(".//span[@class='store-address']"));
                WebElement timeElement = e.findElement(By.xpath(".//p[@class='desc_time_info']"));

                String name = nameElement.getText();
                String address = addressElement.getText();
                String time = timeElement.getText();

                // Output data
                System.out.println("Name: " + name);
                System.out.println("Address: " + address);
                System.out.println("Operating Hours: " + time);
                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public static void main(String[] args) {
        WebCrawler10 crawler = new WebCrawler10();
        crawler.crawlKakaoHairShop("서울"); // 검색하고자 하는 위치를 여기에 입력
    }
}
