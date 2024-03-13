package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.conShopRepository;
import com.example.demo.vo.conShop;

@Service
public class conShopService {

    @Autowired
    private conShopRepository shopRepository;

    public void saveShopInfoList(List<conShop> shopInfoList) {
        shopRepository.saveAll(shopInfoList);
    }
}
