package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.Review;

public interface ReviewMapper {
	List<Review> getAll();
	List<Review> getOne(int productIdx);
	void insert(Review vo);
}
