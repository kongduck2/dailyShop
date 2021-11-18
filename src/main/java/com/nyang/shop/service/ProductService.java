package com.nyang.shop.service;

import java.util.List;

import com.nyang.shop.model.Product;

public interface ProductService {
	
	List<Product> getAll(String category);
	int insert(Product vo);
}
