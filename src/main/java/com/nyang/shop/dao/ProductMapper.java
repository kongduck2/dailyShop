package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.Product;

public interface ProductMapper {
	List<Product> getAll(String category);
	int insert(Product vo);
}
