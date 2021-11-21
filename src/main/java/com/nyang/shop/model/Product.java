package com.nyang.shop.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private int idx;
	private String category;
	private String name;
	private int soldCount;
	private String thumbnailImg;
	private String detailImg;
	private String price;
	//파일 첨부 입력 값 저장을을 위한 MultipartFile 타입
	private List<MultipartFile> files;
}
