package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Cart;

public interface CartService {
	void insert(Map<String, String> param);
	boolean findProduct(int PIdx);
	List<Cart> getAll(int idx);
	int count(int idx);
}
