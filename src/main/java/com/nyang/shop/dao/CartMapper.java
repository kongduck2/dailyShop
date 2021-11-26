package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.Cart;

public interface CartMapper {
	void insert(Cart cart);
	int findProduct(int PIdx);
	List<Cart> getAll(int idx);
	int count(int idx);
	
}
