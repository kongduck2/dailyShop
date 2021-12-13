package com.nyang.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.nyang.shop.model.Product;
import com.nyang.shop.model.User;
import com.nyang.shop.service.CartService;
import com.nyang.shop.service.ProductService;
import com.nyang.shop.service.UserService;

@Controller
@SessionAttributes({"user","count"})
public class LoginController {
	
	private final UserService uService;
	
	private final CartService cService;
	
	private final ProductService pService;
	
	
	public LoginController(UserService uService, CartService cService, ProductService pService) {
		this.uService = uService;
		this.cService= cService;
		this.pService = pService;
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(Model model) {
		return "/user/login"; 
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginOk(@RequestParam Map<String,String> param ,Model model) {
			User result = uService.login(User.builder().email(param.get("email")).password(param.get("password")).build());
			if(result != null) { //로그인 성공
				model.addAttribute("user",result);
				model.addAttribute("count",cService.count(result.getIdx()));
				List<Product> list = pService.newGetAll();
				model.addAttribute("list",list);
				return "home";
			}else { //로그인 실패
				model.addAttribute("message","로그인 정보가 올바르지 않습니다.");
				model.addAttribute("url","login");
				return "/util/alertPage";
			}
	}
	
	@RequestMapping(value = "/logout")
	public String logout(SessionStatus status , Model model) {
		status.setComplete();
		List<Product> list = pService.newGetAll();
		model.addAttribute("list",list);
		return "home";
	}
	
	@RequestMapping(value = "/kakaoLogin" ,method = RequestMethod.GET)
	public String kakaoLogin(String code , Model model) {
		String accessToken = uService.kakaoGetAccessToken(code);
		HashMap<String, Object> userInfo = uService.kakaoGetUserInfo(accessToken);
        User result = uService.login(User.builder().email((String)userInfo.get("email")).build());
        if(result == null) {// 기존 카카오 아이디가 없을때
        	//카카오 이메일,kakao 이름 넘겨줘야함
        	String kakaoEmail = (String)userInfo.get("email");
        	String nickname = (String)userInfo.get("nickname");
			model.addAttribute("message","등록된 카카오 아이디가 없으므로 회원가입 페이지로 이동합니다.");
			model.addAttribute("url","regist?kakao=kakao&kEmail="+kakaoEmail+"&kNickname="+nickname);
        	return "/util/alertPage";
        }else { // 기존 카카오 아이디가 있을때
        	model.addAttribute("user",result);
        	model.addAttribute("count",cService.count(result.getIdx()));
        	return "home";
        }
        //유저 인포 이메일 가지고 기존 회원인지 검사 후 회원이면 바로 로그인 -> 비회원이면 정보가지고 회원가입으로
	}
	
}//LoginController end
