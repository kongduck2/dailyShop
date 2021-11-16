package com.nyang.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nyang.shop.dao.UserMapper;
import com.nyang.shop.model.User;

@Service
public class UserServiceImpl implements UserService {

	private final UserMapper dao;
	
	public UserServiceImpl(UserMapper dao) { 
		this.dao = dao;
	}
	
	@Override
	public User login(User user) {
		return dao.login(user);
	}

	@Override
	public List<User> selectAll() {
		return dao.selectAll();
	}

	@Override
	public User selectOne(int idx) {
		return dao.selectOne(idx);
	}

	@Override
	public int insert(User user) {
		return dao.insert(user);
	}

	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public int delete(int idx) {
		return dao.delete(idx);
	}

	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

}
