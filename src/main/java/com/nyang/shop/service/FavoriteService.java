package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Favorite;

public interface FavoriteService {
	void insert(Map<String, String> param);
	boolean findProduct(int productIdx);
	int delete(int userIdx,int productIdx);
	void deleteAll(int userIdx);
	int getCount(int userIdx);
	List<Favorite> getAll(int userIdx);
}
