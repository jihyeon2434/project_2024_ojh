package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.ArrayList;
import java.util.List;

public class WebCrawler16 {
    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public void crawlMap(String location) {
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        driver = new ChromeDriver(options);

        url = "https://map.naver.com/v5/";
        driver.get(url);

        try {
            Thread.sleep(5000); // 페이지가 로드될 때까지 충분한 시간 대기
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 네이버 지도 검색창에 원하는 검색어 입력 후 엔터
        WebElement inputSearch = driver.findElement(By.className("input_search"));
        inputSearch.sendKeys(location + Keys.ENTER);

        try {
            Thread.sleep(3000); // 검색 결과가 로드될 때까지 충분한 시간 대기
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // iframe 안의 데이터에 접근하기 위해 iframe으로 전환
        driver.switchTo().frame("searchIframe");

        // 검색 결과에서 각 업체의 정보를 가져옴
        List<WebElement> elements = driver.findElements(By.className("YwYLL"));
        for (WebElement element : elements) {
            // 업체 이름 클릭하여 상세 정보 페이지로 이동
            element.click();

            try {
                Thread.sleep(2000); // 페이지가 로드될 때까지 충분한 시간 대기
            } catch (InterruptedException ex) {
                ex.printStackTrace();
            }

            // 상세 정보 페이지에서 필요한 정보 추출
            String name = driver.findElement(By.className("place_name")).getText();
            String address = driver.findElement(By.className("LDgIH")).getText();
            String phoneNumber = null;
            try {
                phoneNumber = driver.findElement(By.className("xlx7Q")).getText();
            } catch (Exception ignored) {
            }
            String businessHours = null;
            try {
                WebElement businessHoursElement = driver.findElement(By.className("xuHjH"));
                businessHours = businessHoursElement.getText();
            } catch (Exception ignored) {
            }
            String menuInfo = null;
            try {
                WebElement menuInfoElement = driver.findElement(By.className("_3ZA0S"));
                menuInfo = menuInfoElement.getText();
            } catch (Exception ignored) {
            }
            String facilities = null;
            try {
                WebElement facilitiesElement = driver.findElement(By.className("xPvPE"));
                facilities = facilitiesElement.getText();
            } catch (Exception ignored) {
            }
            List<String> imageUrls = new ArrayList<>();
            try {
                List<WebElement> imageElements = driver.findElements(By.xpath("//div[@class='K0PDV _div']"));
                for (WebElement imageElement : imageElements) {
                    String styleAttribute = imageElement.getAttribute("style");
                    String url = styleAttribute.split("url\\(")[1].split("\\)")[0].replaceAll("'", "").replaceAll("\"", "");
                    imageUrls.add(url);
                }
            } catch (Exception ignored) {
            }

            // Output data
            System.out.println("Name: " + name);
            System.out.println("Address: " + address);
            System.out.println("Phone Number: " + phoneNumber);
            System.out.println("Business Hours: " + businessHours);
            System.out.println("Menu Info: " + menuInfo);
            System.out.println("Facilities: " + facilities);
            for (String imageUrl : imageUrls) {
                System.out.println("Image URL: " + imageUrl);
            }

            // 다시 검색 결과 페이지로 돌아가기 위해 뒤로 가기
            driver.navigate().back();
        }

        driver.quit();
    }

    public static void main(String[] args) {
        WebCrawler16 crawler = new WebCrawler16();
        crawler.crawlMap("");
    }
}
