package com.nyang.shop.service;

import com.nyang.shop.model.Cart;

public interface CartService {
	void insert(Cart cart);
	boolean findProduct(int PIdx);
}
