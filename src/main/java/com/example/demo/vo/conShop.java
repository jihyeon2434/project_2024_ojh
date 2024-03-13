package com.example.demo.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class conShop {
    private int id;
    private int categoryId;
    private String shopName;
    private String roadNameNum;
    private String review;
    private List<String> photoUrls; // 여러 개의 사진 URL을 저장할 리스트 필드
    private String phoneNum;
    private String conAvailableTime;
    private String conAvailableDate;
    private String operateTime;
    private int price;
    private int themeId;
    private String regDate;
    private String updateDate;
    private String delDate;
    private int delStatus;
}
