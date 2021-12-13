package com.nyang.shop.service;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nyang.shop.dao.CartMapper;
import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.model.Cart;
import com.nyang.shop.model.Favorite;
import com.nyang.shop.model.PageDto;
import com.nyang.shop.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	

	private final ProductMapper dao;
	
	private final CartMapper cDao;
	
	public ProductServiceImpl(ProductMapper dao,CartMapper cDao) {
		this.dao = dao;
		this.cDao = cDao;
	}
	

	@Override
	public List<Product> getAll(String category) { //카테고리별 목록 전체 가져오기
		return dao.getAll(category);
	}
	
	@Override
	public List<Product> bestGetAll() {
		return dao.bestGetAll();
	}
	
	@Override
	public List<Product> newGetAll() {
		return dao.newGetAll();
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
            	
      	      int leftLimit = 48; // 숫자 '0' 아스키코드값
    	      int rightLimit = 122; // 알파벳 'z' 아스키코드값
    	      int targetStringLength = 10;		//length를 10으로 설정
    	      Random random = new Random();
    	      String rString = random.ints(leftLimit,rightLimit + 1)
    	  	    	.filter(i -> (i <= 57 || (i >= 65 && i <= 90) || i >= 97))
    	  	        .limit(targetStringLength)
    	  	        .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
    	  	        .toString();
            	
            	switch (dif) {
				case 0:
            		fileName = rString + "_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setThumbnailImg(fileName+",");
					break;
				case 1:
            		fileName = rString + "_" + f.getOriginalFilename();
            		newPath = path + "\\" + fileName;   //업로드경로+파일명
            		vo.setDetailImg1(fileName+",");
            		break;
				case 2:
					if(f.getOriginalFilename().length() == 0 ) { //빈 파일일경우
						fileName = "empty";
					}else {
						fileName = rString + "_" + f.getOriginalFilename();
					}
					newPath = path + "\\" + fileName;   //업로드경로+파일명
					vo.setDetailImg2(fileName+",");
					break;
				case 3:
					if(f.getOriginalFilename().length() == 0 ) { //빈 파일일경우
						fileName = "empty";
					}else {
						fileName = rString + "_" + f.getOriginalFilename();
					}
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
	public String categoryName(String category) {
		String categoryName ="";
		if(category.equals("d-feed") || category.equals("c-feed")) categoryName ="사료";
		else if(category.equals("d-snack")||category.equals("c-snack")) categoryName="간식";
		else if(category.equals("d-fashion")||category.equals("c-fashion")) categoryName="패션";
		else if(category.equals("d-toy")||category.equals("c-toy")) categoryName="장난감";
		else if(category.equals("d-walk")) categoryName="산책·외출";
		else if(category.equals("search")) categoryName="검색 결과";
		return categoryName;
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

	@Override
	public List<Product> cartInfo(List<Cart> list) {
		List<Product> result = new ArrayList<Product>();
		for (int i = 0; i < list.size(); i++) {
			Product vo = dao.productInfo(list.get(i).getProductIdx());
			vo.setThumbnailImg(vo.getThumbnailImg().substring(0, vo.getThumbnailImg().length()-1));
			result.add(vo); 
		}
		return result;
	}

	@Override
	public Map<String, Object> listProcess(Map<String, Object> param) { //검색결과 리스트 가져오기
		List<Product> list;
		int totalCount = 0; // 쿼리받아온 개수
		PageDto pageDto = null;
		int currentPage = 0;//현재 페이지
		int pageSize = 16; //한번에 띄울 상품 개수
		String page=(String) param.get("page");
		if(page==null || page.trim().length()==0) currentPage = 1;
		else currentPage = Integer.parseInt(page);
		
		String findText = (String) param.get("findText");
		String category = (String) param.get("category");
		String categoryName = categoryName(category);
		
		if(findText != null) totalCount = searchCount(findText);
		else totalCount = listCount(category);
		
		pageDto = new PageDto(currentPage, pageSize, totalCount,findText,category);
		list = dao.listPage(pageDto);
		param.put("categoryName", categoryName);
		param.put("page", pageDto);
		param.put("list", list);
		return param;
	}

	@Override
	public List<Product> listPage(PageDto dto) {
		return dao.listPage(dto);
	}

	@Override
	public int listCount(String category) {
		return dao.listCount(category);
	}

	@Override
	public int searchCount(String findText) {
		return dao.searchCount(findText);
	}


	@Override
	public List<Product> favoriteInfo(List<Favorite> list) {
		List<Product> result = new ArrayList<Product>();
		for (int i = 0; i < list.size(); i++) {
			Product vo = dao.productInfo(list.get(i).getProductIdx());
			vo.setThumbnailImg(vo.getThumbnailImg().substring(0, vo.getThumbnailImg().length()-1));
			result.add(vo); 
		}
		return result;
	}


	@Override
	public List<Cart> buyNowProcess(Map<String, String> param) {
		List<Cart> list = new ArrayList<Cart>();
		Cart vo = Cart.builder().productIdx(Integer.parseInt(param.get("pIdx"))).
				option1(param.get("option1")).option2(param.get("option2")).option3(param.get("option3")).
				option4(param.get("option4")).option1Quantity(param.get("option1Quantity")).
				option2Quantity(param.get("option2Quantity")).option3Quantity(param.get("option3Quantity")).
				option4Quantity(param.get("option4Quantity")).build();
		
		if(vo.getOption1().equals("undefined")) vo.setOption1(null);//단독상품 구별값 option1값이 null이면 단독상품 표시
		list.add(vo);
		return list;
	}


	@Override
	public void upCount(int idx) {
		dao.upCount(idx);
	}


	@Override
	public List<Cart> selectOrderProcess(Map<String, String> param) {
		List<Cart> list = new ArrayList<Cart>();
		for (int i = 0; i < param.size()-1; i++) {
			Cart vo = cDao.orderGetOne(Integer.parseInt(param.get("order"+(i+1))), Integer.parseInt(param.get("userIdx")));
			list.add(vo);
		}
		return list;
	}

	
	


}
