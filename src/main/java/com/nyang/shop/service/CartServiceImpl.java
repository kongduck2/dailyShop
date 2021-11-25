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
		if(param.get("option1") == null && param.get("option2") == null && 
				param.get("option3") == null && param.get("option4") == null) {
			param.put("option1", ""); 
			param.put("option2", ""); 
			param.put("option3", ""); 
			param.put("option4", ""); 
		}
		if(param.get("option1Quantity") == null && param.get("option2Quantity") == null && 
				param.get("option3Quantity") == null && param.get("option4Quantity") == null) {
			param.put("option1Quantity", "0"); 
			param.put("option2Quantity", "0"); 
			param.put("option3Quantity", "0"); 
			param.put("option4Quantity", "0"); 
		}
		Cart cart = Cart.builder().userIdx(Integer.parseInt(param.get("uIdx")))
				.productIdx(Integer.parseInt(param.get("pIdx"))).option1(param.get("option1"))
				.option2(param.get("option2")).option3(param.get("option3")).option4(param.get("option4"))
				.option1Quantity(param.get("option1Quantity"))
				.option2Quantity(param.get("option2Quantity"))
				.option3Quantity(param.get("option3Quantity"))
				.option4Quantity(param.get("option4Quantity")).build();
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
