package com.nyang.shop.model;

import java.time.LocalDateTime;
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
public class Review {
	private int idx;
	private String writer;
	private String productName;
	private int starRating;
	private String thumbnailImg;
	private String contentImg;
	private String content;
	private LocalDateTime registDate;
	private List<MultipartFile> files;
}
