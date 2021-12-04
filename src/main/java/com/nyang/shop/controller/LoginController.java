package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.nyang.shop.model.User;
import com.nyang.shop.service.CartService;
import com.nyang.shop.service.UserService;

@Controller
@SessionAttributes({"user","count"})
public class LoginController {
	
	private final UserService uService;
	
	private final CartService cService;
	
	public LoginController(UserService uService, CartService cService) {
		this.uService = uService;
		this.cService= cService;
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(String alert,Model model) {
		return "/user/login"; 
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginOk(String email,String password,Model model) {
		User result = uService.login(User.builder().email(email).password(password).build());
		if(result != null) { //로그인 성공
			model.addAttribute("user",result);
			model.addAttribute("count",cService.count(result.getIdx()));
			return "home";
		}else { //로그인 실패
			model.addAttribute("message","로그인 정보가 올바르지 않습니다.");
			model.addAttribute("url","login");
			return "/util/alertPage";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String logout(SessionStatus status) {
		status.setComplete(); 
		return "home";
	}
	
	
	
}//LoginController end
