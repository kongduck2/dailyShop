package com.nyang.shop.service;

import org.springframework.stereotype.Service;

import com.nyang.shop.dao.CartMapper;
import com.nyang.shop.model.Cart;

@Service
public class CartServiceImpl implements CartService {

	private final CartMapper dao;
	
	public CartServiceImpl(CartMapper dao) {
		this.dao=dao;
	}
	
	@Override
	public void insert(Cart cart) {
		dao.insert(cart);
	}

	@Override
	public boolean findProduct(int PIdx) {
		if(dao.findProduct(PIdx) > 0) { //장바구니에 같은 상품이 있는경우
			return true;
		}else { //중복 상품 없음
			return false;
		}
	}

}
