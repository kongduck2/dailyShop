package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nyang.shop.service.UserService;

@Controller
public class UserController {
	
	private final UserService service;
	
	public UserController(UserService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/regist")
	public String registMove() {
		return "/user/regist";
	}
	

}
