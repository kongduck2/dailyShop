package com.nyang.shop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nyang.shop.model.Review;
import com.nyang.shop.service.ReviewService;

@Controller
public class ReviewController {

	private final ReviewService service;
	
	public ReviewController(ReviewService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/review")
	public String review(Model model) {
		List<Review> list = service.getAll();
		System.out.println(list);
		model.addAttribute("list",list);
		return "/user/review";
	}
	
}//ReviewController end
