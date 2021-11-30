package com.nyang.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nyang.shop.model.PageDto;
import com.nyang.shop.model.Product;

public interface ProductMapper {
	List<Product> getAll(String category);
	List<Product> bestGetAll();
	List<Product> newGetAll();
	int insert(Product vo);
	Product getOne(int idx);
	Product cartInfo(int idx); 
	List<Product> searchList(PageDto dto); //검색 게시글
	int searchCount(String findText); //검색된 게시글 수
}
