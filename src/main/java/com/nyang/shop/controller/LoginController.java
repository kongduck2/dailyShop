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
		return "/user/login"; //로그인 버튼 -> login.jsp(뷰) - > 로그인정보 입력후 버튼 ->
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
	public String logout(SessionStatus status) {// @SessionAttributes로 설정된것은 SessionStatus로 지운다.
		status.setComplete(); //@SessionAttributes 로 설정된 애트리뷰트를 clear 한다.
		return "home";
	}
	//status.setComplete(); - JSESSIONID 는 변하지 않고 @SessionAttributes로 설정된 애트리뷰트 값을 clear한다.
	//						- HttpSession의 removeAttribute() 메소드 동작과 유사
	//session.invalidate(); - 서버가 JSESSIONID는 새로 부여해주지만 @SessionAttributes로 설정된 값은 남아있다
	
	
	
	
}
