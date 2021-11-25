package com.nyang.shop.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Cart {
	private int idx;
	private int userIdx;
	private int productIdx;
	private String option1; 
	private String option2;
	private String option3; 
	private String option4; 
	private int option1Quantity;
	private int option2Quantity;
	private int option3Quantity;
	private int option4Quantity;
	private LocalDateTime createDate; 
}
