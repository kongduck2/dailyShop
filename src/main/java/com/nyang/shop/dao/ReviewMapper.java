package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.Review;

public interface ReviewMapper {
	List<Review> getAll();
	void insert(Review vo);
}
