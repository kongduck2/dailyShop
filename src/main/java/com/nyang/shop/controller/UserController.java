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

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.User;
import com.nyang.shop.service.CartService;
import com.nyang.shop.service.ProductService;
import com.nyang.shop.service.UserService;

@Controller
@RequestMapping({"/","/user"})
public class UserController {
	
	private final UserService uService;
	
	private final CartService cService;
	
	private final ProductService pService;

	
	public UserController(UserService uService,CartService cService,ProductService pService) {
		this.uService = uService;
		this.cService=cService;
		this.pService=pService;
	}
	
	//회원가입 뷰페이지 이동
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String moveRegist() {
		return "/user/regist";
	}
	
	//이메일 중복체크 ajax
    @ResponseBody
    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public String emailCheck(String email, Model model) {
        return String.valueOf(uService.emailCheck(email));
    }
    
    //유저정보 등록
    @RequestMapping(value = "/userRegist", method = RequestMethod.POST)
    public String userInsert(User user, Model model) {
    	uService.insert(user);
    	model.addAttribute("message",user.getName()+"님 회원가입을 축하드립니다!");
    	model.addAttribute("url","/dailyshop");
    	return "/util/alertPage";
    }
    
    //마이페이지 이동
    @RequestMapping(value = "/myPage" , method = RequestMethod.GET)
    public String moveMyPage() {
    	return "/user/myPage";
    }
    
    //회원정보수정 비밀번호체크 이동
    @RequestMapping(value = "/infoUpdatePwCheck" , method = RequestMethod.GET)
    public String movePwCheck() {
    	return "/user/infoUpdatePwCheck";
    }
    
    //비밀번호 확인
    @RequestMapping(value = "/pwCheck" , method = RequestMethod.POST)
    public String pwCheck(@SessionAttribute("user")User user, String password ,Model model) { //세션에 저장된(로그인된) 유저 객체사용
    	if(uService.pwCheck(user, password)) { //비밀번호 일치
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
    	uService.update(user);
    	model.addAttribute("message", "회원정보수정이 완료되었습니다.");
    	model.addAttribute("url", "/dailyshop");
    	return "/util/alertPage";
    }
    
    //카트 이동
    @RequestMapping(value = "/cart" , method = RequestMethod.GET)
    public String moveCart(@SessionAttribute("user")User user,Model model) {
    	List<Cart> list = cService.getAll(user.getIdx());
    	model.addAttribute("count", cService.count(user.getIdx()));
    	model.addAttribute("list",list);
    	model.addAttribute("cartInfo",pService.cartInfo(list));
    	return "/user/cart";
    }
    
    @ResponseBody //@ResponseBody로 결과 ajax에응답
    @RequestMapping(value = "/addCart" , method = RequestMethod.POST)
    public void addCart(@RequestParam Map<String,String> param, Model model) { //@RequestParam로 파라미터 형식으로 받기
    	if(cService.findProduct(Integer.parseInt(param.get("pIdx")))) { //장바구니에 같은 상품이 있는경우
    		cService.delete(Integer.parseInt(param.get("pIdx")));
    		cService.insert(param);
    	}else {
    		cService.insert(param);
    	}
    }
    
    @ResponseBody
    @RequestMapping(value = "/delCart" , method = RequestMethod.POST)
    public String delCart(@RequestParam Map<String,String> param, Model model) {
    	cService.delete(Integer.parseInt(param.get("pIdx")));
    	return "/user/cart";
    }
    
    @ResponseBody
    @RequestMapping(value = "/opDelCart" , method = RequestMethod.POST)
    public String opDelCart(@RequestParam Map<String,String> param, Model model) {
    	cService.opDelete(param);
    	return "/user/cart";
    }
    
    
	   
	 


	

}
