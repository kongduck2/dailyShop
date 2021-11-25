package com.nyang.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.Product;
import com.nyang.shop.model.User;
import com.nyang.shop.service.ProductService;

@Controller
@RequestMapping({"/","/product"})
public class ProductController {
	
	private final ProductService service;
	
	public ProductController(ProductService service) {
		this.service = service;
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
			service.insert(vo);
			model.addAttribute("message","상품추가 되었습니다.");
			model.addAttribute("url","addProduct");
		}
		return "/util/alertPage";
	}
	
	//BEST 상품 리스트 뿌리기 soldCount 높은순 
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(Model model) {
		List<Product> list = service.bestGetAll();
		model.addAttribute("list", list);
		return "/product/best";
	}
	
	//카테고리별 상품 리스트 뿌리기  
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String category , Model model) {
		List<Product> list = service.getAll(category);
		model.addAttribute("category", service.categoryName(category)); // 카테고리별 이름출력
		model.addAttribute("list", list);
		return "/product/list";
	}
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String detail(HttpSession session,int idx, Model model) {
		if(session.getAttribute("user") != null) {
			model.addAttribute("user", (User) session.getAttribute("user"));
		}
		model.addAttribute("product",service.getOne(idx)); 
		return "/product/detail";
	}
}


