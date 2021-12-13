package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Review;

public interface ReviewService {
	List<Review> getAll();
	List<Review> getOne(int productIdx);
	void insert(Review vo);

}
