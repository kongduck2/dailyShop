package com.nyang.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nyang.shop.model.Favorite;

public interface FavoriteMapper {
	void insert(Favorite vo);
	int findProduct(int productIdx);
	int delete(@Param("userIdx") int userIdx ,@Param("productIdx") int productIdx);
	void deleteAll(int userIdx);
	int getCount(int userIdx);
	List<Favorite> getAll(int userIdx);
}
