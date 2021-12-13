package com.nyang.shop.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
	private int idx; 
	private String email; //이메일
	private String password; //비밀번호
	private String phone; // 핸드폰번호
	private String zipCode; //우편번호
	private String address; // 주소
	private String addressDetail; // 상세 주소
	private String registType; //회원가입 타입 카카오,일반
	private String name;
	private LocalDateTime registDate;
}
