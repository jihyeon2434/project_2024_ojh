package com.example.demo.service;

import com.example.demo.controller.WebCrawler17;
import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.vo.conShop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConsultShopService {

    @Autowired
    private ConsultShopRepository consultShopRepository;

    public void registerShop(conShop shopInfo) {
        consultShopRepository.insertShop(shopInfo);
    }

    public List<conShop> crawlConsultingShops(String location) {
        WebCrawler17 crawler = new WebCrawler17();
        List<conShop> shopInfoList = crawler.crawlMap(location);
        for (conShop shopInfo : shopInfoList) {
            registerShop(shopInfo); // 크롤링한 가게 정보를 저장
        }
        return shopInfoList; // 크롤링한 가게 정보를 리턴
    }

	public List<conShop> getShopsList() {
		return consultShopRepository.getShopsList();
	}
}
