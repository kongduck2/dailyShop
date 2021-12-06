package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Cart;

public interface CartService {
	void insert(Map<String, String> param);
	boolean findProduct(int pIdx);
	List<Cart> getAll(int idx);
	Cart getOne(int idx);
	String count(int uIdx);
	int delete(int uIdx,int pIdx);
	void opDelete(Map<String,String> param);
	void deleteAll(int userIdx);
	void quanUpdate(Map<String,String> param);
}
