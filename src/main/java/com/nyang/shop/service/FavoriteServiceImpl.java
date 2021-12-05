package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.nyang.shop.dao.FavoriteMapper;
import com.nyang.shop.model.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	private final FavoriteMapper dao;
	
	public FavoriteServiceImpl(FavoriteMapper dao) {
		this.dao = dao;
	}
	@Override
	public void insert(Map<String, String> param) {
		Favorite vo = Favorite.builder().userIdx(Integer.parseInt(param.get("uIdx")))
				.productIdx(Integer.parseInt(param.get("pIdx"))).build();
		dao.insert(vo);
	}
	
	@Override
	public boolean findProduct(int productIdx) {
		if(dao.findProduct(productIdx) > 0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public int delete(int userIdx, int productIdx) {
		return dao.delete(userIdx, productIdx);
	}
	
	@Override
	public int getCount(int userIdx) { //관심상품 개수
		return dao.getCount(userIdx);
	}
	
	@Override
	public List<Favorite> getAll(int userIdx) {
		return dao.getAll(userIdx);
	}
	
	@Override
	public void deleteAll(int userIdx) {
		dao.deleteAll(userIdx);
	}

}
