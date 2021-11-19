package com.nyang.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nyang.shop.model.Product;
import com.nyang.shop.service.ProductService;

@Controller
public class ProductController {
	
	private final ProductService service;
	
	public ProductController(ProductService service) {
		this.service = service;
	}

	//상품추가 페이지로 이동
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String moveAddProduct() {
		return "/product/addProduct";
	}
	
	
	//상품추가
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(Product vo , Model model) {
		if(vo.getCategory() == null) {
			model.addAttribute("message","카테고리 값을 입력해주세요.");
			model.addAttribute("url","addProduct");
		}else {
			service.insert(vo);
			model.addAttribute("message","상품추가 되었습니다.");
			model.addAttribute("url","addProduct");
		}
		return "/util/alertPage";
	}
}
