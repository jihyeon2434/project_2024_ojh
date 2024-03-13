package com.example.demo.service;

import com.example.demo.repository.ConsultShopRepository;
import com.example.demo.vo.conShop;
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

    // 아래에 필요한 다른 메서드들 추가 가능
}
