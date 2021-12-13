package com.nyang.shop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.Review;
import com.nyang.shop.model.User;
import com.nyang.shop.service.ReviewService;
import com.nyang.shop.service.UserService;

@Controller
public class ReviewController {

	private final ReviewService service;
	private final UserService uService;
	
	public ReviewController(ReviewService service,UserService uService) {
		this.service = service;
		this.uService = uService;
	}
	//사용후기 페이지 이동
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Model model) {
		List<Review> list = service.getAll();
		model.addAttribute("list",list);
		return "/user/review";
	}
	//리뷰작성 페이지 이동
	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String writeReview(int pIdx, Model model) {
		OrderList vo = uService.getOrder(pIdx);
		System.out.println(vo);
		model.addAttribute("order",vo);
		return "/user/writeReview";
	}
	//리뷰 등록
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String saveReview(@SessionAttribute("user")User user, @ModelAttribute Review vo, Model model) {
		vo.setWriter(user.getName());
		service.insert(vo);
		model.addAttribute("message","사용후기가 등록되었습니다.");
		model.addAttribute("url","review");
    	return "/util/alertPage";
	}
	
}//ReviewController end
