package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.User;
import com.nyang.shop.service.UserService;

@Controller
public class UserController {
	
	private final UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}
	
	//회원가입 뷰페이지 이동
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registMove() {
		return "/user/regist";
	}
	
	//이메일 중복체크 ajax
    @ResponseBody
    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public String emailCheck(String email, Model model) {
        return String.valueOf(service.emailCheck(email));
    }
    
    //유저정보 등록
    @RequestMapping(value = "/userRegist", method = RequestMethod.POST)
    public String userInsert(User user, Model model) {
    	service.insert(user);
    	model.addAttribute("message",user.getName()+"님 회원가입을 축하드립니다!");
    	model.addAttribute("url","/dailyshop");
    	return "/util/alertPage";
    }
    
    //마이페이지 이동
    @RequestMapping(value = "/myPage" , method = RequestMethod.GET)
    public String mypageMove() {
    	
    	return "/user/myPage";
    }
    
    //회원정보수정 비밀번호체크 이동
    @RequestMapping(value = "/infoUpdatePwCheck" , method = RequestMethod.GET)
    public String pwCheckMove() {
    	return "/user/infoUpdatePwCheck";
    }
    
    //비밀번호 확인
    @RequestMapping(value = "/pwCheck" , method = RequestMethod.POST)
    public String pwCheck(@SessionAttribute("user")User user, String password ,Model model) { //세션에 저장된(로그인된) 유저 객체사용
    	if(service.pwCheck(user, password)) { //비밀번호 일치
    		return "/user/infoUpdate";
    	}else { //불일치 
        	model.addAttribute("message","비밀번호가 올바르지 않습니다.");
        	model.addAttribute("url","infoUpdatePwCheck");
        	return "/util/alertPage";
    	}
    }
    
    //회원정보수정
    @RequestMapping(value = "/userUpdate" , method = RequestMethod.POST)
    public String userUpdate(User user,Model model) {
    	service.update(user);
    	model.addAttribute("message", "회원정보수정이 완료되었습니다.");
    	model.addAttribute("url", "/dailyshop");
    	return "/util/alertPage";
    }
	   
	 


	

}
