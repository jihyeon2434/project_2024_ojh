package com.example.demo.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.springframework.stereotype.Component;
import com.example.demo.vo.conShop;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class WebCrawler17 {

    private WebDriver driver;
    private String url;

    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

    public List<conShop> crawlMap(String location) {
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

        for (int i = 0; i < 6; i++) {
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", scrollBox);
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        List<WebElement> elements = driver.findElements(By.className("YwYLL"));

        List<conShop> shopInfoList = new ArrayList<>();

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
                List<WebElement> dayElements = driver.findElements(By.xpath("//span[@class='i8cJw']"));
                List<WebElement> timeElements = driver.findElements(By.xpath("//div[@class='H3ua4']"));
                StringBuilder businessHoursBuilder = new StringBuilder();
                for (int j = 0; j < dayElements.size(); j++) {
                    String day = dayElements.get(j).getText();
                    String time = timeElements.get(j).getText();
                    String temp = day + " " + time + "; ";
                    businessHoursBuilder.append(temp);
                }
                businessHours = convertToTimestamp(businessHoursBuilder.toString());
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

            // Get image URLs
            List<String> imageUrls = new ArrayList<>();
            try {
                List<WebElement> imageElements = driver.findElements(By.xpath("//div[@class='K0PDV _div']"));
                for (WebElement element : imageElements) {
                    String styleAttribute = element.getAttribute("style");
                    String url = styleAttribute.split("url\\(")[1].split("\\)")[0].replaceAll("'", "").replaceAll("\"", "");
                    imageUrls.add(url);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            // Create conShop object and add it to the list
            conShop shopInfo = new conShop();
            shopInfo.setShopName(key);
            shopInfo.setRoadNameNum(address);
            shopInfo.setPhoneNum(phoneNumber);
            shopInfo.setConAvailableTime(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setConAvailableDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setOperateTime(businessHours);
            shopInfo.setPrice(0); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setThemeId(0); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setRegDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setUpdateDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setDelDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfo.setDelStatus(0); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
            shopInfoList.add(shopInfo);

            driver.switchTo().parentFrame();
            driver.switchTo().frame("searchIframe");
        }

        driver.quit();

        return shopInfoList;
    }

    // 문자열로 된 시간을 TIMESTAMP 형식으로 변환하는 메서드
    private String convertToTimestamp(String businessHours) throws ParseException {
        // 예시로 SimpleDateFormat을 사용하여 문자열을 파싱합니다.
        // 실제 형식에 맞게 수정해야 합니다.
        DateFormat dateFormat = new SimpleDateFormat("E HH:mm");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        StringBuilder convertedHours = new StringBuilder();
        String[] parts = businessHours.split(";");

        for (String part : parts) {
            String[] dayAndTime = part.trim().split(" ");
            Date date = dateFormat.parse(dayAndTime[0] + " " + dayAndTime[1]);
            Timestamp timestamp = new Timestamp(date.getTime());
            convertedHours.append(outputFormat.format(timestamp)).append("; ");
        }

        return convertedHours.toString();
    }

    public static void main(String[] args) {
        WebCrawler17 crawler = new WebCrawler17();
        crawler.crawlMap("");
    }

    public List<conShop> crawlConsultingShops() {
        List<conShop> shopInfoList = crawlMap(""); // crawlMap 메서드 호출하여 shopInfoList 얻음

        // 크롤링한 상담 가게 리스트 반환
        return shopInfoList;
    }
}
