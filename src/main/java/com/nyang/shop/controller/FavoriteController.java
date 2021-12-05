package com.nyang.shop.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.User;
import com.nyang.shop.service.FavoriteService;
import com.nyang.shop.service.ProductService;

@Controller
public class FavoriteController {
	
	private final FavoriteService fService;
	
	private final ProductService pService;
	
	public FavoriteController(FavoriteService fService , ProductService pService) {
		this.fService = fService;
		this.pService = pService;
	}
	
	@RequestMapping(value = "/favorite" ,method = RequestMethod.GET)
	public String moveFavorite(Model model,@SessionAttribute("user")User user){
    	model.addAttribute("list", pService.favoriteInfo(fService.getAll(user.getIdx())));//관심목록 가져온정보로 상품 리스트 가져오기
		model.addAttribute("fCount", fService.getCount(user.getIdx()));
		return "/user/favorite";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addFavorite" , method = RequestMethod.POST)
	public void addFavorite(@RequestParam Map<String,String> param, @SessionAttribute("user")User user){
		if(fService.findProduct(Integer.parseInt(param.get("pIdx")))) { //중복이있는경우 삭제하고 등록
			fService.delete(user.getIdx(), Integer.parseInt(param.get("pIdx")));
			fService.insert(param);
		}else {
			fService.insert(param);
		}
	}
	
    @ResponseBody //관심상품 삭제
    @RequestMapping(value = "/delFavorite" , method = RequestMethod.POST)
    public void delFavorite(@RequestParam Map<String,String> param, Model model,@SessionAttribute("user")User user) {
    	fService.delete(user.getIdx(),Integer.parseInt(param.get("pIdx")));
    }
    
    @ResponseBody //관심상품 전체 삭제
    @RequestMapping(value = "/delAllFavorite" , method = RequestMethod.POST)
    public void delAllFavorite(@SessionAttribute("user")User user) {
    	fService.deleteAll(user.getIdx());
    }
    
	

}
