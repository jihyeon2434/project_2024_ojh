package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class vogueArticle {
	private String title;
	private String link;
	private String imageUrl;
	private String date;
}