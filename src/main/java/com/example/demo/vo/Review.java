package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int themeId;
	private int categoryId;
	private int shopId;
	private int starPoint;
	private String title;
	private String body;
	private int review_goodReactionPoint;
	

	private String extra__writer;

	private boolean userCanModify;
	private boolean userCanDelete;
}