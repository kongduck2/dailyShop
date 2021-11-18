package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.User;

public interface UserMapper {
	User login(User user);
	List<User> selectAll();
	User selectOne(int idx);
	int insert(User user);
	int update(User user);
	int delete(int idx);
	int emailCheck(String email);
	int pwCheck(User user);
}
