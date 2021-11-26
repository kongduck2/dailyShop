package com.nyang.shop.service;

import java.util.List;

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.Product;

public interface ProductService {
	
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	int insert(Product vo);
	String categoryName(String category);
	Product getOne(int idx);
	List<Product> cartInfo(List<Cart> list); //썸네일 가져오기용
}
