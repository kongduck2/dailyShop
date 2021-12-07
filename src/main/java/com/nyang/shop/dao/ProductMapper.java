package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.PageDto;
import com.nyang.shop.model.Product;

public interface ProductMapper {
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	List<Product> newGetAll();
	int insert(Product vo);
	Product getOne(int idx);
	Product productInfo(int idx); 
	List<Product> listPage(PageDto dto); //리스트 페이징해서 받아오기
	int listCount(String category); 
	int searchCount(String findText); //검색된 게시글 수
	void upCount(int idx);
}
