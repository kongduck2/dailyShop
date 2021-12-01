package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.PageDto;
import com.nyang.shop.model.Product;

public interface ProductService {
	
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	List<Product> newGetAll();
	int insert(Product vo);
	String categoryName(String category);
	Product getOne(int idx);
	List<Product> cartInfo(List<Cart> list); //썸네일 가져오기용
	List<Product> listPage(PageDto dto);
	int listCount(String category);
	int searchCount(String findText);
	Map<String, Object> listProcess(Map<String, Object> param);
}
