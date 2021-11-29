package com.nyang.shop.dao;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Cart;

public interface CartMapper {
	void insert(Cart cart);
	int findProduct(int PIdx);
	List<Cart> getAll(int idx);
	Cart getOne(int idx);
	int count(int idx);
	int delete(int pIdx);
	void opDelete(Map<String,String> param);
}
