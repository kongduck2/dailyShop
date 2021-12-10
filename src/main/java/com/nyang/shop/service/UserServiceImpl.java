package com.nyang.shop.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nyang.shop.dao.ProductMapper;
import com.nyang.shop.dao.UserMapper;
import com.nyang.shop.model.OrderList;
import com.nyang.shop.model.Product;
import com.nyang.shop.model.User;

@Service
public class UserServiceImpl implements UserService {

	private final UserMapper dao;
	
	private final ProductMapper pDao;
	
	private final JavaMailSender mailSender;
	
	public UserServiceImpl(UserMapper dao,ProductMapper pDao , JavaMailSender mailSender) { 
		this.dao = dao;
		this.pDao = pDao;
		this.mailSender = mailSender;
	}
	
	@Override
	public User login(User user) {
		return dao.login(user);
	}

	@Override
	public List<User> getAll() {
		return dao.getAll();
	}

	@Override
	public User getOne(int idx) {
		return dao.getOne(idx);
	}

	@Override
	public int insert(User user) {
		return dao.insert(user);
	}

	@Override
	public int update(User user) {
		return dao.update(user);
	}

	@Override
	public int delete(int idx) {
		return dao.delete(idx);
	}

	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public boolean pwCheck(User user,String password) {
		user.setPassword(password);
		if(dao.pwCheck(user) !=0) {//결과값 1
			return true;
		}else {//결과값 0
			return false;
		}
	}

	@Override
	public void addOrderList(Map<String, String> param) {
		for (int i = 0; i < param.size()-1; i++) {
			String[] temp = param.get("order"+(i+1)).split("/");
			String productIdx = temp[0]; //제품 인덱스
			String quantity = temp[1]; // 수량
			String totalPrice = temp[2]; //제품별 합계
			String productOpName = temp[3]; //옵션명 없을때 " " 공백
			
			pDao.upCount(Integer.parseInt(productIdx));//제품 판매 회수 증가
			Product pVo = pDao.productInfo(Integer.parseInt(productIdx));
			
			OrderList vo = OrderList.builder().userIdx(Integer.parseInt(param.get("userIdx")))
					.productIdx(Integer.parseInt(productIdx)).thumbnailImg(pVo.getThumbnailImg().substring(0, pVo.getThumbnailImg().length()-1))
					.productName(pVo.getName()).productOpName(productOpName).quantity(Integer.parseInt(quantity))
					.totalPrice(totalPrice).build();
			dao.addOrderList(vo);
		}
	}

	@Override
	public List<OrderList> getOrderList(int userIdx) {
		return dao.getOrderList(userIdx);
	}

	@Override
	public OrderList getOrder(int productIdx) {
		return dao.getOrder(productIdx);
	}

	 //이메일 인증번호 발송
	@Override
	public String validateEmail(String inputEmail) {
		int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000); //이메일 전송오류
	    String num = "";
		// 메일 제목, 내용
		String subject = "회원가입시 필요한 인증번호 입니다.";
		String content = "[인증번호] "+ serti +" 입니다. 인증번호 확인란에 기입해주세요.";
		// 보내는 사람
		String from = "댕냥이의 일상 <dn@dailyshop.com>";
		// 받는 사람
		String to = inputEmail;
		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content,true);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
	        num = Integer.toString(serti);
			
		} catch(Exception e) {
	    	System.out.println("이메일 전송 오류 : " + e.getMessage());
	        num = "error";
			e.printStackTrace();
		}
		 return num;
	}//validateEmail end

	@Override
	public String kakaoGetAccessToken(String authorizeCode) {
		String access_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=b80983683de548ac06ba30cff2c65ae1");
            sb.append("&redirect_uri=http://localhost:8082/dailyshop/kakaoLogin");
            sb.append("&code=" + authorizeCode);
            bw.write(sb.toString());
            bw.flush();
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return access_Token;
	} //getAccessToken end

	@Override
	public HashMap<String, Object> kakaoGetUserInfo(String accessToken) {
        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return userInfo;
    } // getUserInfo end

}
