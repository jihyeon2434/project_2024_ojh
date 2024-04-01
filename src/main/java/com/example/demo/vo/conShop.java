package com.example.demo.vo;

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
    private String roadName;
    private String review;
    private String photoUrl1;
    private String photoUrl2;
    private String photoUrl3;
    private String photoUrl4;
    private String photoUrl5;
    private String phoneNum;
    private String conAvailableTime;
    private String conAvailableDate;
    private String operateTime;
    private String menu;
    private int themeId;
    private String regDate;
    private String updateDate;
    private String delDate;
    private int delStatus;
    private int totalStarPoint;
    
}
