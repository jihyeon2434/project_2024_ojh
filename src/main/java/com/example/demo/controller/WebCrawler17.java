package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.service.menuService;
import com.example.demo.vo.conShop;
import com.example.demo.vo.menu;



@Component
public class WebCrawler17 {

	
	@Autowired
	private menuService menuService;

	private WebDriver driver;
	private String url;

	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public List<conShop> crawlMap() {
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
		String inputKey = "이미지컨설팅";
		inputSearch.sendKeys(inputKey);
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

		 for (WebElement element : elements) {
	            // Get additional information before clicking on the element
	            String additionalInfo = null;
	            try {
	                // Find the parent element containing the additional information
	                WebElement parentElement = element.findElement(By.xpath(".."));
	                // Find the child element with class "Pb4bU" using CSS selector
	                WebElement infoElement = parentElement.findElement(By.cssSelector("span.Pb4bU"));
	                // Get the text of the element
	                additionalInfo = infoElement.getText();
	            } catch (Exception ex) {
	                ex.printStackTrace(); // 에러가 발생한 경우 콘솔에 출력하여 디버깅할 수 있습니다.
	            }

	            element.click();
	            String key = element.getText();


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
				businessHours = businessHoursBuilder.toString();
			} catch (Exception ex) {
				businessHours = null;
			}

			String menuInfo;
			try {
	            // 메뉴 요소 추출
	            List<WebElement> menuEles = driver.findElements(By.className("y0EHb"));
	            // 가격 요소 추출
	            List<WebElement> priceEles = driver.findElements(By.className("CLSES"));
	            StringBuilder menuInfoBuilder = new StringBuilder();
				for (int i = 0; i < menuEles.size(); i++) {
					String temp = menuEles.get(i).getText() + ":" + priceEles.get(i).getText() + ";";
					menuInfoBuilder.append(temp);
				}
				menuInfo = menuInfoBuilder.toString();
	            // 데이터베이스에 메뉴 정보 삽입
				System.err.println(menuEles);
				System.err.println(priceEles);
				
	          //  insertMenuInfo(menuEles, priceEles, key, 1, 1); // 테마 아이디가 1이라고 가정
	        } catch (Exception ex) {
	            menuInfo = null;
	        }






			// Get image URLs
			List<String> imageUrls = new ArrayList<>();
			try {
			    List<WebElement> imageElements = driver.findElements(By.xpath("//div[@class='K0PDV _div']"));
			    for (WebElement imgElement : imageElements) {
			        String styleAttribute = imgElement.getAttribute("style");
			        String url = styleAttribute.split("url\\(")[1].split("\\)")[0].replaceAll("'", "").replaceAll("\"", "");
			        imageUrls.add(url);
			    }
			} catch (Exception ex) {
			    ex.printStackTrace();
			}

			// Create conShop object and add it to the list
			conShop shopInfo = new conShop();
			shopInfo.setShopName(key);
			shopInfo.setRoadName(address); 
			shopInfo.setPhoneNum(phoneNumber);
			shopInfo.setConAvailableTime(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setConAvailableDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setOperateTime(businessHours);
			shopInfo.setMenu(menuInfo); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setThemeId(1); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setRegDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setUpdateDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			shopInfo.setDelDate(null); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			
			
			// 카테고리 번호 설정
			int categoryId = getCategoryNumber(inputKey);
			shopInfo.setCategoryId(categoryId);
			shopInfo.setDelStatus(0); // 이 부분은 웹 크롤링으로는 얻을 수 없는 정보인지 확인해야 합니다.
			if (imageUrls.size() >= 1) {
				shopInfo.setPhotoUrl1(imageUrls.get(0));
			}
			if (imageUrls.size() >= 2) {
				shopInfo.setPhotoUrl2(imageUrls.get(1));
			}
			if (imageUrls.size() >= 3) {
				shopInfo.setPhotoUrl3(imageUrls.get(2));
			}
			if (imageUrls.size() >= 4) {
				shopInfo.setPhotoUrl4(imageUrls.get(3));
			}
			if (imageUrls.size() >= 5) {
				shopInfo.setPhotoUrl5(imageUrls.get(4));
			}
			shopInfoList.add(shopInfo);

			// Print shop information to console
			System.out.println("Shop Name: " + shopInfo.getShopName());
			System.out.println("Address: " + shopInfo.getRoadName());
			System.out.println("Phone Number: " + shopInfo.getPhoneNum());
			System.out.println("Operating Hours: " + shopInfo.getOperateTime());
			System.out.println("Photo URL 1: " + shopInfo.getPhotoUrl1());
			System.out.println("Photo URL 2: " + shopInfo.getPhotoUrl2());
			System.out.println("Photo URL 3: " + shopInfo.getPhotoUrl3());
			System.out.println("Photo URL 4: " + shopInfo.getPhotoUrl4());
			System.out.println("Photo URL 5: " + shopInfo.getPhotoUrl5());
			// 나머지 필요한 정보들도 출력할 수 있도록 추가하시면 됩니다.

			driver.switchTo().parentFrame();
			driver.switchTo().frame("searchIframe");
		}

		driver.quit();

		return shopInfoList;
	}

	private int getCategoryNumber(String inputKey) {
		int categoryId;
		switch (inputKey) {
		case "이미지컨설팅":
			categoryId = 1;
			break;
		case "퍼스널컬러":
			categoryId = 2;
			break;
		default:
			categoryId = 0; // 기본값은 0으로 설정
			break;
		}
		return categoryId;
	}
	
	

//    public static void main(String[] args) {
//        WebCrawler17 crawler = new WebCrawler17();
//        List<conShop> shopInfoList = crawler.crawlMap("");
//        
//    }

	/*
	 * public List<conShop> crawlConsultingShops() { List<conShop> shopInfoList =
	 * crawlMap(); // crawlMap 메서드 호출하여 shopInfoList 얻음
	 * 
	 * // 크롤링한 상담 가게 리스트 반환 return shopInfoList; }
	 */
	
	
	
	// menu 테이블 데이터만 크롤링
	/*
	 * private void insertMenuInfo(List<WebElement> menuEles, List<WebElement>
	 * priceEles, String shopName, int themeId, int categoryId) { for (int i = 0; i
	 * < menuEles.size(); i++) { try { String menuName = menuEles.get(i).getText();
	 * String priceString = priceEles.get(i).getText();
	 * 
	 * // 가격 문자열에서 가격 추출 int price =
	 * Integer.parseInt(priceString.replaceAll("[^\\d]", ""));
	 * 
	 * // 새로운 메뉴 객체 생성 menu menuObj = new menu(); menuObj.setThemeId(themeId);
	 * menuObj.setCategoryId(categoryId); // categoryId 전달
	 * 
	 * // 나머지 필드 설정 menuObj.setShopName(shopName); menuObj.setMenu(menuName);
	 * menuObj.setPrice(price);
	 * 
	 * 
	 * System.err.println("Price: " + price); System.err.println("menuName: " +
	 * menuName); System.err.println("themeId : "+themeId);
	 * System.err.println("categoryId : "+ categoryId);
	 * System.err.println("shopName : "+ shopName); // 메뉴 객체를 데이터베이스에 삽입
	 * menuService.insertMenu(menuObj); } catch (Exception e) { e.printStackTrace();
	 * }
	 * 
	 * } }
	 */
}
/*
 * public List<menu> crawlMenu(List<WebElement> menuEles, List<WebElement>
 * priceEles, String shopName, int themeId, int categoryId) {
 * System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
 * ); List<menu> menuList = new ArrayList<>();
 * 
 * // menuEles와 priceEles가 모두 null이 아닌 경우에만 메뉴 정보를 가져옴 if (menuEles != null &&
 * priceEles != null) { // 메뉴와 가격 정보를 가져와서 menu 객체를 생성하고 리스트에 추가 for (int i = 0;
 * i < menuEles.size(); i++) { try { String menuName = ""; String priceString =
 * "";
 * 
 * // 메뉴 요소가 null이 아닌 경우에 메뉴 이름을 가져옴 if (menuEles.get(i) != null) { menuName =
 * menuEles.get(i).getText(); }
 * 
 * // 가격 요소가 null이 아닌 경우에 가격을 가져옴 if (priceEles.get(i) != null) { priceString =
 * priceEles.get(i).getText(); }
 * 
 * // 메뉴 이름과 가격이 비어있지 않은 경우에만 처리 if (!menuName.isEmpty() &&
 * !priceString.isEmpty()) { // 가격 정보에서 숫자만 추출 int price =
 * Integer.parseInt(priceString.replaceAll("[^\\d]", ""));
 * 
 * // menu 객체 생성 menu menuObj = new menu(); menuObj.setThemeId(themeId);
 * menuObj.setCategoryId(categoryId); menuObj.setShopName(shopName);
 * menuObj.setMenu(menuName); menuObj.setPrice(price);
 * 
 * menuList.add(menuObj);
 * 
 * // 메뉴 정보를 콘솔에 출력 System.err.println("Menu: " + menuName);
 * System.err.println("Price: " + price);
 * System.out.println("themeId : "+themeId); System.out.println("categoryId : "+
 * categoryId); System.out.println("shopName : "+ shopName);
 * 
 * 
 * } } catch (Exception e) { e.printStackTrace(); } } } else {
 * System.err.println("Menu elements or price elements are null."); }
 * 
 * return menuList; }
 */

