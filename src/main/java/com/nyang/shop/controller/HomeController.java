package com.nyang.shop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nyang.shop.model.Product;
import com.nyang.shop.service.ProductService;

@Controller
public class HomeController {
	
	private final ProductService service;
	
	public HomeController(ProductService service) {
		this.service = service;
	}

	//홈화면 BEST 상품 리스트 뿌리기 soldCount 높은순 desc
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<Product> list = service.getAll("d-feed");
		model.addAttribute("list", list);
		return "home";
	}
}
