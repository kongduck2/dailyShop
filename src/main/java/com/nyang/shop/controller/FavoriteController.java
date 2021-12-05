package com.nyang.shop.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.User;
import com.nyang.shop.service.FavoriteService;

@Controller
public class FavoriteController {
	
	private final FavoriteService fService;
	
	public FavoriteController(FavoriteService fService) {
		this.fService = fService;
	}
	
	@RequestMapping(value = "/favorite" ,method = RequestMethod.GET)
	public String moveFavorite(Model model){
		return "/user/favorite";
	}
	
	@RequestMapping(value = "/addFavorite" , method = RequestMethod.POST)
	public void addFavorite(@RequestParam Map<String,String> param, @SessionAttribute("user")User user){
		if(fService.findProduct(Integer.parseInt(param.get("pIdx")))) { //중복이있는경우 삭제하고 등록
			fService.delete(user.getIdx(), Integer.parseInt(param.get("pIdx")));
			fService.insert(param);
		}else {
			fService.insert(param);
		}
	}
	
	

}
