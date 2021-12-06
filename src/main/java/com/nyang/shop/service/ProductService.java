package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.Favorite;
import com.nyang.shop.model.PageDto;
import com.nyang.shop.model.Product;

public interface ProductService {
	
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	List<Product> newGetAll();
	int insert(Product vo);
	String categoryName(String category);
	Product getOne(int idx);
	List<Product> cartInfo(List<Cart> list); //카트 페이지에 필요한정보
	List<Product> favoriteInfo(List<Favorite> list); //관심목록 페이지에 필요한정보
	List<Product> listPage(PageDto dto);
	int listCount(String category);
	int searchCount(String findText);
	Map<String, Object> listProcess(Map<String, Object> param);
	List<Cart> orderList(Map<String, String> param);
}
