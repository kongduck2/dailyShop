package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.Favorite;

public interface FavoriteMapper {
	void insert(Favorite vo);
	int findProduct(int productIdx);
	int delete(int userIdx , int productIdx);
	void deleteAll(int userIdx);
	int getCount(int userIdx);
	List<Favorite> getAll(int userIdx);
}
