package com.nyang.shop.service;

import java.util.List;

import com.nyang.shop.model.User;

public interface UserService {
	User login(User user);
	List<User> selectAll();
	User selectOne(int idx);
	int insert(User user);
	int update(User user);
	int delete(int idx);
	int emailCheck(String email);
	boolean pwCheck(User vo,String password);
}
