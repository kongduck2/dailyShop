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
import org.springframework.web.bind.support.SessionStatus;

import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.User;
import com.nyang.shop.service.UserService;

@Controller
@RequestMapping({"/","/user"})
@SessionAttributes("count")
public class UserController {
	
	private final UserService uService;
	
	
	public UserController(UserService uService) {
		this.uService = uService;
	}
	
	//회원가입 선택페이지 이동
	@RequestMapping(value = "/choiceRegist", method = RequestMethod.GET)
	public String choiceRegist() {
		return "/user/choiceRegist";
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
    //결제 성공시 주문내역에 추가
    @ResponseBody
    @RequestMapping(value = "/addOrderList" , method = RequestMethod.POST) 
    public void orderList(@SessionAttribute("user")User user, @RequestParam Map<String,String> param) { 
    	param.put("userIdx", String.valueOf(user.getIdx()));
    	uService.addOrderList(param);
    }
    //주문목록 이동
    @RequestMapping(value = "/orderList" , method = RequestMethod.GET)
    public String moveOrderList(@SessionAttribute("user")User user, Model model) { 
    	List<OrderList> list = uService.getOrderList(user.getIdx());
    	model.addAttribute("list", list);
    	return "/user/orderList";
    }
    
    //자식창 호출
    @RequestMapping(value = "/emailCheck" , method = RequestMethod.GET)
    public String openEmailCheck() { 
    	return "/user/emailCheck";
    }
    
    //인증메일 발송
    @ResponseBody 
    @RequestMapping(value = "/emailCheck" , method = RequestMethod.POST)
    public String emailCheck(String inputEmail) {
    	return uService.validateEmail(inputEmail);
    }
    
    //회원탈퇴
    @RequestMapping(value = "/userDelete" , method = RequestMethod.GET)
    public String userDelete(@SessionAttribute("user")User user , SessionStatus status , Model model) { 
    	uService.delete(user.getIdx());
    	status.setComplete();
    	model.addAttribute("message", "회원탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
    	model.addAttribute("url", "/dailyshop");
    	return "/util/alertPage";
    }
    
    
}//UserController end
