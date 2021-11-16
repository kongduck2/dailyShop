package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nyang.shop.service.UserService;

@Controller
public class UserController {
	
	private final UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}
	
	//회원가입 뷰페이지
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registMove() {
		return "/user/regist";
	}
	
	 
	   @ResponseBody
	    @RequestMapping(value = "/regist", method = RequestMethod.POST)
	    public String emailCheck(String email, Model model) {
	        int result = service.emailCheck(email);
	        return String.valueOf(result);
	    }


	

}
