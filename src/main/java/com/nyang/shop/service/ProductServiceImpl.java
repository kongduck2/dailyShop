package com.nyang.shop.service;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormat;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	

	private final ProductMapper dao;
	
	public ProductServiceImpl(ProductMapper dao) {
		this.dao = dao;
	}
	

	@Override
	public List<Product> getAll(String category) { //카테고리별 목록 전체 가져오기
		return dao.getAll(category);
	}

	@Override
	public int insert(Product vo) {
		DecimalFormat df = new DecimalFormat("###,###,###");
		vo.setPrice(df.format(Integer.parseInt(vo.getPrice())));
		
		List<MultipartFile> files = vo.getFiles();
		int dif = 0; //파일명 변경을 위한 변수
	    String path = "c:\\upload";
	    String newPath = null;
	    String fileName = null;
	    
	    //이미지파일 전송 부분
    	if (files != null && files.size() > 0) { //첨부된 파일이 있을 때 첨부된 파일리스트에 하나씩 upload 폴더로 전송
            for (MultipartFile f : files) {	
            	if(dif == 0) {
            		fileName = "tImg_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setThumbnailImg(fileName+",");
            	}else {
            		fileName = "dImg_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setDetailImg(fileName+",");
            	}
                  File upfile = new File(newPath); 
                  try {
					f.transferTo(upfile); 
				} catch (IllegalStateException | IOException e) {
					System.out.println("파일 전송 오류 " + e.getMessage());
					e.printStackTrace();
				}				
                  dif++;
            }
         }
      
		return dao.insert(vo);
	}

	@Override
	public List<Product> bestGetAll() {
		return dao.bestGetAll();
	}
	
	@Override
	public String categoryName(String category) {
		if(category.equals("d-feed") || category.equals("c-feed")) category ="사료";
		else if(category.equals("d-snack")||category.equals("c-snack")) category="간식";
		else if(category.equals("d-fashion")||category.equals("c-fashion")) category="패션";
		else if(category.equals("d-toy")||category.equals("c-toy")) category="장난감";
		else if(category.equals("d-walk")) category="산책·외출";
		return category;
	}

}
