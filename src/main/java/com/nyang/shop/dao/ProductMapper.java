package com.nyang.shop.dao;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Product;

public interface ProductMapper {
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	int insert(Product vo);
	Product getOne(int idx);
	Product cartInfo(int idx); 
}
