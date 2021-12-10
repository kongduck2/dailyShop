package com.nyang.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.User;

public interface UserService {
	User login(User user);
	List<User> getAll();
	User getOne(int idx);
	int insert(User user);
	int update(User user);
	int delete(int idx);
	int emailCheck(String email);
	boolean pwCheck(User vo,String password);
	void addOrderList(Map<String,String> param);
	List<OrderList> getOrderList(int userIdx);
	OrderList getOrder(int productIdx);
	String validateEmail(String inputEmail);
	public String kakaoGetAccessToken (String authorizeCode); //카카오 토큰 받기
	public HashMap<String, Object> kakaoGetUserInfo (String accessToken); //카카오 유저정보 받기
}
