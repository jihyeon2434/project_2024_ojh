package com.example.demo.service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.controller.WebCrawler18;
import com.example.demo.controller.WebCrawler20;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.repository.selfShopRepository;
import com.example.demo.vo.conShop;
import com.example.demo.vo.selfShop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class selfShopService {

    @Autowired
    private selfShopRepository selfShopRepository;

    public void registerShop(selfShop shopInfo) {
        selfShopRepository.insertShop(shopInfo);
    }

    public List<selfShop> crawlSelfShops(String inputKey) {
        WebCrawler18 crawler = new WebCrawler18();
        List<selfShop> shopInfoList = crawler.crawlMap();
        for (selfShop shopInfo : shopInfoList) {
            registerShop(shopInfo); // 크롤링한 가게 정보를 저장
        }
        return shopInfoList; // 크롤링한 가게 정보를 리턴
    }
    
    public List<selfShop> crawlSelfShops2(String inputKey) {
        WebCrawler20 crawler = new WebCrawler20();
        List<selfShop> shopInfoList = crawler.crawlMap();
        for (selfShop shopInfo : shopInfoList) {
            registerShop(shopInfo); // 크롤링한 가게 정보를 저장
        }
        return shopInfoList; // 크롤링한 가게 정보를 리턴
    }

	public List<selfShop> getShopsList() {
		return selfShopRepository.getShopsList();
	}

	public selfShop getShopById(int id) {
		return selfShopRepository.getShopById(id);
		
	}
}
