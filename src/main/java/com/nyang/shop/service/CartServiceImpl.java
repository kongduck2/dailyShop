package com.nyang.shop.service;

import java.util.Map;

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
	public void insert(Map<String, String> param) {
		Cart cart = Cart.builder().userIdx(Integer.parseInt(param.get("uIdx")))
				.productIdx(Integer.parseInt(param.get("pIdx"))).option1(param.get("option1"))
				.option2(param.get("option2")).option3(param.get("option3")).option4(param.get("option4"))
				.option1Quantity(Integer.parseInt(param.get("option1Quantity")))
				.option2Quantity(Integer.parseInt(param.get("option2Quantity")))
				.option3Quantity(Integer.parseInt(param.get("option3Quantity")))
				.option4Quantity(Integer.parseInt(param.get("option4Quantity"))).build();
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
