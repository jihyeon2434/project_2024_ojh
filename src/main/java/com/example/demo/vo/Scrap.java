package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Scrap {
    private int id;
    private String themeId;
    private String categoryId;
    private int shopId;
    private int memberId;
    private String scrapDate;
    private String scrapUpdateDate;
    private int scrapPoint;

    // 생성자, Getter 및 Setter 메서드는 생략
}