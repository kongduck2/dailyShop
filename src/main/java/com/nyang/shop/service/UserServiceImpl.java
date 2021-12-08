package com.nyang.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.dao.UserMapper;
import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.Product;
import com.nyang.shop.model.User;

@Service
public class UserServiceImpl implements UserService {

	private final UserMapper dao;
	
	private final ProductMapper pDao;
	
	public UserServiceImpl(UserMapper dao,ProductMapper pDao) { 
		this.dao = dao;
		this.pDao = pDao;
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

	@Override
	public void addOrderList(Map<String, String> param) {
		for (int i = 0; i < param.size()-1; i++) {
			String[] temp = param.get("order"+(i+1)).split("/");
			String productIdx = temp[0]; //제품 인덱스
			String quantity = temp[1]; // 수량
			String totalPrice = temp[2]; //제품별 합계
			String productOpName = temp[3]; //옵션명 없을때 " " 공백
			
			pDao.upCount(Integer.parseInt(productIdx));//제품 판매 회수 증가
			Product pVo = pDao.productInfo(Integer.parseInt(productIdx));
			
			OrderList vo = OrderList.builder().userIdx(Integer.parseInt(param.get("userIdx")))
					.productIdx(Integer.parseInt(productIdx)).thumbnailImg(pVo.getThumbnailImg().substring(0, pVo.getThumbnailImg().length()-1))
					.productName(pVo.getName()).productOpName(productOpName).quantity(Integer.parseInt(quantity))
					.totalPrice(totalPrice).build();
			dao.addOrderList(vo);
		}
	}

	@Override
	public List<OrderList> getOrderList(int userIdx) {
		return dao.getOrderList(userIdx);
	}

	@Override
	public OrderList getOrder(int productIdx) {
		return dao.getOrder(productIdx);
	}

}
