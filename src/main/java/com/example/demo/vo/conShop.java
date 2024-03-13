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
    private String roadNameNum;
    private String review;
    private String photo;
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
