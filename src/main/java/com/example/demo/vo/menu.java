package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class menu {
    private int id;
    private int themeId;
    private int categoryId;
    private String shopName;
    private String menu;
    private int price;
}
