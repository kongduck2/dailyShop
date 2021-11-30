<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shutcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo.ico" sizes="16x16">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕냥이의 일상</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?v=3">
<!-- 부트스트랩 css 사용 -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css?v=3">
 <!-- 부트스트랩 js 사용 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
  <script src="https://kit.fontawesome.com/cd773dc079.js" crossorigin="anonymous"></script>
</head>


<body>
<header>
<!-- 상단 옵션 -->
	<!-- sns 로고 -->
		<div class="top-div">
			<ul class="top-ul">
				<li class="top-sns"><a href="https://ko-kr.facebook.com/" target="_blank"><i class="fab fa-facebook-square fa-2x"></i></a></li>
				<li class="top-sns"><a href="https://www.instagram.com/?hl=ko" target="_blank"><i class="fab fa-instagram fa-2x"></i></a></li>
			</ul>
			<ul class="top-ul">
				<!-- admin용 상품추가 -->
				<li class="top-text"><a href="addProduct" >상품추가</a></li>
			<c:if test="${sessionScope.user == null}"> 	<!-- 비로그인 상태 -->
				<li class="top-text"><a href="login" >로그인</a></li>
				<li class="top-text"><a href="regist" >회원가입</a></li>
			</c:if>
			
			<c:if test="${sessionScope.user != null}"> <!-- 로그인 상태 -->
				<li class="top-text"><a href="logout" >로그아웃</a></li>
				<li class="top-text" id="mypage-menu"><a href="myPage" >마이페이지</a>
					<!-- 드롭다운 마이페이지,주문내역조회,회원정보수정 -->
					<ul class="mypage-sub">
						<li><a href="#">주문내역조회</a></li>
						<li><a href="#">관심목록</a></li>
						<li><a href="infoUpdatePwCheck">회원정보수정</a></li>
					</ul>
				</li>
				<li class="top-text"><a href="cart" ><i class="fas fa-shopping-cart"></i><span class="cartCount"> ${count}</span> 장바구니</a></li>
			</c:if>
			</ul>
		</div>
		<!-- 로고 -->
		<div class="logo">
		 <span>
			<a href="${pageContext.request.contextPath}"><img
				src="${pageContext.request.contextPath}/resources/image/logo.jpg" class="header-logo" alt="logo"/></a>
		 </span>
		</div>
		<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="best">BEST</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            강아지
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="list?category=d-feed">사료</a></li>
            <li><a class="dropdown-item" href="list?category=d-snack">간식</a></li>
            <li><a class="dropdown-item" href="list?category=d-fashion">패션</a></li>
            <li><a class="dropdown-item" href="list?category=d-toy">장난감</a></li>
            <li><a class="dropdown-item" href="list?category=d-walk">외출</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            고양이
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="list?category=c-feed">사료</a></li>
            <li><a class="dropdown-item" href="list?category=c-snack">간식</a></li>
            <li><a class="dropdown-item" href="list?category=c-fashion">패션</a></li>
            <li><a class="dropdown-item" href="list?category=c-toy">장난감</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">사용후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">고객센터</a>
        </li>
      </ul>
      <form class="d-flex" action="list?category=search&page=">
        <input type="hidden" name="category" value="search">
        <input class="form-control me-2" name="findText" type="search" placeholder="어떤 상품을 찾으시나요?" aria-label="Search">
        <button class="btn btn-outline-primary" type="submit" id="searchBtn">찾기</button>
      </form>
    </div>
  </div>
</nav>
</header>

</body>
</html>