package com.nyang.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.Cart;
import com.nyang.shop.model.Product;
import com.nyang.shop.model.User;
import com.nyang.shop.service.CartService;
import com.nyang.shop.service.ProductService;

@Controller
@RequestMapping({"/","/product"})
public class ProductController {
	
	private final ProductService pService;
	
	private final CartService cService;

	
	public ProductController(ProductService pService, CartService cService) {
		this.pService = pService;
		this.cService = cService;
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String moveAddProduct() {
		return "/product/addProduct";
	}
	
	//상품추가
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(Product vo , Model model) {
		if(vo.getCategory() == "x") {
			model.addAttribute("message","카테고리 값을 입력해주세요.");
			model.addAttribute("url","addProduct");
		}else {
			pService.insert(vo);
			model.addAttribute("message","상품추가 되었습니다.");
			model.addAttribute("url","addProduct");
		}
		return "/util/alertPage";
	}
	
	//BEST 상품 리스트 뿌리기 soldCount 높은순 
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(Model model) {
		List<Product> list = pService.bestGetAll();
		model.addAttribute("list", list);
		return "/product/best";
	}
	
	//카테고리별 상품 리스트 뿌리기  
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, Object> param , Model model) {
			param = pService.listProcess(param);
			model.addAllAttributes(param);
			System.out.println(param); // 토탈카운트 8이고 페이지 2일때 페이지 오류
		return "/product/list";
	}
	
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String detail(HttpSession session,int idx, Model model) {
		if(session.getAttribute("user") != null) {
			model.addAttribute("user", (User) session.getAttribute("user"));
		}
		model.addAttribute("product",pService.getOne(idx)); 
		return "/product/detail";
	}
	
	@RequestMapping(value = "/order" , method = RequestMethod.GET)
	public String moveOrder(@SessionAttribute("user")User user, @RequestParam Map<String,String> param, Model model) {
    	List<Cart> list = cService.getAll(user.getIdx());
    	model.addAttribute("list",list);
    	model.addAttribute("user",user);
    	model.addAttribute("cartInfo",pService.cartInfo(list));
		return "/product/order";
	}
	
	@RequestMapping(value = "/order" , method = RequestMethod.POST)
	public String orderOne(@SessionAttribute("user")User user, @RequestParam Map<String,String> param, Model model) {
		List<Cart> list = pService.orderProcess(param);
		model.addAttribute("list",list);
		model.addAttribute("user",user);
		model.addAttribute("cartInfo",pService.cartInfo(list));
		return "/product/order";
	}
	
}//ProductController end


