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
	
	private final ProductService pService;
	
	public HomeController(ProductService pService) {
		this.pService = pService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
			List<Product> list = pService.newGetAll();
			model.addAttribute("list",list);
		return "home";
	}
}
