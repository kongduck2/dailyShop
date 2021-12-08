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
public class OrderList {
	private int idx;
	private int userIdx;
	private int productIdx;
	private LocalDateTime registDate;
	private String thumbnailImg;
	private String productName;
	private String productOpName;
	private int quantity;
	private String totalPrice;
}
