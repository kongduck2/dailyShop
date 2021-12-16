# Spring 애완용품 쇼핑몰 프로젝트
![header](https://capsule-render.vercel.app/api?type=wave&text=Spring)
### 프로젝트 수행자 : 유일상(dlftkddl94@gmail.com) 
### 프로젝트 기간 : 2021-11-12 ~ 2021-12-14
### AWS를 이용한 EC2 프로젝트 배포 : http://3.129.96.101:8080/dailyshop
### 프로젝트 시연 영상 : https://www.youtube.com/watch?v=0JLMZCIoROk
---
## 개발환경 및 사용언어
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
## 사용한 Api
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
## 참고한 사이트
- 마음펫
  - http://www.maumpet.net
- 댕냥이네
  - http://ddnn.co.kr/index.html 
- 댕냥이
  - http://skin-skin1.greenlab60.cafe24.com/#none
- 캣츠킹덤
  - https://www.catskingdom.co.kr/
---

## MySql DB 구성
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
