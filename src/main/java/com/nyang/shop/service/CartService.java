package com.nyang.shop.service;

import java.util.Map;

public interface CartService {
	void insert(Map<String, String> param);
	boolean findProduct(int PIdx);
}
