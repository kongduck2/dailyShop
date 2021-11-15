<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
				<li class="top-sns"><a href="#"><i class="fab fa-facebook-square fa-2x"></i></a></li>
				<li class="top-sns"><a href="#"><i class="fab fa-instagram fa-2x"></i></a></li>
			</ul>
			<ul class="top-ul">
				<li class="top-text"><a href="login" >로그인</a></li>
				<li class="top-text"><a href="#" >회원가입</a></li>
				<li class="top-text"><a href="#" >마이페이지</a></li>
				<li class="top-text"><a href="#" >장바구니</a></li>
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
    <a class="navbar-brand" href="#">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">BEST</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            강아지
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">사료</a></li>
            <li><a class="dropdown-item" href="#">간식</a></li>
            <li><a class="dropdown-item" href="#">패션</a></li>
            <li><a class="dropdown-item" href="#">미용·목욕</a></li>
            <li><a class="dropdown-item" href="#">외출</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            고양이
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">사료</a></li>
            <li><a class="dropdown-item" href="#">간식</a></li>
            <li><a class="dropdown-item" href="#">패션</a></li>
            <li><a class="dropdown-item" href="#">미용·목욕</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">사용후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">고객센터</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="상품명을 입력하세요." aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</header>

</body>
</html>