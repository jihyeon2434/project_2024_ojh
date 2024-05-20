package com.example.demo.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private int id;
	private int memberId;
	private String shopName;
	private int amount;
	private String paymentDate;
	private String paymentStatus;
	private boolean canWriteArticle;
}