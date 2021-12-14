package com.nyang.shop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.User;
import com.nyang.shop.service.CartService;
import com.nyang.shop.service.ProductService;

@Controller
@SessionAttributes("count")
public class CartController {
	private final CartService cService;
	
	private final ProductService pService;
	
	public CartController(CartService cService,ProductService pService) {
		this.cService=cService;
		this.pService=pService;
	}
	

    //카트 이동
    @RequestMapping(value = "/cart" , method = RequestMethod.GET)
    public String moveCart(@SessionAttribute("user")User user,Model model) {
    	List<Cart> list = cService.getAll(user.getIdx());
    	model.addAttribute("list",list);
    	model.addAttribute("cartInfo",pService.cartInfo(list));
    	model.addAttribute("count",cService.count(user.getIdx()));
    	return "/user/cart";
    }
    
    //장바구니 추가
    @ResponseBody //@ResponseBody로 결과 ajax에응답
    @RequestMapping(value = "/addCart" , method = RequestMethod.POST)
    public void addCart(@RequestParam Map<String,String> param, Model model,
    		@SessionAttribute("user")User user) { //@RequestParam로 파라미터 형식으로 받기
    	if(cService.findProduct(Integer.parseInt(param.get("pIdx")))) { //장바구니에 같은 상품이 있는경우
    		cService.delete(user.getIdx(),Integer.parseInt(param.get("pIdx")));
    		cService.insert(param);
    		model.addAttribute("count",cService.count(user.getIdx()));
    	}else {
    		cService.insert(param);
    		model.addAttribute("count",cService.count(user.getIdx()));
    	}
    }
    
    @ResponseBody //장바구니에서 상품 삭제
    @RequestMapping(value = "/delCart" , method = RequestMethod.POST)
    public String delCart(@RequestParam Map<String,String> param, Model model,@SessionAttribute("user")User user) {
    	cService.delete(user.getIdx(),Integer.parseInt(param.get("pIdx")));
    	model.addAttribute("count",cService.count(user.getIdx()));
    	return "/user/cart";
    }
    
    @ResponseBody //장바구니에서 옵션 상품 삭제
    @RequestMapping(value = "/opDelCart" , method = RequestMethod.POST)
    public String opDelCart(@RequestParam Map<String,String> param, Model model,@SessionAttribute("user")User user) {
    	cService.opDelete(param);
    	model.addAttribute("count",cService.count(user.getIdx()));
    	return "/user/cart";
    }
    
    @ResponseBody //장바구니 전체 삭제
    @RequestMapping(value = "/delAllCart" , method = RequestMethod.POST)
    public void delAllFavorite(@SessionAttribute("user")User user, Model model) {
    	cService.deleteAll(user.getIdx());
    	model.addAttribute("count",cService.count(user.getIdx()));
    }
    
    @ResponseBody //장바구니 수량변경
    @RequestMapping(value = "/quanUpdate" , method = RequestMethod.POST)
    public void quanUpdate(@RequestParam Map<String,String> param, Model model) {
    	cService.quanUpdate(param);
    }
    
    
}//CartController end
