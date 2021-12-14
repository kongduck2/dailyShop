package com.nyang.shop.dao;

import java.util.List;

import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.User;

public interface UserMapper {
	User login(User user);
	List<User> getAll();
	User getOne(int idx);
	int insert(User user);
	int update(User user);
	int delete(int idx);
	int emailCheck(String email);
	int pwCheck(User user);
	void addOrderList(OrderList vo);
	List<OrderList> getOrderList(int userIdx);
	OrderList getOrder(OrderList vo); //옵션명 중복으로 오류나서 타입 수정 int -> OrderList 객체
	String findId(User user);
	void pWUpdate(User user);
}
