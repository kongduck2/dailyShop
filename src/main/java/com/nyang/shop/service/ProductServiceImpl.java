package com.nyang.shop.service;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            	switch (dif) {
				case 0:
            		fileName = "tImg_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setThumbnailImg(fileName+",");
					break;
				case 1:
            		fileName = "dImg_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setDetailImg1(fileName+",");
            		break;
				case 2:
					fileName = "dImg_" + f.getOriginalFilename();
					newPath = path + "\\" + fileName;   //업로드경로+파일명
					vo.setDetailImg2(fileName+",");
					break;
				case 3:
					fileName = "dImg_" + f.getOriginalFilename();
					newPath = path + "\\" + fileName;   //업로드경로+파일명
					vo.setDetailImg3(fileName+",");
					break;
				default:
					break;
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

	@Override
	public Product getOne(int idx) {
		Product vo = dao.getOne(idx);
		vo.setDetailImg1(vo.getDetailImg1().substring(0, vo.getDetailImg1().length()-1)); //,제외
		vo.setDetailImg2(vo.getDetailImg2().substring(0, vo.getDetailImg2().length()-1)); 
		vo.setDetailImg3(vo.getDetailImg3().substring(0, vo.getDetailImg3().length()-1)); 
		vo.setThumbnailImg(vo.getThumbnailImg().substring(0, vo.getThumbnailImg().length()-1));
		return vo;
	}

}
