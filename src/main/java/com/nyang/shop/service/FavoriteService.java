package com.nyang.shop.service;

import java.util.Map;

public interface FavoriteService {
	void insert(Map<String, String> param);
	boolean findProduct(int productIdx);
	int delete(int userIdx,int productIdx);
	int getCount(int userIdx);

}
