package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OnlineConArticle {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String title;
	private String body;


	private int extra__repliesCnt;
	private String extra__writer;

	private boolean userCanModify;
	private boolean userCanDelete;
}