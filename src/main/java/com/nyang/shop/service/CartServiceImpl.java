package com.nyang.shop.service;

import java.util.List;
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
		
		Cart vo = Cart.builder().userIdx(Integer.parseInt(param.get("uIdx")))
				.productIdx(Integer.parseInt(param.get("pIdx"))).option1(param.get("option1"))
				.option2(param.get("option2")).option3(param.get("option3")).option4(param.get("option4"))
				.option1Quantity(param.get("option1Quantity"))
				.option2Quantity(param.get("option2Quantity"))
				.option3Quantity(param.get("option3Quantity"))
				.option4Quantity(param.get("option4Quantity")).build();
		dao.insert(vo);
	}
	
	@Override
	public boolean findProduct(int pIdx) {
		if(dao.findProduct(pIdx) > 0) { //장바구니에 같은 상품이 있는경우
			return true;
		}else { //중복 상품 없음
			return false;
		}
	}

	@Override
	public List<Cart> getAll(int idx) {
		return dao.getAll(idx);
	}

	@Override
	public String count(int idx) {
		if(dao.count(idx) == null) {
			return "0";
		}else {
			return dao.count(idx);
		}
		
	}

	@Override
	public int delete(int uIdx,int pIdx) {
		return dao.delete(uIdx,pIdx);
	}

	@Override
	public void opDelete(Map<String, String> param) {
		dao.opDelete(param);
		Cart vo = dao.getOne(Integer.parseInt(param.get("idx")));
		if(vo.getOption1().equals("") && vo.getOption2().equals("") //product 테이블 옵션명 단독옵션일경우 삭제 
				&& vo.getOption3().equals("") && vo.getOption4().equals("")) {
			dao.delete(vo.getUserIdx(),vo.getProductIdx());
		}
	}

	@Override
	public Cart getOne(int idx) {
		return dao.getOne(idx);
	}

	@Override
	public void deleteAll(int userIdx) {
		dao.deleteAll(userIdx);
	}

	@Override
	public void quanUpdate(Map<String, String> param) {
		dao.quanUpdate(param);
	}

	@Override
	public Cart orderGetOne(int idx, int uIdx) {
		return dao.orderGetOne(idx, uIdx);
	}

}
