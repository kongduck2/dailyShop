package com.nyang.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nyang.shop.model.Cart;

public interface CartMapper {
	void insert(Cart cart);
	int findProduct(int productIdx);
	List<Cart> getAll(int idx);
	Cart getOne(int idx);
	String count(int uIdx);
	int delete(@Param("userIdx") int uIdx,@Param("productIdx")int pIdx);
	void opDelete(Map<String,String> param);
	void deleteAll(int userIdx);
}
