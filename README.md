# Spring 애완용품 쇼핑몰 프로젝트
### 프로젝트 수행자 : 유일상(dlftkddl94@gmail.com) 
### 프로젝트 기간 : 2021-11-12 ~ 2021-12-14
### AWS를 이용한 EC2 프로젝트 배포 : http://3.129.96.101:8080/dailyshop
### 프로젝트 시연 영상 : https://www.youtube.com/watch?v=0JLMZCIoROk
---
## 개발환경
- Window
- 
- STS 3



---
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
