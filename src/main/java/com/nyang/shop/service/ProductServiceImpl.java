package com.nyang.shop.service;

import java.io.File;
import java.io.IOException;
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
	public List<Product> getAll(String category) {
		return dao.getAll(category);
	}

	@Override
	public int insert(Product vo) {
		
		List<MultipartFile> files = vo.getFiles();
		int dif = 0; //파일명 변경을 위한 변수
	    String path = "d:\\upload";
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

}
