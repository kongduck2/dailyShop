package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Product;

public interface ProductService {
	
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	int insert(Product vo);
	String categoryName(String category);
	Product getOne(int idx);
}
