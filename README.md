# Spring 애완용품 쇼핑몰 프로젝트
![header](https://capsule-render.vercel.app/api?type=wave&text=Spring&color=auto&height=250)
### 프로젝트 수행자 : 유일상(dlftkddl94@gmail.com) 
### 프로젝트 기간 : 2021-11-12 ~ 2021-12-14
### AWS를 이용한 EC2 프로젝트 배포 : http://3.129.96.101:8080/dailyshop
### 프로젝트 시연 영상 : https://www.youtube.com/watch?v=0JLMZCIoROk
---
## 1. 개발환경 및 사용언어
- Window 10
- STS 3
- Maven
- jdk 11
- Tomcat 9.0
- MySql 8.0
- Dbeaver
- BootStrap
- AWS
- Jsp, Html, Css
- Java, Ajax, Jquery, JavaScript
---
## 2. 사용한 Api
- 구글 Smtp 이메일 Api 
  - https://mail.google.com/mail/
- 카카오 로그인 Api  
  - https://developers.kakao.com/ 
  - 처음 로그인시 회원가입 하도록 구현 하였습니다.
- 카카오(다음) 주소 Api
  -  https://postcode.map.daum.net/guide
- sweetalert2
  - https://sweetalert2.github.io/   
- 아임포트 Api
  - https://www.iamport.kr/
---
## 3. 참고한 사이트
- 마음펫
  - http://www.maumpet.net
- 댕냥이네
  - http://ddnn.co.kr/index.html 
- 댕냥이
  - http://skin-skin1.greenlab60.cafe24.com/#none
- 캣츠킹덤
  - https://www.catskingdom.co.kr/
---

## 4. MySql DB 구성
### 유저 테이블
```mysql
CREATE TABLE USER(
idx    int    primary key auto_increment,
email   varchar(60) not null,
password varchar(64) not null,
phone varchar(13) not null,
address varchar(500) not null,
zipCode varchar(10) not null,
addressDetail varchar(500),
registType varchar(5), 
name varchar(30) not null, 
registDate timestamp default now()
);
```
### 상품 테이블
```mysql
CREATE TABLE PRODUCT(
idx int primary key auto_increment,
category varchar(100) not null,
name varchar(200) not null,
soldCount int default 0,
thumbnailImg varchar(1000) not null,
detailImg1 varchar(1000) not null,
detailImg2 varchar(1000) ,
detailImg3 varchar(1000) ,
option1 varchar(100),
option2 varchar(100),
option3 varchar(100),
option4 varchar(100),
price varchar(100) not null
);
```
### 관심목록 테이블 
```mysql
CREATE TABLE favorite(
    idx int primary key auto_increment,
    userIdx int not null,
    productIdx int not null,
    createDate timestamp default now(),
    foreign key(userIdx) references user(idx),
    foreign key(productIdx) references product(idx)
);
```
### 장바구니 테이블
```mysql
CREATE TABLE cart(
    idx int primary key auto_increment,
    userIdx int not null,
    productIdx int not null,
    registDate timestamp default now(),
    option1 varchar(100) default '',
	option2 varchar(100) default '',
	option3 varchar(100) default '',
	option4 varchar(100) default '',
	option1Quantity varchar(10) default '0',
	option2Quantity varchar(10) default '0',
	option3Quantity varchar(10) default '0',
	option4Quantity varchar(10) default '0',
    foreign key(userIdx) references user(idx),
    foreign key(productIdx) references product(idx)
);
```
### 리뷰 테이블
```mysql
CREATE TABLE review(
    idx int primary key auto_increment,
    productIdx int not null,
    writer varchar(30) not null, 
    productName varchar(200) not null,
    starRating int default 0,
    thumbnailImg varchar(1000) not null, 
    contentImg varchar(1000), 
    content varchar(1500) not null,
    registDate timestamp default now(),
    foreign key(productIdx) references product(idx)
);
```
### 주문목록 테이블
```mysql
create table orderList(
    idx int primary key auto_increment,
    userIdx int not null,
    productIdx int not null,
    registDate timestamp default now(),
    thumbnailImg varchar(1000) not null,
    productName varchar(200) not null,
    productOpName varchar(200) not null,
    quantity int not null,
    totalPrice varchar(100) not null,
	foreign key(userIdx) references user(idx),
    foreign key(productIdx) references product(idx)
);
```
---
## 5. 뷰 페이지 및 구현한 기능
#### 5-1. 홈화면 구성
![홈화면](https://user-images.githubusercontent.com/90165630/146361851-dbf504f4-bbeb-4717-abd9-7f08f2da18da.jpg)
- 캐롯셀 이미지를 누르면 해당 상품상세로 이동하게 하였습니다. <br/>

![홈화면2](https://user-images.githubusercontent.com/90165630/146362683-1a24f369-279f-417e-b141-900c7fe10d76.jpg)
- 홈 화면에는 최근에 추가된 상품들이 출력됩니다. <br/>

![홈화면3 로그인시](https://user-images.githubusercontent.com/90165630/146363291-9ec8e731-efa2-4f19-8f08-ab28db79261a.jpg)
- 로그인 시 우측 상단에 마이페이지와 장바구니가 표시됩니다. <br/>

![홈화면4 admin 로그인](https://user-images.githubusercontent.com/90165630/146363477-1526f8c5-8380-4002-a1c6-5881e87e84bf.jpg)
- 관리자 계정으로 로그인시 상품추가 버튼이 생깁니다. <br/>

![홈화면5 관상추](https://user-images.githubusercontent.com/90165630/146363608-7a0cde69-0af5-48fb-80c2-3771b09fe6ea.jpg)
- 관리자 상품추가 화면에서 상품을 등록할 수 있습니다.

#### 5-2. 회원가입
![회원가입1](https://user-images.githubusercontent.com/90165630/146364188-84246ad0-66cb-4f0b-bdae-5790da9e464f.jpg)
- 회원가입 버튼을 누르게 되면 가입 방식을 선택하게 하였습니다. <br/>

![회원가입2](https://user-images.githubusercontent.com/90165630/146364429-b009a370-2bf1-4fa2-b680-656e83ec02ef.jpg)  

 <br/>

![회원가입5](https://user-images.githubusercontent.com/90165630/146365014-fb8a453e-22d7-4432-8367-3c05563ec762.jpg)
- 중복 아이디 검사후 이메일 인증 창을 띄워서 이메일 인증을 하게 하였습니다.

![회원가입3](https://user-images.githubusercontent.com/90165630/146364584-337b4c39-2e9f-4366-9f3e-5dba338b9b1d.jpg)
- 회원가입 약관입니다. 필수항목 체크시 회원가입 버튼을 누를 수 있게 하였습니다.

![회원가입4](https://user-images.githubusercontent.com/90165630/146364816-6c37b917-896f-443e-8a60-1d23df1f01d4.jpg)
- 체크된 상태입니다.
- 비밀번호는 SHA-256 인코딩으로 DB에 저장되게 하였습니다.   <br/>

#### 5-3. 로그인
![로그인](https://user-images.githubusercontent.com/90165630/146365479-e4e800ca-324f-4bbb-9140-61edd0a7ca45.jpg)
- 로그인 화면입니다.
- 제품상세 페이지에서 로그인이 필요하여 화면이동시 로그인이 성공하면 제품상세 페이지로 바로 이동할 수 있게 하였습니다. <br/>

![로그인1 아이디찾기](https://user-images.githubusercontent.com/90165630/146365493-3673c57c-a495-4ff1-b766-616a59c8ba87.jpg)
 <br/>
   
![로그인2 비밀찾기](https://user-images.githubusercontent.com/90165630/146365499-fd47d620-2240-46d6-b9ef-73ff32cca150.jpg)
  
#### 5-4. 리스트 
![리스트 카테고리](https://user-images.githubusercontent.com/90165630/146366647-a2edb3df-90c4-4963-96d8-44e36fe7d5a8.jpg) 
- 카테고리에 맞는 리스트 항목들이 출력됩니다.
  
#### 5-5. 제품상세
![디테일1](https://user-images.githubusercontent.com/90165630/146367061-f198168c-3428-4618-8fa3-fdd622cecd0a.jpg)
- 로그인시에만 바로구매 , 장바구니 , 관심상품 버튼을 이용하게 하였습니다.
  
![디테일1 1](https://user-images.githubusercontent.com/90165630/146367071-b9908b5e-0595-42d4-82e2-1d3489218b98.jpg)
- 로그인 하지 않았을때 버튼을 누르면 알림창과 함께 로그인 페이지로 이동하게 하였습니다.
  
![디테일1 2바로구매](https://user-images.githubusercontent.com/90165630/146367079-7f0e382a-297f-4d78-89d3-8bde9596bff1.jpg)
- 로그인상태에서 바로구매 클릭시 주문서 작성 화면으로 바로 이동하게 하였습니다.
  
![디테일2](https://user-images.githubusercontent.com/90165630/146367686-f37f0f3e-a623-448d-bca4-2fc682ce1c87.jpg)
  
![디테일3](https://user-images.githubusercontent.com/90165630/146367693-ea34be79-91a7-47bf-8886-5d1651de7ae1.jpg)
  
![디테일4](https://user-images.githubusercontent.com/90165630/146367697-56b3e521-5212-40be-bcba-0dce7077b374.jpg)

#### 5-6. 장바구니
![장바구니1](https://user-images.githubusercontent.com/90165630/146367976-ed0201bb-52ab-46d4-862a-110cfa6d1e43.jpg)
- 자바스크립트,제이쿼리를 이용하여 제품,수량에따라 금액을 동적으로 계산되게 하였습니다.
- 체크박스를 이용해 선택상품주문을 할수있게 하였습니다.
  
![장바구니2 배송비 동적계산](https://user-images.githubusercontent.com/90165630/146368002-cb20a369-b14a-497c-b94a-03661ff39264.jpg)

#### 5-7. 주문서 작성
![오더1](https://user-images.githubusercontent.com/90165630/146368784-aafb1a5f-694c-478c-be4c-516529618ca7.jpg)
  
![오더2](https://user-images.githubusercontent.com/90165630/146368799-11091e99-84ba-435f-879d-bc934015fbf1.jpg)
  
![오더3](https://user-images.githubusercontent.com/90165630/146368834-6e5b6b34-8c05-42f3-a3f9-a4c964f6fe57.jpg)
- 실제 결제되는 화면입니다.(자동환불)
  
![오더3_2결제실패](https://user-images.githubusercontent.com/90165630/146368855-609b671d-b71c-4e0d-9eec-fc189d3697ae.jpg)
- 결제실패시 알림창입니다.
  
![오더3_1결제성공](https://user-images.githubusercontent.com/90165630/146368847-e49f1e04-5c20-4bf0-a4f0-c0fda2d30281.jpg)
- 결제성공시 알림창을 띄우고 주문목록으로 이동됩니다.
  
![bandicam 2021-12-16 21-21-46-882](https://user-images.githubusercontent.com/90165630/146371253-1aa400da-6039-46cd-b7bd-40327b63f45c.jpg)
- 결제 내역입니다.
  
#### 5-8. 주문목록  
![오더리스트](https://user-images.githubusercontent.com/90165630/146368862-03589f43-7cb6-4680-8308-bc047d9bc50a.jpg)
  
#### 5-9. 사용후기
![리뷰1](https://user-images.githubusercontent.com/90165630/146370868-8bad9385-ae08-413b-bc25-f1fa81b7719f.jpg)
- 주문목록에서 리뷰남기기 버튼을 누르면 리뷰를 작성할 수 있게 하였습니다.
- 별점은 starRating 컬럼에 숫자로 DB에 저장되게 하였습니다.
  
![리뷰2](https://user-images.githubusercontent.com/90165630/146370882-1a924cff-2d79-4e47-81c5-a5f269363ee0.jpg)
- 작성된 리뷰는 사용후기 페이지와 해당하는 제품 상세 페이지의 후기 부분에 출력되게 하였습니다.
  
#### 5-10. 회원정보수정 및 탈퇴
![회원정보수정1](https://user-images.githubusercontent.com/90165630/146370910-103fb461-2178-4cb2-b2fe-8d90e6635333.jpg)
- 회원정보 수정시 비밀번호 재입력을 하게 하였습니다.
  
![회원정보수정2](https://user-images.githubusercontent.com/90165630/146370925-c514057a-87aa-4eb7-88c6-e374f909b39e.jpg)

### 감사합니다.
