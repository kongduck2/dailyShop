package com.nyang.shop.dao;

import com.nyang.shop.model.Cart;

public interface CartMapper {
	void insert(Cart cart);
	int findProduct(int PIdx);
}
