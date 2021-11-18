package com.nyang.shop.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.model.Product;

public class ProductServiceImpl implements ProductService {
	

	private final ProductMapper dao;
	
	public ProductServiceImpl(ProductMapper dao) {
		this.dao = dao;
	}
	

	@Override
	public List<Product> getAll(String category) {
		return dao.getAll(category);
	}

	@Override
	public int insert(Product vo) {
		List<MultipartFile> files = vo.getFiles();
	      String path = "d:\\upload";
	      if (files != null && files.size() > 0) { //첨부된 파일이 있을 때
	            for (MultipartFile f : files) {	//첨부된 파일리스트에 하나씩
	               String newpath = path + "\\" + f.getOriginalFilename();   //업로드경로+파일명
	                  // 선택한 파일 서버로 전송
	                  File upfile = new File(newpath); //newpath에 java.io.File 객체를 생성하고
	                  try {
						f.transferTo(upfile); //upload 폴더로 전송
					} catch (IllegalStateException | IOException e) {
						System.out.println("파일 전송 오류 " + e.getMessage());
						e.printStackTrace();
					}				
	            }
	         }
		return dao.insert(vo);
	}

}
