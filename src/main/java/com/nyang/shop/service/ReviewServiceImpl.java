package com.nyang.shop.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.dao.ReviewMapper;
import com.nyang.shop.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewMapper dao;
	
	
	public ReviewServiceImpl(ReviewMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Review> getAll() {
		return dao.getAll();
	}
	
	@Override
	public List<Review> getOne(int productIdx) {
		return dao.getOne(productIdx);
	}

	@Override
	public void insert(Review vo) {
		MultipartFile file = vo.getFile();
		if(file != null) {
			int leftLimit = 48; 
			int rightLimit = 122; 
			int targetStringLength = 10;
			Random random = new Random();
			String rString = random.ints(leftLimit,rightLimit + 1)
					.filter(i -> (i <= 57 || (i >= 65 && i <= 90) || i >= 97))
					.limit(targetStringLength)
					.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
					.toString();
			String fileName = rString + "_" + file.getOriginalFilename();
			File upfile = new File("c:\\upload\\" + fileName);
			try {
				file.transferTo(upfile);
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일 전송 오류 " + e.getMessage());
				e.printStackTrace();
			}
			vo.setContentImg(fileName);
		}
		dao.insert(vo);
	}

}
