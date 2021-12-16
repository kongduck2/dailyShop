# Spring 애완용품 쇼핑몰 프로젝트
![header](https://capsule-render.vercel.app/api?type=wave&text=Spring)
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
- 회원가입 버튼을 누르게 되면 가입 방식을 선택할 수 있습니다. <br/>

![회원가입2](https://user-images.githubusercontent.com/90165630/146364429-b009a370-2bf1-4fa2-b680-656e83ec02ef.jpg)  

 <br/>

![회원가입5](https://user-images.githubusercontent.com/90165630/146365014-fb8a453e-22d7-4432-8367-3c05563ec762.jpg)
- 중복 아이디 검사후 이메일 인증 창을 띄워서 이메일 인증을 하게 하였습니다.

![회원가입3](https://user-images.githubusercontent.com/90165630/146364584-337b4c39-2e9f-4366-9f3e-5dba338b9b1d.jpg)
- 회원가입 약관입니다. 필수항목 체크시 회원가입 버튼을 누를 수 있게 하였습니다.

![회원가입4](https://user-images.githubusercontent.com/90165630/146364816-6c37b917-896f-443e-8a60-1d23df1f01d4.jpg)
- 체크된 상태입니다. <br/>

#### 5-3. 로그인
![로그인](https://user-images.githubusercontent.com/90165630/146365479-e4e800ca-324f-4bbb-9140-61edd0a7ca45.jpg)
- 로그인 화면입니다. 제품상세에서 로그인이 필요하여 로그인 화면이동시 로그인이 성공하면 제품상세 페이지로 바로 이동할 수 있게 하였습니다. <br/>

![로그인1 아이디찾기](https://user-images.githubusercontent.com/90165630/146365493-3673c57c-a495-4ff1-b766-616a59c8ba87.jpg)
 <br/>
 
![로그인2 비밀찾기](https://user-images.githubusercontent.com/90165630/146365499-fd47d620-2240-46d6-b9ef-73ff32cca150.jpg)
 <br/>
 
 





