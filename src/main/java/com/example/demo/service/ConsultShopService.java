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

    public ConsultShopService(ConsultShopRepository consultShopRepository) {
        this.consultShopRepository = consultShopRepository;
    }

    public void registerShop(conShop shopInfo) {
        consultShopRepository.insertShop(shopInfo);
    }

   

    public List<conShop> crawlConsultingShops(String location) {
        WebCrawler17 crawler = new WebCrawler17();
        List<conShop> shopInfoList = crawler.crawlMap(location);

        // 상담 가게 정보를 repository로 전달
        for (conShop shopInfo : shopInfoList) {
            consultShopRepository.insertShop(shopInfo);
        }

        return shopInfoList;
    }


	

    // 아래에 필요한 다른 메서드들 추가 가능
}
