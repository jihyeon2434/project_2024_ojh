package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;

import java.util.ArrayList;
import java.util.List;

public class WebCrawler7 {

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
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        WebElement inputSearch = driver.findElement(By.className("input_search"));
        String inputKey = " 이미지컨설팅";
        inputSearch.sendKeys(location + inputKey);
        inputSearch.sendKeys(Keys.ENTER);

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        driver.switchTo().frame("searchIframe");

        WebElement scrollBox = driver.findElement(By.id("_pcmap_list_scroll_container"));

        Actions builder = new Actions(driver);

        for (int i = 0; i < 3; i++) {
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", scrollBox);
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        List<WebElement> elements = driver.findElements(By.className("YwYLL"));

        for (WebElement e : elements) {
            e.click();
            String key = e.getText();

            try {
                Thread.sleep(2000);
            } catch (InterruptedException ex) {
                ex.printStackTrace();
            }

            driver.switchTo().parentFrame();
            driver.switchTo().frame(driver.findElement(By.id("entryIframe")));

            String address = driver.findElement(By.className("LDgIH")).getText();
            String phoneNumber;
            try {
                phoneNumber = driver.findElement(By.className("xlx7Q")).getText();
            } catch (Exception ex) {
                phoneNumber = null;
            }
            String businessHours;
            try {
                WebElement button = driver.findElement(By.className("RMgN0"));
                button.click();
                WebElement dayElement = driver.findElement(By.xpath("//span[@class='i8cJw']"));
                String day = dayElement.getText();
                WebElement timeElement = driver.findElement(By.xpath("//div[@class='w9QyJ']//div[@class='H3ua4']"));
                String openingHours = timeElement.getText();
                businessHours = day + " " + openingHours;
            } catch (Exception ex) {
                businessHours = null;
            }
            String menuInfo;
            try {
                List<WebElement> menuEles = driver.findElements(By.className("y0EHb"));
                List<WebElement> priceEles = driver.findElements(By.className("CLSES"));
                StringBuilder menuInfoBuilder = new StringBuilder();
                for (int i = 0; i < menuEles.size(); i++) {
                    String temp = menuEles.get(i).getText() + ":" + priceEles.get(i).getText() + ";";
                    menuInfoBuilder.append(temp);
                }
                menuInfo = menuInfoBuilder.toString();
            } catch (Exception ex) {
                menuInfo = null;
            }

            // Output data
            System.out.println("Name: " + key);
            System.out.println("Address: " + address);
            System.out.println("Phone Number: " + phoneNumber);
            System.out.println("Business Hours: " + businessHours);
            System.out.println("Menu Info: " + menuInfo);

            driver.switchTo().parentFrame();
            driver.switchTo().frame("searchIframe");
        }

        driver.quit();
    }

    public static void main(String[] args) {
        WebCrawler7 crawler = new WebCrawler7();
        crawler.crawlMap("대전");
    }
}
