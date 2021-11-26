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
	public List<User> getAll() {
		return dao.getAll();
	}

	@Override
	public User getOne(int idx) {
		return dao.getOne(idx);
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

	@Override
	public boolean pwCheck(User user,String password) {
		user.setPassword(password);
		if(dao.pwCheck(user) !=0) {//결과값 1
			return true;
		}else {//결과값 0
			return false;
		}
	}

}
