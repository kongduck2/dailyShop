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
	private LocalDateTime createDate; 
}
