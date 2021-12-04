package com.nyang.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nyang.shop.dao.ReviewMapper;
import com.nyang.shop.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewMapper dao;
	
	
	public ReviewServiceImpl(ReviewMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Review> getAll() {
		List<Review> list = dao.getAll();
		for (int i = 0; i < list.size(); i++) {
			String thumbnailImg = list.get(i).getThumbnailImg();
			String contentImg = list.get(i).getContentImg();
			list.get(i).setThumbnailImg(thumbnailImg.substring(0, thumbnailImg.length()-1));
			list.get(i).setContentImg(contentImg.substring(0, contentImg.length()-1));
		}
		return list;
	}

}
