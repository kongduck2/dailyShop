package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        int result = service.emailCheck(email);
        return String.valueOf(result);
    }
    
    //유저정보 등록
    @RequestMapping(value = "/userRegist", method = RequestMethod.POST)
    public String UserInsert(User vo,String addressDetail, Model model) {
    	User user = vo;
    	if(addressDetail != null) {//상세주소
    		user.setAddress(user.getAddress()+" "+addressDetail.trim());
    	}
    	System.out.println(service.insert(user));
    	model.addAttribute("message",user.getName()+"님 회원가입을 축하드립니다!");
    	model.addAttribute("url","/dailyshop");
    	
    	return "/util/alertPage";
    }
	   
	 


	

}
